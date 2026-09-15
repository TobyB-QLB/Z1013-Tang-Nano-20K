library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Z1013 HDMI integration: FAT32 directory on the on-board microSD socket.
--
-- Drop-in VHDL replacement for the testpattern module from the official
-- Sipeed Tang Nano 20K HDMI example.
--
-- HDMI timing remains 1280x720 as selected by video_top.v.  The original
-- Z1013 256x256 matrix is scaled by an exact factor of two in both axes.
-- The centered 512x512 HDMI area is generated through the real Z1013
-- dual-port video RAM and the real 8x8 font ROM.
--
-- The T80 has 64 KiB main RAM plus an 8 KiB boot-ROM overlay at 0000h.
-- The boot ROM copies recovered COMMAND.COM to F000h and IO.SYS to E300h,
-- switches to full RAM through a trampoline at E200h and starts the original
-- monitor at F280h.  COMMAND.COM and IO.SYS still boot from this ROM.  Disk
-- commands use the microSD card; the requested historic 512-byte sector is
-- presented unchanged to IO.SYS at E100h..E2FFh.
--
-- A receive-only PS/2 interface converts Scan Code Set 2 make/break codes into
-- the original active-high 10 x 8 matrix.

entity testpattern is
    port (
        I_pxl_clk  : in  std_logic;
        I_rst_n    : in  std_logic;
        I_ps2_clk  : in  std_logic;
        I_ps2_data : in  std_logic;
        I_sd_miso    : in std_logic;
        I_mode     : in  std_logic_vector(2 downto 0);
        I_single_r : in  std_logic_vector(7 downto 0);
        I_single_g : in  std_logic_vector(7 downto 0);
        I_single_b : in  std_logic_vector(7 downto 0);
        I_h_total  : in  std_logic_vector(11 downto 0);
        I_h_sync   : in  std_logic_vector(11 downto 0);
        I_h_bporch : in  std_logic_vector(11 downto 0);
        I_h_res    : in  std_logic_vector(11 downto 0);
        I_v_total  : in  std_logic_vector(11 downto 0);
        I_v_sync   : in  std_logic_vector(11 downto 0);
        I_v_bporch : in  std_logic_vector(11 downto 0);
        I_v_res    : in  std_logic_vector(11 downto 0);
        I_hs_pol   : in  std_logic;
        I_vs_pol   : in  std_logic;
        O_de       : out std_logic;
        O_hs       : out std_logic;
        O_vs       : out std_logic;
        O_data_r   : out std_logic_vector(7 downto 0);
        O_data_g   : out std_logic_vector(7 downto 0);
        O_data_b   : out std_logic_vector(7 downto 0);
        O_sd_clk       : out std_logic;
        O_sd_cs_n      : out std_logic;
        O_sd_mosi      : out std_logic;
        O_sd_activity  : out std_logic;
        O_ted_frequency_1 : out std_logic_vector(9 downto 0);
        O_ted_frequency_2 : out std_logic_vector(9 downto 0);
        O_ted_control     : out std_logic_vector(7 downto 0);
        O_ted_reload      : out std_logic;
        O_pcm_control     : out std_logic_vector(4 downto 0);
        O_cassette_bit    : out std_logic;
        O_cassette_active : out std_logic
    );
end entity testpattern;

