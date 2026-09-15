library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------
-- video_ram.vhd
--
-- Dual-Port-Bildspeicher fuer Text- und Vollgrafikbetrieb.
--
-- Größe:
--   8192 x 8 Bit = 8 KByte
--
-- Port A:
--   für CPU / Z80
--
-- Port B:
--   für den Videogenerator
--
-- Beide Ports besitzen einen eigenen Takt.
------------------------------------------------------------

entity video_ram is
    port (
        --------------------------------------------------------
        -- CPU / Z80 Port
        --------------------------------------------------------
        cpu_clk  : in  std_logic;
        cpu_addr : in  std_logic_vector(12 downto 0);
        cpu_din  : in  std_logic_vector(7 downto 0);
        cpu_dout : out std_logic_vector(7 downto 0);
        cpu_we   : in  std_logic;

        --------------------------------------------------------
        -- Video Port
        --------------------------------------------------------
        video_clk  : in  std_logic;
        video_addr : in  std_logic_vector(12 downto 0);
        video_dout : out std_logic_vector(7 downto 0)
    );
end entity video_ram;


architecture behavioral of video_ram is

    type ram_t is array (0 to 8191) of std_logic_vector(7 downto 0);
    signal memory_s : ram_t;
    signal cpu_dout_s : std_logic_vector(7 downto 0) := (others => '0');
    signal video_dout_s : std_logic_vector(7 downto 0) := (others => '0');

begin

    -- Port A: synchroner CPU-Lese-/Schreibport.
    process(cpu_clk)
    begin
        if rising_edge(cpu_clk) then
            if cpu_we = '1' then
                memory_s(to_integer(unsigned(cpu_addr))) <= cpu_din;
                -- Write-through vermeidet den von GW2AR-DPB nicht
                -- unterstuetzten Read-before-write-Modus.
                cpu_dout_s <= cpu_din;
            else
                cpu_dout_s <= memory_s(to_integer(unsigned(cpu_addr)));
            end if;
        end if;
    end process;

    -- Port B: unabhaengiger synchroner Nur-Lese-Port fuer die Videoausgabe.
    process(video_clk)
    begin
        if rising_edge(video_clk) then
            video_dout_s <= memory_s(to_integer(unsigned(video_addr)));
        end if;
    end process;

    cpu_dout <= cpu_dout_s;
    video_dout <= video_dout_s;

end architecture behavioral;
