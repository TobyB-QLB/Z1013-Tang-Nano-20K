library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- SD/SDHC card reader in SPI mode.
--
-- The controller performs the complete card initialization after reset and
-- reads or writes one 512-byte logical block for every request pulse. During card
-- initialization SCLK is about 400 kHz.  Data blocks use about 9.3 MHz.  SCLK
-- is generated as an ordinary output signal and is never used as an FPGA
-- clock.  All logic remains in the established 74.25-MHz pixel-clock domain.
entity sd_spi_block_reader is
    generic (
        INIT_HALF_DIV_G : positive := 93;
        DATA_HALF_DIV_G : positive := 4
    );
    port (
        clk          : in  std_logic;
        reset_n      : in  std_logic;
        start        : in  std_logic;
        start_write  : in  std_logic;
        lba          : in  std_logic_vector(31 downto 0);
        ready        : out std_logic;
        busy         : out std_logic;
        error        : out std_logic;
        high_capacity: out std_logic;
        writing      : out std_logic;
        debug_state  : out std_logic_vector(7 downto 0);
        buffer_addr  : out std_logic_vector(8 downto 0);
        buffer_data  : out std_logic_vector(7 downto 0);
        buffer_we    : out std_logic;
        write_buffer_addr : out std_logic_vector(8 downto 0);
        write_buffer_data : in  std_logic_vector(7 downto 0);
        sd_clk       : out std_logic;
        sd_cs_n      : out std_logic;
        sd_mosi      : out std_logic;
        sd_miso      : in  std_logic
    );
end entity sd_spi_block_reader;

architecture Behavioral of sd_spi_block_reader is
    type state_t is (
        POWER_WAIT,
        DUMMY_START, DUMMY_WAIT,
        LOAD_CMD0, LOAD_CMD8, LOAD_CMD55, LOAD_ACMD41,
        LOAD_CMD58, LOAD_CMD16, LOAD_CMD17, LOAD_CMD24,
        COMMAND_START, COMMAND_WAIT,
        RESPONSE_START, RESPONSE_WAIT,
        EXTRA_START, EXTRA_WAIT,
        TOKEN_START, TOKEN_WAIT,
        DATA_START, DATA_WAIT,
        CRC_START, CRC_WAIT,
        WRITE_TOKEN_START, WRITE_TOKEN_WAIT,
        WRITE_PREFETCH_WAIT, WRITE_DATA_START, WRITE_DATA_WAIT,
        WRITE_CRC_START, WRITE_CRC_WAIT,
        WRITE_RESPONSE_START, WRITE_RESPONSE_WAIT,
        WRITE_BUSY_START, WRITE_BUSY_WAIT,
        GAP_START, GAP_WAIT,
        IDLE, FAILED
    );

    signal state_s : state_t := POWER_WAIT;
    signal resume_state_s : state_t := LOAD_CMD0;

    signal byte_start_s : std_logic := '0';
    signal byte_busy_s : std_logic := '0';
    signal byte_done_s : std_logic := '0';
    signal byte_tx_s : std_logic_vector(7 downto 0) := x"FF";
    signal byte_rx_s : std_logic_vector(7 downto 0) := x"FF";
    signal byte_tx_shift_s : std_logic_vector(7 downto 0) := x"FF";
    signal byte_rx_shift_s : std_logic_vector(7 downto 0) := x"FF";
    signal byte_bit_s : integer range 0 to 7 := 7;
    signal spi_divider_s : integer range 0 to INIT_HALF_DIV_G - 1 := 0;
    signal spi_half_div_s : integer range 1 to INIT_HALF_DIV_G := INIT_HALF_DIV_G;
    signal spi_clk_s : std_logic := '0';
    signal spi_mosi_s : std_logic := '1';
    signal spi_cs_n_s : std_logic := '1';

    signal command_shift_s : std_logic_vector(47 downto 0) := (others => '1');
    signal command_byte_s : integer range 0 to 5 := 5;
    signal command_id_s : integer range 0 to 7 := 0;
    signal response_tries_s : integer range 0 to 31 := 0;
    signal extra_byte_s : integer range 0 to 3 := 0;
    signal dummy_byte_s : integer range 0 to 9 := 0;
    signal crc_byte_s : integer range 0 to 1 := 0;
    signal init_tries_s : integer range 0 to 65535 := 0;
    signal token_tries_s : integer range 0 to 65535 := 0;
    signal power_wait_s : integer range 0 to 1000000 := 0;
    signal data_index_s : unsigned(8 downto 0) := (others => '0');

    signal card_v2_s : std_logic := '1';
    signal high_capacity_s : std_logic := '0';
    signal card_ready_s : std_logic := '0';
    signal error_s : std_logic := '0';
    signal write_active_s : std_logic := '0';
    signal buffer_addr_s : std_logic_vector(8 downto 0) := (others => '0');
    signal buffer_data_s : std_logic_vector(7 downto 0) := (others => '0');
    signal buffer_we_s : std_logic := '0';
