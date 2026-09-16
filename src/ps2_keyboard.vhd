library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Receive-only PS/2 keyboard interface for the Z1013 reconstruction.
--
-- The keyboard uses the normal PS/2 Scan Code Set 2.  Clock and data are
-- sampled and filtered in the existing 74.25 MHz pixel-clock domain; no new
-- physical FPGA clock is created.  Valid make/break codes are converted into
-- the active-high 10 x 8 matrix expected by the recovered Z1013 monitor.
--
-- Matrix output convention:
--   O_matrix(row * 8 + bit) = '1' while that key is held.
--
-- The interface remains deliberately receive-only.  Both Shift keys and both
-- Control keys are translated into the original monitor's matrix modifier
-- positions.  Caps Lock emulates the historical mechanically latched case-lock
-- key locally; its keyboard LED cannot be updated because no commands are sent
-- to the keyboard.

entity ps2_keyboard is
    generic (EXTERNAL_SCAN : boolean := false);
    port (
        I_clk       : in  std_logic;
        I_rst_n     : in  std_logic;
        I_ps2_clk   : in  std_logic;
        I_ps2_data  : in  std_logic;
        I_scan_code : in std_logic_vector(7 downto 0) := x"00";
        I_scan_valid : in std_logic := '0';
        O_speed_changed : out std_logic;
        O_macro_active : out std_logic;
        O_matrix    : out std_logic_vector(79 downto 0);
        O_reset_request : out std_logic;
        -- 00 = 1 MHz, 01 = 2 MHz, 10 = 4 MHz, 11 = 8.25 MHz
        O_cpu_speed : out std_logic_vector(1 downto 0)
    );
end entity ps2_keyboard;

architecture Behavioral of ps2_keyboard is

    signal ps2_clk_meta_s : std_logic := '1';
    signal ps2_clk_sync_s : std_logic := '1';
    signal ps2_data_meta_s : std_logic := '1';
    signal ps2_data_sync_s : std_logic := '1';

    signal ps2_clk_filter_s : std_logic_vector(7 downto 0) := (others => '1');
    signal ps2_data_filter_s : std_logic_vector(7 downto 0) := (others => '1');
    signal ps2_clk_filtered_s : std_logic := '1';
    signal ps2_data_filtered_s : std_logic := '1';
    signal ps2_clk_previous_s : std_logic := '1';

    signal bit_count_s : integer range 0 to 10 := 0;
    signal receive_data_s : std_logic_vector(7 downto 0) := (others => '0');
    signal receive_parity_s : std_logic := '0';
    signal parity_bit_s : std_logic := '0';
    signal receive_timeout_s : unsigned(19 downto 0) := (others => '0');

    signal scan_code_s : std_logic_vector(7 downto 0) := (others => '0');
    signal scan_valid_s : std_logic := '0';

    signal break_pending_s : std_logic := '0';
    signal extended_pending_s : std_logic := '0';
    signal matrix_state_s : std_logic_vector(79 downto 0) := (others => '0');

    -- A variable bit write made GowinSynthesis implement these mere 80 key
    -- states in a complete BSRAM block. They are deliberately kept as normal
    -- flip-flops in the COLOR project.
    attribute syn_ramstyle : string;
    attribute syn_ramstyle of matrix_state_s : signal is "registers";

    signal left_shift_s : std_logic := '0';
    signal right_shift_s : std_logic := '0';
    signal left_control_s : std_logic := '0';
    signal right_control_s : std_logic := '0';
    signal left_alt_s : std_logic := '0';
    signal right_alt_s : std_logic := '0';
    signal caps_lock_s : std_logic := '0';
    signal caps_key_down_s : std_logic := '0';
    signal reset_request_s : std_logic := '0';

    -- F1/F2 are local keyboard macros. The original monitor scans empty
    -- rows in polling loops and can need tens of milliseconds at 1 MHz.
    -- Every phase lasts 40 ms, including Shift+2 and the following Shift-only
    -- phase. Keep Shift held after releasing 2: the scanner first remembers
    -- the key and only later reads the modifiers. Releasing Shift early can
    -- turn the pending @ into 2. Verified against the unmodified FD20 scanner.
    constant MACRO_PHASE_LAST_C : unsigned(21 downto 0) :=
        to_unsigned(2969999, 22);
    signal macro_phase_s : integer range 0 to 10 := 0;
    signal macro_counter_s : unsigned(21 downto 0) := (others => '0');
    signal macro_is_dl_s : std_logic := '0';
    signal f1_down_s : std_logic := '0';
    signal f2_down_s : std_logic := '0';
    signal cpu_speed_s : std_logic_vector(1 downto 0) := "11";