architecture Behavioral of testpattern is

    -- Keep short SD transfers visible on the board LED for about 100 ms.
    constant SD_ACTIVITY_HOLD_C : unsigned(22 downto 0) :=
        to_unsigned(7425000, 23);

    -- Keep the cassette audio path enabled for 20 ms after the last write to
    -- PIO port B. The monitor toggles the port much faster while S is active;
    -- afterwards the HDMI channel therefore returns automatically to silence.
    constant CASSETTE_HOLD_C : unsigned(20 downto 0) :=
        to_unsigned(1485000, 21);

    signal h_count_s : integer range 0 to 4095 := 0;
    signal v_count_s : integer range 0 to 4095 := 0;

    signal h_total_s  : integer range 0 to 4095;
    signal h_sync_s   : integer range 0 to 4095;
    signal h_bporch_s : integer range 0 to 4095;
    signal h_res_s    : integer range 0 to 4095;
    signal v_total_s  : integer range 0 to 4095;
    signal v_sync_s   : integer range 0 to 4095;
    signal v_bporch_s : integer range 0 to 4095;
    signal v_res_s    : integer range 0 to 4095;

    signal video_active_raw_s : std_logic := '0';
    signal z1013_active_raw_s : std_logic := '0';
    signal hsync_raw_s : std_logic := '0';
    signal vsync_raw_s : std_logic := '0';

    signal video_active_pipe_s : std_logic := '0';
    signal z1013_active_pipe_s : std_logic := '0';
    signal hsync_pipe_s : std_logic := '0';
    signal vsync_pipe_s : std_logic := '0';

    signal vram_addr_s : std_logic_vector(12 downto 0) := (others => '0');
    signal vram_data_s : std_logic_vector(7 downto 0);

    signal char_row_s : unsigned(2 downto 0) := (others => '0');
    signal char_col_s : unsigned(2 downto 0) := (others => '0');
    signal char_row_pipe_s : unsigned(2 downto 0) := (others => '0');
    signal char_col_pipe_s : unsigned(2 downto 0) := (others => '0');
    signal graphics_mode_s : std_logic := '0';
    signal graphics_mode_pipe_s : std_logic := '0';

    signal font_data_s : std_logic_vector(7 downto 0);
    signal font_pixel_s : std_logic;
    signal visible_pixel_s : std_logic;

    signal vram_cpu_addr_s : std_logic_vector(12 downto 0);
    signal vram_cpu_offset_s : unsigned(15 downto 0);
    signal vram_cpu_data_s : std_logic_vector(7 downto 0);
    signal vram_cpu_dout_s : std_logic_vector(7 downto 0);
    signal vram_cpu_we_s : std_logic;

    signal color_data_s : std_logic_vector(7 downto 0) := x"0F";
    signal color_cpu_dout_s : std_logic_vector(7 downto 0) := x"0F";
    signal color_cpu_we_s : std_logic := '0';
    signal color_bank_s : std_logic := '0';
    signal color_enabled_s : std_logic := '0';
    signal color_index_s : std_logic_vector(3 downto 0) := x"0";
    signal pixel_rgb_s : std_logic_vector(23 downto 0) := (others => '0');

    -- Final registered interface to the official DVI encoder.  Without this
    -- register the synchronous VRAM/font output, colour palette and complete
    -- TMDS encoder formed one 74.25-MHz combinational path.  That path was too
    -- long after adding the colour RAM and caused data-dependent pixel errors
    -- even while colour output was disabled.
    signal output_de_s : std_logic := '0';
    signal output_hs_s : std_logic := '0';
    signal output_vs_s : std_logic := '0';
    signal output_rgb_s : std_logic_vector(23 downto 0) := (others => '0');

    signal cpu_phase_s : unsigned(8 downto 0) := (others => '0');
    signal cpu_speed_s : std_logic_vector(1 downto 0) := "11";
    signal cpu_speed_previous_s : std_logic_vector(1 downto 0) := "11";
    signal cpu_reset_count_s : unsigned(3 downto 0) := (others => '0');
    signal cpu_ce_s : std_logic;
    signal cpu_reset_n_s : std_logic;

    signal z80_data_in_s : std_logic_vector(7 downto 0);
    signal z80_data_out_s : std_logic_vector(7 downto 0);
    signal z80_addr_s : std_logic_vector(15 downto 0);
    signal z80_m1_n_s : std_logic;
    signal z80_mreq_n_s : std_logic;
    signal z80_iorq_n_s : std_logic;
    signal z80_rd_n_s : std_logic;
    signal z80_wr_n_s : std_logic;
    signal z80_rfsh_n_s : std_logic;
    signal z80_halt_n_s : std_logic;
    signal z80_busak_n_s : std_logic;
    signal z80_control_s : std_logic_vector(7 downto 0);

    -- Audio-only TED register image on Z80 I/O ports 30h..34h. The order
    -- mirrors the sound-related part of the MOS 7360 registers FF0Eh..FF12h.
    signal ted_frequency_1_s : std_logic_vector(9 downto 0) := (others => '0');
    signal ted_frequency_2_s : std_logic_vector(9 downto 0) := (others => '0');
    signal ted_control_s : std_logic_vector(7 downto 0) := (others => '0');
    signal ted_reload_s : std_logic := '0';
    -- Bit 4 enables the experimental direct DAC; bits 3..0 are the sample.
    -- This separate register leaves all established TED sound behaviour intact.
    signal pcm_control_s : std_logic_vector(4 downto 0) := (others => '0');

    -- Minimal Z80-PIO port-B recreation used by the original cassette code.
    -- COMMAND.COM performs IN 02h / XOR 80h / OUT 02h at F3F1h.
    signal pio_port_b_s : std_logic_vector(7 downto 0) := (others => '0');
    signal cassette_hold_s : unsigned(20 downto 0) := (others => '0');

    signal rom_data_s : std_logic_vector(7 downto 0);
    signal main_ram_data_s : std_logic_vector(7 downto 0);
    signal main_ram_cpu_we_s : std_logic;
    signal boot_rom_enabled_s : std_logic := '1';
    signal z80_rom_select_s : std_logic;
    signal z80_vram_select_s : std_logic;
    signal z80_sector_buffer_select_s : std_logic;
    signal z80_sd_diag_buffer_select_s : std_logic;
    signal z80_sd_status_select_s : std_logic;
    signal z80_main_ram_select_s : std_logic;

    -- Simple raw SD-sector interface for the Z80. FAT32 is intentionally no
    -- longer interpreted in FPGA logic; the new IO.SYS will do that itself.
    signal sd_lba_s : std_logic_vector(31 downto 0) := (others => '0');
    signal sd_read_request_s : std_logic := '0';
    signal sd_write_request_s : std_logic := '0';
    signal sd_busy_s : std_logic;
    signal sd_error_s : std_logic;
    signal sd_io_status_s : std_logic_vector(7 downto 0);
    signal sd_auto_read_started_s : std_logic := '0';
    signal sd_read_seen_busy_s : std_logic := '0';
    signal sd_sector_valid_s : std_logic := '0';
    signal sector_fill_addr_s : std_logic_vector(8 downto 0);
    signal sector_fill_data_s : std_logic_vector(7 downto 0);
    signal sector_fill_we_s : std_logic;
    signal sector_stream_addr_s : std_logic_vector(8 downto 0);
    signal sector_memory_addr_s : std_logic_vector(8 downto 0);
    signal sector_cpu_data_s : std_logic_vector(7 downto 0);
    signal sector_cpu_we_s : std_logic;
    signal sector_cpu_offset_s : unsigned(15 downto 0);

    signal sd_card_ready_s : std_logic;
    signal sd_high_capacity_s : std_logic;
    signal sd_write_active_s : std_logic;
    signal sd_debug_state_s : std_logic_vector(7 downto 0);
    signal sd_status_s : std_logic_vector(7 downto 0);
    signal sd_activity_hold_s : unsigned(22 downto 0) := (others => '0');

    signal keyboard_select_s : std_logic_vector(3 downto 0) := (others => '0');
    signal keyboard_data_s : std_logic_vector(7 downto 0) := (others => '0');
    signal keyboard_matrix_s : std_logic_vector(79 downto 0) := (others => '0');
    signal ps2_reset_request_s : std_logic := '0';
    signal soft_reset_counter_s : unsigned(19 downto 0) := (others => '0');
    signal system_reset_n_s : std_logic := '0';

    function palette_rgb_f(
        color_index : std_logic_vector(3 downto 0)
    ) return std_logic_vector is
    begin
        case color_index is
            when x"0" => return x"000000"; -- Schwarz
            when x"1" => return x"0000AA"; -- Blau
            when x"2" => return x"00AA00"; -- Gruen
            when x"3" => return x"00AAAA"; -- Cyan
            when x"4" => return x"AA0000"; -- Rot
            when x"5" => return x"AA00AA"; -- Magenta
            when x"6" => return x"AA5500"; -- Braun
            when x"7" => return x"AAAAAA"; -- Hellgrau
            when x"8" => return x"555555"; -- Dunkelgrau
            when x"9" => return x"5555FF"; -- Hellblau
            when x"A" => return x"55FF55"; -- Hellgruen
            when x"B" => return x"55FFFF"; -- Hellcyan
            when x"C" => return x"FF5555"; -- Hellrot
            when x"D" => return x"FF55FF"; -- Hellmagenta
            when x"E" => return x"FFFF55"; -- Gelb
            when others => return x"FFFFFF"; -- Weiss
        end case;
    end function;