begin
    ready         <= card_ready_s when state_s = IDLE else '0';
    busy          <= '0' when state_s = IDLE or state_s = FAILED else '1';
    error         <= error_s;
    high_capacity <= high_capacity_s;
    writing       <= write_active_s;
    debug_state   <= std_logic_vector(to_unsigned(state_t'pos(state_s), 8));
    buffer_addr   <= buffer_addr_s;
    buffer_data   <= buffer_data_s;
    buffer_we     <= buffer_we_s;
    write_buffer_addr <= std_logic_vector(data_index_s);
    sd_clk        <= spi_clk_s;
    sd_cs_n       <= spi_cs_n_s;
    sd_mosi       <= spi_mosi_s;

    -------------------------------------------------------------------------
    -- One SPI byte, mode 0.  MISO is sampled on the rising SCLK edge and the
    -- next MOSI bit is installed on the following falling edge.
    -------------------------------------------------------------------------
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            byte_busy_s <= '0';
            byte_done_s <= '0';
            byte_tx_shift_s <= x"FF";
            byte_rx_shift_s <= x"FF";
            byte_rx_s <= x"FF";
            byte_bit_s <= 7;
            spi_divider_s <= 0;
            spi_clk_s <= '0';
            spi_mosi_s <= '1';
        elsif rising_edge(clk) then
            byte_done_s <= '0';

            if byte_busy_s = '0' then
                spi_clk_s <= '0';
                spi_divider_s <= 0;
                if byte_start_s = '1' then
                    byte_busy_s <= '1';
                    byte_tx_shift_s <= byte_tx_s;
                    byte_rx_shift_s <= (others => '1');
                    byte_bit_s <= 7;
                    spi_mosi_s <= byte_tx_s(7);
                else
                    spi_mosi_s <= '1';
                end if;
            elsif spi_divider_s = spi_half_div_s - 1 then
                spi_divider_s <= 0;
                if spi_clk_s = '0' then
                    spi_clk_s <= '1';
                    byte_rx_shift_s(byte_bit_s) <= sd_miso;
                else
                    spi_clk_s <= '0';
                    if byte_bit_s = 0 then
                        -- Bit 0 was sampled on the preceding rising edge.
                        -- Do not sample it again on the falling edge, where
                        -- the card is allowed to change MISO for the next bit.
                        byte_rx_s <= byte_rx_shift_s;
                        byte_busy_s <= '0';
                        byte_done_s <= '1';
                        spi_mosi_s <= '1';
                    else
                        byte_bit_s <= byte_bit_s - 1;
                        spi_mosi_s <= byte_tx_shift_s(byte_bit_s - 1);
                    end if;
                end if;
            else
                spi_divider_s <= spi_divider_s + 1;
            end if;
        end if;
    end process;

    -------------------------------------------------------------------------
    -- Card initialization and single-block CMD17 reader.
    -------------------------------------------------------------------------
    process(clk, reset_n)
        variable address_v : unsigned(31 downto 0);
    begin
        if reset_n = '0' then
            state_s <= POWER_WAIT;
            resume_state_s <= LOAD_CMD0;
            byte_start_s <= '0';
            byte_tx_s <= x"FF";
            spi_cs_n_s <= '1';
            spi_half_div_s <= INIT_HALF_DIV_G;
            command_shift_s <= (others => '1');
            command_byte_s <= 5;
            command_id_s <= 0;
            response_tries_s <= 0;
            extra_byte_s <= 0;
            dummy_byte_s <= 0;
            crc_byte_s <= 0;
            init_tries_s <= 0;
            token_tries_s <= 0;
            power_wait_s <= 0;
            data_index_s <= (others => '0');
            card_v2_s <= '1';
            high_capacity_s <= '0';
            card_ready_s <= '0';
            error_s <= '0';
            write_active_s <= '0';
            buffer_addr_s <= (others => '0');
            buffer_data_s <= (others => '0');
            buffer_we_s <= '0';
        elsif rising_edge(clk) then
            byte_start_s <= '0';
            buffer_we_s <= '0';

            case state_s is
                when POWER_WAIT =>
                    spi_cs_n_s <= '1';
                    -- Give the card about 10 ms after FPGA reset before the
                    -- mandatory initial clocks are sent.
                    if power_wait_s = 742500 then
                        dummy_byte_s <= 0;
                        state_s <= DUMMY_START;
                    else
                        power_wait_s <= power_wait_s + 1;
                    end if;

                when DUMMY_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= DUMMY_WAIT;
                    end if;

                when DUMMY_WAIT =>
                    if byte_done_s = '1' then
                        if dummy_byte_s = 9 then
                            state_s <= LOAD_CMD0;
                        else
                            dummy_byte_s <= dummy_byte_s + 1;
                            state_s <= DUMMY_START;
                        end if;
                    end if;

                when LOAD_CMD0 =>
                    spi_cs_n_s <= '0';
                    command_shift_s <= x"400000000095";
                    command_byte_s <= 5;
                    command_id_s <= 0;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_CMD8 =>
                    spi_cs_n_s <= '0';
                    command_shift_s <= x"48000001AA87";
                    command_byte_s <= 5;
                    command_id_s <= 1;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_CMD55 =>
                    spi_cs_n_s <= '0';
                    command_shift_s <= x"7700000001FF";
                    command_byte_s <= 5;
                    command_id_s <= 2;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_ACMD41 =>
                    spi_cs_n_s <= '0';
                    if card_v2_s = '1' then
                        command_shift_s <= x"6940000000FF";
                    else
                        command_shift_s <= x"6900000000FF";
                    end if;
                    command_byte_s <= 5;
                    command_id_s <= 3;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_CMD58 =>
                    spi_cs_n_s <= '0';
                    command_shift_s <= x"7A00000000FF";
                    command_byte_s <= 5;
                    command_id_s <= 4;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_CMD16 =>
                    spi_cs_n_s <= '0';
                    command_shift_s <= x"5000000200FF";
                    command_byte_s <= 5;
                    command_id_s <= 5;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_CMD17 =>
                    spi_cs_n_s <= '0';
                    if high_capacity_s = '1' then
                        address_v := unsigned(lba);
                    else
                        address_v := shift_left(unsigned(lba), 9);
                    end if;
                    command_shift_s <= x"51" & std_logic_vector(address_v) & x"FF";
                    command_byte_s <= 5;
                    command_id_s <= 6;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when LOAD_CMD24 =>
                    spi_cs_n_s <= '0';
                    if high_capacity_s = '1' then
                        address_v := unsigned(lba);
                    else
                        address_v := shift_left(unsigned(lba), 9);
                    end if;
                    command_shift_s <= x"58" & std_logic_vector(address_v) & x"FF";
                    command_byte_s <= 5;
                    command_id_s <= 7;
                    response_tries_s <= 0;
                    state_s <= COMMAND_START;

                when COMMAND_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= command_shift_s(47 downto 40);
                        byte_start_s <= '1';
                        state_s <= COMMAND_WAIT;
                    end if;

                when COMMAND_WAIT =>
                    if byte_done_s = '1' then
                        if command_byte_s = 0 then
                            state_s <= RESPONSE_START;
                        else
                            command_shift_s <= command_shift_s(39 downto 0) & x"FF";
                            command_byte_s <= command_byte_s - 1;
                            state_s <= COMMAND_START;
                        end if;
                    end if;

                when RESPONSE_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= RESPONSE_WAIT;
                    end if;

                when RESPONSE_WAIT =>
                    if byte_done_s = '1' then
                        if byte_rx_s(7) = '1' then
                            if response_tries_s = 31 then
                                error_s <= '1';
                                state_s <= FAILED;
                            else
                                response_tries_s <= response_tries_s + 1;
                                state_s <= RESPONSE_START;
                            end if;
                        else
                            case command_id_s is
                                when 0 =>
                                    if byte_rx_s = x"01" then
                                        spi_cs_n_s <= '1';
                                        resume_state_s <= LOAD_CMD8;
                                        state_s <= GAP_START;
                                    else
                                        error_s <= '1';
                                        state_s <= FAILED;
                                    end if;
                                when 1 =>
                                    if byte_rx_s(2) = '1' then
                                        card_v2_s <= '0';
                                        spi_cs_n_s <= '1';
                                        resume_state_s <= LOAD_CMD55;
                                        state_s <= GAP_START;
                                    else
                                        extra_byte_s <= 0;
                                        state_s <= EXTRA_START;
                                    end if;
                                when 2 =>
                                    if byte_rx_s = x"00" or byte_rx_s = x"01" then
                                        spi_cs_n_s <= '1';
                                        resume_state_s <= LOAD_ACMD41;
                                        state_s <= GAP_START;
                                    else
                                        error_s <= '1';
                                        state_s <= FAILED;
                                    end if;
                                when 3 =>
                                    spi_cs_n_s <= '1';
                                    if byte_rx_s = x"00" then
                                        resume_state_s <= LOAD_CMD58;
                                    elsif byte_rx_s = x"01" and init_tries_s < 65535 then
                                        init_tries_s <= init_tries_s + 1;
                                        resume_state_s <= LOAD_CMD55;
                                    else
                                        error_s <= '1';
                                        resume_state_s <= FAILED;
                                    end if;
                                    state_s <= GAP_START;
                                when 4 =>
                                    if byte_rx_s = x"00" then
                                        extra_byte_s <= 0;
                                        state_s <= EXTRA_START;
                                    else
                                        error_s <= '1';
                                        state_s <= FAILED;
                                    end if;
                                when 5 =>
                                    spi_cs_n_s <= '1';
                                    if byte_rx_s = x"00" then
                                        card_ready_s <= '1';
                                        spi_half_div_s <= DATA_HALF_DIV_G;
                                        resume_state_s <= IDLE;
                                    else
                                        error_s <= '1';
                                        resume_state_s <= FAILED;
                                    end if;
                                    state_s <= GAP_START;
                                when 6 =>
                                    if byte_rx_s = x"00" then
                                        token_tries_s <= 0;
                                        state_s <= TOKEN_START;
                                    else
                                        error_s <= '1';
                                        state_s <= FAILED;
                                    end if;
                                when others =>
                                    if byte_rx_s = x"00" then
                                        data_index_s <= (others => '0');
                                        state_s <= WRITE_TOKEN_START;
                                    else
                                        error_s <= '1';
                                        state_s <= FAILED;
                                    end if;
                            end case;
                        end if;
                    end if;

                when EXTRA_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= EXTRA_WAIT;
                    end if;

                when EXTRA_WAIT =>
                    if byte_done_s = '1' then
                        if command_id_s = 4 and extra_byte_s = 0 then
                            high_capacity_s <= byte_rx_s(6);
                        end if;
                        if extra_byte_s = 3 then
                            spi_cs_n_s <= '1';
                            if command_id_s = 1 then
                                resume_state_s <= LOAD_CMD55;
                            else
                                if high_capacity_s = '1' then
                                    card_ready_s <= '1';
                                    spi_half_div_s <= DATA_HALF_DIV_G;
                                    resume_state_s <= IDLE;
                                else
                                    resume_state_s <= LOAD_CMD16;
                                end if;
                            end if;
                            state_s <= GAP_START;
                        else
                            extra_byte_s <= extra_byte_s + 1;
                            state_s <= EXTRA_START;
                        end if;
                    end if;

                when TOKEN_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= TOKEN_WAIT;
                    end if;

                when TOKEN_WAIT =>
                    if byte_done_s = '1' then
                        if byte_rx_s = x"FE" then
                            data_index_s <= (others => '0');
                            state_s <= DATA_START;
                        elsif token_tries_s = 65535 then
                            error_s <= '1';
                            state_s <= FAILED;
                        else
                            token_tries_s <= token_tries_s + 1;
                            state_s <= TOKEN_START;
                        end if;
                    end if;

                when DATA_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= DATA_WAIT;
                    end if;

                when DATA_WAIT =>
                    if byte_done_s = '1' then
                        buffer_addr_s <= std_logic_vector(data_index_s);
                        buffer_data_s <= byte_rx_s;
                        buffer_we_s <= '1';
                        if data_index_s = to_unsigned(511, data_index_s'length) then
                            crc_byte_s <= 0;
                            state_s <= CRC_START;
                        else
                            data_index_s <= data_index_s + 1;
                            state_s <= DATA_START;
                        end if;
                    end if;

                when CRC_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= CRC_WAIT;
                    end if;

                when CRC_WAIT =>
                    if byte_done_s = '1' then
                        if crc_byte_s = 1 then
                            spi_cs_n_s <= '1';
                            resume_state_s <= IDLE;
                            state_s <= GAP_START;
                        else
                            crc_byte_s <= crc_byte_s + 1;
                            state_s <= CRC_START;
                        end if;
                    end if;

                when WRITE_TOKEN_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FE";
                        byte_start_s <= '1';
                        state_s <= WRITE_TOKEN_WAIT;
                    end if;

                when WRITE_TOKEN_WAIT =>
                    if byte_done_s = '1' then
                        data_index_s <= (others => '0');
                        state_s <= WRITE_PREFETCH_WAIT;
                    end if;

                -- sector_buffer is synchronous. One complete pixel-clock is
                -- allowed after changing data_index_s.
                when WRITE_PREFETCH_WAIT =>
                    state_s <= WRITE_DATA_START;

                when WRITE_DATA_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= write_buffer_data;
                        byte_start_s <= '1';
                        state_s <= WRITE_DATA_WAIT;
                    end if;

                when WRITE_DATA_WAIT =>
                    if byte_done_s = '1' then
                        if data_index_s = to_unsigned(511, data_index_s'length) then
                            crc_byte_s <= 0;
                            state_s <= WRITE_CRC_START;
                        else
                            data_index_s <= data_index_s + 1;
                            state_s <= WRITE_PREFETCH_WAIT;
                        end if;
                    end if;

                when WRITE_CRC_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= WRITE_CRC_WAIT;
                    end if;

                when WRITE_CRC_WAIT =>
                    if byte_done_s = '1' then
                        if crc_byte_s = 1 then
                            state_s <= WRITE_RESPONSE_START;
                        else
                            crc_byte_s <= crc_byte_s + 1;
                            state_s <= WRITE_CRC_START;
                        end if;
                    end if;

                when WRITE_RESPONSE_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= WRITE_RESPONSE_WAIT;
                    end if;

                when WRITE_RESPONSE_WAIT =>
                    if byte_done_s = '1' then
                        if byte_rx_s(4 downto 0) = "00101" then
                            token_tries_s <= 0;
                            state_s <= WRITE_BUSY_START;
                        else
                            error_s <= '1';
                            state_s <= FAILED;
                        end if;
                    end if;

                when WRITE_BUSY_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= WRITE_BUSY_WAIT;
                    end if;

                when WRITE_BUSY_WAIT =>
                    if byte_done_s = '1' then
                        if byte_rx_s = x"FF" then
                            write_active_s <= '0';
                            spi_cs_n_s <= '1';
                            resume_state_s <= IDLE;
                            state_s <= GAP_START;
                        elsif token_tries_s = 65535 then
                            error_s <= '1';
                            state_s <= FAILED;
                        else
                            token_tries_s <= token_tries_s + 1;
                            state_s <= WRITE_BUSY_START;
                        end if;
                    end if;

                when GAP_START =>
                    if byte_busy_s = '0' then
                        byte_tx_s <= x"FF";
                        byte_start_s <= '1';
                        state_s <= GAP_WAIT;
                    end if;

                when GAP_WAIT =>
                    if byte_done_s = '1' then
                        state_s <= resume_state_s;
                    end if;

                when IDLE =>
                    spi_cs_n_s <= '1';
                    error_s <= '0';
                    if start_write = '1' then
                        write_active_s <= '1';
                        state_s <= LOAD_CMD24;
                    elsif start = '1' then
                        state_s <= LOAD_CMD17;
                    end if;

                when FAILED =>
                    spi_cs_n_s <= '1';
                    card_ready_s <= '0';
                    error_s <= '1';
                    write_active_s <= '0';
            end case;
        end if;
    end process;
end architecture Behavioral;
