library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Z1013 64 KiB main memory.
--
-- The CPU uses I_pxl_clk as its physical clock and advances only on its
-- clock-enable pulse.  This synchronous RAM therefore has several pixel
-- clocks to provide stable read data before the next T80 state.

entity main_ram is
    port (
        clk      : in  std_logic;
        address  : in  std_logic_vector(15 downto 0);
        data_in  : in  std_logic_vector(7 downto 0);
        data_out : out std_logic_vector(7 downto 0);
        write_en : in  std_logic
    );
end entity main_ram;

architecture Behavioral of main_ram is

    type ram_t is array (0 to 65535) of std_logic_vector(7 downto 0);
    signal memory_s : ram_t;
    signal data_out_s : std_logic_vector(7 downto 0) := (others => '0');

    attribute syn_ramstyle : string;
    attribute syn_ramstyle of memory_s : signal is "block_ram";

begin

    process(clk)
        variable address_v : integer range 0 to 65535;
    begin
        if rising_edge(clk) then
            address_v := to_integer(unsigned(address));

            if write_en = '1' then
                memory_s(address_v) <= data_in;
            end if;

            data_out_s <= memory_s(address_v);
        end if;
    end process;

    data_out <= data_out_s;

end architecture Behavioral;
