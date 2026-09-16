// ==============0ooo===================================================0ooo===========
// =  Copyright (C) 2014-2020 Gowin Semiconductor Technology Co.,Ltd.
// =                     All rights reserved.
// ====================================================================================
// 
//  __      __      __
//  \ \    /  \    / /   [File name   ] video_top.v
//   \ \  / /\ \  / /    [Description ] Video demo
//    \ \/ /  \ \/ /     [Timestamp   ] Friday April 10 14:00:30 2020
//     \  /    \  /      [version     ] 2.0
//      \/      \/
//
// ==============0ooo===================================================0ooo===========
// Code Revision History :
// ----------------------------------------------------------------------------------
// Ver:    |  Author    | Mod. Date    | Changes Made:
// ----------------------------------------------------------------------------------
// V1.0    | Caojie     |  4/10/20     | Initial version 
// ----------------------------------------------------------------------------------
// V2.0    | Caojie     | 10/30/20     | DVI IP update 
// ----------------------------------------------------------------------------------
// ==============0ooo===================================================0ooo===========

module video_top
(
    input             I_clk           , //27Mhz
    input             I_rst           ,
    input             I_key           ,
    input             I_ps2_clk       ,
    input             I_ps2_data      ,
    input             I_usb_cs_n,
    input             I_usb_sclk,
    input             I_usb_mosi,
    output            O_usb_miso,
    output            O_usb_irq_n,
    input             I_sd_miso       ,
    output     [4:0]  O_led           ,
    output            running         ,
    output            O_sd_clk        ,
    output            O_sd_cs_n       ,
    output            O_sd_mosi       ,
    output            O_tmds_clk_p    ,
    output            O_tmds_clk_n    ,
    output     [2:0]  O_tmds_data_p   ,//{r,g,b}
    output     [2:0]  O_tmds_data_n   
);

//==================================================
wire        I_rst_n;
assign      I_rst_n = ~I_rst;


//--------------------------
wire        tp0_vs_in  ;
wire        tp0_hs_in  ;
wire        tp0_de_in ;
wire [ 7:0] tp0_data_r/*synthesis syn_keep=1*/;
wire [ 7:0] tp0_data_g/*synthesis syn_keep=1*/;
wire [ 7:0] tp0_data_b/*synthesis syn_keep=1*/;
wire [ 9:0] ted_frequency_1;
wire [ 9:0] ted_frequency_2;
wire [ 7:0] ted_control;
wire        ted_reload;
wire [ 4:0] pcm_control;
wire        cassette_bit;
wire        cassette_active;
wire        sd_activity;

reg         vs_r;
reg  [9:0]  cnt_vs;

//------------------------------------
//HDMI4 TX
wire serial_clk;
wire pll_lock;

wire hdmi4_rst_n;

wire pix_clk;

