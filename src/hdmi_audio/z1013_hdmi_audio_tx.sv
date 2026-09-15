// Z1013 HDMI audio output, expansion stage 1.
//
// The picture remains 1280x720p60. This wrapper replaces only the former
// encrypted DVI transmitter. It sends standards-compliant HDMI data islands
// with 16-bit stereo LPCM at 48 kHz. Expansion stage 4 feeds an audio-only
// MOS 7360/8360 TED recreation controlled by Z80 I/O into both channels.
//
// The HDMI packet/encoder modules are from hdl-util/hdmi by Sameer Puri and
// are included under their MIT/Apache-2.0 dual licence in this directory.

module z1013_hdmi_audio_tx
(
    input  logic        reset_n,
    input  logic        clk_pixel_x5,
    input  logic        clk_pixel,
    input  logic        video_de,
    input  logic [23:0] rgb,
    input  logic [9:0]  ted_frequency_1,
    input  logic [9:0]  ted_frequency_2,
    input  logic [7:0]  ted_control,
    input  logic        ted_reload,
    input  logic [4:0]  pcm_control,
    input  logic        cassette_bit,
    input  logic        cassette_active,
    output logic        tmds_clk_p,
    output logic        tmds_clk_n,
    output logic [2:0]  tmds_data_p,
    output logic [2:0]  tmds_data_n
);

    // Fractional clock-enable generator. A one-pixel-clock pulse is produced
    // exactly 48,000 times per second on average from 74.25 MHz. The HDMI
    // core observes this pulse in the pixel-clock domain; it is not routed as
    // an additional FPGA clock and therefore introduces no new clock tree.
    localparam integer      AUDIO_RATE_HZ   = 48000;
    localparam logic [26:0] PIXEL_RATE_STEP = 27'd74250000;
    localparam logic [26:0] AUDIO_RATE_STEP = 27'd48000;

    logic [26:0] audio_phase = 27'd0;
    logic        audio_sample_pulse = 1'b0;
    logic [15:0] audio_sample_word [1:0];

    logic signed [15:0] ted_sample;

    always_ff @(posedge clk_pixel) begin
        if (!reset_n) begin
            audio_phase        <= 27'd0;
            audio_sample_pulse <= 1'b0;
        end else if (audio_phase >= PIXEL_RATE_STEP - AUDIO_RATE_STEP) begin
            audio_phase        <= audio_phase + AUDIO_RATE_STEP - PIXEL_RATE_STEP;
            audio_sample_pulse <= 1'b1;
        end else begin
            audio_phase        <= audio_phase + AUDIO_RATE_STEP;
            audio_sample_pulse <= 1'b0;
        end
    end

    ted_sound_core ted_sound_core_inst (
        .clk(clk_pixel),
        .reset_n(reset_n),
        .frequency_1(ted_frequency_1),
        .frequency_2(ted_frequency_2),
        .voice_1_enable(ted_control[4]),
        // Voice 2 wins when tone and noise are selected together, matching
        // the original TED behaviour.
        .voice_2_enable(ted_control[5] | ted_control[6]),
        .noise_select(ted_control[6] & ~ted_control[5]),
        .volume(ted_control[3:0]),
        .sound_reload(ted_reload),
        .pcm_enable(pcm_control[4]),
        .pcm_sample(pcm_control[3:0]),
        .cassette_enable(cassette_active),
        .cassette_bit(cassette_bit),
        .sample(ted_sample)
    );

    assign audio_sample_word[0] = ted_sample;
    assign audio_sample_word[1] = ted_sample;

    logic [2:0]  tmds_serial;
    logic        tmds_clock_unused;
    logic [10:0] hdmi_x_unused;
    logic [9:0]  hdmi_y_unused;
    logic [10:0] frame_width_unused;
    logic [9:0]  frame_height_unused;
    logic [10:0] screen_width_unused;
    logic [9:0]  screen_height_unused;

    // The established Sipeed generator counts sync and back porch before the
    // active picture. hdl-util counts from the active picture. START_X/Y
    // rotate the otherwise identical 1650x750 raster. A shared pixel-clock
    // reset in video_top guarantees that both counter chains start together.
    // The active Sipeed picture begins after 40+220 horizontal clocks and
    // after 5+20 vertical lines.
    hdmi #(
        .VIDEO_ID_CODE(4),
        .DVI_OUTPUT(1'b0),
        .VIDEO_REFRESH_RATE(60.0),
        .IT_CONTENT(1'b1),
        .AUDIO_RATE(AUDIO_RATE_HZ),
        .AUDIO_BIT_WIDTH(16),
        .START_X(1390),
        .START_Y(725)
    ) hdmi_inst (
        .clk_pixel_x5(clk_pixel_x5),
        .clk_pixel(clk_pixel),
        .clk_audio(audio_sample_pulse),
        .reset(!reset_n),
        // testpattern deliberately carries CPU bus activity in RGB during
        // blanking. The old DVI block suppressed it with DE; do the same here
        // so no phase-edge can turn those diagnostic values into visible
        // pixels.
        .rgb(video_de ? rgb : 24'h000000),
        .audio_sample_word(audio_sample_word),
        .tmds(tmds_serial),
        .tmds_clock(tmds_clock_unused),
        .cx(hdmi_x_unused),
        .cy(hdmi_y_unused),
        .frame_width(frame_width_unused),
        .frame_height(frame_height_unused),
        .screen_width(screen_width_unused),
        .screen_height(screen_height_unused)
    );

    // Native Gowin differential output buffers. Channel order is the same
    // as in proven Tang Nano 20K HDMI designs: {clock, red, green, blue}.
    ELVDS_OBUF tmds_bufds [3:0] (
        .I ({clk_pixel, tmds_serial}),
        .O ({tmds_clk_p, tmds_data_p}),
        .OB({tmds_clk_n, tmds_data_n})
    );

endmodule
