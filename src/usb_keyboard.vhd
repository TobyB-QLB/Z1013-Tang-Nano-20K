library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- German USB keyboard front end. Uses byte 2 of Companion HID transactions:
-- 0..67 HID usages, 68..6F modifiers, bit 7 = release. FF clears unplugged keys.
-- Minimum input spacing is 24 SPI clocks; conversion completes in <=4 pixel clocks.
entity usb_keyboard is
 port(I_clk, I_rst_n: in std_logic;
      I_event: in std_logic_vector(7 downto 0); I_valid: in std_logic;
      O_matrix: out std_logic_vector(79 downto 0);
      O_reset_request: out std_logic;
      O_cpu_speed: out std_logic_vector(1 downto 0);
      O_speed_changed: out std_logic);
end;
architecture rtl of usb_keyboard is
 signal held: std_logic_vector(111 downto 0) := (others=>'0');
 attribute syn_ramstyle: string;
 attribute syn_ramstyle of held: signal is "registers";
 signal scan: std_logic_vector(7 downto 0) := x"00";
 signal valid: std_logic := '0';
 signal pending_code: std_logic_vector(7 downto 0);
 signal pending_release: std_logic;
 signal phase: integer range 0 to 2 := 0;
 signal base_matrix: std_logic_vector(79 downto 0);
 signal macro_active: std_logic;
 function set2(h: integer) return unsigned is
 begin
 case h is
 when 4 => return to_unsigned(28,9);
 when 5 => return to_unsigned(50,9);
 when 6 => return to_unsigned(33,9);
 when 7 => return to_unsigned(35,9);
 when 8 => return to_unsigned(36,9);
 when 9 => return to_unsigned(43,9);
 when 10 => return to_unsigned(52,9);
 when 11 => return to_unsigned(51,9);
 when 12 => return to_unsigned(67,9);
 when 13 => return to_unsigned(59,9);
 when 14 => return to_unsigned(66,9);
 when 15 => return to_unsigned(75,9);
 when 16 => return to_unsigned(58,9);
 when 17 => return to_unsigned(49,9);
 when 18 => return to_unsigned(68,9);
 when 19 => return to_unsigned(77,9);
 when 20 => return to_unsigned(21,9);
 when 21 => return to_unsigned(45,9);
 when 22 => return to_unsigned(27,9);
 when 23 => return to_unsigned(44,9);
 when 24 => return to_unsigned(60,9);
 when 25 => return to_unsigned(42,9);
 when 26 => return to_unsigned(29,9);
 when 27 => return to_unsigned(34,9);
 when 28 => return to_unsigned(26,9);
 when 29 => return to_unsigned(53,9);
 when 40 => return to_unsigned(90,9);
 when 41 => return to_unsigned(118,9);
 when 42 => return to_unsigned(102,9);
 when 43 => return to_unsigned(13,9);
 when 44 => return to_unsigned(41,9);
 when 57 => return to_unsigned(88,9);
 when 58 => return to_unsigned(5,9);
 when 59 => return to_unsigned(6,9);
 when 66 => return to_unsigned(1,9);
 when 67 => return to_unsigned(9,9);
 when 68 => return to_unsigned(120,9);
 when 69 => return to_unsigned(7,9);
 when 76 => return to_unsigned(369,9);
 when 79 => return to_unsigned(372,9);
 when 80 => return to_unsigned(363,9);
 when 81 => return to_unsigned(370,9);
 when 82 => return to_unsigned(373,9);
 when 88 => return to_unsigned(90,9);
 when 104 => return to_unsigned(20,9);
 when 105 => return to_unsigned(18,9);
 when 106 => return to_unsigned(17,9);
 when 108 => return to_unsigned(276,9);
 when 109 => return to_unsigned(89,9);
 when 110 => return to_unsigned(273,9);
 when others => return to_unsigned(0,9);
 end case;
 end;