// CLKDIV only starts the pixel clock after pll_lock is already high.  Keep
// both the established picture generator and the new synchronous HDMI core
// in reset for four real pixel-clock edges so their raster counters always
// start in the same cycle.
reg [3:0] pixel_reset_pipe;
always @(posedge pix_clk or negedge hdmi4_rst_n) begin
    if (!hdmi4_rst_n)
        pixel_reset_pipe <= 4'b0000;
    else
        pixel_reset_pipe <= {pixel_reset_pipe[2:0], 1'b1};
end

wire pixel_system_reset_n = &pixel_reset_pipe;

wire [7:0] usb_async_event, usb_event;
wire usb_event_toggle, usb_event_valid, usb_miso;
wire usb_traffic, usb_accepted, usb_configured, usb_key_seen, usb_key_down;
usb_companion_spi usb_spi_inst(
 .reset(!pixel_system_reset_n), .cs_n(I_usb_cs_n), .sclk(I_usb_sclk), .mosi(I_usb_mosi),
 .miso(usb_miso), .traffic(usb_traffic), .status_accepted(usb_accepted),
 .config_accepted(usb_configured), .key_seen(usb_key_seen), .key_down(usb_key_down),
 .key_event(usb_async_event), .event_toggle(usb_event_toggle));
assign O_usb_miso = I_usb_cs_n ? 1'bz : usb_miso;
assign O_usb_irq_n = 1'b1;
usb_event_cdc usb_cdc_inst(.clk(pix_clk), .reset_n(pixel_system_reset_n),
 .async_event(usb_async_event), .async_toggle(usb_event_toggle),
 .event_data(usb_event), .event_valid(usb_event_valid));

//===================================================
// The former push-button LED counter is intentionally removed. The on-board
// LEDs are active low: LED 0 now indicates SD-card activity, all others stay
// off. The separate "running" LED is also held off.
assign  O_led   = {4'b1111, ~sd_activity};
assign  running = 1'b1;

//===========================================================================
//testpattern
testpattern testpattern_inst
(
    .I_pxl_clk   (pix_clk            ),//pixel clock
    .I_rst_n     (pixel_system_reset_n),//low active 
    .I_ps2_clk   (I_ps2_clk          ),
    .I_ps2_data  (I_ps2_data         ),
    .I_usb_event (usb_event),
    .I_usb_valid (usb_event_valid),
    .I_sd_miso   (I_sd_miso          ),
    .I_mode      (3'd0               ),//former push-button test disabled
    .I_single_r  (8'd0               ),
    .I_single_g  (8'd255             ),
    .I_single_b  (8'd0               ),                  //800x600    //1024x768   //1280x720    
    .I_h_total   (12'd1650           ),//hor total time  // 12'd1056  // 12'd1344  // 12'd1650  
    .I_h_sync    (12'd40             ),//hor sync time   // 12'd128   // 12'd136   // 12'd40    
    .I_h_bporch  (12'd220            ),//hor back porch  // 12'd88    // 12'd160   // 12'd220   
    .I_h_res     (12'd1280           ),//hor resolution  // 12'd800   // 12'd1024  // 12'd1280  
    .I_v_total   (12'd750            ),//ver total time  // 12'd628   // 12'd806   // 12'd750    
    .I_v_sync    (12'd5              ),//ver sync time   // 12'd4     // 12'd6     // 12'd5     
    .I_v_bporch  (12'd20             ),//ver back porch  // 12'd23    // 12'd29    // 12'd20    
    .I_v_res     (12'd720            ),//ver resolution  // 12'd600   // 12'd768   // 12'd720    
    .I_hs_pol    (1'b1               ),//HS polarity , 0:negetive ploarity，1：positive polarity
    .I_vs_pol    (1'b1               ),//VS polarity , 0:negetive ploarity，1：positive polarity
    .O_de        (tp0_de_in          ),   
    .O_hs        (tp0_hs_in          ),
    .O_vs        (tp0_vs_in          ),
    .O_data_r    (tp0_data_r         ),   
    .O_data_g    (tp0_data_g         ),
    .O_data_b    (tp0_data_b         ),
    .O_sd_clk    (O_sd_clk           ),
    .O_sd_cs_n   (O_sd_cs_n          ),
    .O_sd_mosi   (O_sd_mosi          ),
    .O_sd_activity(sd_activity       ),
    .O_ted_frequency_1(ted_frequency_1),
    .O_ted_frequency_2(ted_frequency_2),
    .O_ted_control    (ted_control    ),
    .O_ted_reload     (ted_reload     ),
    .O_pcm_control    (pcm_control    ),
    .O_cassette_bit   (cassette_bit   ),
    .O_cassette_active(cassette_active)
);

always@(posedge pix_clk)
begin
    vs_r<=tp0_vs_in;
end

always@(posedge pix_clk or negedge hdmi4_rst_n)
begin
    if(!hdmi4_rst_n)
        cnt_vs<=0;
    else if(vs_r && !tp0_vs_in) //vKEY4 falling edge
        cnt_vs<=cnt_vs+1'b1;
end 

//==============================================================================
//TMDS TX(HDMI4)
TMDS_rPLL u_tmds_rpll
(.clkin     (I_clk     )     //input clk 
,.clkout    (serial_clk)     //output clk 
,.lock      (pll_lock  )     //output lock
);

assign hdmi4_rst_n = I_rst_n & pll_lock;

CLKDIV u_clkdiv
(.RESETN(hdmi4_rst_n)
,.HCLKIN(serial_clk) //clk  x5
,.CLKOUT(pix_clk)    //clk  x1
,.CALIB (1'b1)
);
defparam u_clkdiv.DIV_MODE="5";
defparam u_clkdiv.GSREN="false";

// True HDMI transmitter with 48-kHz 16-bit stereo digital silence.
// The established Z1013 RGB pipeline and the 74.25/371.25-MHz clocks remain
// unchanged; only the former encrypted DVI encoder is replaced.
z1013_hdmi_audio_tx z1013_hdmi_audio_tx_inst
(
    .reset_n       (pixel_system_reset_n),
    .clk_pixel_x5  (serial_clk),
    .clk_pixel     (pix_clk),
    .video_de      (tp0_de_in),
    .rgb           ({tp0_data_r, tp0_data_g, tp0_data_b}),
    .ted_frequency_1(ted_frequency_1),
    .ted_frequency_2(ted_frequency_2),
    .ted_control    (ted_control),
    .ted_reload     (ted_reload),
    .pcm_control    (pcm_control),
    .cassette_bit   (cassette_bit),
    .cassette_active(cassette_active),
    .tmds_clk_p    (O_tmds_clk_p),
    .tmds_clk_n    (O_tmds_clk_n),
    .tmds_data_p   (O_tmds_data_p),
    .tmds_data_n   (O_tmds_data_n)
);

endmodule