begin

    O_macro_active <= '1' when macro_phase_s /= 0 else '0';
    O_reset_request <= reset_request_s;
    O_cpu_speed <= cpu_speed_s;

    ---------------------------------------------------------------------------
    -- Input synchronizers, eight-sample glitch filters and PS/2 receiver.
    -- PS/2 data is captured on falling clock edges.  A frame consists of a
    -- zero start bit, eight LSB-first data bits, odd parity and a one stop bit.
    ---------------------------------------------------------------------------
    physical_receiver: if not EXTERNAL_SCAN generate
    process(I_clk, I_rst_n)
    begin
        if I_rst_n = '0' then
            ps2_clk_meta_s <= '1';
            ps2_clk_sync_s <= '1';
            ps2_data_meta_s <= '1';
            ps2_data_sync_s <= '1';
            ps2_clk_filter_s <= (others => '1');
            ps2_data_filter_s <= (others => '1');
            ps2_clk_filtered_s <= '1';
            ps2_data_filtered_s <= '1';
            ps2_clk_previous_s <= '1';
            bit_count_s <= 0;
            receive_data_s <= (others => '0');
            receive_parity_s <= '0';
            parity_bit_s <= '0';
            receive_timeout_s <= (others => '0');
            scan_code_s <= (others => '0');
            scan_valid_s <= '0';
        elsif rising_edge(I_clk) then
            scan_valid_s <= '0';

            ps2_clk_meta_s <= I_ps2_clk;
            ps2_clk_sync_s <= ps2_clk_meta_s;
            ps2_data_meta_s <= I_ps2_data;
            ps2_data_sync_s <= ps2_data_meta_s;

            ps2_clk_filter_s <= ps2_clk_filter_s(6 downto 0) & ps2_clk_sync_s;
            ps2_data_filter_s <= ps2_data_filter_s(6 downto 0) & ps2_data_sync_s;

            if ps2_clk_filter_s = x"00" then
                ps2_clk_filtered_s <= '0';
            elsif ps2_clk_filter_s = x"FF" then
                ps2_clk_filtered_s <= '1';
            end if;

            if ps2_data_filter_s = x"00" then
                ps2_data_filtered_s <= '0';
            elsif ps2_data_filter_s = x"FF" then
                ps2_data_filtered_s <= '1';
            end if;

            ps2_clk_previous_s <= ps2_clk_filtered_s;

            if bit_count_s = 0 then
                receive_timeout_s <= (others => '0');
            elsif receive_timeout_s = (receive_timeout_s'range => '1') then
                -- An incomplete frame is abandoned after about 14 ms.
                bit_count_s <= 0;
                receive_timeout_s <= (others => '0');
            else
                receive_timeout_s <= receive_timeout_s + 1;
            end if;

            if ps2_clk_previous_s = '1' and ps2_clk_filtered_s = '0' then
                receive_timeout_s <= (others => '0');

                case bit_count_s is
                    when 0 =>
                        if ps2_data_filtered_s = '0' then
                            bit_count_s <= 1;
                            receive_parity_s <= '0';
                        end if;

                    when 1 to 8 =>
                        receive_data_s(bit_count_s - 1) <= ps2_data_filtered_s;
                        receive_parity_s <= receive_parity_s xor ps2_data_filtered_s;
                        bit_count_s <= bit_count_s + 1;

                    when 9 =>
                        parity_bit_s <= ps2_data_filtered_s;
                        bit_count_s <= 10;

                    when 10 =>
                        if
                            ps2_data_filtered_s = '1' and
                            (receive_parity_s xor parity_bit_s) = '1'
                        then
                            scan_code_s <= receive_data_s;
                            scan_valid_s <= '1';
                        end if;

                        bit_count_s <= 0;

                    when others =>
                        bit_count_s <= 0;
                end case;
            end if;
        end if;
    end process;

    end generate;
    external_receiver: if EXTERNAL_SCAN generate
        scan_code_s <= I_scan_code;
        scan_valid_s <= I_scan_valid;
    end generate;

    ---------------------------------------------------------------------------
    -- Scan Code Set 2 to original Z1013 matrix.
    --
    -- The recovered monitor table proves, among others:
    --   row 3 / D5 = A, row 3 / D3 = D,
    --   row 8 / D5 = space and row 2 / D2 = enter.
    --
    -- The connected Solidtek ACK-595 is a US-QWERTY keyboard.  The physical Y
    -- and Z keys therefore use the normal Set-2 Y/Z scan codes.
    --
    -- Original monitor modifier positions recovered from COMMAND.COM:
    --   row 0 / D2 = first Shift key
    --   row 1 / D5 = second Shift key
    --   row 3 / D6 = Control
    --   row 3 / D7 = latched case lock (letters only)
    ---------------------------------------------------------------------------
    process(I_clk, I_rst_n)
        variable key_pressed_v : std_logic;
    begin
        if I_rst_n = '0' then
            break_pending_s <= '0';
            extended_pending_s <= '0';
            matrix_state_s <= (others => '0');
            left_shift_s <= '0';
            right_shift_s <= '0';
            left_control_s <= '0';
            right_control_s <= '0';
            left_alt_s <= '0';
            right_alt_s <= '0';
            caps_lock_s <= '0';
            caps_key_down_s <= '0';
            reset_request_s <= '0';
            macro_phase_s <= 0;
            macro_counter_s <= (others => '0');
            macro_is_dl_s <= '0';
            f1_down_s <= '0';
            f2_down_s <= '0';
            cpu_speed_s <= "11";
            O_speed_changed <= '0';
        elsif rising_edge(I_clk) then
            -- One pixel-clock pulse; the top level stretches it into a complete
            -- Z1013 system reset without disturbing HDMI/TMDS synchronization.
            reset_request_s <= '0';
            O_speed_changed <= '0';

            if macro_phase_s /= 0 then
                if macro_counter_s = MACRO_PHASE_LAST_C then
                    macro_counter_s <= (others => '0');
                    if macro_phase_s = 10 then
                        macro_phase_s <= 0;
                    else
                        macro_phase_s <= macro_phase_s + 1;
                    end if;
                else
                    macro_counter_s <= macro_counter_s + 1;
                end if;
            end if;

            if scan_valid_s = '1' then
                if scan_code_s = x"AA" then
                    -- Keyboard self-test completed; also clears stale keys.
                    break_pending_s <= '0';
                    extended_pending_s <= '0';
                    matrix_state_s <= (others => '0');
                    left_shift_s <= '0';
                    right_shift_s <= '0';
                    left_control_s <= '0';
                    right_control_s <= '0';
                    left_alt_s <= '0';
                    right_alt_s <= '0';
                    caps_lock_s <= '0';
                    caps_key_down_s <= '0';
                    macro_phase_s <= 0;
                    macro_counter_s <= (others => '0');
                    f1_down_s <= '0';
                    f2_down_s <= '0';
                elsif scan_code_s = x"E0" then
                    extended_pending_s <= '1';
                elsif scan_code_s = x"F0" then
                    break_pending_s <= '1';
                else
                    if break_pending_s = '1' then
                        key_pressed_v := '0';
                    else
                        key_pressed_v := '1';
                    end if;

                    -- Modifier keys are kept separately so that pressing both
                    -- Shift or Control keys and releasing only one remains
                    -- unambiguous.
                    if extended_pending_s = '1' and scan_code_s = x"14" then
                        if break_pending_s = '1' then
                            right_control_s <= '0';
                        else
                            right_control_s <= '1';
                        end if;
                    elsif extended_pending_s = '0' and scan_code_s = x"12" then
                        if break_pending_s = '1' then
                            left_shift_s <= '0';
                        else
                            left_shift_s <= '1';
                        end if;
                    elsif extended_pending_s = '0' and scan_code_s = x"59" then
                        if break_pending_s = '1' then
                            right_shift_s <= '0';
                        else
                            right_shift_s <= '1';
                        end if;
                    elsif extended_pending_s = '0' and scan_code_s = x"14" then
                        if break_pending_s = '1' then
                            left_control_s <= '0';
                        else
                            left_control_s <= '1';
                        end if;
                    elsif scan_code_s = x"11" then
                        -- Left Alt is 11h; right Alt (AltGr) is E0h,11h.
                        if extended_pending_s = '1' then
                            right_alt_s <= key_pressed_v;
                        else
                            left_alt_s <= key_pressed_v;
                        end if;
                    elsif extended_pending_s = '0' and scan_code_s = x"58" then
                        if break_pending_s = '1' then
                            caps_key_down_s <= '0';
                        elsif caps_key_down_s = '0' then
                            caps_lock_s <= not caps_lock_s;
                            caps_key_down_s <= '1';
                        end if;
                    elsif extended_pending_s = '0' and scan_code_s = x"05" then
                        -- F1: type @DD followed by Enter exactly once per key
                        -- press; typematic repeats cannot restart the macro.
                        if break_pending_s = '1' then
                            f1_down_s <= '0';
                        elsif f1_down_s = '0' then
                            f1_down_s <= '1';
                            if macro_phase_s = 0 then
                                macro_is_dl_s <= '0';
                                macro_phase_s <= 1;
                                macro_counter_s <= (others => '0');
                            end if;
                        end if;
                    elsif extended_pending_s = '0' and scan_code_s = x"06" then
                        -- F2: type @DL followed by Enter.
                        if break_pending_s = '1' then
                            f2_down_s <= '0';
                        elsif f2_down_s = '0' then
                            f2_down_s <= '1';
                            if macro_phase_s = 0 then
                                macro_is_dl_s <= '1';
                                macro_phase_s <= 1;
                                macro_counter_s <= (others => '0');
                            end if;
                        end if;
                    elsif extended_pending_s = '0' and break_pending_s = '0' and scan_code_s = x"01" then
                        cpu_speed_s <= "00"; O_speed_changed <= '1'; -- F9  = 1 MHz
                    elsif extended_pending_s = '0' and break_pending_s = '0' and scan_code_s = x"09" then
                        cpu_speed_s <= "01"; O_speed_changed <= '1'; -- F10 = 2 MHz
                    elsif extended_pending_s = '0' and break_pending_s = '0' and scan_code_s = x"78" then
                        cpu_speed_s <= "10"; O_speed_changed <= '1'; -- F11 = 4 MHz
                    elsif extended_pending_s = '0' and break_pending_s = '0' and scan_code_s = x"07" then
                        cpu_speed_s <= "11"; O_speed_changed <= '1'; -- F12 = 8.25 MHz
                    elsif extended_pending_s = '1' then
                        case scan_code_s is
                            when x"6B" => matrix_state_s(0)  <= key_pressed_v; -- cursor left  -> 08h
                            when x"74" => matrix_state_s(66) <= key_pressed_v; -- cursor right -> 09h
                            when x"72" => matrix_state_s(67) <= key_pressed_v; -- cursor down  -> 0Ah
                            when x"75" => matrix_state_s(16) <= key_pressed_v; -- cursor up    -> 0Bh
                            when x"71" =>
                                if
                                    (left_control_s = '1' or right_control_s = '1') and
                                    (left_alt_s = '1' or right_alt_s = '1')
                                then
                                    -- Ctrl+Alt+Delete is a local FPGA command,
                                    -- not a Z1013 key. Never expose Delete to
                                    -- the monitor matrix while both modifiers
                                    -- are held, including its break code.
                                    matrix_state_s(33) <= '0';
                                    if key_pressed_v = '1' then
                                        reset_request_s <= '1';
                                    end if;
                                else
                                    matrix_state_s(33) <= key_pressed_v; -- delete
                                end if;
                            when others => null;
                        end case;
                    else
                        case scan_code_s is
                            -- Alphabetic keys.
                            when x"1C" => matrix_state_s(29) <= key_pressed_v; -- A, row 3 D5
                            when x"32" => matrix_state_s(8)  <= key_pressed_v; -- B, row 1 D0
                            when x"21" => matrix_state_s(10) <= key_pressed_v; -- C, row 1 D2
                            when x"23" => matrix_state_s(27) <= key_pressed_v; -- D, row 3 D3
                            when x"24" => matrix_state_s(44) <= key_pressed_v; -- E, row 5 D4
                            when x"2B" => matrix_state_s(26) <= key_pressed_v; -- F, row 3 D2
                            when x"34" => matrix_state_s(25) <= key_pressed_v; -- G, row 3 D1
                            when x"33" => matrix_state_s(24) <= key_pressed_v; -- H, row 3 D0
                            when x"43" => matrix_state_s(39) <= key_pressed_v; -- I, row 4 D7
                            when x"3B" => matrix_state_s(23) <= key_pressed_v; -- J, row 2 D7
                            when x"42" => matrix_state_s(22) <= key_pressed_v; -- K, row 2 D6
                            when x"4B" => matrix_state_s(21) <= key_pressed_v; -- L, row 2 D5
                            when x"3A" => matrix_state_s(6)  <= key_pressed_v; -- M, row 0 D6
                            when x"31" => matrix_state_s(7)  <= key_pressed_v; -- N, row 0 D7
                            when x"44" => matrix_state_s(38) <= key_pressed_v; -- O, row 4 D6
                            when x"4D" => matrix_state_s(37) <= key_pressed_v; -- P, row 4 D5
                            when x"15" => matrix_state_s(46) <= key_pressed_v; -- Q, row 5 D6
                            when x"2D" => matrix_state_s(43) <= key_pressed_v; -- R, row 5 D3
                            when x"1B" => matrix_state_s(28) <= key_pressed_v; -- S, row 3 D4
                            when x"2C" => matrix_state_s(42) <= key_pressed_v; -- T, row 5 D2
                            when x"3C" => matrix_state_s(40) <= key_pressed_v; -- U, row 5 D0
                            when x"2A" => matrix_state_s(9)  <= key_pressed_v; -- V, row 1 D1
                            when x"1D" => matrix_state_s(45) <= key_pressed_v; -- W, row 5 D5
                            when x"22" => matrix_state_s(11) <= key_pressed_v; -- X, row 1 D3
                            when x"1A" => matrix_state_s(12) <= key_pressed_v; -- Z on US QWERTY
                            when x"35" => matrix_state_s(41) <= key_pressed_v; -- Y on US QWERTY

                            -- Number row.
                            when x"16" => matrix_state_s(64) <= key_pressed_v; -- 1, row 8 D0
                            when x"1E" => matrix_state_s(63) <= key_pressed_v; -- 2, row 7 D7
                            when x"26" => matrix_state_s(62) <= key_pressed_v; -- 3, row 7 D6
                            when x"25" => matrix_state_s(61) <= key_pressed_v; -- 4, row 7 D5
                            when x"2E" => matrix_state_s(60) <= key_pressed_v; -- 5, row 7 D4
                            when x"36" => matrix_state_s(59) <= key_pressed_v; -- 6, row 7 D3
                            when x"3D" => matrix_state_s(58) <= key_pressed_v; -- 7, row 7 D2
                            when x"3E" => matrix_state_s(57) <= key_pressed_v; -- 8, row 7 D1
                            when x"46" => matrix_state_s(56) <= key_pressed_v; -- 9, row 7 D0
                            when x"45" => matrix_state_s(55) <= key_pressed_v; -- 0, row 6 D7

                            -- Editing and punctuation keys.
                            when x"66" => matrix_state_s(0)  <= key_pressed_v; -- backspace
                            when x"0D" => matrix_state_s(66) <= key_pressed_v; -- tab
                            when x"5A" => matrix_state_s(18) <= key_pressed_v; -- enter
                            when x"76" => matrix_state_s(65) <= key_pressed_v; -- escape
                            when x"29" => matrix_state_s(69) <= key_pressed_v; -- space
                            when x"4E" => matrix_state_s(54) <= key_pressed_v; -- minus
                            when x"55" => matrix_state_s(53) <= key_pressed_v; -- equals
                            when x"0E" => matrix_state_s(52) <= key_pressed_v; -- grave accent
                            when x"5D" => matrix_state_s(51) <= key_pressed_v; -- backslash
                            when x"54" => matrix_state_s(36) <= key_pressed_v; -- left bracket
                            when x"5B" => matrix_state_s(35) <= key_pressed_v; -- right bracket
                            when x"4C" => matrix_state_s(20) <= key_pressed_v; -- semicolon
                            when x"52" => matrix_state_s(19) <= key_pressed_v; -- apostrophe
                            when x"41" => matrix_state_s(5)  <= key_pressed_v; -- comma
                            when x"49" => matrix_state_s(4)  <= key_pressed_v; -- full stop
                            when x"4A" => matrix_state_s(3)  <= key_pressed_v; -- slash

                            when others => null;
                        end case;
                    end if;

                    break_pending_s <= '0';
                    extended_pending_s <= '0';
                end if;
            end if;
        end if;
    end process;

    ---------------------------------------------------------------------------
    -- Add the historical modifier positions to the normal key matrix.
    -- The monitor itself performs case conversion and Control-code generation.
    ---------------------------------------------------------------------------
    process(
        matrix_state_s,
        left_shift_s,
        right_shift_s,
        left_control_s,
        right_control_s,
        caps_lock_s,
        macro_phase_s,
        macro_is_dl_s
    )
        variable matrix_output_v : std_logic_vector(79 downto 0);
    begin
        matrix_output_v := (others => '0');

        if macro_phase_s = 0 then
            matrix_output_v := matrix_state_s;

            if left_shift_s = '1' then
                matrix_output_v(2) := '1';  -- row 0 / D2
            end if;

            if right_shift_s = '1' then
                matrix_output_v(13) := '1'; -- row 1 / D5
            end if;

            if left_control_s = '1' or right_control_s = '1' then
                matrix_output_v(30) := '1'; -- row 3 / D6
            end if;

            if caps_lock_s = '1' then
                matrix_output_v(31) := '1'; -- row 3 / D7
            end if;
        else
            -- The monitor scans the matrix row by row. Shift therefore gets
            -- one complete phase before the 2 key is pressed, otherwise a
            -- stray unshifted 2 can appear before the @ character.
            case macro_phase_s is
                when 1 =>
                    matrix_output_v(2) := '1';  -- Shift settles first
                when 2 =>
                    matrix_output_v(2) := '1';  -- Shift remains active
                    matrix_output_v(63) := '1'; -- 2 -> @
                when 3 =>
                    matrix_output_v(2) := '1';  -- release 2, then Shift
                when 5 =>
                    matrix_output_v(27) := '1'; -- D
                when 7 =>
                    if macro_is_dl_s = '1' then
                        matrix_output_v(21) := '1'; -- L
                    else
                        matrix_output_v(27) := '1'; -- D
                    end if;
                when 9 =>
                    matrix_output_v(18) := '1'; -- Enter
                when others => null;
            end case;
        end if;

        O_matrix <= matrix_output_v;
    end process;

end architecture Behavioral;