begin
 decoder: entity work.ps2_keyboard generic map(EXTERNAL_SCAN=>true)
 port map(I_clk=>I_clk, I_rst_n=>I_rst_n, I_ps2_clk=>'1', I_ps2_data=>'1',
 I_scan_code=>scan,I_scan_valid=>valid,O_matrix=>base_matrix,
 O_reset_request=>O_reset_request,O_cpu_speed=>O_cpu_speed,
 O_speed_changed=>O_speed_changed,O_macro_active=>macro_active);
 process(I_clk,I_rst_n)
 variable h: integer; variable code: unsigned(8 downto 0);
 begin
 if I_rst_n='0' then
  held <= (others=>'0'); scan<=x"00";valid<='0';phase<=0;
  pending_code<=x"00"; pending_release<='0';
 elsif rising_edge(I_clk) then
  valid<='0';
  if phase=1 then
   valid<='1';
   if pending_release='1' then scan<=x"F0";phase<=2;
   else scan<=pending_code;phase<=0;end if;
  elsif phase=2 then
   valid<='1';scan<=pending_code;phase<=0;
  elsif I_valid='1' then
   if I_event=x"FF" then
    held<=(others=>'0');scan<=x"AA";valid<='1';
   else
    h:=to_integer(unsigned(I_event(6 downto 0)));
    if h<112 then
     held(h)<=not I_event(7);
     code:=set2(h);
     if code/=0 then
      pending_code<=std_logic_vector(code(7 downto 0));pending_release<=I_event(7);
      valid<='1';
      if code(8)='1' then scan<=x"E0";phase<=1;
      elsif I_event(7)='1' then scan<=x"F0";phase<=2;
      else scan<=std_logic_vector(code(7 downto 0));end if;
     end if;
    end if;
   end if;
  end if;
 end if;
 end process;

 -- German punctuation becomes the monitor's US-like matrix combinations.
 -- National characters absent from the monitor character set are not invented.
 -- A symbol determines the monitor Shift state while held; macros take priority.
 process(held,base_matrix,macro_active)
 variable m: std_logic_vector(79 downto 0);
 variable shift,altgr: boolean;
 variable symbol_active, symbol_shift: boolean;
 procedure symbol(constant key: integer;constant shifted: boolean) is
 begin
  m(key):='1';symbol_active:=true;
  if shifted then symbol_shift:=true;end if;
 end;
 begin
 m:=base_matrix;shift:=held(16#69#)='1' or held(16#6D#)='1';altgr:=held(16#6E#)='1';
 symbol_active:=false;symbol_shift:=false;
 if macro_active='0' then
  if held(30)='1' then
   if altgr then null;
   elsif shift then symbol(64,true);
   else symbol(64,false); end if;
  end if;
  if held(31)='1' then
   if altgr then null;
   elsif shift then symbol(19,true);
   else symbol(63,false); end if;
  end if;
  if held(32)='1' then
   if altgr then null;
   elsif shift then null;
   else symbol(62,false); end if;
  end if;
  if held(33)='1' then
   if altgr then null;
   elsif shift then symbol(61,true);
   else symbol(61,false); end if;
  end if;
  if held(34)='1' then
   if altgr then null;
   elsif shift then symbol(60,true);
   else symbol(60,false); end if;
  end if;
  if held(35)='1' then
   if altgr then null;
   elsif shift then symbol(58,true);
   else symbol(59,false); end if;
  end if;
  if held(36)='1' then
   if altgr then symbol(36,true);
   elsif shift then symbol(3,false);
   else symbol(58,false); end if;
  end if;
  if held(37)='1' then
   if altgr then symbol(36,false);
   elsif shift then symbol(56,true);
   else symbol(57,false); end if;
  end if;
  if held(38)='1' then
   if altgr then symbol(35,false);
   elsif shift then symbol(55,true);
   else symbol(56,false); end if;
  end if;
  if held(39)='1' then
   if altgr then symbol(35,true);
   elsif shift then symbol(53,false);
   else symbol(55,false); end if;
  end if;
  if held(45)='1' then
   if altgr then symbol(51,false);
   elsif shift then symbol(3,true);
   else null; end if;
  end if;
  if held(46)='1' then
   if altgr then null;
   elsif shift then symbol(52,false);
   else null; end if;
  end if;
  if held(48)='1' then
   if altgr then symbol(52,true);
   elsif shift then symbol(57,true);
   else symbol(53,true); end if;
  end if;
  if held(49)='1' then
   if altgr then null;
   elsif shift then symbol(19,false);
   else symbol(62,true); end if;
  end if;
  if held(50)='1' then
   if altgr then null;
   elsif shift then symbol(19,false);
   else symbol(62,true); end if;
  end if;
  if held(53)='1' then
   if altgr then null;
   elsif shift then null;
   else symbol(59,true); end if;
  end if;
  if held(54)='1' then
   if altgr then null;
   elsif shift then symbol(20,false);
   else symbol(5,false); end if;
  end if;
  if held(55)='1' then
   if altgr then null;
   elsif shift then symbol(20,true);
   else symbol(4,false); end if;
  end if;
  if held(56)='1' then
   if altgr then null;
   elsif shift then symbol(54,true);
   else symbol(54,false); end if;
  end if;
  if held(100)='1' then
   if altgr then symbol(51,true);
   elsif shift then symbol(4,true);
   else symbol(5,true); end if;
  end if;
  if altgr and held(16#14#)='1' then
   m(46):='0';symbol(63,true); -- AltGr+Q -> @
  end if;
  if symbol_active then
   m(2):='0';m(13):='0';
   if symbol_shift then m(2):='1';end if;
  end if;
 end if;
 O_matrix<=m;
 end process;
end;
