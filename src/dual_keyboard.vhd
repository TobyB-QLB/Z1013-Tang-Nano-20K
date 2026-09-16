library ieee;
use ieee.std_logic_1164.all;
entity dual_keyboard is
 port(I_clk,I_rst_n,I_ps2_clk,I_ps2_data: in std_logic;
 I_usb_event: in std_logic_vector(7 downto 0); I_usb_valid: in std_logic;
 O_matrix: out std_logic_vector(79 downto 0); O_reset_request: out std_logic;
 O_cpu_speed: out std_logic_vector(1 downto 0));
end;
architecture rtl of dual_keyboard is
 signal ps2_matrix,usb_matrix: std_logic_vector(79 downto 0);
 signal ps2_reset,usb_reset,ps2_changed,usb_changed: std_logic;
 signal ps2_speed,usb_speed: std_logic_vector(1 downto 0);
begin
 ps2: entity work.ps2_keyboard port map(I_clk=>I_clk,I_rst_n=>I_rst_n,
 I_ps2_clk=>I_ps2_clk,I_ps2_data=>I_ps2_data,O_matrix=>ps2_matrix,
 O_reset_request=>ps2_reset,O_cpu_speed=>ps2_speed,
 O_speed_changed=>ps2_changed,O_macro_active=>open);
 usb: entity work.usb_keyboard port map(I_clk=>I_clk,I_rst_n=>I_rst_n,
 I_event=>I_usb_event,I_valid=>I_usb_valid,O_matrix=>usb_matrix,
 O_reset_request=>usb_reset,O_cpu_speed=>usb_speed,O_speed_changed=>usb_changed);
 -- Separate held-key state prevents release on one keyboard clearing the other.
 O_matrix<=ps2_matrix or usb_matrix;
 O_reset_request<=ps2_reset or usb_reset;
 process(I_clk,I_rst_n) begin
 if I_rst_n='0' then O_cpu_speed<="11";
 elsif rising_edge(I_clk) then
  if ps2_changed='1' then O_cpu_speed<=ps2_speed;end if;
  if usb_changed='1' then O_cpu_speed<=usb_speed;end if;
 end if;
 end process;
end;
