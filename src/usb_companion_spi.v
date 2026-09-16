// Original diagnostic implementation of the published MiSTle byte protocol.
// SPI MODE1. Native SPI clock domain: no slow-clock oversampling limit.
module usb_companion_spi (
 input wire reset, cs_n, sclk, mosi,
 output reg miso,
 output reg traffic = 0, status_accepted = 0, config_accepted = 0,
 output reg key_seen = 0, key_down = 0,
 output reg [7:0] key_event = 0,
 output reg event_toggle = 0
);
 reg [2:0] bit_index = 0;
 reg [10:0] byte_index = 0;
 reg [6:0] shift = 0;
 reg [7:0] target = 0, command = 0, arg0 = 0, arg1 = 0;
 wire [7:0] rx_byte = {shift, mosi};
 wire byte_done = !cs_n && bit_index == 7;
 reg [7:0] reply;
 `include "usb_config_rom.vh"

 always @(negedge sclk or posedge cs_n or posedge reset) begin
  if(cs_n || reset) begin
   bit_index <= 0; byte_index <= 0; shift <= 0;
   target <= 0; command <= 0; arg0 <= 0; arg1 <= 0;
  end else begin
   shift <= {shift[5:0], mosi};
   bit_index <= bit_index + 1'b1;
   if(bit_index == 7) begin
    if(byte_index != 2047) byte_index <= byte_index + 1'b1;
    case(byte_index)
     0: target <= rx_byte;
     1: command <= rx_byte;
     2: arg0 <= rx_byte;
     3: arg1 <= rx_byte;
    endcase
   end
  end
 end
 always @* begin
  reply = 0;
  if(target == 0 && command == 0) begin
   if(byte_index == 3) reply = 8'h5c;
   if(byte_index == 4) reply = 8'h42;
  end
  if(target == 0 && command == 8 && byte_index >= 3)
   reply = config_byte(byte_index - 3);
 end
 always @(posedge sclk or posedge cs_n or posedge reset) begin
  if(cs_n || reset) miso <= 0;
  else miso <= reply[7-bit_index];
 end
 // Persistent observations, not reset at each chip-select boundary.
 always @(negedge sclk or posedge reset) begin
  if(reset) begin
   traffic <= 0; status_accepted <= 0; config_accepted <= 0;
   key_seen <= 0; key_down <= 0; key_event <= 0; event_toggle <= 0;
  end else if(byte_done) begin
   traffic <= 1;
   // Companion sends RGB blue only after receiving valid 5c/42 status.
   if(target == 0 && command == 2 && byte_index == 4 &&
      arg0 == 0 && arg1 == 0 && rx_byte == 8'h40)
    status_accepted <= 1;
   // Our XML init action returns this marker after reading config over MISO.
   if(target == 0 && command == 4 && byte_index == 3 &&
      arg0 == 8'h44 && rx_byte == 8'h5a)
    config_accepted <= 1;
   if(target == 1 && command == 1 && byte_index == 2) begin
    key_seen <= 1;
    key_down <= !rx_byte[7];
    key_event <= rx_byte;
    event_toggle <= !event_toggle;
   end
  end
 end
endmodule
