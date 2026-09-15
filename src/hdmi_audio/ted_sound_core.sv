// Audio-only recreation of the MOS 7360/8360 TED sound generator.
//
// This block deliberately implements none of the TED video, timer or memory
// functions. It contains only the two 10-bit tone generators, the voice-2
// noise selection and the common 0..8 volume control.  The oscillator tick
// is derived as a clock enable in the pixel-clock domain; no new FPGA clock
// tree is created.

module ted_sound_core
(
    input  logic               clk,
    input  logic               reset_n,
    input  logic [9:0]         frequency_1,
    input  logic [9:0]         frequency_2,
    input  logic               voice_1_enable,
    input  logic               voice_2_enable,
    input  logic               noise_select,
    input  logic [3:0]         volume,
    input  logic               sound_reload,
    input  logic               pcm_enable,
    input  logic [3:0]         pcm_sample,
    input  logic               cassette_enable,
    input  logic               cassette_bit,
    output logic signed [15:0] sample
);

    // PAL TED pitch model:
    //   f = 110840.45 Hz / (1024 - frequency)
    // A square-wave output toggles once per half period, hence an oscillator
    // enable of approximately 2 * 110840.45 Hz.  221681 Hz differs from the
    // documented PAL value by less than 0.001 percent.
    localparam logic [26:0] PIXEL_RATE_STEP = 27'd74250000;
    localparam logic [26:0] TED_TICK_STEP   = 27'd221681;

    logic [26:0] tick_phase = 27'd0;
    logic        ted_tick   = 1'b0;

    logic [9:0] counter_1 = 10'd0;
    logic [9:0] counter_2 = 10'd0;
    logic       square_1  = 1'b0;
    logic       square_2  = 1'b0;

    // A compact maximal-length pseudo-random generator. The real TED exposes
    // only its resulting white-noise voice, not the internal shift register.
    logic [14:0] noise_lfsr = 15'h7fff;

    logic [9:0] reload_1;
    logic [9:0] reload_2;
    logic       noise_bit;
    logic [3:0] safe_volume;
    logic signed [3:0] source_sum;
    logic signed [8:0] scaled_sum;
    logic signed [5:0] pcm_centered;
    logic signed [15:0] pcm_scaled;
    logic signed [15:0] cassette_scaled;

    // A frequency value X represents a half-period of 1024-X TED ticks.
    // Loading 1023-X gives exactly that many ticks including count zero.
    assign reload_1 = 10'd1023 - frequency_1;
    assign reload_2 = 10'd1023 - frequency_2;
    assign noise_bit = noise_lfsr[0];
    assign safe_volume = (volume > 4'd8) ? 4'd8 : volume;
    assign pcm_centered = $signed({1'b0, pcm_sample}) - 6'sd8;
    assign pcm_scaled = pcm_centered * 16'sd1024;
    assign cassette_scaled = cassette_bit ? 16'sd4096 : -16'sd4096;

    always_ff @(posedge clk) begin
        if (!reset_n) begin
            tick_phase <= 27'd0;
            ted_tick   <= 1'b0;
        end else if (tick_phase >= PIXEL_RATE_STEP - TED_TICK_STEP) begin
            tick_phase <= tick_phase + TED_TICK_STEP - PIXEL_RATE_STEP;
            ted_tick   <= 1'b1;
        end else begin
            tick_phase <= tick_phase + TED_TICK_STEP;
            ted_tick   <= 1'b0;
        end
    end

    always_ff @(posedge clk) begin
        if (!reset_n || sound_reload) begin
            counter_1 <= reload_1;
            counter_2 <= reload_2;
            square_1  <= 1'b0;
            square_2  <= 1'b0;
            noise_lfsr <= 15'h7fff;
        end else if (ted_tick) begin
            if (counter_1 == 10'd0) begin
                counter_1 <= reload_1;
                square_1  <= ~square_1;
            end else begin
                counter_1 <= counter_1 - 1'b1;
            end

            if (counter_2 == 10'd0) begin
                counter_2 <= reload_2;
                square_2  <= ~square_2;
                // x^15 + x^14 + 1. Advance noise at the voice-2 rate so the
                // frequency register also controls the noise character.
                noise_lfsr <= {noise_lfsr[13:0],
                               noise_lfsr[14] ^ noise_lfsr[13]};
            end else begin
                counter_2 <= counter_2 - 1'b1;
            end
        end
    end

    // Voice 2 and noise are mutually exclusive, matching the TED. The mixer
    // is centred around zero. At maximum volume two sources reach +/-4096,
    // leaving ample headroom in the signed 16-bit HDMI sample.
    always_comb begin
        source_sum = 4'sd0;

        if (voice_1_enable)
            source_sum = source_sum + (square_1 ? 4'sd1 : -4'sd1);

        if (voice_2_enable) begin
            if (noise_select)
                source_sum = source_sum + (noise_bit ? 4'sd1 : -4'sd1);
            else
                source_sum = source_sum + (square_2 ? 4'sd1 : -4'sd1);
        end

        scaled_sum = source_sum * $signed({1'b0, safe_volume});

        // Isolated linear 4-bit DAC for sampled audio.  It is deliberately
        // selected through a new Z1013 port, so legacy TED programs remain
        // bit-for-bit compatible with the proven sound implementation.
        // The monitor's cassette writer needs an unmodified two-level signal.
        // It takes priority only while port 02h is actively toggled; the
        // VHDL-side timeout then restores the established PCM/TED path.
        if (cassette_enable)
            sample = cassette_scaled;
        else if (pcm_enable)
            sample = pcm_scaled;
        else
            sample = scaled_sum <<< 8;
    end

endmodule
