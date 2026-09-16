// Bundled-data toggle mailbox. Source updates only once per HID SPI frame.
// Minimum event spacing: 24 SPI clocks at <=20 MHz = 1.2 us.
// Destination is 74.25 MHz, samples data after three toggle synchronizer stages.
module usb_event_cdc(input clk, reset_n, input [7:0] async_event,
 input async_toggle, output reg [7:0] event_data, output reg event_valid);
 (* syn_preserve=1 *) reg [2:0] toggle_sync;
 reg seen;
 always @(posedge clk or negedge reset_n) begin
  if(!reset_n) begin toggle_sync<=0; seen<=0; event_data<=0; event_valid<=0; end
  else begin
   toggle_sync <= {toggle_sync[1:0],async_toggle};
   event_valid <= 0;
   if(toggle_sync[2] != seen) begin
    event_data <= async_event;
    event_valid <= 1;
    seen <= toggle_sync[2];
   end
  end
 end
endmodule
