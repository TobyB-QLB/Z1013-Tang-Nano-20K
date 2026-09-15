library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- 512-byte dual-access buffer. Port A is filled by the QSPI reader; port B is
-- mapped into the Z80 address range E100h..E2FFh and remains CPU-writable.
--
-- This COLOR project deliberately implements the buffer in ordinary FPGA
-- registers instead of consuming a complete 2 KiB BSRAM block. Both users
-- already operate in the same pixel-clock domain, so one synchronous process
-- preserves the former one-clock read latency without introducing a new clock
-- domain. A simultaneous write collision cannot occur in the normal FDC
-- protocol; should it nevertheless happen, the CPU port has priority.
entity sector_buffer is
    port (
        clk       : in  std_logic;
        fill_addr : in  std_logic_vector(8 downto 0);
        fill_data : in  std_logic_vector(7 downto 0);
        fill_we   : in  std_logic;
        cpu_addr  : in  std_logic_vector(8 downto 0);
        cpu_din   : in  std_logic_vector(7 downto 0);
        cpu_dout  : out std_logic_vector(7 downto 0);
        cpu_we    : in  std_logic
    );
end entity sector_buffer;

architecture Behavioral of sector_buffer is
    type memory_t is array (0 to 511) of std_logic_vector(7 downto 0);
    signal memory_s : memory_t;
    signal cpu_dout_s : std_logic_vector(7 downto 0) := (others => '0');

    -- Keep this small scratchpad out of the scarce block RAM resources.
    attribute syn_ramstyle : string;
    attribute syn_ramstyle of memory_s : signal is "registers";
begin
    cpu_dout <= cpu_dout_s;

    process(clk)
    begin
        if rising_edge(clk) then
            cpu_dout_s <= memory_s(to_integer(unsigned(cpu_addr)));

            if fill_we = '1' then
                memory_s(to_integer(unsigned(fill_addr))) <= fill_data;
            end if;

            if cpu_we = '1' then
                memory_s(to_integer(unsigned(cpu_addr))) <= cpu_din;
            end if;
        end if;
    end process;
end architecture Behavioral;
