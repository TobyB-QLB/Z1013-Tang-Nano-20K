library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- 8 KiB dual-port colour attribute RAM.
--
-- Every byte corresponds one-to-one with a byte in the monochrome video RAM:
--   bits 3..0 = foreground colour
--   bits 7..4 = background colour
--
-- Port A is selected by the Z80 through the hidden colour-RAM bank. Port B is
-- read continuously in parallel with the original video RAM. The initial value
-- 0Fh means white foreground on black background.

entity color_ram is
    port (
        cpu_clk    : in  std_logic;
        cpu_addr   : in  std_logic_vector(12 downto 0);
        cpu_din    : in  std_logic_vector(7 downto 0);
        cpu_dout   : out std_logic_vector(7 downto 0);
        cpu_we     : in  std_logic;

        video_clk  : in  std_logic;
        video_addr : in  std_logic_vector(12 downto 0);
        video_dout : out std_logic_vector(7 downto 0)
    );
end entity color_ram;

architecture Behavioral of color_ram is

    type ram_t is array (0 to 8191) of std_logic_vector(7 downto 0);
    signal memory_s : ram_t := (others => x"0F");
    signal cpu_dout_s : std_logic_vector(7 downto 0) := x"0F";
    signal video_dout_s : std_logic_vector(7 downto 0) := x"0F";

    attribute syn_ramstyle : string;
    attribute syn_ramstyle of memory_s : signal is "block_ram";

begin

    process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if cpu_we = '1' then
                memory_s(to_integer(unsigned(cpu_addr))) <= cpu_din;
                cpu_dout_s <= cpu_din;
            else
                cpu_dout_s <= memory_s(to_integer(unsigned(cpu_addr)));
            end if;
        end if;
    end process;

    process(video_clk)
    begin
        if rising_edge(video_clk) then
            video_dout_s <= memory_s(to_integer(unsigned(video_addr)));
        end if;
    end process;

    cpu_dout <= cpu_dout_s;
    video_dout <= video_dout_s;

end architecture Behavioral;
