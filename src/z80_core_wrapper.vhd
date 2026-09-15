library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


------------------------------------------------------------
-- Z80 Core Wrapper für den T80se-Core
--
-- Ziel:
--
--   Diese Datei bildet eine saubere Trennschicht zwischen
--   unserem Z1013-Projekt und dem externen T80se-Z80-Core.
--
--   Der T80se-Core selbst bleibt unverändert.
--
--   Dadurch können wir später ROM, RAM, Video-RAM und I/O
--   übersichtlich an einen klassischen Z80-Bus anschließen.
--
-- Verwendeter Core:
--
--   T80se
--
-- Konfiguration:
--
--   Mode    = 0  -> Z80
--   T2Write = 0  -> WR_n wird im normalen T3 aktiv
--   IOWait  = 1  -> Standard-I/O-Zyklus
--
------------------------------------------------------------

entity z80_core_wrapper is
    port (
        --------------------------------------------------------
        -- Takt und Reset
        --------------------------------------------------------

        clk        : in  std_logic;
        clk_enable : in  std_logic;
        reset_n    : in  std_logic;


        --------------------------------------------------------
        -- Datenbus
        --
        -- data_in:
        --     Daten vom Speicher / I/O zur CPU
        --
        -- data_out:
        --     Daten von der CPU zum Speicher / I/O
        --------------------------------------------------------

        data_in    : in  std_logic_vector(7 downto 0);
        data_out   : out std_logic_vector(7 downto 0);


        --------------------------------------------------------
        -- 16-Bit-Adressbus
        --------------------------------------------------------

        address    : out std_logic_vector(15 downto 0);


        --------------------------------------------------------
        -- Klassische Z80-Steuersignale
        --
        -- Alle Signale sind LOW-aktiv.
        --------------------------------------------------------

        m1_n       : out std_logic;
        mreq_n     : out std_logic;
        iorq_n     : out std_logic;
        rd_n       : out std_logic;
        wr_n       : out std_logic;
        rfsh_n     : out std_logic;
        halt_n     : out std_logic;


        --------------------------------------------------------
        -- Bus-Acknowledge
        --------------------------------------------------------

        busak_n    : out std_logic
    );
end entity z80_core_wrapper;


architecture Structural of z80_core_wrapper is

begin

    ------------------------------------------------------------
    -- T80se Z80-Core
    --
    -- Nicht benötigte externe Eingänge werden zunächst
    -- fest inaktiv beschaltet:
    --
    --   WAIT_n  = 1 -> keine Waitstates
    --   INT_n   = 1 -> kein Interrupt
    --   NMI_n   = 1 -> kein NMI
    --   BUSRQ_n = 1 -> keine Busanforderung
    --
    -- Diese Signale können später problemlos erweitert werden.
    ------------------------------------------------------------

    CPU : entity work.T80se
        generic map (
            Mode    => 0,
            T2Write => 0,
            IOWait  => 1
        )
        port map (
            RESET_n => reset_n,
            CLK_n   => clk,
            CLKEN   => clk_enable,

            WAIT_n  => '1',
            INT_n   => '1',
            NMI_n   => '1',
            BUSRQ_n => '1',

            M1_n    => m1_n,
            MREQ_n  => mreq_n,
            IORQ_n  => iorq_n,
            RD_n    => rd_n,
            WR_n    => wr_n,
            RFSH_n  => rfsh_n,
            HALT_n  => halt_n,
            BUSAK_n => busak_n,

            A       => address,
            DI      => data_in,
            DO      => data_out
        );

end architecture Structural;
