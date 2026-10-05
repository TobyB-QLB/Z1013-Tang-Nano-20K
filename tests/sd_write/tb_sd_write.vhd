library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

entity tb_sd_write is
  generic (RESPONSE_DELAY : natural := 0; BUSY_BYTES : natural := 4;
           RESPONSE_TOKEN : natural := 5; EXPECT_ERROR : boolean := false);
end;
architecture sim of tb_sd_write is
  signal clk : std_logic := '0';
  signal rst, request, ready, busy, err, writing, cs, sclk, mosi : std_logic := '0';
  signal miso : std_logic := '1';
  signal lba : std_logic_vector(31 downto 0) := (others=>'0');
  signal addr : std_logic_vector(8 downto 0);
  signal data : std_logic_vector(7 downto 0);
  signal card_done : boolean := false;
begin
  clk <= not clk after 6734 ps;
  data <= addr(7 downto 0);
  dut: entity work.sd_spi_block_reader port map(
    clk=>clk,reset_n=>rst,start=>'0',start_write=>request,lba=>lba,
    ready=>ready,busy=>busy,error=>err,high_capacity=>open,writing=>writing,
    debug_state=>open,buffer_addr=>open,buffer_data=>open,buffer_we=>open,
    write_buffer_addr=>addr,write_buffer_data=>data,
    sd_clk=>sclk,sd_cs_n=>cs,sd_mosi=>mosi,sd_miso=>miso);
  card: process
    variable rx, cmd : std_logic_vector(7 downto 0);
    variable count : natural := 0;
    procedure exchange(tx : std_logic_vector(7 downto 0); variable v : out std_logic_vector(7 downto 0)) is
    begin
      for i in 7 downto 0 loop
        miso <= tx(i);
        wait until rising_edge(sclk);
        v(i) := mosi;
        wait until falling_edge(sclk);
      end loop;
    end;
  begin
    loop
      if cs/='0' then wait until cs='0'; end if;
      exchange(x"FF",cmd);
      report "Card command " & integer'image(to_integer(unsigned(cmd(5 downto 0))));
      assert cmd(7 downto 6)="01" report "Expected SD command" severity failure;
      for n in 1 to 5 loop exchange(x"FF",rx); end loop;
      case to_integer(unsigned(cmd(5 downto 0))) is
        when 0 => exchange(x"01",rx);
        when 8 =>
          exchange(x"01",rx);
          exchange(x"00",rx);exchange(x"00",rx);exchange(x"01",rx);exchange(x"AA",rx);
        when 55 => exchange(x"01",rx);
        when 41 => exchange(x"00",rx);
        when 58 =>
          exchange(x"00",rx);
          exchange(x"40",rx);exchange(x"00",rx);exchange(x"00",rx);exchange(x"00",rx);
        when 24 =>
          exchange(x"00",rx);
          exchange(x"FF",rx);
          assert rx=x"FE" report "Missing write token" severity failure;
          for n in 0 to 511 loop
            exchange(x"FF",rx);
            assert rx=std_logic_vector(to_unsigned(n mod 256,8)) report "Wrong sector payload" severity failure;
          end loop;
          exchange(x"FF",rx);exchange(x"FF",rx);
          for n in 1 to RESPONSE_DELAY loop exchange(x"FF",rx); end loop;
          exchange(std_logic_vector(to_unsigned(RESPONSE_TOKEN,8)),rx);
          for n in 1 to BUSY_BYTES loop exchange(x"00",rx); end loop;
          exchange(x"FF",rx);
          count := count+1;
          if count=3 then card_done<=true; end if;
        when others => assert false report "Unexpected command" severity failure;
      end case;
      miso <= '1';
      wait until cs='1';
    end loop;
  end process;
  test: process
    variable started : time;
  begin
    rst<='0'; wait for 100 ns; rst<='1';
    wait until ready='1';
    for n in 0 to 2 loop
      lba<=std_logic_vector(to_unsigned(n,32));
      wait until falling_edge(clk); request<='1';
      wait until falling_edge(clk); request<='0';
      if busy/='1' then wait until busy='1'; end if; started:=now;
      wait until busy='0';
      report "Write duration: " & time'image(now-started);
      if EXPECT_ERROR then
        assert err='1' report "Expected write error missing" severity failure;
        wait until rising_edge(clk); wait for 1 ns;
        assert writing='0' and cs='1' and ready='0'
          report "Controller did not release failed write" severity failure;
        report "PASS: failed write reported and bus released";
        stop; wait;
      end if;
      assert err='0' report "Sector write failed" severity failure;
      assert ready='1' report "Controller not ready after write" severity failure;
    end loop;
    assert card_done report "Card did not finish all sectors" severity failure;
    report "PASS: three consecutive sectors";
    stop;
    wait;
  end process;
  watchdog: process begin
    wait for 1500 ms;
    assert false report "Simulation timeout" severity failure;
  end process;
end;