begin

    O_ted_frequency_1 <= ted_frequency_1_s;
    O_ted_frequency_2 <= ted_frequency_2_s;
    O_ted_control     <= ted_control_s;
    O_ted_reload      <= ted_reload_s;
    O_pcm_control     <= pcm_control_s;
    O_cassette_bit    <= pio_port_b_s(7);
    O_cassette_active <= '1' when cassette_hold_s /= to_unsigned(0, cassette_hold_s'length)
                         else '0';
    O_sd_activity     <= '1' when
        sd_busy_s = '1' or sd_activity_hold_s /= to_unsigned(0, sd_activity_hold_s'length)
        else '0';

    h_total_s  <= to_integer(unsigned(I_h_total));
    h_sync_s   <= to_integer(unsigned(I_h_sync));
    h_bporch_s <= to_integer(unsigned(I_h_bporch));
    h_res_s    <= to_integer(unsigned(I_h_res));
    v_total_s  <= to_integer(unsigned(I_v_total));
    v_sync_s   <= to_integer(unsigned(I_v_sync));
    v_bporch_s <= to_integer(unsigned(I_v_bporch));
    v_res_s    <= to_integer(unsigned(I_v_res));

    ---------------------------------------------------------------------------
    -- Isolated receive-only PS/2 front end and Z1013 matrix translator.
    -- Both inputs are synchronized to the existing pixel clock.  No clock from
    -- the keyboard is ever connected to the FPGA clock network.
    ---------------------------------------------------------------------------
    PS2_KEYBOARD : entity work.ps2_keyboard
        port map (
            I_clk      => I_pxl_clk,
            I_rst_n    => I_rst_n,
            I_ps2_clk  => I_ps2_clk,
            I_ps2_data => I_ps2_data,
            O_matrix   => keyboard_matrix_s,
            O_reset_request => ps2_reset_request_s,
            O_cpu_speed => cpu_speed_s
        );

    ---------------------------------------------------------------------------
    -- Ctrl+Alt+Delete resets the reconstructed Z1013, not the HDMI transmitter.
    -- The one-clock request from the keyboard is stretched to about 14 ms. This
    -- restarts the CPU and ROM overlay while the pixel timing,
    -- PLL and TMDS serializer continue uninterrupted.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, I_rst_n)
    begin
        if I_rst_n = '0' then
            soft_reset_counter_s <= (others => '0');
        elsif rising_edge(I_pxl_clk) then
            if ps2_reset_request_s = '1' then
                soft_reset_counter_s <= (others => '1');
            elsif soft_reset_counter_s /= to_unsigned(0, soft_reset_counter_s'length) then
                soft_reset_counter_s <= soft_reset_counter_s - 1;
            end if;
        end if;
    end process;

    system_reset_n_s <= '1' when
        I_rst_n = '1' and
        soft_reset_counter_s = to_unsigned(0, soft_reset_counter_s'length)
        else '0';

    ---------------------------------------------------------------------------
    -- Official Sipeed frame timing.  All dimensions continue to come from
    -- the unchanged video_top.v instance.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, I_rst_n)
    begin
        if I_rst_n = '0' then
            h_count_s <= 0;
            v_count_s <= 0;
        elsif rising_edge(I_pxl_clk) then
            if h_count_s = h_total_s - 1 then
                h_count_s <= 0;

                if v_count_s = v_total_s - 1 then
                    v_count_s <= 0;
                else
                    v_count_s <= v_count_s + 1;
                end if;
            else
                h_count_s <= h_count_s + 1;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Active picture, sync signals and local Z1013 coordinates.
    ---------------------------------------------------------------------------
    process(
        h_count_s, v_count_s,
        h_sync_s, h_bporch_s, h_res_s,
        v_sync_s, v_bporch_s, v_res_s,
        I_hs_pol, I_vs_pol, graphics_mode_s
    )
        variable active_x_start_v : integer range 0 to 4095;
        variable active_y_start_v : integer range 0 to 4095;
        variable field_x_start_v  : integer range 0 to 4095;
        variable field_y_start_v  : integer range 0 to 4095;
        variable local_x_v        : integer range 0 to 511;
        variable local_y_v        : integer range 0 to 511;
        variable source_x_v       : integer range 0 to 255;
        variable source_y_v       : integer range 0 to 255;
        variable address_v        : integer range 0 to 8191;
    begin
        active_x_start_v := h_sync_s + h_bporch_s;
        active_y_start_v := v_sync_s + v_bporch_s;
        field_x_start_v  := active_x_start_v + ((h_res_s - 512) / 2);
        field_y_start_v  := active_y_start_v + ((v_res_s - 512) / 2);
        local_x_v := 0;
        local_y_v := 0;
        source_x_v := 0;
        source_y_v := 0;
        address_v := 0;

        video_active_raw_s <= '0';
        z1013_active_raw_s <= '0';
        vram_addr_s <= (others => '0');
        char_row_s <= (others => '0');
        char_col_s <= (others => '0');

        if I_hs_pol = '1' then
            if h_count_s < h_sync_s then
                hsync_raw_s <= '1';
            else
                hsync_raw_s <= '0';
            end if;
        else
            if h_count_s < h_sync_s then
                hsync_raw_s <= '0';
            else
                hsync_raw_s <= '1';
            end if;
        end if;

        if I_vs_pol = '1' then
            if v_count_s < v_sync_s then
                vsync_raw_s <= '1';
            else
                vsync_raw_s <= '0';
            end if;
        else
            if v_count_s < v_sync_s then
                vsync_raw_s <= '0';
            else
                vsync_raw_s <= '1';
            end if;
        end if;

        if
            h_count_s >= active_x_start_v and
            h_count_s <  active_x_start_v + h_res_s and
            v_count_s >= active_y_start_v and
            v_count_s <  active_y_start_v + v_res_s
        then
            video_active_raw_s <= '1';
        end if;

        if
            h_count_s >= field_x_start_v and
            h_count_s <  field_x_start_v + 512 and
            v_count_s >= field_y_start_v and
            v_count_s <  field_y_start_v + 512
        then
            z1013_active_raw_s <= '1';

            local_x_v := h_count_s - field_x_start_v;
            local_y_v := v_count_s - field_y_start_v;
            source_x_v := local_x_v / 2;
            source_y_v := local_y_v / 2;
            if graphics_mode_s = '1' then
                -- 256 x 256 Pixel, acht horizontale Pixel pro Byte.
                address_v := (source_y_v * 32) + (source_x_v / 8);
            else
                -- 32 x 32 Zeichen im unteren 1-KByte-Teil des 8-KByte-VRAM.
                address_v := ((source_y_v / 8) * 32) + (source_x_v / 8);
            end if;

            vram_addr_s <= std_logic_vector(to_unsigned(address_v, 13));
            char_row_s <= to_unsigned(source_y_v mod 8, 3);
            char_col_s <= to_unsigned(source_x_v mod 8, 3);
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- T80 clock enable and reset.
    --
    -- The official 1280x720 pixel clock is 74.25 MHz.  A fractional phase
    -- accumulator emits one-clock-wide CLKEN pulses with exact average rates
    -- of 1, 2, 4 or 8.25 MHz. I_pxl_clk remains the only physical clock.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, system_reset_n_s)
        variable phase_sum_v : integer range 0 to 329;
        variable phase_step_v : integer range 4 to 33;
    begin
        if system_reset_n_s = '0' then
            cpu_phase_s <= (others => '0');
            cpu_speed_previous_s <= "11";
            cpu_ce_s <= '0';
            cpu_reset_count_s <= (others => '0');
        elsif rising_edge(I_pxl_clk) then
            cpu_ce_s <= '0';

            case cpu_speed_s is
                when "00" => phase_step_v := 4;  -- 74.25 * 4/297 = 1 MHz
                when "01" => phase_step_v := 8;  -- 2 MHz
                when "10" => phase_step_v := 16; -- 4 MHz
                when others => phase_step_v := 33; -- 8.25 MHz
            end case;

            if cpu_speed_s /= cpu_speed_previous_s then
                cpu_phase_s <= (others => '0');
                cpu_speed_previous_s <= cpu_speed_s;
            else
                phase_sum_v := to_integer(cpu_phase_s) + phase_step_v;
                if phase_sum_v >= 297 then
                    cpu_phase_s <= to_unsigned(phase_sum_v - 297, cpu_phase_s'length);
                    cpu_ce_s <= '1';

                    if cpu_reset_count_s /= to_unsigned(15, cpu_reset_count_s'length) then
                        cpu_reset_count_s <= cpu_reset_count_s + 1;
                    end if;
                else
                    cpu_phase_s <= to_unsigned(phase_sum_v, cpu_phase_s'length);
                end if;
            end if;
        end if;
    end process;

    cpu_reset_n_s <= '1' when
        system_reset_n_s = '1' and
        cpu_reset_count_s = to_unsigned(15, cpu_reset_count_s'length)
        else '0';

    -- Return exactly the selected active-high matrix row to IN 04h.  The
    -- former virtual A key from the on-board Nano button is no longer added.
    process(keyboard_select_s, keyboard_matrix_s)
        variable keyboard_data_v : std_logic_vector(7 downto 0);
    begin
        keyboard_data_v := (others => '0');

        case keyboard_select_s is
            when x"0" => keyboard_data_v := keyboard_matrix_s(7 downto 0);
            when x"1" => keyboard_data_v := keyboard_matrix_s(15 downto 8);
            when x"2" => keyboard_data_v := keyboard_matrix_s(23 downto 16);
            when x"3" => keyboard_data_v := keyboard_matrix_s(31 downto 24);
            when x"4" => keyboard_data_v := keyboard_matrix_s(39 downto 32);
            when x"5" => keyboard_data_v := keyboard_matrix_s(47 downto 40);
            when x"6" => keyboard_data_v := keyboard_matrix_s(55 downto 48);
            when x"7" => keyboard_data_v := keyboard_matrix_s(63 downto 56);
            when x"8" => keyboard_data_v := keyboard_matrix_s(71 downto 64);
            when x"9" => keyboard_data_v := keyboard_matrix_s(79 downto 72);
            when others => keyboard_data_v := (others => '0');
        end case;

        keyboard_data_s <= keyboard_data_v;
    end process;

    ---------------------------------------------------------------------------
    -- Human-visible SD activity indicator. Every active read reloads a 100-ms
    -- hold timer. A future write engine can be ORed into the same condition.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, I_rst_n)
    begin
        if I_rst_n = '0' then
            sd_activity_hold_s <= (others => '0');
        elsif rising_edge(I_pxl_clk) then
            if sd_busy_s = '1' then
                sd_activity_hold_s <= SD_ACTIVITY_HOLD_C;
            elsif sd_activity_hold_s /= to_unsigned(0, sd_activity_hold_s'length) then
                sd_activity_hold_s <= sd_activity_hold_s - 1;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Boot memory latch.
    --
    -- Reset state:
    --   0000h..1FFFh = boot ROM
    --   2000h..7FFFh = disabled lower RAM
    --   8000h..FFFFh = upper RAM, except the text VRAM window
    --
    -- A Z80 output cycle to port 08h removes the ROM overlay and enables the
    -- complete main RAM.  Only reset can enable the boot overlay again.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, system_reset_n_s)
    begin
        if system_reset_n_s = '0' then
            boot_rom_enabled_s <= '1';
            graphics_mode_s <= '0';
            color_bank_s <= '0';
            color_enabled_s <= '0';
            keyboard_select_s <= (others => '0');
            sd_lba_s <= (others => '0');
            sd_read_request_s <= '0';
            sd_write_request_s <= '0';
            sd_auto_read_started_s <= '0';
            sd_read_seen_busy_s <= '0';
            sd_sector_valid_s <= '0';
            ted_frequency_1_s <= (others => '0');
            ted_frequency_2_s <= (others => '0');
            ted_control_s <= (others => '0');
            ted_reload_s <= '0';
            pcm_control_s <= (others => '0');
            pio_port_b_s <= (others => '0');
            cassette_hold_s <= (others => '0');
        elsif rising_edge(I_pxl_clk) then
            sd_read_request_s <= '0';
            sd_write_request_s <= '0';
            ted_reload_s <= '0';

            if cassette_hold_s /= to_unsigned(0, cassette_hold_s'length) then
                cassette_hold_s <= cassette_hold_s - 1;
            end if;

            -- For the first hardware test, sector zero is read automatically
            -- as soon as card initialization has completed. Thus a plain
            -- monitor dump E100-E2FF verifies the complete raw path without
            -- depending on the old IO.SYS.
            if sd_auto_read_started_s = '0' and sd_card_ready_s = '1' then
                sd_lba_s <= (others => '0');
                sd_read_request_s <= '1';
                sd_auto_read_started_s <= '1';
                sd_sector_valid_s <= '0';
            end if;

            if sd_busy_s = '1' then
                sd_read_seen_busy_s <= '1';
            elsif sd_read_seen_busy_s = '1' and sd_card_ready_s = '1' then
                sd_read_seen_busy_s <= '0';
                if sd_error_s = '0' then
                    sd_sector_valid_s <= '1';
                end if;
            end if;

            if cpu_reset_n_s = '0' then
                boot_rom_enabled_s <= '1';
                graphics_mode_s <= '0';
                color_bank_s <= '0';
                color_enabled_s <= '0';
                keyboard_select_s <= (others => '0');
                ted_frequency_1_s <= (others => '0');
                ted_frequency_2_s <= (others => '0');
                ted_control_s <= (others => '0');
                pcm_control_s <= (others => '0');
                pio_port_b_s <= (others => '0');
                cassette_hold_s <= (others => '0');
            elsif
                cpu_ce_s = '1' and
                z80_iorq_n_s = '0' and
                z80_wr_n_s = '0' and
                z80_addr_s(7 downto 0) = x"08"
            then
                boot_rom_enabled_s <= '0';
                keyboard_select_s <= z80_data_out_s(3 downto 0);
            end if;

            if cpu_ce_s = '1' and z80_iorq_n_s = '0' and z80_wr_n_s = '0' then
                case z80_addr_s(7 downto 0) is
                    -- Original Z80-PIO port B. Bit 7 is the cassette output;
                    -- keeping all eight bits makes the preceding IN 02h read
                    -- back exactly the last value written by COMMAND.COM.
                    when x"02" =>
                        pio_port_b_s <= z80_data_out_s;
                        cassette_hold_s <= CASSETTE_HOLD_C;
                    -- Raw logical block address, least-significant byte first.
                    when x"10" => sd_lba_s(7 downto 0) <= z80_data_out_s;
                    when x"11" => sd_lba_s(15 downto 8) <= z80_data_out_s;
                    when x"12" => sd_lba_s(23 downto 16) <= z80_data_out_s;
                    when x"13" => sd_lba_s(31 downto 24) <= z80_data_out_s;
                    -- bit 0 starts CMD17 (read), bit 1 starts CMD24 (write).
                    when x"14" =>
                        if z80_data_out_s(1) = '1' and sd_card_ready_s = '1' then
                            sd_write_request_s <= '1';
                            sd_sector_valid_s <= '0';
                        elsif z80_data_out_s(0) = '1' and sd_card_ready_s = '1' then
                            sd_read_request_s <= '1';
                            sd_sector_valid_s <= '0';
                        end if;
                    -- Durch den historischen Maschinencode von VIEW.COM und
                    -- den Bilddateien eindeutig nachgewiesene Polaritaet.
                    when x"18" => graphics_mode_s <= '1';
                    when x"1C" => graphics_mode_s <= '0';
                    -- Erweiterte Farbgrafik. Der CPU-Adressbereich bleibt
                    -- unveraendert; nur der dahinter liegende Speicher wird
                    -- umgeschaltet. Die Videoausgabe liest beide RAMs parallel.
                    when x"20" => color_bank_s <= '0';
                    when x"24" => color_bank_s <= '1';
                    when x"28" => color_enabled_s <= '1';
                    when x"2C" => color_enabled_s <= '0';
                    -- TED-compatible audio-only register order:
                    -- 30h = voice 1 low byte (FF0Eh)
                    -- 31h = voice 2 low byte (FF0Fh)
                    -- 32h = voice 2 high two bits (FF10h)
                    -- 33h = volume/voice/noise/reload (FF11h)
                    -- 34h = voice 1 high two bits (FF12h bits 1..0)
                    when x"30" => ted_frequency_1_s(7 downto 0) <= z80_data_out_s;
                    when x"31" => ted_frequency_2_s(7 downto 0) <= z80_data_out_s;
                    when x"32" => ted_frequency_2_s(9 downto 8) <= z80_data_out_s(1 downto 0);
                    when x"33" =>
                        ted_control_s <= z80_data_out_s;
                        if z80_data_out_s(7) = '1' then
                            ted_reload_s <= '1';
                        end if;
                    when x"34" => ted_frequency_1_s(9 downto 8) <= z80_data_out_s(1 downto 0);
                    -- Experimental 4-bit PCM DAC.  Writing 80h..8Fh enables
                    -- direct playback and selects one of 16 linear levels.
                    -- Any value with bit 7 clear switches it off again.
                    when x"35" =>
                        pcm_control_s(4) <= z80_data_out_s(7);
                        pcm_control_s(3 downto 0) <= z80_data_out_s(3 downto 0);
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- 8 KiB synchronous boot ROM at 0000h..1FFFh while the overlay is active.
    --
    -- The ROM is clocked continuously with I_pxl_clk.  Since the T80 advances
    -- only once every nine pixel clocks, the ROM output is stable long before
    -- the CPU samples it.
    ---------------------------------------------------------------------------
    PROGRAM_ROM : entity work.Gowin_Z1013_ROM
        port map (
            dout  => rom_data_s,
            clk   => I_pxl_clk,
            oce   => '1',
            ce    => '1',
            reset => '0',
            ad    => z80_addr_s(12 downto 0)
        );

    ---------------------------------------------------------------------------
    -- Raw SD/SDHC block reader. It only initializes the card and executes
    -- CMD17 for the LBA selected by the Z80. It deliberately knows nothing
    -- about partitions, FAT32, directories or Z1013 files.
    ---------------------------------------------------------------------------
    SD_RAW_BLOCK_READER : entity work.sd_spi_block_reader
        port map (
            clk           => I_pxl_clk,
            reset_n       => system_reset_n_s,
            start         => sd_read_request_s,
            start_write   => sd_write_request_s,
            lba           => sd_lba_s,
            ready         => sd_card_ready_s,
            busy          => sd_busy_s,
            error         => sd_error_s,
            high_capacity => sd_high_capacity_s,
            writing       => sd_write_active_s,
            debug_state   => sd_debug_state_s,
            buffer_addr   => sector_fill_addr_s,
            buffer_data   => sector_fill_data_s,
            buffer_we     => sector_fill_we_s,
            write_buffer_addr => sector_stream_addr_s,
            write_buffer_data => sector_cpu_data_s,
            sd_clk        => O_sd_clk,
            sd_cs_n       => O_sd_cs_n,
            sd_mosi       => O_sd_mosi,
            sd_miso       => I_sd_miso
        );

    -- Port 15h / D200 status:
    -- bit0 busy, bit1 error, bit2 initialized/ready, bit3 SDHC,
    -- bit4 sector buffer valid, bit6 live MISO.
    sd_io_status_s <= '0' & I_sd_miso & '0' & sd_sector_valid_s &
                      sd_high_capacity_s & sd_card_ready_s & sd_error_s & sd_busy_s;
    sd_status_s <= sd_io_status_s;

    SECTOR_MEMORY : entity work.sector_buffer
        port map (
            clk       => I_pxl_clk,
            fill_addr => sector_fill_addr_s,
            fill_data => sector_fill_data_s,
            fill_we   => sector_fill_we_s,
            cpu_addr  => sector_memory_addr_s,
            cpu_din   => z80_data_out_s,
            cpu_dout  => sector_cpu_data_s,
            cpu_we    => sector_cpu_we_s
        );

    -- While CMD24 is active the Z80 only polls port 15h, so the existing
    -- synchronous buffer port can safely stream bytes to the SD controller.
    sector_memory_addr_s <= sector_stream_addr_s when sd_write_active_s = '1'
                            else std_logic_vector(sector_cpu_offset_s(8 downto 0));

    sector_cpu_offset_s <=
        unsigned(z80_addr_s) - to_unsigned(16#D000#, 16)
            when z80_sd_diag_buffer_select_s = '1' else
        unsigned(z80_addr_s) - to_unsigned(16#E100#, 16);

    z80_rom_select_s <= '1' when
        boot_rom_enabled_s = '1' and
        z80_addr_s(15 downto 13) = "000"
        else '0';

    z80_vram_select_s <= '1' when
        (
            graphics_mode_s = '0' and
            unsigned(z80_addr_s) >= to_unsigned(16#EC00#, 16) and
            unsigned(z80_addr_s) <= to_unsigned(16#EFFF#, 16)
        ) or (
            graphics_mode_s = '1' and
            unsigned(z80_addr_s) >= to_unsigned(16#B000#, 16) and
            unsigned(z80_addr_s) <= to_unsigned(16#CFFF#, 16)
        )
        else '0';

    z80_sector_buffer_select_s <= '1' when
        unsigned(z80_addr_s) >= to_unsigned(16#E100#, 16) and
        unsigned(z80_addr_s) <= to_unsigned(16#E2FF#, 16)
        else '0';

    -- Read-only test aliases outside both text and full-graphics VRAM.
    z80_sd_diag_buffer_select_s <= '1' when
        unsigned(z80_addr_s) >= to_unsigned(16#D000#, 16) and
        unsigned(z80_addr_s) <= to_unsigned(16#D1FF#, 16)
        else '0';

    z80_sd_status_select_s <= '1' when
        z80_addr_s = x"D200" or z80_addr_s = x"D201" or z80_addr_s = x"D202"
        else '0';

    z80_main_ram_select_s <= '1' when
        z80_vram_select_s = '0' and
        z80_sector_buffer_select_s = '0' and
        z80_sd_diag_buffer_select_s = '0' and
        z80_sd_status_select_s = '0' and
        (boot_rom_enabled_s = '0' or z80_addr_s(15) = '1')
        else '0';

    z80_data_in_s <=
        pio_port_b_s when
            z80_iorq_n_s = '0' and
            z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"02" else
        keyboard_data_s when
            z80_iorq_n_s = '0' and
            z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"04" else
        sd_lba_s(7 downto 0) when
            z80_iorq_n_s = '0' and
            z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"10" else
        sd_lba_s(15 downto 8) when
            z80_iorq_n_s = '0' and z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"11" else
        sd_lba_s(23 downto 16) when
            z80_iorq_n_s = '0' and z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"12" else
        sd_lba_s(31 downto 24) when
            z80_iorq_n_s = '0' and z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"13" else
        sd_io_status_s when
            z80_iorq_n_s = '0' and z80_rd_n_s = '0' and
            z80_addr_s(7 downto 0) = x"15" else
        x"FF" when z80_iorq_n_s = '0' else
        rom_data_s when z80_rom_select_s = '1' else
        color_cpu_dout_s when z80_vram_select_s = '1' and color_bank_s = '1' else
        vram_cpu_dout_s when z80_vram_select_s = '1' else
        sector_cpu_data_s when z80_sd_diag_buffer_select_s = '1' else
        sector_cpu_data_s when z80_sector_buffer_select_s = '1' else
        sd_status_s when z80_addr_s = x"D200" else
        sd_debug_state_s when z80_addr_s = x"D201" else
        sd_lba_s(7 downto 0) when z80_addr_s = x"D202" else
        main_ram_data_s when z80_main_ram_select_s = '1' else
        x"FF";

    CPU_TEST : entity work.z80_core_wrapper
        port map (
            clk        => I_pxl_clk,
            clk_enable => cpu_ce_s,
            reset_n    => cpu_reset_n_s,
            data_in    => z80_data_in_s,
            data_out   => z80_data_out_s,
            address    => z80_addr_s,
            m1_n       => z80_m1_n_s,
            mreq_n     => z80_mreq_n_s,
            iorq_n     => z80_iorq_n_s,
            rd_n       => z80_rd_n_s,
            wr_n       => z80_wr_n_s,
            rfsh_n     => z80_rfsh_n_s,
            halt_n     => z80_halt_n_s,
            busak_n    => z80_busak_n_s
        );

    z80_control_s <=
        z80_m1_n_s &
        z80_mreq_n_s &
        z80_iorq_n_s &
        z80_rd_n_s &
        z80_wr_n_s &
        z80_rfsh_n_s &
        z80_halt_n_s &
        z80_busak_n_s;

    ---------------------------------------------------------------------------
    -- Direct Z80 connection to VRAM port A.
    -- Refresh cycles cannot write because WR_n remains inactive.  The write
    -- enable below is asserted only for a valid memory-write cycle inside
    -- the currently visible VRAM window and only on a CPU clock-enable edge.
    ---------------------------------------------------------------------------
    vram_cpu_offset_s <=
        unsigned(z80_addr_s) - to_unsigned(16#B000#, 16)
            when graphics_mode_s = '1' else
        unsigned(z80_addr_s) - to_unsigned(16#EC00#, 16);

    vram_cpu_addr_s <= std_logic_vector(vram_cpu_offset_s(12 downto 0));

    vram_cpu_data_s <= z80_data_out_s;

    vram_cpu_we_s <=
        '1' when
            cpu_reset_n_s = '1' and
            cpu_ce_s = '1' and
            z80_vram_select_s = '1' and
            color_bank_s = '0' and
            z80_mreq_n_s = '0' and
            z80_wr_n_s = '0'
        else '0';

    color_cpu_we_s <=
        '1' when
            cpu_reset_n_s = '1' and
            cpu_ce_s = '1' and
            z80_vram_select_s = '1' and
            color_bank_s = '1' and
            z80_mreq_n_s = '0' and
            z80_wr_n_s = '0'
        else '0';

    ---------------------------------------------------------------------------
    -- 64 KiB main RAM.  During boot, the lower half is deliberately disabled.
    -- The active video-memory window always has priority over main RAM.
    ---------------------------------------------------------------------------
    main_ram_cpu_we_s <=
        '1' when
            cpu_reset_n_s = '1' and
            cpu_ce_s = '1' and
            z80_main_ram_select_s = '1' and
            z80_mreq_n_s = '0' and
            z80_wr_n_s = '0'
        else '0';

    sector_cpu_we_s <=
        '1' when
            cpu_reset_n_s = '1' and
            cpu_ce_s = '1' and
            z80_sector_buffer_select_s = '1' and
            z80_mreq_n_s = '0' and
            z80_wr_n_s = '0'
        else '0';

    MAIN_MEMORY : entity work.main_ram
        port map (
            clk      => I_pxl_clk,
            address  => z80_addr_s,
            data_in  => z80_data_out_s,
            data_out => main_ram_data_s,
            write_en => main_ram_cpu_we_s
        );

    ---------------------------------------------------------------------------
    -- Real 8 KiB dual-port Z1013 video RAM.  Text mode uses its lower
    -- 1 KiB through EC00h..EFFFh; graphics mode uses all 8 KiB through
    -- B000h..CFFFh. Port B remains the independent video read port.
    ---------------------------------------------------------------------------
    VIDEO_RAM : entity work.video_ram
        port map (
            cpu_clk    => I_pxl_clk,
            cpu_addr   => vram_cpu_addr_s,
            cpu_din    => vram_cpu_data_s,
            cpu_dout   => vram_cpu_dout_s,
            cpu_we     => vram_cpu_we_s,
            video_clk  => I_pxl_clk,
            video_addr => vram_addr_s,
            video_dout => vram_data_s
        );

    ---------------------------------------------------------------------------
    -- Hidden 8 KiB colour RAM. It has the same address organization as the
    -- monochrome VRAM and is therefore valid in text and full-graphics mode.
    ---------------------------------------------------------------------------
    COLOR_MEMORY : entity work.color_ram
        port map (
            cpu_clk    => I_pxl_clk,
            cpu_addr   => vram_cpu_addr_s,
            cpu_din    => vram_cpu_data_s,
            cpu_dout   => color_cpu_dout_s,
            cpu_we     => color_cpu_we_s,
            video_clk  => I_pxl_clk,
            video_addr => vram_addr_s,
            video_dout => color_data_s
        );

    ---------------------------------------------------------------------------
    -- Compensate the synchronous one-pixel-clock latency of VRAM port B.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, I_rst_n)
    begin
        if I_rst_n = '0' then
            char_row_pipe_s <= (others => '0');
            char_col_pipe_s <= (others => '0');
            graphics_mode_pipe_s <= '0';
            video_active_pipe_s <= '0';
            z1013_active_pipe_s <= '0';
            hsync_pipe_s <= '0';
            vsync_pipe_s <= '0';
        elsif rising_edge(I_pxl_clk) then
            char_row_pipe_s <= char_row_s;
            char_col_pipe_s <= char_col_s;
            graphics_mode_pipe_s <= graphics_mode_s;
            video_active_pipe_s <= video_active_raw_s;
            z1013_active_pipe_s <= z1013_active_raw_s;
            hsync_pipe_s <= hsync_raw_s;
            vsync_pipe_s <= vsync_raw_s;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Real Z1013 256-character / 2-KByte font ROM.
    ---------------------------------------------------------------------------
    FONT_ROM : entity work.font_rom
        port map (
            char_code => unsigned(vram_data_s(7 downto 0)),
            char_row  => char_row_pipe_s,
            font_data => font_data_s
        );

    font_pixel_s <= font_data_s(7 - to_integer(char_col_pipe_s));

    -- Text mode uses the complete original character ROM.  Graphics mode
    -- bypasses it and shifts the addressed VRAM byte directly to the screen.
    visible_pixel_s <=
        vram_data_s(7 - to_integer(char_col_pipe_s))
            when z1013_active_pipe_s = '1' and graphics_mode_pipe_s = '1' else
        font_pixel_s
            when z1013_active_pipe_s = '1' else
        '0';

    -- A colour byte describes both logical monochrome states. This keeps the
    -- original 1-bit picture and character generator completely unchanged.
    color_index_s <=
        color_data_s(3 downto 0) when visible_pixel_s = '1' else
        color_data_s(7 downto 4);

    pixel_rgb_s <=
        palette_rgb_f(color_index_s)
            when z1013_active_pipe_s = '1' and color_enabled_s = '1' else
        x"FFFFFF"
            when visible_pixel_s = '1' else
        x"000000";

    ---------------------------------------------------------------------------
    -- One final pixel-clock register separates VRAM/font/palette from the
    -- official TMDS encoder. DE, sync and RGB are delayed together, so their
    -- alignment and the established 1280x720 timing remain unchanged.
    --
    -- During blanking the otherwise invisible CPU values are still registered
    -- into RGB. This keeps the complete T80 logic in the design without
    -- placing it in the active video timing path.
    ---------------------------------------------------------------------------
    process(I_pxl_clk, I_rst_n)
    begin
        if I_rst_n = '0' then
            output_de_s <= '0';
            output_hs_s <= '0';
            output_vs_s <= '0';
            output_rgb_s <= (others => '0');
        elsif rising_edge(I_pxl_clk) then
            output_de_s <= video_active_pipe_s;
            output_hs_s <= hsync_pipe_s;
            output_vs_s <= vsync_pipe_s;

            if video_active_pipe_s = '0' then
                output_rgb_s(23 downto 16) <= z80_addr_s(7 downto 0);
                output_rgb_s(15 downto 8) <= z80_addr_s(15 downto 8);
                output_rgb_s(7 downto 0) <= z80_data_out_s xor z80_control_s;
            else
                output_rgb_s <= pixel_rgb_s;
            end if;
        end if;
    end process;

    O_de <= output_de_s;
    O_hs <= output_hs_s;
    O_vs <= output_vs_s;
    O_data_r <= output_rgb_s(23 downto 16);
    O_data_g <= output_rgb_s(15 downto 8);
    O_data_b <= output_rgb_s(7 downto 0);

end architecture Behavioral;
