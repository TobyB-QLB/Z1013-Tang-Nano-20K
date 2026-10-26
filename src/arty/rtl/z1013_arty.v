(* ram_style = "distributed" *)
module l8_ram_16x64_r1_w1_d (
  input  wire clk,
  input  wire [5:0] rd0_addr,
  output wire [15:0] rd0_data,
  input  wire wr0_we,
  input  wire [5:0] wr0_addr,
  input  wire [15:0] wr0_data
);
  reg [15:0] mem [0:63];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_17x256_r1_w1_d (
  input  wire clk,
  input  wire [7:0] rd0_addr,
  output wire [16:0] rd0_data,
  input  wire wr0_we,
  input  wire [7:0] wr0_addr,
  input  wire [16:0] wr0_data
);
  reg [16:0] mem [0:255];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_28x1024_r1_w1_d (
  input  wire clk,
  input  wire [9:0] rd0_addr,
  output wire [27:0] rd0_data,
  input  wire wr0_we,
  input  wire [9:0] wr0_addr,
  input  wire [27:0] wr0_data
);
  reg [27:0] mem [0:1023];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_29x2048_r1_w1_d (
  input  wire clk,
  input  wire [10:0] rd0_addr,
  output wire [28:0] rd0_data,
  input  wire wr0_we,
  input  wire [10:0] wr0_addr,
  input  wire [28:0] wr0_data
);
  reg [28:0] mem [0:2047];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_8x16_r1_w1_d (
  input  wire clk,
  input  wire [3:0] rd0_addr,
  output wire [7:0] rd0_data,
  input  wire wr0_we,
  input  wire [3:0] wr0_addr,
  input  wire [7:0] wr0_data
);
  reg [7:0] mem [0:15];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_8x256_r1_w1_d (
  input  wire clk,
  input  wire [7:0] rd0_addr,
  output wire [7:0] rd0_data,
  input  wire wr0_we,
  input  wire [7:0] wr0_addr,
  input  wire [7:0] wr0_data
);
  reg [7:0] mem [0:255];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_8x512_r1_w1_d (
  input  wire clk,
  input  wire [8:0] rd0_addr,
  output wire [7:0] rd0_data,
  input  wire wr0_we,
  input  wire [8:0] wr0_addr,
  input  wire [7:0] wr0_data
);
  reg [7:0] mem [0:511];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_8x64_r1_w1_d (
  input  wire clk,
  input  wire [5:0] rd0_addr,
  output wire [7:0] rd0_data,
  input  wire wr0_we,
  input  wire [5:0] wr0_addr,
  input  wire [7:0] wr0_data
);
  reg [7:0] mem [0:63];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_9x1024_r1_w1_d (
  input  wire clk,
  input  wire [9:0] rd0_addr,
  output wire [8:0] rd0_data,
  input  wire wr0_we,
  input  wire [9:0] wr0_addr,
  input  wire [8:0] wr0_data
);
  reg [8:0] mem [0:1023];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_9x16_r1_w1_d (
  input  wire clk,
  input  wire [3:0] rd0_addr,
  output wire [8:0] rd0_data,
  input  wire wr0_we,
  input  wire [3:0] wr0_addr,
  input  wire [8:0] wr0_data
);
  reg [8:0] mem [0:15];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_9x2048_r1_w1_d (
  input  wire clk,
  input  wire [10:0] rd0_addr,
  output wire [8:0] rd0_data,
  input  wire wr0_we,
  input  wire [10:0] wr0_addr,
  input  wire [8:0] wr0_data
);
  reg [8:0] mem [0:2047];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "block" *)
module l8_ram_9x2048_r1_w1_b (
  input  wire clk,
  input  wire [10:0] rd0_addr,
  output reg  [8:0] rd0_data,
  input  wire wr0_we,
  input  wire [10:0] wr0_addr,
  input  wire [8:0] wr0_data
);
  reg [8:0] mem [0:2047];
  always @(posedge clk) begin
    rd0_data <= mem[rd0_addr];
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

(* ram_style = "distributed" *)
module l8_ram_9x4_r1_w1_d (
  input  wire clk,
  input  wire [1:0] rd0_addr,
  output wire [8:0] rd0_data,
  input  wire wr0_we,
  input  wire [1:0] wr0_addr,
  input  wire [8:0] wr0_data
);
  reg [8:0] mem [0:3];
  assign rd0_data = mem[rd0_addr];
  always @(posedge clk) begin
    if (wr0_we) mem[wr0_addr] <= wr0_data;
  end
endmodule

`default_nettype none
module xfifo_9_4_16 (
  input  wire clk,
  input  wire rst,
  input  wire wclk,
  input  wire wrst,
  input  wire rclk,
  input  wire rrst,
  input  wire [8:0] src_data,
  input  wire src_valid,
  output wire src_ready,
  output wire [8:0] dst_data,
  output wire dst_valid,
  input  wire dst_ready
);
  reg  [4:0] wp;
  reg  [4:0] rp;
  reg  [4:0] wg;
  reg  [4:0] rg;
  wire [4:0] rg_w;
  wire [4:0] wg_r;
  wire [3:0] mem_rd0_addr;
  wire [8:0] mem_rd0_data;
  wire [3:0] mem_wr0_addr;
  wire [8:0] mem_wr0_data;
  wire mem_wr0_we;
  wire [4:0] wn;
  wire [4:0] wng;
  wire [4:0] rn;
  wire [4:0] rng;
  reg  [4:0] rg_w_sync0;
  reg  [4:0] rg_w_sync1;
  reg  [4:0] wg_r_sync0;
  reg  [4:0] wg_r_sync1;
  wire _t0;
  wire _t1;
  wire _t2;
  wire [3:0] _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire [3:0] _t7;
  wire _t8;
  wire _t9;
  wire [4:0] _t10;
  wire _t11;
  wire _t12;
  wire [2:0] _t13;
  wire _t14;
  wire _t15;
  wire [4:0] _t16;
  wire _t17;
  wire _t18;
  wire [2:0] _t19;
  wire _t20;
  wire _t21;
  wire [4:0] _t22;
  wire [1:0] _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire [4:0] _t28;
  wire [1:0] _t29;
  wire _t30;
  wire [1:0] _t31;
  wire _t32;
  wire _t33;
  wire [4:0] _t34;
  wire [2:0] _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire [4:0] _t40;
  wire [2:0] _t41;
  wire _t42;
  wire _t43;
  wire [4:0] _t44;
  wire [3:0] _t45;
  wire _t46;
  wire [4:0] _t47;
  wire [3:0] _t48;
  wire _t49;
  wire [2:0] _t50;
  wire [2:0] _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire [3:0] _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire [4:0] _t66;
  wire [4:0] _t67;
  wire [4:0] _t68;
  wire [4:0] _t69;
  assign _t0 = wn[1];
  assign _t1 = wn[0];
  assign _t2 = (_t1 ^ _t0);
  assign _t3 = 4'd0;
  assign _t4 = rn[1];
  assign _t5 = rn[0];
  assign _t6 = (_t5 ^ _t4);
  assign _t7 = 4'd0;
  assign _t8 = wn[2];
  assign _t9 = wn[1];
  assign _t10 = {_t3, _t2};
  assign _t11 = _t10[0:0];
  assign _t12 = (_t9 ^ _t8);
  assign _t13 = _t10[4:2];
  assign _t14 = rn[2];
  assign _t15 = rn[1];
  assign _t16 = {_t7, _t6};
  assign _t17 = _t16[0:0];
  assign _t18 = (_t15 ^ _t14);
  assign _t19 = _t16[4:2];
  assign _t20 = wn[3];
  assign _t21 = wn[2];
  assign _t22 = {_t13, _t12, _t11};
  assign _t23 = _t22[1:0];
  assign _t24 = (_t21 ^ _t20);
  assign _t25 = _t22[4:3];
  assign _t26 = rn[3];
  assign _t27 = rn[2];
  assign _t28 = {_t19, _t18, _t17};
  assign _t29 = _t28[1:0];
  assign _t30 = (_t27 ^ _t26);
  assign _t31 = _t28[4:3];
  assign _t32 = wn[4];
  assign _t33 = wn[3];
  assign _t34 = {_t25, _t24, _t23};
  assign _t35 = _t34[2:0];
  assign _t36 = (_t33 ^ _t32);
  assign _t37 = _t34[4:4];
  assign _t38 = rn[4];
  assign _t39 = rn[3];
  assign _t40 = {_t31, _t30, _t29};
  assign _t41 = _t40[2:0];
  assign _t42 = (_t39 ^ _t38);
  assign _t43 = _t40[4:4];
  assign _t44 = {_t37, _t36, _t35};
  assign _t45 = _t44[3:0];
  assign _t46 = wn[4];
  assign _t47 = {_t43, _t42, _t41};
  assign _t48 = _t47[3:0];
  assign _t49 = rn[4];
  assign _t50 = rg_w[2:0];
  assign _t51 = wg[2:0];
  assign _t52 = (_t51 == _t50);
  assign _t53 = rg_w[3];
  assign _t54 = wg[3];
  assign _t55 = (_t54 != _t53);
  assign _t56 = rg_w[4];
  assign _t57 = wg[4];
  assign _t58 = (_t57 != _t56);
  assign _t59 = ((|_t58) && (|_t55));
  assign _t60 = ((|_t59) && (|_t52));
  assign _t61 = wp[3:0];
  assign _t62 = (~_t60);
  assign _t63 = ((|src_valid) && (|_t62));
  assign _t64 = (rg == wg_r);
  assign _t65 = ((|dst_valid) && (|dst_ready));
  assign wn = (wp + 5'd1);
  assign rn = (rp + 5'd1);
  assign wng = {_t46, _t45};
  assign rng = {_t49, _t48};
  assign rg_w = rg_w_sync1;
  assign src_ready = (~_t60);
  assign mem_wr0_addr = ((|_t63) ? _t61 : 4'd0);
  assign mem_wr0_data = ((|_t63) ? src_data : 9'd0);
  assign mem_wr0_we = ((|_t63) ? 1'd1 : 1'd0);
  assign _t66 = ((|_t63) ? wn : wp);
  assign _t67 = ((|_t63) ? wng : wg);
  assign wg_r = wg_r_sync1;
  assign dst_valid = (~_t64);
  assign mem_rd0_addr = rp[3:0];
  assign dst_data = mem_rd0_data;
  assign _t68 = ((|_t65) ? rn : rp);
  assign _t69 = ((|_t65) ? rng : rg);
  always @(posedge wclk) begin
    if (wrst) begin
      wp <= 5'd0;
      wg <= 5'd0;
      rg_w_sync0 <= 5'd0;
      rg_w_sync1 <= 5'd0;
    end else begin
      wp <= _t66;
      wg <= _t67;
      rg_w_sync0 <= rg;
      rg_w_sync1 <= rg_w_sync0;
    end
  end
  always @(posedge rclk) begin
    if (rrst) begin
      rp <= 5'd0;
      rg <= 5'd0;
      wg_r_sync0 <= 5'd0;
      wg_r_sync1 <= 5'd0;
    end else begin
      rp <= _t68;
      rg <= _t69;
      wg_r_sync0 <= wg;
      wg_r_sync1 <= wg_r_sync0;
    end
  end
  l8_ram_9x16_r1_w1_d _meminst_0_mem (
    .clk(wclk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module xfifo_frame_8_4_16 (
  input  wire clk,
  input  wire rst,
  input  wire wclk,
  input  wire wrst,
  input  wire rclk,
  input  wire rrst,
  input  wire [7:0] src_data,
  input  wire src_last,
  input  wire src_valid,
  output wire src_ready,
  output wire [7:0] dst_data,
  output wire dst_last,
  output wire dst_valid,
  input  wire dst_ready
);
  wire [8:0] p_data;
  wire p_valid;
  wire p_ready;
  wire [8:0] q_data;
  wire q_valid;
  wire q_ready;
  wire _t0;
  wire [8:0] _t1;
  wire [7:0] _t2;
  wire x_src_ready;
  wire [8:0] x_dst_data;
  wire x_dst_valid;
  assign _t0 = 1'd0;
  assign _t1 = {_t0, src_data};
  assign _t2 = _t1[7:0];
  assign p_data = {src_last, _t2};
  assign p_valid = src_valid;
  assign src_ready = p_ready;
  assign dst_data = q_data[7:0];
  assign dst_last = q_data[8];
  assign dst_valid = q_valid;
  assign q_ready = dst_ready;
  assign p_ready = x_src_ready;
  assign q_data = x_dst_data;
  assign q_valid = x_dst_valid;
  xfifo_9_4_16 x (
    .clk(clk),
    .rst(rst),
    .wclk(wclk),
    .wrst(wrst),
    .rclk(rclk),
    .rrst(rrst),
    .src_data(p_data),
    .src_valid(p_valid),
    .src_ready(x_src_ready),
    .dst_data(x_dst_data),
    .dst_valid(x_dst_valid),
    .dst_ready(q_ready)
  );
endmodule
`default_nettype wire

`default_nettype none
module frame_in (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  assign o_valid = i_valid;
  assign o_data = i_data;
  assign o_last = i_last;
  assign i_ready = o_ready;
endmodule
`default_nettype wire

`default_nettype none
module ip4_rx_36492_2200301993985_3232255234_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  output wire peer_valid,
  output wire [47:0] peer_mac,
  output wire [31:0] peer_ip,
  output wire [15:0] peer_port,
  output wire ask_valid,
  output wire [47:0] ask_mac,
  output wire [31:0] ask_ip,
  input  wire ask_ack,
  output reg  [15:0] n
);
  reg  [5:0] idx;
  reg  oku;
  reg  oka;
  reg  bc;
  reg  [15:0] left;
  reg  pv;
  reg  [47:0] pmac;
  reg  [31:0] pip;
  reg  [15:0] pprt;
  reg  [47:0] tmac;
  reg  [31:0] tip;
  reg  [15:0] tprt;
  reg  [31:0] aip;
  reg  av;
  reg  [47:0] amac;
  reg  [31:0] arip;
  wire pay;
  wire [7:0] d;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire [39:0] _t8;
  wire [47:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [47:0] _t13;
  wire [7:0] _t14;
  wire [31:0] _t15;
  wire [47:0] _t16;
  wire _t17;
  wire _t18;
  wire [47:0] _t19;
  wire [15:0] _t20;
  wire [23:0] _t21;
  wire [47:0] _t22;
  wire _t23;
  wire _t24;
  wire [47:0] _t25;
  wire [23:0] _t26;
  wire [15:0] _t27;
  wire [47:0] _t28;
  wire _t29;
  wire _t30;
  wire [47:0] _t31;
  wire [31:0] _t32;
  wire [7:0] _t33;
  wire [47:0] _t34;
  wire _t35;
  wire _t36;
  wire [47:0] _t37;
  wire [39:0] _t38;
  wire [47:0] _t39;
  wire _t40;
  wire _t41;
  wire [23:0] _t42;
  wire [31:0] _t43;
  wire _t44;
  wire _t45;
  wire [23:0] _t46;
  wire [31:0] _t47;
  wire _t48;
  wire _t49;
  wire [31:0] _t50;
  wire [7:0] _t51;
  wire [15:0] _t52;
  wire [31:0] _t53;
  wire _t54;
  wire _t55;
  wire [31:0] _t56;
  wire [7:0] _t57;
  wire [15:0] _t58;
  wire [31:0] _t59;
  wire _t60;
  wire _t61;
  wire [31:0] _t62;
  wire [15:0] _t63;
  wire [7:0] _t64;
  wire [31:0] _t65;
  wire _t66;
  wire _t67;
  wire [31:0] _t68;
  wire [15:0] _t69;
  wire [7:0] _t70;
  wire [31:0] _t71;
  wire _t72;
  wire _t73;
  wire [31:0] _t74;
  wire [23:0] _t75;
  wire [31:0] _t76;
  wire _t77;
  wire _t78;
  wire [31:0] _t79;
  wire [23:0] _t80;
  wire [31:0] _t81;
  wire _t82;
  wire _t83;
  wire [7:0] _t84;
  wire [15:0] _t85;
  wire _t86;
  wire _t87;
  wire [15:0] _t88;
  wire [7:0] _t89;
  wire [15:0] _t90;
  wire _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [15:0] _t94;
  wire _t95;
  wire _t96;
  wire [15:0] _t97;
  wire [7:0] _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire [15:0] _t101;
  wire [15:0] _t102;
  wire [15:0] _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire _t109;
  wire [15:0] _t110;
  wire [15:0] _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire _t158;
  wire _t159;
  wire _t160;
  wire _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire _t187;
  wire _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire [5:0] _t214;
  wire [5:0] _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire [15:0] _t274;
  wire _t275;
  wire _t276;
  wire [47:0] _t277;
  wire [31:0] _t278;
  wire [31:0] _t279;
  wire [15:0] _t280;
  wire [15:0] _t281;
  wire _t282;
  wire [5:0] _t283;
  wire _t284;
  wire _t285;
  wire _t286;
  wire [47:0] _t287;
  wire [31:0] _t288;
  wire _t289;
  wire [47:0] _t290;
  wire [31:0] _t291;
  wire [15:0] _t292;
  wire [15:0] _t293;
  assign _t0 = (left != 16'd0);
  assign _t1 = ((|i_valid) && (|pay));
  assign _t2 = ((|_t1) && (|oku));
  assign _t3 = (left != 16'd0);
  assign _t4 = ((|pay) && (|oku));
  assign _t5 = ((|_t4) && (|_t3));
  assign _t6 = ((|_t5) ? o_ready : 1'd0);
  assign _t7 = (~_t5);
  assign _t8 = tmac[47:8];
  assign _t9 = {_t8, d};
  assign _t10 = (idx == 6'd6);
  assign _t11 = ((|i_valid) && (|i_ready));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? _t9 : tmac);
  assign _t14 = _t13[7:0];
  assign _t15 = _t13[47:16];
  assign _t16 = {_t15, d, _t14};
  assign _t17 = (idx == 6'd7);
  assign _t18 = ((|_t11) && (|_t17));
  assign _t19 = ((|_t18) ? _t16 : _t13);
  assign _t20 = _t19[15:0];
  assign _t21 = _t19[47:24];
  assign _t22 = {_t21, d, _t20};
  assign _t23 = (idx == 6'd8);
  assign _t24 = ((|_t11) && (|_t23));
  assign _t25 = ((|_t24) ? _t22 : _t19);
  assign _t26 = _t25[23:0];
  assign _t27 = _t25[47:32];
  assign _t28 = {_t27, d, _t26};
  assign _t29 = (idx == 6'd9);
  assign _t30 = ((|_t11) && (|_t29));
  assign _t31 = ((|_t30) ? _t28 : _t25);
  assign _t32 = _t31[31:0];
  assign _t33 = _t31[47:40];
  assign _t34 = {_t33, d, _t32};
  assign _t35 = (idx == 6'd10);
  assign _t36 = ((|_t11) && (|_t35));
  assign _t37 = ((|_t36) ? _t34 : _t31);
  assign _t38 = _t37[39:0];
  assign _t39 = {d, _t38};
  assign _t40 = (idx == 6'd11);
  assign _t41 = ((|_t11) && (|_t40));
  assign _t42 = tip[31:8];
  assign _t43 = {_t42, d};
  assign _t44 = (idx == 6'd26);
  assign _t45 = ((|_t11) && (|_t44));
  assign _t46 = aip[31:8];
  assign _t47 = {_t46, d};
  assign _t48 = (idx == 6'd28);
  assign _t49 = ((|_t11) && (|_t48));
  assign _t50 = ((|_t45) ? _t43 : tip);
  assign _t51 = _t50[7:0];
  assign _t52 = _t50[31:16];
  assign _t53 = {_t52, d, _t51};
  assign _t54 = (idx == 6'd27);
  assign _t55 = ((|_t11) && (|_t54));
  assign _t56 = ((|_t49) ? _t47 : aip);
  assign _t57 = _t56[7:0];
  assign _t58 = _t56[31:16];
  assign _t59 = {_t58, d, _t57};
  assign _t60 = (idx == 6'd29);
  assign _t61 = ((|_t11) && (|_t60));
  assign _t62 = ((|_t55) ? _t53 : _t50);
  assign _t63 = _t62[15:0];
  assign _t64 = _t62[31:24];
  assign _t65 = {_t64, d, _t63};
  assign _t66 = (idx == 6'd28);
  assign _t67 = ((|_t11) && (|_t66));
  assign _t68 = ((|_t61) ? _t59 : _t56);
  assign _t69 = _t68[15:0];
  assign _t70 = _t68[31:24];
  assign _t71 = {_t70, d, _t69};
  assign _t72 = (idx == 6'd30);
  assign _t73 = ((|_t11) && (|_t72));
  assign _t74 = ((|_t67) ? _t65 : _t62);
  assign _t75 = _t74[23:0];
  assign _t76 = {d, _t75};
  assign _t77 = (idx == 6'd29);
  assign _t78 = ((|_t11) && (|_t77));
  assign _t79 = ((|_t73) ? _t71 : _t68);
  assign _t80 = _t79[23:0];
  assign _t81 = {d, _t80};
  assign _t82 = (idx == 6'd31);
  assign _t83 = ((|_t11) && (|_t82));
  assign _t84 = tprt[7:0];
  assign _t85 = {d, _t84};
  assign _t86 = (idx == 6'd34);
  assign _t87 = ((|_t11) && (|_t86));
  assign _t88 = ((|_t87) ? _t85 : tprt);
  assign _t89 = _t88[15:8];
  assign _t90 = {_t89, d};
  assign _t91 = (idx == 6'd35);
  assign _t92 = ((|_t11) && (|_t91));
  assign _t93 = left[7:0];
  assign _t94 = {d, _t93};
  assign _t95 = (idx == 6'd38);
  assign _t96 = ((|_t11) && (|_t95));
  assign _t97 = {8'b0, d};
  assign _t98 = left[15:8];
  assign _t99 = {8'b0, _t98};
  assign _t100 = (_t99 << 32'd8);
  assign _t101 = (_t100 + _t97);
  assign _t102 = ((|_t96) ? _t94 : left);
  assign _t103 = (_t101 - 16'd8);
  assign _t104 = (idx == 6'd39);
  assign _t105 = ((|_t11) && (|_t104));
  assign _t106 = (d != 8'd255);
  assign _t107 = (idx < 6'd6);
  assign _t108 = ((|_t107) && (|_t106));
  assign _t109 = ((|_t11) && (|_t108));
  assign _t110 = ((|_t105) ? _t103 : _t102);
  assign _t111 = (left - 16'd1);
  assign _t112 = (left != 16'd0);
  assign _t113 = ((|pay) && (|oku));
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t11) && (|_t114));
  assign _t116 = ((|_t11) && (|i_last));
  assign _t117 = ((|_t11) && (|i_last));
  assign _t118 = ((|_t11) && (|i_last));
  assign _t119 = ((|_t109) ? 1'd0 : bc);
  assign _t120 = ((|_t11) && (|i_last));
  assign _t121 = (~av);
  assign _t122 = (idx >= 6'd41);
  assign _t123 = (d != 8'd2);
  assign _t124 = (idx == 6'd41);
  assign _t125 = ((|_t124) && (|_t123));
  assign _t126 = (d != 8'd77);
  assign _t127 = (idx == 6'd40);
  assign _t128 = ((|_t127) && (|_t126));
  assign _t129 = (d != 8'd168);
  assign _t130 = (idx == 6'd39);
  assign _t131 = ((|_t130) && (|_t129));
  assign _t132 = (d != 8'd192);
  assign _t133 = (idx == 6'd38);
  assign _t134 = ((|_t133) && (|_t132));
  assign _t135 = (d != 8'd1);
  assign _t136 = (idx == 6'd21);
  assign _t137 = ((|_t136) && (|_t135));
  assign _t138 = (d != 8'd0);
  assign _t139 = (idx == 6'd20);
  assign _t140 = ((|_t139) && (|_t138));
  assign _t141 = (d != 8'd6);
  assign _t142 = (idx == 6'd13);
  assign _t143 = ((|_t142) && (|_t141));
  assign _t144 = (d != 8'd8);
  assign _t145 = (idx == 6'd12);
  assign _t146 = ((|_t145) && (|_t144));
  assign _t147 = (d == 8'd255);
  assign _t148 = ((|bc) && (|_t147));
  assign _t149 = (~_t148);
  assign _t150 = (d != 8'd1);
  assign _t151 = (idx == 6'd5);
  assign _t152 = ((|_t151) && (|_t150));
  assign _t153 = ((|_t152) && (|_t149));
  assign _t154 = (d == 8'd255);
  assign _t155 = ((|bc) && (|_t154));
  assign _t156 = (~_t155);
  assign _t157 = (d != 8'd0);
  assign _t158 = (idx == 6'd4);
  assign _t159 = ((|_t158) && (|_t157));
  assign _t160 = ((|_t159) && (|_t156));
  assign _t161 = (d == 8'd255);
  assign _t162 = ((|bc) && (|_t161));
  assign _t163 = (~_t162);
  assign _t164 = (d != 8'd56);
  assign _t165 = (idx == 6'd3);
  assign _t166 = ((|_t165) && (|_t164));
  assign _t167 = ((|_t166) && (|_t163));
  assign _t168 = (d == 8'd255);
  assign _t169 = ((|bc) && (|_t168));
  assign _t170 = (~_t169);
  assign _t171 = (d != 8'd76);
  assign _t172 = (idx == 6'd2);
  assign _t173 = ((|_t172) && (|_t171));
  assign _t174 = ((|_t173) && (|_t170));
  assign _t175 = (d == 8'd255);
  assign _t176 = ((|bc) && (|_t175));
  assign _t177 = (~_t176);
  assign _t178 = (d != 8'd0);
  assign _t179 = (idx == 6'd1);
  assign _t180 = ((|_t179) && (|_t178));
  assign _t181 = ((|_t180) && (|_t177));
  assign _t182 = (d == 8'd255);
  assign _t183 = ((|bc) && (|_t182));
  assign _t184 = (~_t183);
  assign _t185 = (d != 8'd2);
  assign _t186 = (idx == 6'd0);
  assign _t187 = ((|_t186) && (|_t185));
  assign _t188 = ((|_t187) && (|_t184));
  assign _t189 = ((|1'd0) || (|_t188));
  assign _t190 = ((|_t189) || (|_t181));
  assign _t191 = ((|_t190) || (|_t174));
  assign _t192 = ((|_t191) || (|_t167));
  assign _t193 = ((|_t192) || (|_t160));
  assign _t194 = ((|_t193) || (|_t153));
  assign _t195 = ((|_t194) || (|_t146));
  assign _t196 = ((|_t195) || (|_t143));
  assign _t197 = ((|_t196) || (|_t140));
  assign _t198 = ((|_t197) || (|_t137));
  assign _t199 = ((|_t198) || (|_t134));
  assign _t200 = ((|_t199) || (|_t131));
  assign _t201 = ((|_t200) || (|_t128));
  assign _t202 = ((|_t201) || (|_t125));
  assign _t203 = (~_t202);
  assign _t204 = ((|1'd1) && (|oka));
  assign _t205 = ((|_t204) && (|_t203));
  assign _t206 = ((|_t205) && (|_t122));
  assign _t207 = ((|_t206) && (|_t121));
  assign _t208 = ((|_t11) && (|i_last));
  assign _t209 = ((|_t208) && (|_t207));
  assign _t210 = ((|_t11) && (|i_last));
  assign _t211 = ((|_t210) && (|_t207));
  assign _t212 = ((|_t11) && (|i_last));
  assign _t213 = ((|_t212) && (|_t207));
  assign _t214 = ((|_t116) ? 6'd0 : idx);
  assign _t215 = (idx + 6'd1);
  assign _t216 = (~pay);
  assign _t217 = (~i_last);
  assign _t218 = ((|_t11) && (|_t217));
  assign _t219 = ((|_t218) && (|_t216));
  assign _t220 = ((|_t117) ? 1'd1 : oku);
  assign _t221 = (d != 8'd2);
  assign _t222 = (idx == 6'd33);
  assign _t223 = ((|_t222) && (|_t221));
  assign _t224 = (d != 8'd77);
  assign _t225 = (idx == 6'd32);
  assign _t226 = ((|_t225) && (|_t224));
  assign _t227 = (d != 8'd168);
  assign _t228 = (idx == 6'd31);
  assign _t229 = ((|_t228) && (|_t227));
  assign _t230 = (d != 8'd192);
  assign _t231 = (idx == 6'd30);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = (d != 8'd140);
  assign _t234 = (idx == 6'd37);
  assign _t235 = ((|_t234) && (|_t233));
  assign _t236 = (d != 8'd142);
  assign _t237 = (idx == 6'd36);
  assign _t238 = ((|_t237) && (|_t236));
  assign _t239 = (d != 8'd17);
  assign _t240 = (idx == 6'd23);
  assign _t241 = ((|_t240) && (|_t239));
  assign _t242 = (d != 8'd69);
  assign _t243 = (idx == 6'd14);
  assign _t244 = ((|_t243) && (|_t242));
  assign _t245 = (d != 8'd0);
  assign _t246 = (idx == 6'd13);
  assign _t247 = ((|_t246) && (|_t245));
  assign _t248 = (d != 8'd8);
  assign _t249 = (idx == 6'd12);
  assign _t250 = ((|_t249) && (|_t248));
  assign _t251 = ((|_t194) || (|_t250));
  assign _t252 = ((|_t251) || (|_t247));
  assign _t253 = ((|_t252) || (|_t244));
  assign _t254 = ((|_t253) || (|_t241));
  assign _t255 = ((|_t254) || (|_t238));
  assign _t256 = ((|_t255) || (|_t235));
  assign _t257 = ((|_t256) || (|_t232));
  assign _t258 = ((|_t257) || (|_t229));
  assign _t259 = ((|_t258) || (|_t226));
  assign _t260 = ((|_t259) || (|_t223));
  assign _t261 = ((|_t11) && (|_t217));
  assign _t262 = ((|_t261) && (|_t260));
  assign _t263 = ((|_t118) ? 1'd1 : oka);
  assign _t264 = ((|_t11) && (|_t217));
  assign _t265 = ((|_t264) && (|_t202));
  assign _t266 = (idx == 6'd41);
  assign _t267 = (~_t260);
  assign _t268 = ((|oku) && (|_t267));
  assign _t269 = ((|_t268) && (|_t266));
  assign _t270 = ((|_t11) && (|_t269));
  assign _t271 = ((|_t11) && (|_t269));
  assign _t272 = ((|_t11) && (|_t269));
  assign _t273 = ((|_t11) && (|_t269));
  assign _t274 = (n + 16'd1);
  assign _t275 = ((|_t11) && (|_t269));
  assign _t276 = ((|_t209) ? 1'd1 : av);
  assign d = i_data;
  assign pay = (idx == 6'd42);
  assign o_valid = ((|_t2) && (|_t0));
  assign o_data = d;
  assign o_last = (left == 16'd1);
  assign i_ready = ((|_t7) ? 1'd1 : _t6);
  assign _t277 = ((|_t41) ? _t39 : _t37);
  assign _t278 = ((|_t78) ? _t76 : _t74);
  assign _t279 = ((|_t83) ? _t81 : _t79);
  assign _t280 = ((|_t92) ? _t90 : _t88);
  assign _t281 = ((|_t115) ? _t111 : _t110);
  assign _t282 = ((|_t120) ? 1'd1 : _t119);
  assign _t283 = ((|_t219) ? _t215 : _t214);
  assign _t284 = ((|_t262) ? 1'd0 : _t220);
  assign _t285 = ((|_t265) ? 1'd0 : _t263);
  assign _t286 = ((|ask_ack) ? 1'd0 : _t276);
  assign _t287 = ((|_t211) ? tmac : amac);
  assign _t288 = ((|_t213) ? aip : arip);
  assign _t289 = ((|_t270) ? 1'd1 : pv);
  assign _t290 = ((|_t271) ? tmac : pmac);
  assign _t291 = ((|_t272) ? tip : pip);
  assign _t292 = ((|_t273) ? tprt : pprt);
  assign _t293 = ((|_t275) ? _t274 : n);
  assign peer_valid = pv;
  assign peer_mac = pmac;
  assign peer_ip = pip;
  assign peer_port = pprt;
  assign ask_valid = av;
  assign ask_mac = amac;
  assign ask_ip = arip;
  always @(posedge clk) begin
    if (rst) begin
      idx <= 6'd0;
      oku <= 1'd1;
      oka <= 1'd1;
      bc <= 1'd1;
      left <= 16'd0;
      n <= 16'd0;
      pv <= 1'd0;
      pmac <= 48'd0;
      pip <= 32'd0;
      pprt <= 16'd0;
      tmac <= 48'd0;
      tip <= 32'd0;
      tprt <= 16'd0;
      aip <= 32'd0;
      av <= 1'd0;
      amac <= 48'd0;
      arip <= 32'd0;
    end else begin
      idx <= _t283;
      oku <= _t284;
      oka <= _t285;
      bc <= _t282;
      left <= _t281;
      n <= _t293;
      pv <= _t289;
      pmac <= _t290;
      pip <= _t291;
      pprt <= _t292;
      tmac <= _t277;
      tip <= _t278;
      tprt <= _t280;
      aip <= _t279;
      av <= _t286;
      amac <= _t287;
      arip <= _t288;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module peer_head (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  input  wire pr_valid,
  input  wire [47:0] pr_mac,
  input  wire [31:0] pr_ip,
  input  wire [15:0] pr_port
);
  reg  [3:0] k;
  wire [7:0] hb;
  wire [7:0] _t0;
  wire _t1;
  wire [7:0] _t2;
  wire [7:0] _t3;
  wire _t4;
  wire [7:0] _t5;
  wire [7:0] _t6;
  wire _t7;
  wire [7:0] _t8;
  wire [7:0] _t9;
  wire _t10;
  wire [7:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire [7:0] _t15;
  wire _t16;
  wire [7:0] _t17;
  wire [7:0] _t18;
  wire _t19;
  wire [7:0] _t20;
  wire [7:0] _t21;
  wire _t22;
  wire [7:0] _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire [7:0] _t30;
  wire _t31;
  wire [7:0] _t32;
  wire [7:0] _t33;
  wire _t34;
  wire _t35;
  wire [3:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire [7:0] _t41;
  wire _t42;
  wire _t43;
  wire [3:0] _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire [3:0] _t48;
  assign _t0 = pr_mac[7:0];
  assign _t1 = (k == 4'd0);
  assign _t2 = ((|_t1) ? _t0 : 8'd0);
  assign _t3 = pr_mac[15:8];
  assign _t4 = (k == 4'd1);
  assign _t5 = ((|_t4) ? _t3 : _t2);
  assign _t6 = pr_mac[23:16];
  assign _t7 = (k == 4'd2);
  assign _t8 = ((|_t7) ? _t6 : _t5);
  assign _t9 = pr_mac[31:24];
  assign _t10 = (k == 4'd3);
  assign _t11 = ((|_t10) ? _t9 : _t8);
  assign _t12 = pr_mac[39:32];
  assign _t13 = (k == 4'd4);
  assign _t14 = ((|_t13) ? _t12 : _t11);
  assign _t15 = pr_mac[47:40];
  assign _t16 = (k == 4'd5);
  assign _t17 = ((|_t16) ? _t15 : _t14);
  assign _t18 = pr_ip[7:0];
  assign _t19 = (k == 4'd6);
  assign _t20 = ((|_t19) ? _t18 : _t17);
  assign _t21 = pr_ip[15:8];
  assign _t22 = (k == 4'd7);
  assign _t23 = ((|_t22) ? _t21 : _t20);
  assign _t24 = pr_ip[23:16];
  assign _t25 = (k == 4'd8);
  assign _t26 = ((|_t25) ? _t24 : _t23);
  assign _t27 = pr_ip[31:24];
  assign _t28 = (k == 4'd9);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = pr_port[7:0];
  assign _t31 = (k == 4'd10);
  assign _t32 = ((|_t31) ? _t30 : _t29);
  assign _t33 = pr_port[15:8];
  assign _t34 = (k == 4'd11);
  assign _t35 = (k != 4'd12);
  assign _t36 = (k + 4'd1);
  assign _t37 = ((|i_valid) && (|o_ready));
  assign _t38 = ((|_t35) && (|_t37));
  assign _t39 = ((|_t35) ? i_valid : 1'd0);
  assign _t40 = (~_t35);
  assign _t41 = ((|_t35) ? hb : 8'd0);
  assign _t42 = ((|_t35) ? 1'd0 : 1'd0);
  assign _t43 = ((|_t35) ? 1'd0 : 1'd0);
  assign _t44 = ((|_t38) ? _t36 : k);
  assign _t45 = ((|i_valid) && (|i_ready));
  assign _t46 = ((|_t45) && (|i_last));
  assign _t47 = ((|_t40) && (|_t46));
  assign hb = ((|_t34) ? _t33 : _t32);
  assign o_valid = ((|_t40) ? i_valid : _t39);
  assign o_data = ((|_t40) ? i_data : _t41);
  assign o_last = ((|_t40) ? i_last : _t42);
  assign i_ready = ((|_t40) ? o_ready : _t43);
  assign _t48 = ((|_t47) ? 4'd0 : _t44);
  always @(posedge clk) begin
    if (rst) begin
      k <= 4'd0;
    end else begin
      k <= _t48;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module fifo_9_4 (
  input  wire clk,
  input  wire rst,
  input  wire [8:0] src_data,
  input  wire src_valid,
  output wire src_ready,
  output wire [8:0] dst_data,
  output wire dst_valid,
  input  wire dst_ready,
  output reg  [2:0] cnt
);
  reg  [2:0] wp;
  reg  [2:0] rp;
  wire [1:0] mem_rd0_addr;
  wire [8:0] mem_rd0_data;
  wire [1:0] mem_wr0_addr;
  wire [8:0] mem_wr0_data;
  wire mem_wr0_we;
  wire inF;
  wire outF;
  wire _t0;
  wire _t1;
  wire _t2;
  wire [2:0] _t3;
  wire [2:0] _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire [2:0] _t10;
  wire [2:0] _t11;
  wire _t12;
  wire _t13;
  wire [2:0] _t14;
  wire _t15;
  wire _t16;
  wire [2:0] _t17;
  wire [2:0] _t18;
  wire _t19;
  wire _t20;
  wire [2:0] _t21;
  wire [2:0] _t22;
  wire [2:0] _t23;
  assign _t0 = ((|src_valid) && (|src_ready));
  assign _t1 = (wp == 3'd3);
  assign _t2 = ((|_t0) && (|_t1));
  assign _t3 = ((|_t2) ? 3'd0 : wp);
  assign _t4 = (wp + 3'd1);
  assign _t5 = (~_t1);
  assign _t6 = ((|_t0) && (|_t5));
  assign _t7 = ((|dst_valid) && (|dst_ready));
  assign _t8 = (rp == 3'd3);
  assign _t9 = ((|_t7) && (|_t8));
  assign _t10 = ((|_t9) ? 3'd0 : rp);
  assign _t11 = (rp + 3'd1);
  assign _t12 = (~_t8);
  assign _t13 = ((|_t7) && (|_t12));
  assign _t14 = (cnt + 3'd1);
  assign _t15 = (~outF);
  assign _t16 = ((|inF) && (|_t15));
  assign _t17 = ((|_t16) ? _t14 : cnt);
  assign _t18 = (cnt - 3'd1);
  assign _t19 = (~inF);
  assign _t20 = ((|outF) && (|_t19));
  assign src_ready = (cnt != 3'd4);
  assign dst_valid = (cnt != 3'd0);
  assign mem_rd0_addr = rp;
  assign dst_data = mem_rd0_data;
  assign inF = ((|_t0) ? 1'd1 : 1'd0);
  assign mem_wr0_addr = ((|_t0) ? wp[1:0] : 2'd0);
  assign mem_wr0_data = ((|_t0) ? src_data : 9'd0);
  assign mem_wr0_we = ((|_t0) ? 1'd1 : 1'd0);
  assign _t21 = ((|_t6) ? _t4 : _t3);
  assign outF = ((|_t7) ? 1'd1 : 1'd0);
  assign _t22 = ((|_t13) ? _t11 : _t10);
  assign _t23 = ((|_t20) ? _t18 : _t17);
  always @(posedge clk) begin
    if (rst) begin
      wp <= 3'd0;
      rp <= 3'd0;
      cnt <= 3'd0;
    end else begin
      wp <= _t21;
      rp <= _t22;
      cnt <= _t23;
    end
  end
  l8_ram_9x4_r1_w1_d _meminst_0_mem (
    .clk(clk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module peer_tail (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  output wire pt_valid,
  output wire [47:0] pt_mac,
  output wire [31:0] pt_ip,
  output wire [15:0] pt_port
);
  reg  [3:0] k;
  reg  v;
  reg  [47:0] mac;
  reg  [31:0] ip;
  reg  [15:0] port;
  wire _t0;
  wire [39:0] _t1;
  wire [47:0] _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire [47:0] _t6;
  wire [7:0] _t7;
  wire [31:0] _t8;
  wire [47:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [47:0] _t13;
  wire [15:0] _t14;
  wire [23:0] _t15;
  wire [47:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire [47:0] _t20;
  wire [23:0] _t21;
  wire [15:0] _t22;
  wire [47:0] _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire [47:0] _t27;
  wire [31:0] _t28;
  wire [7:0] _t29;
  wire [47:0] _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire [47:0] _t34;
  wire [39:0] _t35;
  wire [47:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire [23:0] _t40;
  wire [31:0] _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire [31:0] _t45;
  wire [7:0] _t46;
  wire [15:0] _t47;
  wire [31:0] _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire [31:0] _t52;
  wire [15:0] _t53;
  wire [7:0] _t54;
  wire [31:0] _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire [31:0] _t59;
  wire [23:0] _t60;
  wire [31:0] _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire [7:0] _t65;
  wire [15:0] _t66;
  wire _t67;
  wire _t68;
  wire _t69;
  wire [15:0] _t70;
  wire [7:0] _t71;
  wire [15:0] _t72;
  wire _t73;
  wire _t74;
  wire _t75;
  wire _t76;
  wire _t77;
  wire _t78;
  wire [3:0] _t79;
  wire _t80;
  wire _t81;
  wire _t82;
  wire [7:0] _t83;
  wire _t84;
  wire _t85;
  wire [3:0] _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire [47:0] _t90;
  wire [31:0] _t91;
  wire [15:0] _t92;
  wire _t93;
  wire [3:0] _t94;
  assign _t0 = (k != 4'd12);
  assign _t1 = mac[47:8];
  assign _t2 = {_t1, i_data};
  assign _t3 = (k == 4'd0);
  assign _t4 = ((|_t0) && (|i_valid));
  assign _t5 = ((|_t4) && (|_t3));
  assign _t6 = ((|_t5) ? _t2 : mac);
  assign _t7 = _t6[7:0];
  assign _t8 = _t6[47:16];
  assign _t9 = {_t8, i_data, _t7};
  assign _t10 = (k == 4'd1);
  assign _t11 = ((|_t0) && (|i_valid));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? _t9 : _t6);
  assign _t14 = _t13[15:0];
  assign _t15 = _t13[47:24];
  assign _t16 = {_t15, i_data, _t14};
  assign _t17 = (k == 4'd2);
  assign _t18 = ((|_t0) && (|i_valid));
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = ((|_t19) ? _t16 : _t13);
  assign _t21 = _t20[23:0];
  assign _t22 = _t20[47:32];
  assign _t23 = {_t22, i_data, _t21};
  assign _t24 = (k == 4'd3);
  assign _t25 = ((|_t0) && (|i_valid));
  assign _t26 = ((|_t25) && (|_t24));
  assign _t27 = ((|_t26) ? _t23 : _t20);
  assign _t28 = _t27[31:0];
  assign _t29 = _t27[47:40];
  assign _t30 = {_t29, i_data, _t28};
  assign _t31 = (k == 4'd4);
  assign _t32 = ((|_t0) && (|i_valid));
  assign _t33 = ((|_t32) && (|_t31));
  assign _t34 = ((|_t33) ? _t30 : _t27);
  assign _t35 = _t34[39:0];
  assign _t36 = {i_data, _t35};
  assign _t37 = (k == 4'd5);
  assign _t38 = ((|_t0) && (|i_valid));
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ip[31:8];
  assign _t41 = {_t40, i_data};
  assign _t42 = (k == 4'd6);
  assign _t43 = ((|_t0) && (|i_valid));
  assign _t44 = ((|_t43) && (|_t42));
  assign _t45 = ((|_t44) ? _t41 : ip);
  assign _t46 = _t45[7:0];
  assign _t47 = _t45[31:16];
  assign _t48 = {_t47, i_data, _t46};
  assign _t49 = (k == 4'd7);
  assign _t50 = ((|_t0) && (|i_valid));
  assign _t51 = ((|_t50) && (|_t49));
  assign _t52 = ((|_t51) ? _t48 : _t45);
  assign _t53 = _t52[15:0];
  assign _t54 = _t52[31:24];
  assign _t55 = {_t54, i_data, _t53};
  assign _t56 = (k == 4'd8);
  assign _t57 = ((|_t0) && (|i_valid));
  assign _t58 = ((|_t57) && (|_t56));
  assign _t59 = ((|_t58) ? _t55 : _t52);
  assign _t60 = _t59[23:0];
  assign _t61 = {i_data, _t60};
  assign _t62 = (k == 4'd9);
  assign _t63 = ((|_t0) && (|i_valid));
  assign _t64 = ((|_t63) && (|_t62));
  assign _t65 = port[15:8];
  assign _t66 = {_t65, i_data};
  assign _t67 = (k == 4'd10);
  assign _t68 = ((|_t0) && (|i_valid));
  assign _t69 = ((|_t68) && (|_t67));
  assign _t70 = ((|_t69) ? _t66 : port);
  assign _t71 = _t70[7:0];
  assign _t72 = {i_data, _t71};
  assign _t73 = (k == 4'd11);
  assign _t74 = ((|_t0) && (|i_valid));
  assign _t75 = ((|_t74) && (|_t73));
  assign _t76 = (k == 4'd11);
  assign _t77 = ((|_t0) && (|i_valid));
  assign _t78 = ((|_t77) && (|_t76));
  assign _t79 = (k + 4'd1);
  assign _t80 = ((|_t0) && (|i_valid));
  assign _t81 = ((|_t0) ? 1'd0 : 1'd0);
  assign _t82 = (~_t0);
  assign _t83 = ((|_t0) ? i_data : 8'd0);
  assign _t84 = ((|_t0) ? 1'd0 : 1'd0);
  assign _t85 = ((|_t0) ? 1'd1 : 1'd0);
  assign _t86 = ((|_t80) ? _t79 : k);
  assign _t87 = ((|i_valid) && (|i_ready));
  assign _t88 = ((|_t87) && (|i_last));
  assign _t89 = ((|_t82) && (|_t88));
  assign pt_valid = v;
  assign pt_mac = mac;
  assign pt_ip = ip;
  assign pt_port = port;
  assign o_valid = ((|_t82) ? i_valid : _t81);
  assign o_data = ((|_t82) ? i_data : _t83);
  assign o_last = ((|_t82) ? i_last : _t84);
  assign i_ready = ((|_t82) ? o_ready : _t85);
  assign _t90 = ((|_t39) ? _t36 : _t34);
  assign _t91 = ((|_t64) ? _t61 : _t59);
  assign _t92 = ((|_t75) ? _t72 : _t70);
  assign _t93 = ((|_t78) ? 1'd1 : v);
  assign _t94 = ((|_t89) ? 4'd0 : _t86);
  always @(posedge clk) begin
    if (rst) begin
      k <= 4'd0;
      v <= 1'd0;
      mac <= 48'd0;
      ip <= 32'd0;
      port <= 16'd0;
    end else begin
      k <= _t94;
      v <= _t93;
      mac <= _t90;
      ip <= _t91;
      port <= _t92;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module pktfifo_8_2048 (
  input  wire clk,
  input  wire rst,
  input  wire wr,
  input  wire [7:0] wdata,
  input  wire wlast,
  input  wire commit,
  input  wire rewind,
  output wire [7:0] dst_data,
  output wire dst_last,
  output wire dst_valid,
  input  wire dst_ready,
  output wire full,
  output reg  tight
);
  reg  [11:0] wps;
  reg  [11:0] wpc;
  reg  [11:0] rp;
  wire [11:0] nxt;
  wire [11:0] used;
  wire take;
  wire [8:0] word;
  wire [8:0] rdw;
  wire [11:0] rnx;
  reg  [11:0] seen;
  reg  fresh;
  wire adv;
  wire [10:0] mem_rd0_addr;
  wire [8:0] mem_rd0_data;
  wire [10:0] mem_wr0_addr;
  wire [8:0] mem_wr0_data;
  wire mem_wr0_we;
  wire _t0;
  wire [11:0] _t1;
  wire [11:0] _t2;
  wire _t3;
  wire [11:0] _t4;
  wire _t5;
  wire [11:0] _t6;
  wire [11:0] _t7;
  wire [11:0] _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire [8:0] _t12;
  wire [7:0] _t13;
  wire [11:0] _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire [11:0] _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire [11:0] _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire [11:0] _t29;
  wire [11:0] _t30;
  wire _t31;
  wire [10:0] _t32;
  wire _t33;
  wire [8:0] _t34;
  wire _t35;
  wire [8:0] _t36;
  wire _t37;
  wire [11:0] _t38;
  wire [11:0] _t39;
  wire [11:0] _t40;
  assign _t0 = (wps == 12'd2047);
  assign _t1 = ((|_t0) ? 12'd0 : 12'd0);
  assign _t2 = (wps + 12'd1);
  assign _t3 = (~_t0);
  assign _t4 = (wps - rp);
  assign _t5 = (wps >= rp);
  assign _t6 = (wps + 12'd2048);
  assign _t7 = ((|_t5) ? _t4 : 12'd0);
  assign _t8 = (_t6 - rp);
  assign _t9 = (~_t5);
  assign _t10 = (~full);
  assign _t11 = 1'd0;
  assign _t12 = {_t11, wdata};
  assign _t13 = _t12[7:0];
  assign _t14 = ((|rewind) ? wpc : wps);
  assign _t15 = (~rewind);
  assign _t16 = ((|_t15) && (|commit));
  assign _t17 = ((|_t16) && (|take));
  assign _t18 = ((|_t15) && (|commit));
  assign _t19 = ((|_t18) && (|take));
  assign _t20 = ((|_t19) ? nxt : wpc);
  assign _t21 = (~take);
  assign _t22 = ((|_t15) && (|commit));
  assign _t23 = ((|_t22) && (|_t21));
  assign _t24 = ((|_t17) ? nxt : _t14);
  assign _t25 = (~commit);
  assign _t26 = ((|_t15) && (|_t25));
  assign _t27 = ((|_t26) && (|take));
  assign _t28 = (rp == 12'd2047);
  assign _t29 = ((|_t28) ? 12'd0 : 12'd0);
  assign _t30 = (rp + 12'd1);
  assign _t31 = (~_t28);
  assign _t32 = ((|adv) ? rnx[10:0] : 11'd0);
  assign _t33 = (~adv);
  assign _t34 = ((|adv) ? mem_rd0_data : 9'd0);
  assign _t35 = (rp != seen);
  assign nxt = ((|_t3) ? _t2 : _t1);
  assign full = (nxt == rp);
  assign used = ((|_t9) ? _t8 : _t7);
  assign _t37 = (used >= 12'd2044);
  assign take = ((|wr) && (|_t10));
  assign word = {wlast, _t13};
  assign mem_wr0_addr = ((|take) ? wps[10:0] : 11'd0);
  assign mem_wr0_data = ((|take) ? word : 9'd0);
  assign mem_wr0_we = ((|take) ? 1'd1 : 1'd0);
  assign _t38 = ((|_t27) ? nxt : _t24);
  assign _t39 = ((|_t23) ? wps : _t20);
  assign rnx = ((|_t31) ? _t30 : _t29);
  assign adv = ((|dst_valid) && (|dst_ready));
  assign mem_rd0_addr = ((|_t33) ? rp[10:0] : _t32);
  assign rdw = ((|_t33) ? mem_rd0_data : _t34);
  assign dst_valid = ((|_t35) && (|fresh));
  assign dst_data = rdw[7:0];
  assign dst_last = rdw[8];
  assign _t40 = ((|adv) ? rnx : rp);
  always @(posedge clk) begin
    if (rst) begin
      wps <= 12'd0;
      wpc <= 12'd0;
      rp <= 12'd0;
      tight <= 1'd0;
      seen <= 12'd0;
      fresh <= 1'd0;
    end else begin
      wps <= _t38;
      wpc <= _t39;
      rp <= _t40;
      tight <= _t37;
      seen <= wpc;
      fresh <= 1'd1;
    end
  end
  l8_ram_9x2048_r1_w1_b _meminst_0_mem (
    .clk(clk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module ip4_tx_36492_2200301993985_3232255234_2048_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  input  wire peer_valid,
  input  wire [47:0] peer_mac,
  input  wire [31:0] peer_ip,
  input  wire [15:0] peer_port,
  input  wire ask_valid,
  input  wire [47:0] ask_mac,
  input  wire [31:0] ask_ip,
  output wire ask_ack,
  output reg  [15:0] n,
  output reg  [15:0] na
);
  reg  [15:0] len;
  reg  [31:0] acc;
  reg  [31:0] iac;
  reg  [15:0] ck;
  reg  [15:0] ick;
  reg  [5:0] hi;
  reg  [47:0] dmac;
  reg  [31:0] dip;
  reg  [15:0] dprt;
  wire [15:0] ulen;
  wire [15:0] tlen;
  wire [31:0] dipw;
  wire [7:0] hb;
  wire [7:0] ab;
  wire w;
  wire cm;
  wire full;
  wire ffull;
  wire [7:0] fo_data;
  wire fo_last;
  wire fo_valid;
  wire fo_ready;
  reg  [2:0] ut_state;
  wire [7:0] _t0;
  wire [31:0] _t1;
  wire [7:0] _t2;
  wire [31:0] _t3;
  wire [31:0] _t4;
  wire [7:0] _t5;
  wire [31:0] _t6;
  wire [7:0] _t7;
  wire [31:0] _t8;
  wire [31:0] _t9;
  wire [31:0] _t10;
  wire [31:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire _t15;
  wire [7:0] _t16;
  wire [7:0] _t17;
  wire _t18;
  wire [7:0] _t19;
  wire _t20;
  wire [7:0] _t21;
  wire [7:0] _t22;
  wire _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire _t30;
  wire [7:0] _t31;
  wire [7:0] _t32;
  wire _t33;
  wire [7:0] _t34;
  wire _t35;
  wire [7:0] _t36;
  wire [7:0] _t37;
  wire _t38;
  wire [7:0] _t39;
  wire _t40;
  wire [7:0] _t41;
  wire _t42;
  wire [7:0] _t43;
  wire _t44;
  wire [7:0] _t45;
  wire [7:0] _t46;
  wire _t47;
  wire [7:0] _t48;
  wire [7:0] _t49;
  wire _t50;
  wire [7:0] _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire [7:0] _t55;
  wire _t56;
  wire [7:0] _t57;
  wire [7:0] _t58;
  wire _t59;
  wire [7:0] _t60;
  wire [7:0] _t61;
  wire _t62;
  wire [7:0] _t63;
  wire _t64;
  wire [7:0] _t65;
  wire [7:0] _t66;
  wire _t67;
  wire [7:0] _t68;
  wire _t69;
  wire [7:0] _t70;
  wire [7:0] _t71;
  wire _t72;
  wire [7:0] _t73;
  wire _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire _t77;
  wire [7:0] _t78;
  wire _t79;
  wire [7:0] _t80;
  wire [7:0] _t81;
  wire _t82;
  wire [7:0] _t83;
  wire _t84;
  wire [7:0] _t85;
  wire _t86;
  wire [7:0] _t87;
  wire [7:0] _t88;
  wire _t89;
  wire [7:0] _t90;
  wire [7:0] _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [7:0] _t94;
  wire _t95;
  wire [7:0] _t96;
  wire [7:0] _t97;
  wire _t98;
  wire [7:0] _t99;
  wire [7:0] _t100;
  wire _t101;
  wire [7:0] _t102;
  wire [7:0] _t103;
  wire _t104;
  wire [7:0] _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire [7:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire [7:0] _t113;
  wire [7:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire [7:0] _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire [7:0] _t122;
  wire [7:0] _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire [7:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire [7:0] _t131;
  wire [7:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire [7:0] _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire [7:0] _t140;
  wire [7:0] _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire [7:0] _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire [7:0] _t149;
  wire [7:0] _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [7:0] _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire [7:0] _t158;
  wire _t159;
  wire [7:0] _t160;
  wire [7:0] _t161;
  wire _t162;
  wire [7:0] _t163;
  wire _t164;
  wire [7:0] _t165;
  wire [7:0] _t166;
  wire _t167;
  wire [7:0] _t168;
  wire _t169;
  wire [7:0] _t170;
  wire [7:0] _t171;
  wire _t172;
  wire [7:0] _t173;
  wire _t174;
  wire [7:0] _t175;
  wire [7:0] _t176;
  wire _t177;
  wire [7:0] _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [7:0] _t182;
  wire _t183;
  wire [7:0] _t184;
  wire _t185;
  wire [7:0] _t186;
  wire _t187;
  wire [7:0] _t188;
  wire _t189;
  wire [7:0] _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire [15:0] _t210;
  wire _t211;
  wire _t212;
  wire [31:0] _t213;
  wire [31:0] _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire [31:0] _t219;
  wire [31:0] _t220;
  wire [31:0] _t221;
  wire [31:0] _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire [47:0] _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire [31:0] _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire [15:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [2:0] _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [2:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire _t274;
  wire _t275;
  wire [7:0] _t276;
  wire _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire _t281;
  wire [31:0] _t282;
  wire [31:0] _t283;
  wire [31:0] _t284;
  wire [31:0] _t285;
  wire [31:0] _t286;
  wire _t287;
  wire [31:0] _t288;
  wire _t289;
  wire [2:0] _t290;
  wire _t291;
  wire _t292;
  wire _t293;
  wire _t294;
  wire _t295;
  wire _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire [7:0] _t302;
  wire _t303;
  wire _t304;
  wire _t305;
  wire _t306;
  wire _t307;
  wire [31:0] _t308;
  wire [31:0] _t309;
  wire [31:0] _t310;
  wire [31:0] _t311;
  wire [31:0] _t312;
  wire _t313;
  wire [31:0] _t314;
  wire [31:0] _t315;
  wire [31:0] _t316;
  wire _t317;
  wire [2:0] _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire _t323;
  wire _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [7:0] _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire _t334;
  wire _t335;
  wire [15:0] _t336;
  wire [31:0] _t337;
  wire [15:0] _t338;
  wire [31:0] _t339;
  wire [31:0] _t340;
  wire [31:0] _t341;
  wire [15:0] _t342;
  wire _t343;
  wire [15:0] _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire [15:0] _t349;
  wire [31:0] _t350;
  wire [15:0] _t351;
  wire [31:0] _t352;
  wire [31:0] _t353;
  wire [31:0] _t354;
  wire _t355;
  wire _t356;
  wire [2:0] _t357;
  wire _t358;
  wire _t359;
  wire [15:0] _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire [15:0] _t366;
  wire [15:0] _t367;
  wire [15:0] _t368;
  wire _t369;
  wire _t370;
  wire _t371;
  wire _t372;
  wire [15:0] _t373;
  wire [15:0] _t374;
  wire _t375;
  wire _t376;
  wire [5:0] _t377;
  wire _t378;
  wire _t379;
  wire [2:0] _t380;
  wire _t381;
  wire _t382;
  wire _t383;
  wire _t384;
  wire _t385;
  wire _t386;
  wire _t387;
  wire _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire _t392;
  wire [7:0] _t393;
  wire _t394;
  wire _t395;
  wire _t396;
  wire _t397;
  wire _t398;
  wire [5:0] _t399;
  wire [5:0] _t400;
  wire _t401;
  wire _t402;
  wire [2:0] _t403;
  wire _t404;
  wire _t405;
  wire _t406;
  wire _t407;
  wire [2:0] _t408;
  wire _t409;
  wire _t410;
  wire _t411;
  wire _t412;
  wire _t413;
  wire _t414;
  wire _t415;
  wire _t416;
  wire _t417;
  wire _t418;
  wire _t419;
  wire _t420;
  wire _t421;
  wire [7:0] _t422;
  wire _t423;
  wire _t424;
  wire _t425;
  wire _t426;
  wire _t427;
  wire [15:0] _t428;
  wire _t429;
  wire _t430;
  wire _t431;
  wire _t432;
  wire [31:0] _t433;
  wire _t434;
  wire _t435;
  wire [15:0] _t436;
  wire _t437;
  wire _t438;
  wire [2:0] _t439;
  wire _t440;
  wire _t441;
  wire [2:0] _t442;
  wire _t443;
  wire _t444;
  wire _t445;
  wire _t446;
  wire _t447;
  wire _t448;
  wire _t449;
  wire _t450;
  wire _t451;
  wire _t452;
  wire _t453;
  wire _t454;
  wire _t455;
  wire _t456;
  wire [7:0] _t457;
  wire _t458;
  wire _t459;
  wire _t460;
  wire _t461;
  wire _t462;
  wire _t463;
  wire _t464;
  wire [5:0] _t465;
  wire [5:0] _t466;
  wire _t467;
  wire _t468;
  wire [15:0] _t469;
  wire _t470;
  wire _t471;
  wire _t472;
  wire _t473;
  wire [2:0] _t474;
  wire _t475;
  wire _t476;
  wire [2:0] _t477;
  wire _t478;
  wire _t479;
  wire _t480;
  wire [15:0] _t481;
  wire [31:0] _t482;
  wire [47:0] _t483;
  wire [31:0] _t484;
  wire [15:0] _t485;
  wire [2:0] _t486;
  wire [5:0] _t487;
  wire [31:0] _t488;
  wire [15:0] _t489;
  wire [15:0] _t490;
  wire [15:0] _t491;
  wire [15:0] _t492;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  assign _t0 = dip[31:24];
  assign _t1 = {24'b0, _t0};
  assign _t2 = dip[23:16];
  assign _t3 = {24'b0, _t2};
  assign _t4 = (_t3 << 32'd8);
  assign _t5 = dip[15:8];
  assign _t6 = {24'b0, _t5};
  assign _t7 = dip[7:0];
  assign _t8 = {24'b0, _t7};
  assign _t9 = (_t8 << 32'd8);
  assign _t10 = (_t9 + _t6);
  assign _t11 = (_t10 + _t4);
  assign _t12 = dmac[7:0];
  assign _t13 = (hi == 6'd0);
  assign _t14 = ((|_t13) ? _t12 : 8'd0);
  assign _t15 = (hi == 6'd6);
  assign _t16 = ((|_t15) ? 8'd2 : _t14);
  assign _t17 = dmac[15:8];
  assign _t18 = (hi == 6'd1);
  assign _t19 = ((|_t18) ? _t17 : _t16);
  assign _t20 = (hi == 6'd7);
  assign _t21 = ((|_t20) ? 8'd0 : _t19);
  assign _t22 = dmac[23:16];
  assign _t23 = (hi == 6'd2);
  assign _t24 = ((|_t23) ? _t22 : _t21);
  assign _t25 = (hi == 6'd8);
  assign _t26 = ((|_t25) ? 8'd76 : _t24);
  assign _t27 = dmac[31:24];
  assign _t28 = (hi == 6'd3);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = (hi == 6'd9);
  assign _t31 = ((|_t30) ? 8'd56 : _t29);
  assign _t32 = dmac[39:32];
  assign _t33 = (hi == 6'd4);
  assign _t34 = ((|_t33) ? _t32 : _t31);
  assign _t35 = (hi == 6'd10);
  assign _t36 = ((|_t35) ? 8'd0 : _t34);
  assign _t37 = dmac[47:40];
  assign _t38 = (hi == 6'd5);
  assign _t39 = ((|_t38) ? _t37 : _t36);
  assign _t40 = (hi == 6'd11);
  assign _t41 = ((|_t40) ? 8'd1 : _t39);
  assign _t42 = (hi == 6'd12);
  assign _t43 = ((|_t42) ? 8'd8 : _t41);
  assign _t44 = (hi == 6'd14);
  assign _t45 = ((|_t44) ? 8'd69 : _t43);
  assign _t46 = tlen[15:8];
  assign _t47 = (hi == 6'd16);
  assign _t48 = ((|_t47) ? _t46 : _t45);
  assign _t49 = tlen[7:0];
  assign _t50 = (hi == 6'd17);
  assign _t51 = ((|_t50) ? _t49 : _t48);
  assign _t52 = (hi == 6'd20);
  assign _t53 = ((|_t52) ? 8'd64 : _t51);
  assign _t54 = (hi == 6'd22);
  assign _t55 = ((|_t54) ? 8'd64 : _t53);
  assign _t56 = (hi == 6'd23);
  assign _t57 = ((|_t56) ? 8'd17 : _t55);
  assign _t58 = ick[15:8];
  assign _t59 = (hi == 6'd24);
  assign _t60 = ((|_t59) ? _t58 : _t57);
  assign _t61 = ick[7:0];
  assign _t62 = (hi == 6'd25);
  assign _t63 = ((|_t62) ? _t61 : _t60);
  assign _t64 = (hi == 6'd26);
  assign _t65 = ((|_t64) ? 8'd192 : _t63);
  assign _t66 = dip[7:0];
  assign _t67 = (hi == 6'd30);
  assign _t68 = ((|_t67) ? _t66 : _t65);
  assign _t69 = (hi == 6'd27);
  assign _t70 = ((|_t69) ? 8'd168 : _t68);
  assign _t71 = dip[15:8];
  assign _t72 = (hi == 6'd31);
  assign _t73 = ((|_t72) ? _t71 : _t70);
  assign _t74 = (hi == 6'd28);
  assign _t75 = ((|_t74) ? 8'd77 : _t73);
  assign _t76 = dip[23:16];
  assign _t77 = (hi == 6'd32);
  assign _t78 = ((|_t77) ? _t76 : _t75);
  assign _t79 = (hi == 6'd29);
  assign _t80 = ((|_t79) ? 8'd2 : _t78);
  assign _t81 = dip[31:24];
  assign _t82 = (hi == 6'd33);
  assign _t83 = ((|_t82) ? _t81 : _t80);
  assign _t84 = (hi == 6'd34);
  assign _t85 = ((|_t84) ? 8'd142 : _t83);
  assign _t86 = (hi == 6'd35);
  assign _t87 = ((|_t86) ? 8'd140 : _t85);
  assign _t88 = dprt[15:8];
  assign _t89 = (hi == 6'd36);
  assign _t90 = ((|_t89) ? _t88 : _t87);
  assign _t91 = dprt[7:0];
  assign _t92 = (hi == 6'd37);
  assign _t93 = ((|_t92) ? _t91 : _t90);
  assign _t94 = ulen[15:8];
  assign _t95 = (hi == 6'd38);
  assign _t96 = ((|_t95) ? _t94 : _t93);
  assign _t97 = ulen[7:0];
  assign _t98 = (hi == 6'd39);
  assign _t99 = ((|_t98) ? _t97 : _t96);
  assign _t100 = ck[15:8];
  assign _t101 = (hi == 6'd40);
  assign _t102 = ((|_t101) ? _t100 : _t99);
  assign _t103 = ck[7:0];
  assign _t104 = (hi == 6'd41);
  assign _t105 = ask_mac[7:0];
  assign _t106 = (hi == 6'd32);
  assign _t107 = (hi == 6'd0);
  assign _t108 = ((|_t107) || (|_t106));
  assign _t109 = ((|_t108) ? _t105 : 8'd0);
  assign _t110 = (hi == 6'd22);
  assign _t111 = (hi == 6'd6);
  assign _t112 = ((|_t111) || (|_t110));
  assign _t113 = ((|_t112) ? 8'd2 : _t109);
  assign _t114 = ask_mac[15:8];
  assign _t115 = (hi == 6'd33);
  assign _t116 = (hi == 6'd1);
  assign _t117 = ((|_t116) || (|_t115));
  assign _t118 = ((|_t117) ? _t114 : _t113);
  assign _t119 = (hi == 6'd23);
  assign _t120 = (hi == 6'd7);
  assign _t121 = ((|_t120) || (|_t119));
  assign _t122 = ((|_t121) ? 8'd0 : _t118);
  assign _t123 = ask_mac[23:16];
  assign _t124 = (hi == 6'd34);
  assign _t125 = (hi == 6'd2);
  assign _t126 = ((|_t125) || (|_t124));
  assign _t127 = ((|_t126) ? _t123 : _t122);
  assign _t128 = (hi == 6'd24);
  assign _t129 = (hi == 6'd8);
  assign _t130 = ((|_t129) || (|_t128));
  assign _t131 = ((|_t130) ? 8'd76 : _t127);
  assign _t132 = ask_mac[31:24];
  assign _t133 = (hi == 6'd35);
  assign _t134 = (hi == 6'd3);
  assign _t135 = ((|_t134) || (|_t133));
  assign _t136 = ((|_t135) ? _t132 : _t131);
  assign _t137 = (hi == 6'd25);
  assign _t138 = (hi == 6'd9);
  assign _t139 = ((|_t138) || (|_t137));
  assign _t140 = ((|_t139) ? 8'd56 : _t136);
  assign _t141 = ask_mac[39:32];
  assign _t142 = (hi == 6'd36);
  assign _t143 = (hi == 6'd4);
  assign _t144 = ((|_t143) || (|_t142));
  assign _t145 = ((|_t144) ? _t141 : _t140);
  assign _t146 = (hi == 6'd26);
  assign _t147 = (hi == 6'd10);
  assign _t148 = ((|_t147) || (|_t146));
  assign _t149 = ((|_t148) ? 8'd0 : _t145);
  assign _t150 = ask_mac[47:40];
  assign _t151 = (hi == 6'd37);
  assign _t152 = (hi == 6'd5);
  assign _t153 = ((|_t152) || (|_t151));
  assign _t154 = ((|_t153) ? _t150 : _t149);
  assign _t155 = (hi == 6'd27);
  assign _t156 = (hi == 6'd11);
  assign _t157 = ((|_t156) || (|_t155));
  assign _t158 = ((|_t157) ? 8'd1 : _t154);
  assign _t159 = (hi == 6'd28);
  assign _t160 = ((|_t159) ? 8'd192 : _t158);
  assign _t161 = ask_ip[7:0];
  assign _t162 = (hi == 6'd38);
  assign _t163 = ((|_t162) ? _t161 : _t160);
  assign _t164 = (hi == 6'd29);
  assign _t165 = ((|_t164) ? 8'd168 : _t163);
  assign _t166 = ask_ip[15:8];
  assign _t167 = (hi == 6'd39);
  assign _t168 = ((|_t167) ? _t166 : _t165);
  assign _t169 = (hi == 6'd30);
  assign _t170 = ((|_t169) ? 8'd77 : _t168);
  assign _t171 = ask_ip[23:16];
  assign _t172 = (hi == 6'd40);
  assign _t173 = ((|_t172) ? _t171 : _t170);
  assign _t174 = (hi == 6'd31);
  assign _t175 = ((|_t174) ? 8'd2 : _t173);
  assign _t176 = ask_ip[31:24];
  assign _t177 = (hi == 6'd41);
  assign _t178 = ((|_t177) ? _t176 : _t175);
  assign _t179 = (hi == 6'd12);
  assign _t180 = ((|_t179) ? 8'd8 : _t178);
  assign _t181 = (hi == 6'd13);
  assign _t182 = ((|_t181) ? 8'd6 : _t180);
  assign _t183 = (hi == 6'd15);
  assign _t184 = ((|_t183) ? 8'd1 : _t182);
  assign _t185 = (hi == 6'd16);
  assign _t186 = ((|_t185) ? 8'd8 : _t184);
  assign _t187 = (hi == 6'd18);
  assign _t188 = ((|_t187) ? 8'd6 : _t186);
  assign _t189 = (hi == 6'd19);
  assign _t190 = ((|_t189) ? 8'd4 : _t188);
  assign _t191 = (hi == 6'd21);
  assign _t192 = ((|peer_valid) || (|1'd1));
  assign _t193 = (len == 16'd0);
  assign _t194 = ((|ask_valid) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (~full);
  assign _t197 = ((|_t196) && (|_t195));
  assign _t198 = ((|_t197) && (|_t192));
  assign _t199 = ({29'b0, ut_state} == 32'd0);
  assign _t200 = ((|t_valid) && (|t_ready));
  assign _t201 = ({29'b0, ut_state} == 32'd0);
  assign _t202 = ((|t_valid) && (|t_ready));
  assign _t203 = ((|_t202) && (|t_last));
  assign _t204 = ({29'b0, ut_state} == 32'd0);
  assign _t205 = ({29'b0, ut_state} == 32'd0);
  assign _t206 = ({29'b0, ut_state} == 32'd0);
  assign _t207 = ({29'b0, ut_state} == 32'd0);
  assign _t208 = ({29'b0, ut_state} == 32'd0);
  assign _t209 = ({29'b0, ut_state} == 32'd0);
  assign _t210 = (len + 16'd1);
  assign _t211 = ({29'b0, ut_state} == 32'd0);
  assign _t212 = ((|_t211) && (|w));
  assign _t213 = {24'b0, t_data};
  assign _t214 = (acc + _t213);
  assign _t215 = len[0];
  assign _t216 = ((|w) && (|_t215));
  assign _t217 = ({29'b0, ut_state} == 32'd0);
  assign _t218 = ((|_t217) && (|_t216));
  assign _t219 = {24'b0, t_data};
  assign _t220 = (_t219 << 32'd8);
  assign _t221 = ((|_t218) ? _t214 : acc);
  assign _t222 = (acc + _t220);
  assign _t223 = (~_t215);
  assign _t224 = ((|w) && (|_t223));
  assign _t225 = ({29'b0, ut_state} == 32'd0);
  assign _t226 = ((|_t225) && (|_t224));
  assign _t227 = ((|cm) && (|peer_valid));
  assign _t228 = ({29'b0, ut_state} == 32'd0);
  assign _t229 = ((|_t228) && (|_t227));
  assign _t230 = ((|cm) && (|peer_valid));
  assign _t231 = ({29'b0, ut_state} == 32'd0);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = ((|cm) && (|peer_valid));
  assign _t234 = ({29'b0, ut_state} == 32'd0);
  assign _t235 = ((|_t234) && (|_t233));
  assign _t236 = ((|_t229) ? peer_mac : dmac);
  assign _t237 = (~peer_valid);
  assign _t238 = ((|cm) && (|_t237));
  assign _t239 = ({29'b0, ut_state} == 32'd0);
  assign _t240 = ((|_t239) && (|_t238));
  assign _t241 = ((|_t232) ? peer_ip : dip);
  assign _t242 = ((|cm) && (|_t237));
  assign _t243 = ({29'b0, ut_state} == 32'd0);
  assign _t244 = ((|_t243) && (|_t242));
  assign _t245 = ((|_t235) ? peer_port : dprt);
  assign _t246 = ((|cm) && (|_t237));
  assign _t247 = ({29'b0, ut_state} == 32'd0);
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ({29'b0, ut_state} == 32'd0);
  assign _t250 = ((|_t249) && (|cm));
  assign _t251 = (len == 16'd0);
  assign _t252 = ((|ask_valid) && (|_t251));
  assign _t253 = (~cm);
  assign _t254 = ((|_t253) && (|_t252));
  assign _t255 = ({29'b0, ut_state} == 32'd0);
  assign _t256 = ((|_t255) && (|_t254));
  assign _t257 = ((|_t250) ? 32'd1 : ut_state);
  assign _t258 = ((|_t253) && (|_t252));
  assign _t259 = ({29'b0, ut_state} == 32'd0);
  assign _t260 = ((|_t259) && (|_t258));
  assign _t261 = ((|_t260) ? 32'd6 : _t257);
  assign _t262 = (~_t252);
  assign _t263 = ((|_t253) && (|_t262));
  assign _t264 = ({29'b0, ut_state} == 32'd0);
  assign _t265 = ((|_t264) && (|_t263));
  assign _t266 = ((|_t199) ? _t198 : 1'd0);
  assign _t267 = ({29'b0, ut_state} == 32'd1);
  assign _t268 = ((|_t201) ? _t200 : 1'd0);
  assign _t269 = ({29'b0, ut_state} == 32'd1);
  assign _t270 = ((|_t204) ? _t203 : 1'd0);
  assign _t271 = ({29'b0, ut_state} == 32'd1);
  assign _t272 = ((|_t205) ? 1'd0 : 1'd0);
  assign _t273 = ({29'b0, ut_state} == 32'd1);
  assign _t274 = ((|_t206) ? 1'd0 : 1'd0);
  assign _t275 = ({29'b0, ut_state} == 32'd1);
  assign _t276 = ((|_t207) ? hb : 8'd0);
  assign _t277 = ({29'b0, ut_state} == 32'd1);
  assign _t278 = ((|_t208) ? 1'd0 : 1'd0);
  assign _t279 = ({29'b0, ut_state} == 32'd1);
  assign _t280 = ((|_t209) ? 1'd0 : 1'd0);
  assign _t281 = ({29'b0, ut_state} == 32'd1);
  assign _t282 = {16'b0, dprt};
  assign _t283 = (acc + dipw);
  assign _t284 = (_t283 + _t282);
  assign _t285 = ((|_t226) ? _t222 : _t221);
  assign _t286 = (_t284 + 32'd105543);
  assign _t287 = ({29'b0, ut_state} == 32'd1);
  assign _t288 = (dipw + 32'd119483);
  assign _t289 = ({29'b0, ut_state} == 32'd1);
  assign _t290 = ((|_t265) ? 32'd0 : _t261);
  assign _t291 = ({29'b0, ut_state} == 32'd1);
  assign _t292 = ((|_t267) ? 1'd0 : _t266);
  assign _t293 = ({29'b0, ut_state} == 32'd2);
  assign _t294 = ((|_t269) ? 1'd0 : _t268);
  assign _t295 = ({29'b0, ut_state} == 32'd2);
  assign _t296 = ((|_t271) ? 1'd0 : _t270);
  assign _t297 = ({29'b0, ut_state} == 32'd2);
  assign _t298 = ((|_t273) ? 1'd0 : _t272);
  assign _t299 = ({29'b0, ut_state} == 32'd2);
  assign _t300 = ((|_t275) ? 1'd0 : _t274);
  assign _t301 = ({29'b0, ut_state} == 32'd2);
  assign _t302 = ((|_t277) ? hb : _t276);
  assign _t303 = ({29'b0, ut_state} == 32'd2);
  assign _t304 = ((|_t279) ? 1'd0 : _t278);
  assign _t305 = ({29'b0, ut_state} == 32'd2);
  assign _t306 = ((|_t281) ? 1'd0 : _t280);
  assign _t307 = ({29'b0, ut_state} == 32'd2);
  assign _t308 = {16'b0, ulen};
  assign _t309 = {16'b0, ulen};
  assign _t310 = (acc + _t309);
  assign _t311 = ((|_t287) ? _t286 : _t285);
  assign _t312 = (_t310 + _t308);
  assign _t313 = ({29'b0, ut_state} == 32'd2);
  assign _t314 = {16'b0, tlen};
  assign _t315 = ((|_t289) ? _t288 : iac);
  assign _t316 = (iac + _t314);
  assign _t317 = ({29'b0, ut_state} == 32'd2);
  assign _t318 = ((|_t291) ? 32'd2 : _t290);
  assign _t319 = ({29'b0, ut_state} == 32'd2);
  assign _t320 = ((|_t293) ? 1'd0 : _t292);
  assign _t321 = ({29'b0, ut_state} == 32'd3);
  assign _t322 = ((|_t295) ? 1'd0 : _t294);
  assign _t323 = ({29'b0, ut_state} == 32'd3);
  assign _t324 = ((|_t297) ? 1'd0 : _t296);
  assign _t325 = ({29'b0, ut_state} == 32'd3);
  assign _t326 = ((|_t299) ? 1'd0 : _t298);
  assign _t327 = ({29'b0, ut_state} == 32'd3);
  assign _t328 = ((|_t301) ? 1'd0 : _t300);
  assign _t329 = ({29'b0, ut_state} == 32'd3);
  assign _t330 = ((|_t303) ? hb : _t302);
  assign _t331 = ({29'b0, ut_state} == 32'd3);
  assign _t332 = ((|_t305) ? 1'd0 : _t304);
  assign _t333 = ({29'b0, ut_state} == 32'd3);
  assign _t334 = ((|_t307) ? 1'd0 : _t306);
  assign _t335 = ({29'b0, ut_state} == 32'd3);
  assign _t336 = acc[31:16];
  assign _t337 = {16'b0, _t336};
  assign _t338 = acc[15:0];
  assign _t339 = {16'b0, _t338};
  assign _t340 = ((|_t313) ? _t312 : _t311);
  assign _t341 = (_t339 + _t337);
  assign _t342 = iac[31:16];
  assign _t343 = (_t342 != 16'd0);
  assign _t344 = acc[31:16];
  assign _t345 = (_t344 != 16'd0);
  assign _t346 = ((|_t345) || (|_t343));
  assign _t347 = ({29'b0, ut_state} == 32'd3);
  assign _t348 = ((|_t347) && (|_t346));
  assign _t349 = iac[31:16];
  assign _t350 = {16'b0, _t349};
  assign _t351 = iac[15:0];
  assign _t352 = {16'b0, _t351};
  assign _t353 = ((|_t317) ? _t316 : _t315);
  assign _t354 = (_t352 + _t350);
  assign _t355 = ({29'b0, ut_state} == 32'd3);
  assign _t356 = ((|_t355) && (|_t346));
  assign _t357 = ((|_t319) ? 32'd3 : _t318);
  assign _t358 = ({29'b0, ut_state} == 32'd3);
  assign _t359 = ((|_t358) && (|_t346));
  assign _t360 = acc[15:0];
  assign _t361 = (_t360 == 16'd65535);
  assign _t362 = (~_t346);
  assign _t363 = ((|_t362) && (|_t361));
  assign _t364 = ({29'b0, ut_state} == 32'd3);
  assign _t365 = ((|_t364) && (|_t363));
  assign _t366 = acc[15:0];
  assign _t367 = ((|_t365) ? 16'd65535 : ck);
  assign _t368 = (_t366 ^ 16'd65535);
  assign _t369 = (~_t361);
  assign _t370 = ((|_t362) && (|_t369));
  assign _t371 = ({29'b0, ut_state} == 32'd3);
  assign _t372 = ((|_t371) && (|_t370));
  assign _t373 = iac[15:0];
  assign _t374 = (_t373 ^ 16'd65535);
  assign _t375 = ({29'b0, ut_state} == 32'd3);
  assign _t376 = ((|_t375) && (|_t362));
  assign _t377 = ((|_t256) ? 6'd0 : hi);
  assign _t378 = ({29'b0, ut_state} == 32'd3);
  assign _t379 = ((|_t378) && (|_t362));
  assign _t380 = ((|_t359) ? 32'd3 : _t357);
  assign _t381 = ({29'b0, ut_state} == 32'd3);
  assign _t382 = ((|_t381) && (|_t362));
  assign _t383 = ((|_t321) ? 1'd0 : _t320);
  assign _t384 = ({29'b0, ut_state} == 32'd4);
  assign _t385 = ((|_t323) ? 1'd0 : _t322);
  assign _t386 = ({29'b0, ut_state} == 32'd4);
  assign _t387 = ((|_t325) ? 1'd0 : _t324);
  assign _t388 = ({29'b0, ut_state} == 32'd4);
  assign _t389 = ((|_t327) ? 1'd0 : _t326);
  assign _t390 = ({29'b0, ut_state} == 32'd4);
  assign _t391 = ((|_t329) ? 1'd0 : _t328);
  assign _t392 = ({29'b0, ut_state} == 32'd4);
  assign _t393 = ((|_t331) ? hb : _t330);
  assign _t394 = ({29'b0, ut_state} == 32'd4);
  assign _t395 = ((|_t333) ? 1'd0 : _t332);
  assign _t396 = ({29'b0, ut_state} == 32'd4);
  assign _t397 = ((|_t335) ? 1'd0 : _t334);
  assign _t398 = ({29'b0, ut_state} == 32'd4);
  assign _t399 = ((|_t379) ? 6'd0 : _t377);
  assign _t400 = (hi + 6'd1);
  assign _t401 = ({29'b0, ut_state} == 32'd4);
  assign _t402 = ((|_t401) && (|o_ready));
  assign _t403 = ((|_t382) ? 32'd4 : _t380);
  assign _t404 = (hi == 6'd41);
  assign _t405 = ((|o_ready) && (|_t404));
  assign _t406 = ({29'b0, ut_state} == 32'd4);
  assign _t407 = ((|_t406) && (|_t405));
  assign _t408 = ((|_t407) ? 32'd5 : _t403);
  assign _t409 = (~_t405);
  assign _t410 = ({29'b0, ut_state} == 32'd4);
  assign _t411 = ((|_t410) && (|_t409));
  assign _t412 = ((|_t384) ? 1'd0 : _t383);
  assign _t413 = ({29'b0, ut_state} == 32'd5);
  assign _t414 = ((|_t386) ? 1'd0 : _t385);
  assign _t415 = ({29'b0, ut_state} == 32'd5);
  assign _t416 = ((|_t388) ? 1'd0 : _t387);
  assign _t417 = ({29'b0, ut_state} == 32'd5);
  assign _t418 = ((|_t390) ? 1'd1 : _t389);
  assign _t419 = ({29'b0, ut_state} == 32'd5);
  assign _t420 = ((|_t392) ? 1'd0 : _t391);
  assign _t421 = ({29'b0, ut_state} == 32'd5);
  assign _t422 = ((|_t394) ? hb : _t393);
  assign _t423 = ({29'b0, ut_state} == 32'd5);
  assign _t424 = ((|_t396) ? 1'd0 : _t395);
  assign _t425 = ({29'b0, ut_state} == 32'd5);
  assign _t426 = ((|_t398) ? 1'd0 : _t397);
  assign _t427 = ({29'b0, ut_state} == 32'd5);
  assign _t428 = ((|_t212) ? _t210 : len);
  assign _t429 = ((|fo_valid) && (|o_ready));
  assign _t430 = ((|_t429) && (|fo_last));
  assign _t431 = ({29'b0, ut_state} == 32'd5);
  assign _t432 = ((|_t431) && (|_t430));
  assign _t433 = ((|_t348) ? _t341 : _t340);
  assign _t434 = ({29'b0, ut_state} == 32'd5);
  assign _t435 = ((|_t434) && (|_t430));
  assign _t436 = (n + 16'd1);
  assign _t437 = ({29'b0, ut_state} == 32'd5);
  assign _t438 = ((|_t437) && (|_t430));
  assign _t439 = ((|_t411) ? 32'd4 : _t408);
  assign _t440 = ({29'b0, ut_state} == 32'd5);
  assign _t441 = ((|_t440) && (|_t430));
  assign _t442 = ((|_t441) ? 32'd0 : _t439);
  assign _t443 = (~_t430);
  assign _t444 = ({29'b0, ut_state} == 32'd5);
  assign _t445 = ((|_t444) && (|_t443));
  assign _t446 = ((|_t413) ? 1'd0 : _t412);
  assign _t447 = ({29'b0, ut_state} == 32'd6);
  assign _t448 = ((|_t415) ? 1'd0 : _t414);
  assign _t449 = ({29'b0, ut_state} == 32'd6);
  assign _t450 = ((|_t417) ? 1'd0 : _t416);
  assign _t451 = ({29'b0, ut_state} == 32'd6);
  assign _t452 = ((|_t419) ? fo_valid : _t418);
  assign _t453 = ({29'b0, ut_state} == 32'd6);
  assign _t454 = ((|_t421) ? fo_last : _t420);
  assign _t455 = (hi == 6'd41);
  assign _t456 = ({29'b0, ut_state} == 32'd6);
  assign _t457 = ((|_t423) ? fo_data : _t422);
  assign _t458 = ({29'b0, ut_state} == 32'd6);
  assign _t459 = ((|_t425) ? o_ready : _t424);
  assign _t460 = ({29'b0, ut_state} == 32'd6);
  assign _t461 = (hi == 6'd41);
  assign _t462 = ((|_t427) ? 1'd0 : _t426);
  assign _t463 = ((|o_ready) && (|_t461));
  assign _t464 = ({29'b0, ut_state} == 32'd6);
  assign _t465 = ((|_t402) ? _t400 : _t399);
  assign _t466 = (hi + 6'd1);
  assign _t467 = ({29'b0, ut_state} == 32'd6);
  assign _t468 = ((|_t467) && (|o_ready));
  assign _t469 = (na + 16'd1);
  assign _t470 = (hi == 6'd41);
  assign _t471 = ((|o_ready) && (|_t470));
  assign _t472 = ({29'b0, ut_state} == 32'd6);
  assign _t473 = ((|_t472) && (|_t471));
  assign _t474 = ((|_t445) ? 32'd5 : _t442);
  assign _t475 = ({29'b0, ut_state} == 32'd6);
  assign _t476 = ((|_t475) && (|_t471));
  assign _t477 = ((|_t476) ? 32'd0 : _t474);
  assign _t478 = (~_t471);
  assign _t479 = ({29'b0, ut_state} == 32'd6);
  assign _t480 = ((|_t479) && (|_t478));
  assign fo_data = q_dst_data;
  assign fo_last = q_dst_last;
  assign fo_valid = q_dst_valid;
  assign ffull = q_full;
  assign full = q_tight;
  assign ulen = (len + 16'd8);
  assign tlen = (len + 16'd28);
  assign dipw = (_t11 + _t1);
  assign hb = ((|_t104) ? _t103 : _t102);
  assign ab = ((|_t191) ? 8'd2 : _t190);
  assign t_ready = ((|_t447) ? 1'd0 : _t446);
  assign w = ((|_t449) ? 1'd0 : _t448);
  assign cm = ((|_t451) ? 1'd0 : _t450);
  assign o_valid = ((|_t453) ? 1'd1 : _t452);
  assign o_last = ((|_t456) ? _t455 : _t454);
  assign o_data = ((|_t458) ? ab : _t457);
  assign fo_ready = ((|_t460) ? 1'd0 : _t459);
  assign ask_ack = ((|_t464) ? _t463 : _t462);
  assign _t481 = ((|_t432) ? 16'd0 : _t428);
  assign _t482 = ((|_t435) ? 32'd0 : _t433);
  assign _t483 = ((|_t240) ? 48'd281474976710655 : _t236);
  assign _t484 = ((|_t244) ? 32'd4294967295 : _t241);
  assign _t485 = ((|_t248) ? 16'd36493 : _t245);
  assign _t486 = ((|_t480) ? 32'd6 : _t477);
  assign _t487 = ((|_t468) ? _t466 : _t465);
  assign _t488 = ((|_t356) ? _t354 : _t353);
  assign _t489 = ((|_t372) ? _t368 : _t367);
  assign _t490 = ((|_t376) ? _t374 : ick);
  assign _t491 = ((|_t438) ? _t436 : n);
  assign _t492 = ((|_t473) ? _t469 : na);
  always @(posedge clk) begin
    if (rst) begin
      len <= 16'd0;
      acc <= 32'd0;
      iac <= 32'd0;
      ck <= 16'd0;
      ick <= 16'd0;
      hi <= 6'd0;
      n <= 16'd0;
      na <= 16'd0;
      dmac <= 48'd0;
      dip <= 32'd0;
      dprt <= 16'd0;
      ut_state <= 3'd0;
    end else begin
      len <= _t481;
      acc <= _t482;
      iac <= _t488;
      ck <= _t489;
      ick <= _t490;
      hi <= _t487;
      n <= _t491;
      na <= _t492;
      dmac <= _t483;
      dip <= _t484;
      dprt <= _t485;
      ut_state <= _t486;
    end
  end
  pktfifo_8_2048 q (
    .clk(clk),
    .rst(rst),
    .wr(w),
    .wdata(t_data),
    .wlast(t_last),
    .commit(cm),
    .rewind(1'd0),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(fo_ready),
    .full(q_full),
    .tight(q_tight)
  );
endmodule
`default_nettype wire

`default_nettype none
module udp4_port_36492_2200301993985_3232255234_2048_1_0_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] erx_data,
  input  wire erx_last,
  input  wire erx_valid,
  output wire erx_ready,
  output wire [7:0] etx_data,
  output wire etx_last,
  output wire etx_valid,
  input  wire etx_ready,
  output wire [7:0] rx_data,
  output wire rx_last,
  output wire rx_valid,
  input  wire rx_ready,
  input  wire [7:0] tx_data,
  input  wire tx_last,
  input  wire tx_valid,
  output wire tx_ready,
  output wire [15:0] nr,
  output wire [15:0] nt,
  output wire [15:0] na,
  output wire pr_valid
);
  wire [47:0] pr_mac;
  wire [31:0] pr_ip;
  wire [15:0] pr_port;
  wire ak_valid;
  wire [47:0] ak_mac;
  wire [31:0] ak_ip;
  wire ak_ack;
  wire [7:0] ri_data;
  wire ri_last;
  wire ri_valid;
  wire ri_ready;
  wire [7:0] ri0_data;
  wire ri0_last;
  wire ri0_valid;
  wire ri0_ready;
  wire [8:0] fi_data;
  wire fi_valid;
  wire fi_ready;
  wire [8:0] fo_data;
  wire fo_valid;
  wire fo_ready;
  wire [2:0] fc;
  wire pt_valid;
  wire [47:0] pt_mac;
  wire [31:0] pt_ip;
  wire [15:0] pt_port;
  wire [7:0] tx2_data;
  wire tx2_last;
  wire tx2_valid;
  wire tx2_ready;
  wire _t0;
  wire [8:0] _t1;
  wire [7:0] _t2;
  wire ur_i_ready;
  wire [7:0] ur_o_data;
  wire ur_o_last;
  wire ur_o_valid;
  wire ur_peer_valid;
  wire [47:0] ur_peer_mac;
  wire [31:0] ur_peer_ip;
  wire [15:0] ur_peer_port;
  wire ur_ask_valid;
  wire [47:0] ur_ask_mac;
  wire [31:0] ur_ask_ip;
  wire [15:0] ur_n;
  wire phd_i_ready;
  wire [7:0] phd_o_data;
  wire phd_o_last;
  wire phd_o_valid;
  wire sl_src_ready;
  wire [8:0] sl_dst_data;
  wire sl_dst_valid;
  wire [2:0] sl_cnt;
  wire ptl_i_ready;
  wire [7:0] ptl_o_data;
  wire ptl_o_last;
  wire ptl_o_valid;
  wire ptl_pt_valid;
  wire [47:0] ptl_pt_mac;
  wire [31:0] ptl_pt_ip;
  wire [15:0] ptl_pt_port;
  wire ux_t_ready;
  wire [7:0] ux_o_data;
  wire ux_o_last;
  wire ux_o_valid;
  wire ux_ask_ack;
  wire [15:0] ux_n;
  wire [15:0] ux_na;
  assign _t0 = 1'd0;
  assign _t1 = {_t0, ri_data};
  assign _t2 = _t1[7:0];
  assign erx_ready = ur_i_ready;
  assign ri0_data = ur_o_data;
  assign ri0_last = ur_o_last;
  assign ri0_valid = ur_o_valid;
  assign pr_valid = ur_peer_valid;
  assign pr_mac = ur_peer_mac;
  assign pr_ip = ur_peer_ip;
  assign pr_port = ur_peer_port;
  assign ak_valid = ur_ask_valid;
  assign ak_mac = ur_ask_mac;
  assign ak_ip = ur_ask_ip;
  assign nr = ur_n;
  assign ri0_ready = phd_i_ready;
  assign ri_data = phd_o_data;
  assign ri_last = phd_o_last;
  assign ri_valid = phd_o_valid;
  assign fi_ready = sl_src_ready;
  assign fo_data = sl_dst_data;
  assign fo_valid = sl_dst_valid;
  assign fc = sl_cnt;
  assign fi_valid = ri_valid;
  assign fi_data = {ri_last, _t2};
  assign ri_ready = fi_ready;
  assign rx_valid = fo_valid;
  assign rx_data = fo_data[7:0];
  assign rx_last = fo_data[8];
  assign fo_ready = rx_ready;
  assign tx_ready = ptl_i_ready;
  assign tx2_data = ptl_o_data;
  assign tx2_last = ptl_o_last;
  assign tx2_valid = ptl_o_valid;
  assign pt_valid = ptl_pt_valid;
  assign pt_mac = ptl_pt_mac;
  assign pt_ip = ptl_pt_ip;
  assign pt_port = ptl_pt_port;
  assign tx2_ready = ux_t_ready;
  assign etx_data = ux_o_data;
  assign etx_last = ux_o_last;
  assign etx_valid = ux_o_valid;
  assign ak_ack = ux_ask_ack;
  assign nt = ux_n;
  assign na = ux_na;
  ip4_rx_36492_2200301993985_3232255234_1 ur (
    .clk(clk),
    .rst(rst),
    .i_data(erx_data),
    .i_last(erx_last),
    .i_valid(erx_valid),
    .i_ready(ur_i_ready),
    .o_data(ur_o_data),
    .o_last(ur_o_last),
    .o_valid(ur_o_valid),
    .o_ready(ri0_ready),
    .peer_valid(ur_peer_valid),
    .peer_mac(ur_peer_mac),
    .peer_ip(ur_peer_ip),
    .peer_port(ur_peer_port),
    .ask_valid(ur_ask_valid),
    .ask_mac(ur_ask_mac),
    .ask_ip(ur_ask_ip),
    .ask_ack(ak_ack),
    .n(ur_n)
  );
  peer_head phd (
    .clk(clk),
    .rst(rst),
    .i_data(ri0_data),
    .i_last(ri0_last),
    .i_valid(ri0_valid),
    .i_ready(phd_i_ready),
    .o_data(phd_o_data),
    .o_last(phd_o_last),
    .o_valid(phd_o_valid),
    .o_ready(ri_ready),
    .pr_valid(pr_valid),
    .pr_mac(pr_mac),
    .pr_ip(pr_ip),
    .pr_port(pr_port)
  );
  fifo_9_4 sl (
    .clk(clk),
    .rst(rst),
    .src_data(fi_data),
    .src_valid(fi_valid),
    .src_ready(sl_src_ready),
    .dst_data(sl_dst_data),
    .dst_valid(sl_dst_valid),
    .dst_ready(fo_ready),
    .cnt(sl_cnt)
  );
  peer_tail ptl (
    .clk(clk),
    .rst(rst),
    .i_data(tx_data),
    .i_last(tx_last),
    .i_valid(tx_valid),
    .i_ready(ptl_i_ready),
    .o_data(ptl_o_data),
    .o_last(ptl_o_last),
    .o_valid(ptl_o_valid),
    .o_ready(tx2_ready),
    .pt_valid(ptl_pt_valid),
    .pt_mac(ptl_pt_mac),
    .pt_ip(ptl_pt_ip),
    .pt_port(ptl_pt_port)
  );
  ip4_tx_36492_2200301993985_3232255234_2048_0 ux (
    .clk(clk),
    .rst(rst),
    .t_data(tx2_data),
    .t_last(tx2_last),
    .t_valid(tx2_valid),
    .t_ready(ux_t_ready),
    .o_data(ux_o_data),
    .o_last(ux_o_last),
    .o_valid(ux_o_valid),
    .o_ready(etx_ready),
    .peer_valid(pt_valid),
    .peer_mac(pt_mac),
    .peer_ip(pt_ip),
    .peer_port(pt_port),
    .ask_valid(ak_valid),
    .ask_mac(ak_mac),
    .ask_ip(ak_ip),
    .ask_ack(ux_ask_ack),
    .n(ux_n),
    .na(ux_na)
  );
endmodule
`default_nettype wire

`default_nettype none
module ip4_rx_36500_2200301993985_3232255234_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  output wire peer_valid,
  output wire [47:0] peer_mac,
  output wire [31:0] peer_ip,
  output wire [15:0] peer_port,
  output wire ask_valid,
  output wire [47:0] ask_mac,
  output wire [31:0] ask_ip,
  input  wire ask_ack,
  output reg  [15:0] n
);
  reg  [5:0] idx;
  reg  oku;
  reg  oka;
  reg  bc;
  reg  [15:0] left;
  reg  pv;
  reg  [47:0] pmac;
  reg  [31:0] pip;
  reg  [15:0] pprt;
  reg  [47:0] tmac;
  reg  [31:0] tip;
  reg  [15:0] tprt;
  reg  [31:0] aip;
  reg  av;
  wire [47:0] amac;
  wire [31:0] arip;
  wire pay;
  wire [7:0] d;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire [39:0] _t8;
  wire [47:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [47:0] _t13;
  wire [7:0] _t14;
  wire [31:0] _t15;
  wire [47:0] _t16;
  wire _t17;
  wire _t18;
  wire [47:0] _t19;
  wire [15:0] _t20;
  wire [23:0] _t21;
  wire [47:0] _t22;
  wire _t23;
  wire _t24;
  wire [47:0] _t25;
  wire [23:0] _t26;
  wire [15:0] _t27;
  wire [47:0] _t28;
  wire _t29;
  wire _t30;
  wire [47:0] _t31;
  wire [31:0] _t32;
  wire [7:0] _t33;
  wire [47:0] _t34;
  wire _t35;
  wire _t36;
  wire [47:0] _t37;
  wire [39:0] _t38;
  wire [47:0] _t39;
  wire _t40;
  wire _t41;
  wire [23:0] _t42;
  wire [31:0] _t43;
  wire _t44;
  wire _t45;
  wire [23:0] _t46;
  wire [31:0] _t47;
  wire _t48;
  wire _t49;
  wire [31:0] _t50;
  wire [7:0] _t51;
  wire [15:0] _t52;
  wire [31:0] _t53;
  wire _t54;
  wire _t55;
  wire [31:0] _t56;
  wire [7:0] _t57;
  wire [15:0] _t58;
  wire [31:0] _t59;
  wire _t60;
  wire _t61;
  wire [31:0] _t62;
  wire [15:0] _t63;
  wire [7:0] _t64;
  wire [31:0] _t65;
  wire _t66;
  wire _t67;
  wire [31:0] _t68;
  wire [15:0] _t69;
  wire [7:0] _t70;
  wire [31:0] _t71;
  wire _t72;
  wire _t73;
  wire [31:0] _t74;
  wire [23:0] _t75;
  wire [31:0] _t76;
  wire _t77;
  wire _t78;
  wire [31:0] _t79;
  wire [23:0] _t80;
  wire [31:0] _t81;
  wire _t82;
  wire _t83;
  wire [7:0] _t84;
  wire [15:0] _t85;
  wire _t86;
  wire _t87;
  wire [15:0] _t88;
  wire [7:0] _t89;
  wire [15:0] _t90;
  wire _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [15:0] _t94;
  wire _t95;
  wire _t96;
  wire [15:0] _t97;
  wire [7:0] _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire [15:0] _t101;
  wire [15:0] _t102;
  wire [15:0] _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire _t109;
  wire [15:0] _t110;
  wire [15:0] _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire [5:0] _t121;
  wire [5:0] _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire _t158;
  wire _t159;
  wire _t160;
  wire _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire _t187;
  wire _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [15:0] _t261;
  wire _t262;
  wire [47:0] _t263;
  wire [31:0] _t264;
  wire [31:0] _t265;
  wire [15:0] _t266;
  wire [15:0] _t267;
  wire _t268;
  wire [5:0] _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire [47:0] _t273;
  wire [31:0] _t274;
  wire [15:0] _t275;
  wire [15:0] _t276;
  wire _t277;
  assign _t0 = (left != 16'd0);
  assign _t1 = ((|i_valid) && (|pay));
  assign _t2 = ((|_t1) && (|oku));
  assign _t3 = (left != 16'd0);
  assign _t4 = ((|pay) && (|oku));
  assign _t5 = ((|_t4) && (|_t3));
  assign _t6 = ((|_t5) ? o_ready : 1'd0);
  assign _t7 = (~_t5);
  assign _t8 = tmac[47:8];
  assign _t9 = {_t8, d};
  assign _t10 = (idx == 6'd6);
  assign _t11 = ((|i_valid) && (|i_ready));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? _t9 : tmac);
  assign _t14 = _t13[7:0];
  assign _t15 = _t13[47:16];
  assign _t16 = {_t15, d, _t14};
  assign _t17 = (idx == 6'd7);
  assign _t18 = ((|_t11) && (|_t17));
  assign _t19 = ((|_t18) ? _t16 : _t13);
  assign _t20 = _t19[15:0];
  assign _t21 = _t19[47:24];
  assign _t22 = {_t21, d, _t20};
  assign _t23 = (idx == 6'd8);
  assign _t24 = ((|_t11) && (|_t23));
  assign _t25 = ((|_t24) ? _t22 : _t19);
  assign _t26 = _t25[23:0];
  assign _t27 = _t25[47:32];
  assign _t28 = {_t27, d, _t26};
  assign _t29 = (idx == 6'd9);
  assign _t30 = ((|_t11) && (|_t29));
  assign _t31 = ((|_t30) ? _t28 : _t25);
  assign _t32 = _t31[31:0];
  assign _t33 = _t31[47:40];
  assign _t34 = {_t33, d, _t32};
  assign _t35 = (idx == 6'd10);
  assign _t36 = ((|_t11) && (|_t35));
  assign _t37 = ((|_t36) ? _t34 : _t31);
  assign _t38 = _t37[39:0];
  assign _t39 = {d, _t38};
  assign _t40 = (idx == 6'd11);
  assign _t41 = ((|_t11) && (|_t40));
  assign _t42 = tip[31:8];
  assign _t43 = {_t42, d};
  assign _t44 = (idx == 6'd26);
  assign _t45 = ((|_t11) && (|_t44));
  assign _t46 = aip[31:8];
  assign _t47 = {_t46, d};
  assign _t48 = (idx == 6'd28);
  assign _t49 = ((|_t11) && (|_t48));
  assign _t50 = ((|_t45) ? _t43 : tip);
  assign _t51 = _t50[7:0];
  assign _t52 = _t50[31:16];
  assign _t53 = {_t52, d, _t51};
  assign _t54 = (idx == 6'd27);
  assign _t55 = ((|_t11) && (|_t54));
  assign _t56 = ((|_t49) ? _t47 : aip);
  assign _t57 = _t56[7:0];
  assign _t58 = _t56[31:16];
  assign _t59 = {_t58, d, _t57};
  assign _t60 = (idx == 6'd29);
  assign _t61 = ((|_t11) && (|_t60));
  assign _t62 = ((|_t55) ? _t53 : _t50);
  assign _t63 = _t62[15:0];
  assign _t64 = _t62[31:24];
  assign _t65 = {_t64, d, _t63};
  assign _t66 = (idx == 6'd28);
  assign _t67 = ((|_t11) && (|_t66));
  assign _t68 = ((|_t61) ? _t59 : _t56);
  assign _t69 = _t68[15:0];
  assign _t70 = _t68[31:24];
  assign _t71 = {_t70, d, _t69};
  assign _t72 = (idx == 6'd30);
  assign _t73 = ((|_t11) && (|_t72));
  assign _t74 = ((|_t67) ? _t65 : _t62);
  assign _t75 = _t74[23:0];
  assign _t76 = {d, _t75};
  assign _t77 = (idx == 6'd29);
  assign _t78 = ((|_t11) && (|_t77));
  assign _t79 = ((|_t73) ? _t71 : _t68);
  assign _t80 = _t79[23:0];
  assign _t81 = {d, _t80};
  assign _t82 = (idx == 6'd31);
  assign _t83 = ((|_t11) && (|_t82));
  assign _t84 = tprt[7:0];
  assign _t85 = {d, _t84};
  assign _t86 = (idx == 6'd34);
  assign _t87 = ((|_t11) && (|_t86));
  assign _t88 = ((|_t87) ? _t85 : tprt);
  assign _t89 = _t88[15:8];
  assign _t90 = {_t89, d};
  assign _t91 = (idx == 6'd35);
  assign _t92 = ((|_t11) && (|_t91));
  assign _t93 = left[7:0];
  assign _t94 = {d, _t93};
  assign _t95 = (idx == 6'd38);
  assign _t96 = ((|_t11) && (|_t95));
  assign _t97 = {8'b0, d};
  assign _t98 = left[15:8];
  assign _t99 = {8'b0, _t98};
  assign _t100 = (_t99 << 32'd8);
  assign _t101 = (_t100 + _t97);
  assign _t102 = ((|_t96) ? _t94 : left);
  assign _t103 = (_t101 - 16'd8);
  assign _t104 = (idx == 6'd39);
  assign _t105 = ((|_t11) && (|_t104));
  assign _t106 = (d != 8'd255);
  assign _t107 = (idx < 6'd6);
  assign _t108 = ((|_t107) && (|_t106));
  assign _t109 = ((|_t11) && (|_t108));
  assign _t110 = ((|_t105) ? _t103 : _t102);
  assign _t111 = (left - 16'd1);
  assign _t112 = (left != 16'd0);
  assign _t113 = ((|pay) && (|oku));
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t11) && (|_t114));
  assign _t116 = ((|_t11) && (|i_last));
  assign _t117 = ((|_t11) && (|i_last));
  assign _t118 = ((|_t11) && (|i_last));
  assign _t119 = ((|_t109) ? 1'd0 : bc);
  assign _t120 = ((|_t11) && (|i_last));
  assign _t121 = ((|_t116) ? 6'd0 : idx);
  assign _t122 = (idx + 6'd1);
  assign _t123 = (~pay);
  assign _t124 = (~i_last);
  assign _t125 = ((|_t11) && (|_t124));
  assign _t126 = ((|_t125) && (|_t123));
  assign _t127 = ((|_t117) ? 1'd1 : oku);
  assign _t128 = (d != 8'd2);
  assign _t129 = (idx == 6'd33);
  assign _t130 = ((|_t129) && (|_t128));
  assign _t131 = (d != 8'd77);
  assign _t132 = (idx == 6'd32);
  assign _t133 = ((|_t132) && (|_t131));
  assign _t134 = (d != 8'd168);
  assign _t135 = (idx == 6'd31);
  assign _t136 = ((|_t135) && (|_t134));
  assign _t137 = (d != 8'd192);
  assign _t138 = (idx == 6'd30);
  assign _t139 = ((|_t138) && (|_t137));
  assign _t140 = (d != 8'd148);
  assign _t141 = (idx == 6'd37);
  assign _t142 = ((|_t141) && (|_t140));
  assign _t143 = (d != 8'd142);
  assign _t144 = (idx == 6'd36);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = (d != 8'd17);
  assign _t147 = (idx == 6'd23);
  assign _t148 = ((|_t147) && (|_t146));
  assign _t149 = (d != 8'd69);
  assign _t150 = (idx == 6'd14);
  assign _t151 = ((|_t150) && (|_t149));
  assign _t152 = (d != 8'd0);
  assign _t153 = (idx == 6'd13);
  assign _t154 = ((|_t153) && (|_t152));
  assign _t155 = (d != 8'd8);
  assign _t156 = (idx == 6'd12);
  assign _t157 = ((|_t156) && (|_t155));
  assign _t158 = (d == 8'd255);
  assign _t159 = ((|bc) && (|_t158));
  assign _t160 = (~_t159);
  assign _t161 = (d != 8'd1);
  assign _t162 = (idx == 6'd5);
  assign _t163 = ((|_t162) && (|_t161));
  assign _t164 = ((|_t163) && (|_t160));
  assign _t165 = (d == 8'd255);
  assign _t166 = ((|bc) && (|_t165));
  assign _t167 = (~_t166);
  assign _t168 = (d != 8'd0);
  assign _t169 = (idx == 6'd4);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t170) && (|_t167));
  assign _t172 = (d == 8'd255);
  assign _t173 = ((|bc) && (|_t172));
  assign _t174 = (~_t173);
  assign _t175 = (d != 8'd56);
  assign _t176 = (idx == 6'd3);
  assign _t177 = ((|_t176) && (|_t175));
  assign _t178 = ((|_t177) && (|_t174));
  assign _t179 = (d == 8'd255);
  assign _t180 = ((|bc) && (|_t179));
  assign _t181 = (~_t180);
  assign _t182 = (d != 8'd76);
  assign _t183 = (idx == 6'd2);
  assign _t184 = ((|_t183) && (|_t182));
  assign _t185 = ((|_t184) && (|_t181));
  assign _t186 = (d == 8'd255);
  assign _t187 = ((|bc) && (|_t186));
  assign _t188 = (~_t187);
  assign _t189 = (d != 8'd0);
  assign _t190 = (idx == 6'd1);
  assign _t191 = ((|_t190) && (|_t189));
  assign _t192 = ((|_t191) && (|_t188));
  assign _t193 = (d == 8'd255);
  assign _t194 = ((|bc) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (d != 8'd2);
  assign _t197 = (idx == 6'd0);
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = ((|_t198) && (|_t195));
  assign _t200 = ((|1'd0) || (|_t199));
  assign _t201 = ((|_t200) || (|_t192));
  assign _t202 = ((|_t201) || (|_t185));
  assign _t203 = ((|_t202) || (|_t178));
  assign _t204 = ((|_t203) || (|_t171));
  assign _t205 = ((|_t204) || (|_t164));
  assign _t206 = ((|_t205) || (|_t157));
  assign _t207 = ((|_t206) || (|_t154));
  assign _t208 = ((|_t207) || (|_t151));
  assign _t209 = ((|_t208) || (|_t148));
  assign _t210 = ((|_t209) || (|_t145));
  assign _t211 = ((|_t210) || (|_t142));
  assign _t212 = ((|_t211) || (|_t139));
  assign _t213 = ((|_t212) || (|_t136));
  assign _t214 = ((|_t213) || (|_t133));
  assign _t215 = ((|_t214) || (|_t130));
  assign _t216 = ((|_t11) && (|_t124));
  assign _t217 = ((|_t216) && (|_t215));
  assign _t218 = ((|_t118) ? 1'd1 : oka);
  assign _t219 = (d != 8'd2);
  assign _t220 = (idx == 6'd41);
  assign _t221 = ((|_t220) && (|_t219));
  assign _t222 = (d != 8'd77);
  assign _t223 = (idx == 6'd40);
  assign _t224 = ((|_t223) && (|_t222));
  assign _t225 = (d != 8'd168);
  assign _t226 = (idx == 6'd39);
  assign _t227 = ((|_t226) && (|_t225));
  assign _t228 = (d != 8'd192);
  assign _t229 = (idx == 6'd38);
  assign _t230 = ((|_t229) && (|_t228));
  assign _t231 = (d != 8'd1);
  assign _t232 = (idx == 6'd21);
  assign _t233 = ((|_t232) && (|_t231));
  assign _t234 = (d != 8'd0);
  assign _t235 = (idx == 6'd20);
  assign _t236 = ((|_t235) && (|_t234));
  assign _t237 = (d != 8'd6);
  assign _t238 = (idx == 6'd13);
  assign _t239 = ((|_t238) && (|_t237));
  assign _t240 = (d != 8'd8);
  assign _t241 = (idx == 6'd12);
  assign _t242 = ((|_t241) && (|_t240));
  assign _t243 = ((|_t205) || (|_t242));
  assign _t244 = ((|_t243) || (|_t239));
  assign _t245 = ((|_t244) || (|_t236));
  assign _t246 = ((|_t245) || (|_t233));
  assign _t247 = ((|_t246) || (|_t230));
  assign _t248 = ((|_t247) || (|_t227));
  assign _t249 = ((|_t248) || (|_t224));
  assign _t250 = ((|_t249) || (|_t221));
  assign _t251 = ((|_t11) && (|_t124));
  assign _t252 = ((|_t251) && (|_t250));
  assign _t253 = (idx == 6'd41);
  assign _t254 = (~_t215);
  assign _t255 = ((|oku) && (|_t254));
  assign _t256 = ((|_t255) && (|_t253));
  assign _t257 = ((|_t11) && (|_t256));
  assign _t258 = ((|_t11) && (|_t256));
  assign _t259 = ((|_t11) && (|_t256));
  assign _t260 = ((|_t11) && (|_t256));
  assign _t261 = (n + 16'd1);
  assign _t262 = ((|_t11) && (|_t256));
  assign d = i_data;
  assign pay = (idx == 6'd42);
  assign o_valid = ((|_t2) && (|_t0));
  assign o_data = d;
  assign o_last = (left == 16'd1);
  assign i_ready = ((|_t7) ? 1'd1 : _t6);
  assign _t263 = ((|_t41) ? _t39 : _t37);
  assign _t264 = ((|_t78) ? _t76 : _t74);
  assign _t265 = ((|_t83) ? _t81 : _t79);
  assign _t266 = ((|_t92) ? _t90 : _t88);
  assign _t267 = ((|_t115) ? _t111 : _t110);
  assign _t268 = ((|_t120) ? 1'd1 : _t119);
  assign _t269 = ((|_t126) ? _t122 : _t121);
  assign _t270 = ((|_t217) ? 1'd0 : _t127);
  assign _t271 = ((|_t252) ? 1'd0 : _t218);
  assign _t272 = ((|_t257) ? 1'd1 : pv);
  assign _t273 = ((|_t258) ? tmac : pmac);
  assign _t274 = ((|_t259) ? tip : pip);
  assign _t275 = ((|_t260) ? tprt : pprt);
  assign _t276 = ((|_t262) ? _t261 : n);
  assign _t277 = ((|ask_ack) ? 1'd0 : av);
  assign peer_valid = pv;
  assign peer_mac = pmac;
  assign peer_ip = pip;
  assign peer_port = pprt;
  assign ask_valid = av;
  assign ask_mac = amac;
  assign ask_ip = arip;
  assign amac = 48'd0;
  assign arip = 32'd0;
  always @(posedge clk) begin
    if (rst) begin
      idx <= 6'd0;
      oku <= 1'd1;
      oka <= 1'd1;
      bc <= 1'd1;
      left <= 16'd0;
      n <= 16'd0;
      pv <= 1'd0;
      pmac <= 48'd0;
      pip <= 32'd0;
      pprt <= 16'd0;
      tmac <= 48'd0;
      tip <= 32'd0;
      tprt <= 16'd0;
      aip <= 32'd0;
      av <= 1'd0;
    end else begin
      idx <= _t269;
      oku <= _t270;
      oka <= _t271;
      bc <= _t268;
      left <= _t267;
      n <= _t276;
      pv <= _t272;
      pmac <= _t273;
      pip <= _t274;
      pprt <= _t275;
      tmac <= _t263;
      tip <= _t264;
      tprt <= _t266;
      aip <= _t265;
      av <= _t277;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ip4_tx_36500_2200301993985_3232255234_2048_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  input  wire peer_valid,
  input  wire [47:0] peer_mac,
  input  wire [31:0] peer_ip,
  input  wire [15:0] peer_port,
  input  wire ask_valid,
  input  wire [47:0] ask_mac,
  input  wire [31:0] ask_ip,
  output wire ask_ack,
  output reg  [15:0] n,
  output reg  [15:0] na
);
  reg  [15:0] len;
  reg  [31:0] acc;
  reg  [31:0] iac;
  reg  [15:0] ck;
  reg  [15:0] ick;
  reg  [5:0] hi;
  reg  [47:0] dmac;
  reg  [31:0] dip;
  reg  [15:0] dprt;
  wire [15:0] ulen;
  wire [15:0] tlen;
  wire [31:0] dipw;
  wire [7:0] hb;
  wire [7:0] ab;
  wire w;
  wire cm;
  wire full;
  wire ffull;
  wire [7:0] fo_data;
  wire fo_last;
  wire fo_valid;
  wire fo_ready;
  reg  [2:0] ut2_state;
  wire [7:0] _t0;
  wire [31:0] _t1;
  wire [7:0] _t2;
  wire [31:0] _t3;
  wire [31:0] _t4;
  wire [7:0] _t5;
  wire [31:0] _t6;
  wire [7:0] _t7;
  wire [31:0] _t8;
  wire [31:0] _t9;
  wire [31:0] _t10;
  wire [31:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire _t15;
  wire [7:0] _t16;
  wire [7:0] _t17;
  wire _t18;
  wire [7:0] _t19;
  wire _t20;
  wire [7:0] _t21;
  wire [7:0] _t22;
  wire _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire _t30;
  wire [7:0] _t31;
  wire [7:0] _t32;
  wire _t33;
  wire [7:0] _t34;
  wire _t35;
  wire [7:0] _t36;
  wire [7:0] _t37;
  wire _t38;
  wire [7:0] _t39;
  wire _t40;
  wire [7:0] _t41;
  wire _t42;
  wire [7:0] _t43;
  wire _t44;
  wire [7:0] _t45;
  wire [7:0] _t46;
  wire _t47;
  wire [7:0] _t48;
  wire [7:0] _t49;
  wire _t50;
  wire [7:0] _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire [7:0] _t55;
  wire _t56;
  wire [7:0] _t57;
  wire [7:0] _t58;
  wire _t59;
  wire [7:0] _t60;
  wire [7:0] _t61;
  wire _t62;
  wire [7:0] _t63;
  wire _t64;
  wire [7:0] _t65;
  wire [7:0] _t66;
  wire _t67;
  wire [7:0] _t68;
  wire _t69;
  wire [7:0] _t70;
  wire [7:0] _t71;
  wire _t72;
  wire [7:0] _t73;
  wire _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire _t77;
  wire [7:0] _t78;
  wire _t79;
  wire [7:0] _t80;
  wire [7:0] _t81;
  wire _t82;
  wire [7:0] _t83;
  wire _t84;
  wire [7:0] _t85;
  wire _t86;
  wire [7:0] _t87;
  wire [7:0] _t88;
  wire _t89;
  wire [7:0] _t90;
  wire [7:0] _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [7:0] _t94;
  wire _t95;
  wire [7:0] _t96;
  wire [7:0] _t97;
  wire _t98;
  wire [7:0] _t99;
  wire [7:0] _t100;
  wire _t101;
  wire [7:0] _t102;
  wire [7:0] _t103;
  wire _t104;
  wire [7:0] _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire [7:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire [7:0] _t113;
  wire [7:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire [7:0] _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire [7:0] _t122;
  wire [7:0] _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire [7:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire [7:0] _t131;
  wire [7:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire [7:0] _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire [7:0] _t140;
  wire [7:0] _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire [7:0] _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire [7:0] _t149;
  wire [7:0] _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [7:0] _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire [7:0] _t158;
  wire _t159;
  wire [7:0] _t160;
  wire [7:0] _t161;
  wire _t162;
  wire [7:0] _t163;
  wire _t164;
  wire [7:0] _t165;
  wire [7:0] _t166;
  wire _t167;
  wire [7:0] _t168;
  wire _t169;
  wire [7:0] _t170;
  wire [7:0] _t171;
  wire _t172;
  wire [7:0] _t173;
  wire _t174;
  wire [7:0] _t175;
  wire [7:0] _t176;
  wire _t177;
  wire [7:0] _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [7:0] _t182;
  wire _t183;
  wire [7:0] _t184;
  wire _t185;
  wire [7:0] _t186;
  wire _t187;
  wire [7:0] _t188;
  wire _t189;
  wire [7:0] _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire [15:0] _t210;
  wire _t211;
  wire _t212;
  wire [31:0] _t213;
  wire [31:0] _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire [31:0] _t219;
  wire [31:0] _t220;
  wire [31:0] _t221;
  wire [31:0] _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire [47:0] _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire [31:0] _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire [15:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [2:0] _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [2:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire _t274;
  wire _t275;
  wire [7:0] _t276;
  wire _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire _t281;
  wire [31:0] _t282;
  wire [31:0] _t283;
  wire [31:0] _t284;
  wire [31:0] _t285;
  wire [31:0] _t286;
  wire _t287;
  wire [31:0] _t288;
  wire _t289;
  wire [2:0] _t290;
  wire _t291;
  wire _t292;
  wire _t293;
  wire _t294;
  wire _t295;
  wire _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire [7:0] _t302;
  wire _t303;
  wire _t304;
  wire _t305;
  wire _t306;
  wire _t307;
  wire [31:0] _t308;
  wire [31:0] _t309;
  wire [31:0] _t310;
  wire [31:0] _t311;
  wire [31:0] _t312;
  wire _t313;
  wire [31:0] _t314;
  wire [31:0] _t315;
  wire [31:0] _t316;
  wire _t317;
  wire [2:0] _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire _t323;
  wire _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [7:0] _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire _t334;
  wire _t335;
  wire [15:0] _t336;
  wire [31:0] _t337;
  wire [15:0] _t338;
  wire [31:0] _t339;
  wire [31:0] _t340;
  wire [31:0] _t341;
  wire [15:0] _t342;
  wire _t343;
  wire [15:0] _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire [15:0] _t349;
  wire [31:0] _t350;
  wire [15:0] _t351;
  wire [31:0] _t352;
  wire [31:0] _t353;
  wire [31:0] _t354;
  wire _t355;
  wire _t356;
  wire [2:0] _t357;
  wire _t358;
  wire _t359;
  wire [15:0] _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire [15:0] _t366;
  wire [15:0] _t367;
  wire [15:0] _t368;
  wire _t369;
  wire _t370;
  wire _t371;
  wire _t372;
  wire [15:0] _t373;
  wire [15:0] _t374;
  wire _t375;
  wire _t376;
  wire [5:0] _t377;
  wire _t378;
  wire _t379;
  wire [2:0] _t380;
  wire _t381;
  wire _t382;
  wire _t383;
  wire _t384;
  wire _t385;
  wire _t386;
  wire _t387;
  wire _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire _t392;
  wire [7:0] _t393;
  wire _t394;
  wire _t395;
  wire _t396;
  wire _t397;
  wire _t398;
  wire [5:0] _t399;
  wire [5:0] _t400;
  wire _t401;
  wire _t402;
  wire [2:0] _t403;
  wire _t404;
  wire _t405;
  wire _t406;
  wire _t407;
  wire [2:0] _t408;
  wire _t409;
  wire _t410;
  wire _t411;
  wire _t412;
  wire _t413;
  wire _t414;
  wire _t415;
  wire _t416;
  wire _t417;
  wire _t418;
  wire _t419;
  wire _t420;
  wire _t421;
  wire [7:0] _t422;
  wire _t423;
  wire _t424;
  wire _t425;
  wire _t426;
  wire _t427;
  wire [15:0] _t428;
  wire _t429;
  wire _t430;
  wire _t431;
  wire _t432;
  wire [31:0] _t433;
  wire _t434;
  wire _t435;
  wire [15:0] _t436;
  wire _t437;
  wire _t438;
  wire [2:0] _t439;
  wire _t440;
  wire _t441;
  wire [2:0] _t442;
  wire _t443;
  wire _t444;
  wire _t445;
  wire _t446;
  wire _t447;
  wire _t448;
  wire _t449;
  wire _t450;
  wire _t451;
  wire _t452;
  wire _t453;
  wire _t454;
  wire _t455;
  wire _t456;
  wire [7:0] _t457;
  wire _t458;
  wire _t459;
  wire _t460;
  wire _t461;
  wire _t462;
  wire _t463;
  wire _t464;
  wire [5:0] _t465;
  wire [5:0] _t466;
  wire _t467;
  wire _t468;
  wire [15:0] _t469;
  wire _t470;
  wire _t471;
  wire _t472;
  wire _t473;
  wire [2:0] _t474;
  wire _t475;
  wire _t476;
  wire [2:0] _t477;
  wire _t478;
  wire _t479;
  wire _t480;
  wire [15:0] _t481;
  wire [31:0] _t482;
  wire [47:0] _t483;
  wire [31:0] _t484;
  wire [15:0] _t485;
  wire [2:0] _t486;
  wire [5:0] _t487;
  wire [31:0] _t488;
  wire [15:0] _t489;
  wire [15:0] _t490;
  wire [15:0] _t491;
  wire [15:0] _t492;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  assign _t0 = dip[31:24];
  assign _t1 = {24'b0, _t0};
  assign _t2 = dip[23:16];
  assign _t3 = {24'b0, _t2};
  assign _t4 = (_t3 << 32'd8);
  assign _t5 = dip[15:8];
  assign _t6 = {24'b0, _t5};
  assign _t7 = dip[7:0];
  assign _t8 = {24'b0, _t7};
  assign _t9 = (_t8 << 32'd8);
  assign _t10 = (_t9 + _t6);
  assign _t11 = (_t10 + _t4);
  assign _t12 = dmac[7:0];
  assign _t13 = (hi == 6'd0);
  assign _t14 = ((|_t13) ? _t12 : 8'd0);
  assign _t15 = (hi == 6'd6);
  assign _t16 = ((|_t15) ? 8'd2 : _t14);
  assign _t17 = dmac[15:8];
  assign _t18 = (hi == 6'd1);
  assign _t19 = ((|_t18) ? _t17 : _t16);
  assign _t20 = (hi == 6'd7);
  assign _t21 = ((|_t20) ? 8'd0 : _t19);
  assign _t22 = dmac[23:16];
  assign _t23 = (hi == 6'd2);
  assign _t24 = ((|_t23) ? _t22 : _t21);
  assign _t25 = (hi == 6'd8);
  assign _t26 = ((|_t25) ? 8'd76 : _t24);
  assign _t27 = dmac[31:24];
  assign _t28 = (hi == 6'd3);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = (hi == 6'd9);
  assign _t31 = ((|_t30) ? 8'd56 : _t29);
  assign _t32 = dmac[39:32];
  assign _t33 = (hi == 6'd4);
  assign _t34 = ((|_t33) ? _t32 : _t31);
  assign _t35 = (hi == 6'd10);
  assign _t36 = ((|_t35) ? 8'd0 : _t34);
  assign _t37 = dmac[47:40];
  assign _t38 = (hi == 6'd5);
  assign _t39 = ((|_t38) ? _t37 : _t36);
  assign _t40 = (hi == 6'd11);
  assign _t41 = ((|_t40) ? 8'd1 : _t39);
  assign _t42 = (hi == 6'd12);
  assign _t43 = ((|_t42) ? 8'd8 : _t41);
  assign _t44 = (hi == 6'd14);
  assign _t45 = ((|_t44) ? 8'd69 : _t43);
  assign _t46 = tlen[15:8];
  assign _t47 = (hi == 6'd16);
  assign _t48 = ((|_t47) ? _t46 : _t45);
  assign _t49 = tlen[7:0];
  assign _t50 = (hi == 6'd17);
  assign _t51 = ((|_t50) ? _t49 : _t48);
  assign _t52 = (hi == 6'd20);
  assign _t53 = ((|_t52) ? 8'd64 : _t51);
  assign _t54 = (hi == 6'd22);
  assign _t55 = ((|_t54) ? 8'd64 : _t53);
  assign _t56 = (hi == 6'd23);
  assign _t57 = ((|_t56) ? 8'd17 : _t55);
  assign _t58 = ick[15:8];
  assign _t59 = (hi == 6'd24);
  assign _t60 = ((|_t59) ? _t58 : _t57);
  assign _t61 = ick[7:0];
  assign _t62 = (hi == 6'd25);
  assign _t63 = ((|_t62) ? _t61 : _t60);
  assign _t64 = (hi == 6'd26);
  assign _t65 = ((|_t64) ? 8'd192 : _t63);
  assign _t66 = dip[7:0];
  assign _t67 = (hi == 6'd30);
  assign _t68 = ((|_t67) ? _t66 : _t65);
  assign _t69 = (hi == 6'd27);
  assign _t70 = ((|_t69) ? 8'd168 : _t68);
  assign _t71 = dip[15:8];
  assign _t72 = (hi == 6'd31);
  assign _t73 = ((|_t72) ? _t71 : _t70);
  assign _t74 = (hi == 6'd28);
  assign _t75 = ((|_t74) ? 8'd77 : _t73);
  assign _t76 = dip[23:16];
  assign _t77 = (hi == 6'd32);
  assign _t78 = ((|_t77) ? _t76 : _t75);
  assign _t79 = (hi == 6'd29);
  assign _t80 = ((|_t79) ? 8'd2 : _t78);
  assign _t81 = dip[31:24];
  assign _t82 = (hi == 6'd33);
  assign _t83 = ((|_t82) ? _t81 : _t80);
  assign _t84 = (hi == 6'd34);
  assign _t85 = ((|_t84) ? 8'd142 : _t83);
  assign _t86 = (hi == 6'd35);
  assign _t87 = ((|_t86) ? 8'd148 : _t85);
  assign _t88 = dprt[15:8];
  assign _t89 = (hi == 6'd36);
  assign _t90 = ((|_t89) ? _t88 : _t87);
  assign _t91 = dprt[7:0];
  assign _t92 = (hi == 6'd37);
  assign _t93 = ((|_t92) ? _t91 : _t90);
  assign _t94 = ulen[15:8];
  assign _t95 = (hi == 6'd38);
  assign _t96 = ((|_t95) ? _t94 : _t93);
  assign _t97 = ulen[7:0];
  assign _t98 = (hi == 6'd39);
  assign _t99 = ((|_t98) ? _t97 : _t96);
  assign _t100 = ck[15:8];
  assign _t101 = (hi == 6'd40);
  assign _t102 = ((|_t101) ? _t100 : _t99);
  assign _t103 = ck[7:0];
  assign _t104 = (hi == 6'd41);
  assign _t105 = ask_mac[7:0];
  assign _t106 = (hi == 6'd32);
  assign _t107 = (hi == 6'd0);
  assign _t108 = ((|_t107) || (|_t106));
  assign _t109 = ((|_t108) ? _t105 : 8'd0);
  assign _t110 = (hi == 6'd22);
  assign _t111 = (hi == 6'd6);
  assign _t112 = ((|_t111) || (|_t110));
  assign _t113 = ((|_t112) ? 8'd2 : _t109);
  assign _t114 = ask_mac[15:8];
  assign _t115 = (hi == 6'd33);
  assign _t116 = (hi == 6'd1);
  assign _t117 = ((|_t116) || (|_t115));
  assign _t118 = ((|_t117) ? _t114 : _t113);
  assign _t119 = (hi == 6'd23);
  assign _t120 = (hi == 6'd7);
  assign _t121 = ((|_t120) || (|_t119));
  assign _t122 = ((|_t121) ? 8'd0 : _t118);
  assign _t123 = ask_mac[23:16];
  assign _t124 = (hi == 6'd34);
  assign _t125 = (hi == 6'd2);
  assign _t126 = ((|_t125) || (|_t124));
  assign _t127 = ((|_t126) ? _t123 : _t122);
  assign _t128 = (hi == 6'd24);
  assign _t129 = (hi == 6'd8);
  assign _t130 = ((|_t129) || (|_t128));
  assign _t131 = ((|_t130) ? 8'd76 : _t127);
  assign _t132 = ask_mac[31:24];
  assign _t133 = (hi == 6'd35);
  assign _t134 = (hi == 6'd3);
  assign _t135 = ((|_t134) || (|_t133));
  assign _t136 = ((|_t135) ? _t132 : _t131);
  assign _t137 = (hi == 6'd25);
  assign _t138 = (hi == 6'd9);
  assign _t139 = ((|_t138) || (|_t137));
  assign _t140 = ((|_t139) ? 8'd56 : _t136);
  assign _t141 = ask_mac[39:32];
  assign _t142 = (hi == 6'd36);
  assign _t143 = (hi == 6'd4);
  assign _t144 = ((|_t143) || (|_t142));
  assign _t145 = ((|_t144) ? _t141 : _t140);
  assign _t146 = (hi == 6'd26);
  assign _t147 = (hi == 6'd10);
  assign _t148 = ((|_t147) || (|_t146));
  assign _t149 = ((|_t148) ? 8'd0 : _t145);
  assign _t150 = ask_mac[47:40];
  assign _t151 = (hi == 6'd37);
  assign _t152 = (hi == 6'd5);
  assign _t153 = ((|_t152) || (|_t151));
  assign _t154 = ((|_t153) ? _t150 : _t149);
  assign _t155 = (hi == 6'd27);
  assign _t156 = (hi == 6'd11);
  assign _t157 = ((|_t156) || (|_t155));
  assign _t158 = ((|_t157) ? 8'd1 : _t154);
  assign _t159 = (hi == 6'd28);
  assign _t160 = ((|_t159) ? 8'd192 : _t158);
  assign _t161 = ask_ip[7:0];
  assign _t162 = (hi == 6'd38);
  assign _t163 = ((|_t162) ? _t161 : _t160);
  assign _t164 = (hi == 6'd29);
  assign _t165 = ((|_t164) ? 8'd168 : _t163);
  assign _t166 = ask_ip[15:8];
  assign _t167 = (hi == 6'd39);
  assign _t168 = ((|_t167) ? _t166 : _t165);
  assign _t169 = (hi == 6'd30);
  assign _t170 = ((|_t169) ? 8'd77 : _t168);
  assign _t171 = ask_ip[23:16];
  assign _t172 = (hi == 6'd40);
  assign _t173 = ((|_t172) ? _t171 : _t170);
  assign _t174 = (hi == 6'd31);
  assign _t175 = ((|_t174) ? 8'd2 : _t173);
  assign _t176 = ask_ip[31:24];
  assign _t177 = (hi == 6'd41);
  assign _t178 = ((|_t177) ? _t176 : _t175);
  assign _t179 = (hi == 6'd12);
  assign _t180 = ((|_t179) ? 8'd8 : _t178);
  assign _t181 = (hi == 6'd13);
  assign _t182 = ((|_t181) ? 8'd6 : _t180);
  assign _t183 = (hi == 6'd15);
  assign _t184 = ((|_t183) ? 8'd1 : _t182);
  assign _t185 = (hi == 6'd16);
  assign _t186 = ((|_t185) ? 8'd8 : _t184);
  assign _t187 = (hi == 6'd18);
  assign _t188 = ((|_t187) ? 8'd6 : _t186);
  assign _t189 = (hi == 6'd19);
  assign _t190 = ((|_t189) ? 8'd4 : _t188);
  assign _t191 = (hi == 6'd21);
  assign _t192 = ((|peer_valid) || (|1'd0));
  assign _t193 = (len == 16'd0);
  assign _t194 = ((|ask_valid) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (~full);
  assign _t197 = ((|_t196) && (|_t195));
  assign _t198 = ((|_t197) && (|_t192));
  assign _t199 = ({29'b0, ut2_state} == 32'd0);
  assign _t200 = ((|t_valid) && (|t_ready));
  assign _t201 = ({29'b0, ut2_state} == 32'd0);
  assign _t202 = ((|t_valid) && (|t_ready));
  assign _t203 = ((|_t202) && (|t_last));
  assign _t204 = ({29'b0, ut2_state} == 32'd0);
  assign _t205 = ({29'b0, ut2_state} == 32'd0);
  assign _t206 = ({29'b0, ut2_state} == 32'd0);
  assign _t207 = ({29'b0, ut2_state} == 32'd0);
  assign _t208 = ({29'b0, ut2_state} == 32'd0);
  assign _t209 = ({29'b0, ut2_state} == 32'd0);
  assign _t210 = (len + 16'd1);
  assign _t211 = ({29'b0, ut2_state} == 32'd0);
  assign _t212 = ((|_t211) && (|w));
  assign _t213 = {24'b0, t_data};
  assign _t214 = (acc + _t213);
  assign _t215 = len[0];
  assign _t216 = ((|w) && (|_t215));
  assign _t217 = ({29'b0, ut2_state} == 32'd0);
  assign _t218 = ((|_t217) && (|_t216));
  assign _t219 = {24'b0, t_data};
  assign _t220 = (_t219 << 32'd8);
  assign _t221 = ((|_t218) ? _t214 : acc);
  assign _t222 = (acc + _t220);
  assign _t223 = (~_t215);
  assign _t224 = ((|w) && (|_t223));
  assign _t225 = ({29'b0, ut2_state} == 32'd0);
  assign _t226 = ((|_t225) && (|_t224));
  assign _t227 = ((|cm) && (|peer_valid));
  assign _t228 = ({29'b0, ut2_state} == 32'd0);
  assign _t229 = ((|_t228) && (|_t227));
  assign _t230 = ((|cm) && (|peer_valid));
  assign _t231 = ({29'b0, ut2_state} == 32'd0);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = ((|cm) && (|peer_valid));
  assign _t234 = ({29'b0, ut2_state} == 32'd0);
  assign _t235 = ((|_t234) && (|_t233));
  assign _t236 = ((|_t229) ? peer_mac : dmac);
  assign _t237 = (~peer_valid);
  assign _t238 = ((|cm) && (|_t237));
  assign _t239 = ({29'b0, ut2_state} == 32'd0);
  assign _t240 = ((|_t239) && (|_t238));
  assign _t241 = ((|_t232) ? peer_ip : dip);
  assign _t242 = ((|cm) && (|_t237));
  assign _t243 = ({29'b0, ut2_state} == 32'd0);
  assign _t244 = ((|_t243) && (|_t242));
  assign _t245 = ((|_t235) ? peer_port : dprt);
  assign _t246 = ((|cm) && (|_t237));
  assign _t247 = ({29'b0, ut2_state} == 32'd0);
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ({29'b0, ut2_state} == 32'd0);
  assign _t250 = ((|_t249) && (|cm));
  assign _t251 = (len == 16'd0);
  assign _t252 = ((|ask_valid) && (|_t251));
  assign _t253 = (~cm);
  assign _t254 = ((|_t253) && (|_t252));
  assign _t255 = ({29'b0, ut2_state} == 32'd0);
  assign _t256 = ((|_t255) && (|_t254));
  assign _t257 = ((|_t250) ? 32'd1 : ut2_state);
  assign _t258 = ((|_t253) && (|_t252));
  assign _t259 = ({29'b0, ut2_state} == 32'd0);
  assign _t260 = ((|_t259) && (|_t258));
  assign _t261 = ((|_t260) ? 32'd6 : _t257);
  assign _t262 = (~_t252);
  assign _t263 = ((|_t253) && (|_t262));
  assign _t264 = ({29'b0, ut2_state} == 32'd0);
  assign _t265 = ((|_t264) && (|_t263));
  assign _t266 = ((|_t199) ? _t198 : 1'd0);
  assign _t267 = ({29'b0, ut2_state} == 32'd1);
  assign _t268 = ((|_t201) ? _t200 : 1'd0);
  assign _t269 = ({29'b0, ut2_state} == 32'd1);
  assign _t270 = ((|_t204) ? _t203 : 1'd0);
  assign _t271 = ({29'b0, ut2_state} == 32'd1);
  assign _t272 = ((|_t205) ? 1'd0 : 1'd0);
  assign _t273 = ({29'b0, ut2_state} == 32'd1);
  assign _t274 = ((|_t206) ? 1'd0 : 1'd0);
  assign _t275 = ({29'b0, ut2_state} == 32'd1);
  assign _t276 = ((|_t207) ? hb : 8'd0);
  assign _t277 = ({29'b0, ut2_state} == 32'd1);
  assign _t278 = ((|_t208) ? 1'd0 : 1'd0);
  assign _t279 = ({29'b0, ut2_state} == 32'd1);
  assign _t280 = ((|_t209) ? 1'd0 : 1'd0);
  assign _t281 = ({29'b0, ut2_state} == 32'd1);
  assign _t282 = {16'b0, dprt};
  assign _t283 = (acc + dipw);
  assign _t284 = (_t283 + _t282);
  assign _t285 = ((|_t226) ? _t222 : _t221);
  assign _t286 = (_t284 + 32'd105551);
  assign _t287 = ({29'b0, ut2_state} == 32'd1);
  assign _t288 = (dipw + 32'd119483);
  assign _t289 = ({29'b0, ut2_state} == 32'd1);
  assign _t290 = ((|_t265) ? 32'd0 : _t261);
  assign _t291 = ({29'b0, ut2_state} == 32'd1);
  assign _t292 = ((|_t267) ? 1'd0 : _t266);
  assign _t293 = ({29'b0, ut2_state} == 32'd2);
  assign _t294 = ((|_t269) ? 1'd0 : _t268);
  assign _t295 = ({29'b0, ut2_state} == 32'd2);
  assign _t296 = ((|_t271) ? 1'd0 : _t270);
  assign _t297 = ({29'b0, ut2_state} == 32'd2);
  assign _t298 = ((|_t273) ? 1'd0 : _t272);
  assign _t299 = ({29'b0, ut2_state} == 32'd2);
  assign _t300 = ((|_t275) ? 1'd0 : _t274);
  assign _t301 = ({29'b0, ut2_state} == 32'd2);
  assign _t302 = ((|_t277) ? hb : _t276);
  assign _t303 = ({29'b0, ut2_state} == 32'd2);
  assign _t304 = ((|_t279) ? 1'd0 : _t278);
  assign _t305 = ({29'b0, ut2_state} == 32'd2);
  assign _t306 = ((|_t281) ? 1'd0 : _t280);
  assign _t307 = ({29'b0, ut2_state} == 32'd2);
  assign _t308 = {16'b0, ulen};
  assign _t309 = {16'b0, ulen};
  assign _t310 = (acc + _t309);
  assign _t311 = ((|_t287) ? _t286 : _t285);
  assign _t312 = (_t310 + _t308);
  assign _t313 = ({29'b0, ut2_state} == 32'd2);
  assign _t314 = {16'b0, tlen};
  assign _t315 = ((|_t289) ? _t288 : iac);
  assign _t316 = (iac + _t314);
  assign _t317 = ({29'b0, ut2_state} == 32'd2);
  assign _t318 = ((|_t291) ? 32'd2 : _t290);
  assign _t319 = ({29'b0, ut2_state} == 32'd2);
  assign _t320 = ((|_t293) ? 1'd0 : _t292);
  assign _t321 = ({29'b0, ut2_state} == 32'd3);
  assign _t322 = ((|_t295) ? 1'd0 : _t294);
  assign _t323 = ({29'b0, ut2_state} == 32'd3);
  assign _t324 = ((|_t297) ? 1'd0 : _t296);
  assign _t325 = ({29'b0, ut2_state} == 32'd3);
  assign _t326 = ((|_t299) ? 1'd0 : _t298);
  assign _t327 = ({29'b0, ut2_state} == 32'd3);
  assign _t328 = ((|_t301) ? 1'd0 : _t300);
  assign _t329 = ({29'b0, ut2_state} == 32'd3);
  assign _t330 = ((|_t303) ? hb : _t302);
  assign _t331 = ({29'b0, ut2_state} == 32'd3);
  assign _t332 = ((|_t305) ? 1'd0 : _t304);
  assign _t333 = ({29'b0, ut2_state} == 32'd3);
  assign _t334 = ((|_t307) ? 1'd0 : _t306);
  assign _t335 = ({29'b0, ut2_state} == 32'd3);
  assign _t336 = acc[31:16];
  assign _t337 = {16'b0, _t336};
  assign _t338 = acc[15:0];
  assign _t339 = {16'b0, _t338};
  assign _t340 = ((|_t313) ? _t312 : _t311);
  assign _t341 = (_t339 + _t337);
  assign _t342 = iac[31:16];
  assign _t343 = (_t342 != 16'd0);
  assign _t344 = acc[31:16];
  assign _t345 = (_t344 != 16'd0);
  assign _t346 = ((|_t345) || (|_t343));
  assign _t347 = ({29'b0, ut2_state} == 32'd3);
  assign _t348 = ((|_t347) && (|_t346));
  assign _t349 = iac[31:16];
  assign _t350 = {16'b0, _t349};
  assign _t351 = iac[15:0];
  assign _t352 = {16'b0, _t351};
  assign _t353 = ((|_t317) ? _t316 : _t315);
  assign _t354 = (_t352 + _t350);
  assign _t355 = ({29'b0, ut2_state} == 32'd3);
  assign _t356 = ((|_t355) && (|_t346));
  assign _t357 = ((|_t319) ? 32'd3 : _t318);
  assign _t358 = ({29'b0, ut2_state} == 32'd3);
  assign _t359 = ((|_t358) && (|_t346));
  assign _t360 = acc[15:0];
  assign _t361 = (_t360 == 16'd65535);
  assign _t362 = (~_t346);
  assign _t363 = ((|_t362) && (|_t361));
  assign _t364 = ({29'b0, ut2_state} == 32'd3);
  assign _t365 = ((|_t364) && (|_t363));
  assign _t366 = acc[15:0];
  assign _t367 = ((|_t365) ? 16'd65535 : ck);
  assign _t368 = (_t366 ^ 16'd65535);
  assign _t369 = (~_t361);
  assign _t370 = ((|_t362) && (|_t369));
  assign _t371 = ({29'b0, ut2_state} == 32'd3);
  assign _t372 = ((|_t371) && (|_t370));
  assign _t373 = iac[15:0];
  assign _t374 = (_t373 ^ 16'd65535);
  assign _t375 = ({29'b0, ut2_state} == 32'd3);
  assign _t376 = ((|_t375) && (|_t362));
  assign _t377 = ((|_t256) ? 6'd0 : hi);
  assign _t378 = ({29'b0, ut2_state} == 32'd3);
  assign _t379 = ((|_t378) && (|_t362));
  assign _t380 = ((|_t359) ? 32'd3 : _t357);
  assign _t381 = ({29'b0, ut2_state} == 32'd3);
  assign _t382 = ((|_t381) && (|_t362));
  assign _t383 = ((|_t321) ? 1'd0 : _t320);
  assign _t384 = ({29'b0, ut2_state} == 32'd4);
  assign _t385 = ((|_t323) ? 1'd0 : _t322);
  assign _t386 = ({29'b0, ut2_state} == 32'd4);
  assign _t387 = ((|_t325) ? 1'd0 : _t324);
  assign _t388 = ({29'b0, ut2_state} == 32'd4);
  assign _t389 = ((|_t327) ? 1'd0 : _t326);
  assign _t390 = ({29'b0, ut2_state} == 32'd4);
  assign _t391 = ((|_t329) ? 1'd0 : _t328);
  assign _t392 = ({29'b0, ut2_state} == 32'd4);
  assign _t393 = ((|_t331) ? hb : _t330);
  assign _t394 = ({29'b0, ut2_state} == 32'd4);
  assign _t395 = ((|_t333) ? 1'd0 : _t332);
  assign _t396 = ({29'b0, ut2_state} == 32'd4);
  assign _t397 = ((|_t335) ? 1'd0 : _t334);
  assign _t398 = ({29'b0, ut2_state} == 32'd4);
  assign _t399 = ((|_t379) ? 6'd0 : _t377);
  assign _t400 = (hi + 6'd1);
  assign _t401 = ({29'b0, ut2_state} == 32'd4);
  assign _t402 = ((|_t401) && (|o_ready));
  assign _t403 = ((|_t382) ? 32'd4 : _t380);
  assign _t404 = (hi == 6'd41);
  assign _t405 = ((|o_ready) && (|_t404));
  assign _t406 = ({29'b0, ut2_state} == 32'd4);
  assign _t407 = ((|_t406) && (|_t405));
  assign _t408 = ((|_t407) ? 32'd5 : _t403);
  assign _t409 = (~_t405);
  assign _t410 = ({29'b0, ut2_state} == 32'd4);
  assign _t411 = ((|_t410) && (|_t409));
  assign _t412 = ((|_t384) ? 1'd0 : _t383);
  assign _t413 = ({29'b0, ut2_state} == 32'd5);
  assign _t414 = ((|_t386) ? 1'd0 : _t385);
  assign _t415 = ({29'b0, ut2_state} == 32'd5);
  assign _t416 = ((|_t388) ? 1'd0 : _t387);
  assign _t417 = ({29'b0, ut2_state} == 32'd5);
  assign _t418 = ((|_t390) ? 1'd1 : _t389);
  assign _t419 = ({29'b0, ut2_state} == 32'd5);
  assign _t420 = ((|_t392) ? 1'd0 : _t391);
  assign _t421 = ({29'b0, ut2_state} == 32'd5);
  assign _t422 = ((|_t394) ? hb : _t393);
  assign _t423 = ({29'b0, ut2_state} == 32'd5);
  assign _t424 = ((|_t396) ? 1'd0 : _t395);
  assign _t425 = ({29'b0, ut2_state} == 32'd5);
  assign _t426 = ((|_t398) ? 1'd0 : _t397);
  assign _t427 = ({29'b0, ut2_state} == 32'd5);
  assign _t428 = ((|_t212) ? _t210 : len);
  assign _t429 = ((|fo_valid) && (|o_ready));
  assign _t430 = ((|_t429) && (|fo_last));
  assign _t431 = ({29'b0, ut2_state} == 32'd5);
  assign _t432 = ((|_t431) && (|_t430));
  assign _t433 = ((|_t348) ? _t341 : _t340);
  assign _t434 = ({29'b0, ut2_state} == 32'd5);
  assign _t435 = ((|_t434) && (|_t430));
  assign _t436 = (n + 16'd1);
  assign _t437 = ({29'b0, ut2_state} == 32'd5);
  assign _t438 = ((|_t437) && (|_t430));
  assign _t439 = ((|_t411) ? 32'd4 : _t408);
  assign _t440 = ({29'b0, ut2_state} == 32'd5);
  assign _t441 = ((|_t440) && (|_t430));
  assign _t442 = ((|_t441) ? 32'd0 : _t439);
  assign _t443 = (~_t430);
  assign _t444 = ({29'b0, ut2_state} == 32'd5);
  assign _t445 = ((|_t444) && (|_t443));
  assign _t446 = ((|_t413) ? 1'd0 : _t412);
  assign _t447 = ({29'b0, ut2_state} == 32'd6);
  assign _t448 = ((|_t415) ? 1'd0 : _t414);
  assign _t449 = ({29'b0, ut2_state} == 32'd6);
  assign _t450 = ((|_t417) ? 1'd0 : _t416);
  assign _t451 = ({29'b0, ut2_state} == 32'd6);
  assign _t452 = ((|_t419) ? fo_valid : _t418);
  assign _t453 = ({29'b0, ut2_state} == 32'd6);
  assign _t454 = ((|_t421) ? fo_last : _t420);
  assign _t455 = (hi == 6'd41);
  assign _t456 = ({29'b0, ut2_state} == 32'd6);
  assign _t457 = ((|_t423) ? fo_data : _t422);
  assign _t458 = ({29'b0, ut2_state} == 32'd6);
  assign _t459 = ((|_t425) ? o_ready : _t424);
  assign _t460 = ({29'b0, ut2_state} == 32'd6);
  assign _t461 = (hi == 6'd41);
  assign _t462 = ((|_t427) ? 1'd0 : _t426);
  assign _t463 = ((|o_ready) && (|_t461));
  assign _t464 = ({29'b0, ut2_state} == 32'd6);
  assign _t465 = ((|_t402) ? _t400 : _t399);
  assign _t466 = (hi + 6'd1);
  assign _t467 = ({29'b0, ut2_state} == 32'd6);
  assign _t468 = ((|_t467) && (|o_ready));
  assign _t469 = (na + 16'd1);
  assign _t470 = (hi == 6'd41);
  assign _t471 = ((|o_ready) && (|_t470));
  assign _t472 = ({29'b0, ut2_state} == 32'd6);
  assign _t473 = ((|_t472) && (|_t471));
  assign _t474 = ((|_t445) ? 32'd5 : _t442);
  assign _t475 = ({29'b0, ut2_state} == 32'd6);
  assign _t476 = ((|_t475) && (|_t471));
  assign _t477 = ((|_t476) ? 32'd0 : _t474);
  assign _t478 = (~_t471);
  assign _t479 = ({29'b0, ut2_state} == 32'd6);
  assign _t480 = ((|_t479) && (|_t478));
  assign fo_data = q_dst_data;
  assign fo_last = q_dst_last;
  assign fo_valid = q_dst_valid;
  assign ffull = q_full;
  assign full = q_tight;
  assign ulen = (len + 16'd8);
  assign tlen = (len + 16'd28);
  assign dipw = (_t11 + _t1);
  assign hb = ((|_t104) ? _t103 : _t102);
  assign ab = ((|_t191) ? 8'd2 : _t190);
  assign t_ready = ((|_t447) ? 1'd0 : _t446);
  assign w = ((|_t449) ? 1'd0 : _t448);
  assign cm = ((|_t451) ? 1'd0 : _t450);
  assign o_valid = ((|_t453) ? 1'd1 : _t452);
  assign o_last = ((|_t456) ? _t455 : _t454);
  assign o_data = ((|_t458) ? ab : _t457);
  assign fo_ready = ((|_t460) ? 1'd0 : _t459);
  assign ask_ack = ((|_t464) ? _t463 : _t462);
  assign _t481 = ((|_t432) ? 16'd0 : _t428);
  assign _t482 = ((|_t435) ? 32'd0 : _t433);
  assign _t483 = ((|_t240) ? 48'd281474976710655 : _t236);
  assign _t484 = ((|_t244) ? 32'd4294967295 : _t241);
  assign _t485 = ((|_t248) ? 16'd36501 : _t245);
  assign _t486 = ((|_t480) ? 32'd6 : _t477);
  assign _t487 = ((|_t468) ? _t466 : _t465);
  assign _t488 = ((|_t356) ? _t354 : _t353);
  assign _t489 = ((|_t372) ? _t368 : _t367);
  assign _t490 = ((|_t376) ? _t374 : ick);
  assign _t491 = ((|_t438) ? _t436 : n);
  assign _t492 = ((|_t473) ? _t469 : na);
  always @(posedge clk) begin
    if (rst) begin
      len <= 16'd0;
      acc <= 32'd0;
      iac <= 32'd0;
      ck <= 16'd0;
      ick <= 16'd0;
      hi <= 6'd0;
      n <= 16'd0;
      na <= 16'd0;
      dmac <= 48'd0;
      dip <= 32'd0;
      dprt <= 16'd0;
      ut2_state <= 3'd0;
    end else begin
      len <= _t481;
      acc <= _t482;
      iac <= _t488;
      ck <= _t489;
      ick <= _t490;
      hi <= _t487;
      n <= _t491;
      na <= _t492;
      dmac <= _t483;
      dip <= _t484;
      dprt <= _t485;
      ut2_state <= _t486;
    end
  end
  pktfifo_8_2048 q (
    .clk(clk),
    .rst(rst),
    .wr(w),
    .wdata(t_data),
    .wlast(t_last),
    .commit(cm),
    .rewind(1'd0),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(fo_ready),
    .full(q_full),
    .tight(q_tight)
  );
endmodule
`default_nettype wire

`default_nettype none
module udp4_port_36500_2200301993985_3232255234_2048_0_1_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] erx_data,
  input  wire erx_last,
  input  wire erx_valid,
  output wire erx_ready,
  output wire [7:0] etx_data,
  output wire etx_last,
  output wire etx_valid,
  input  wire etx_ready,
  output wire [7:0] rx_data,
  output wire rx_last,
  output wire rx_valid,
  input  wire rx_ready,
  input  wire [7:0] tx_data,
  input  wire tx_last,
  input  wire tx_valid,
  output wire tx_ready,
  output wire [15:0] nr,
  output wire [15:0] nt,
  output wire [15:0] na,
  output wire pr_valid
);
  wire [47:0] pr_mac;
  wire [31:0] pr_ip;
  wire [15:0] pr_port;
  wire ak_valid;
  wire [47:0] ak_mac;
  wire [31:0] ak_ip;
  wire ak_ack;
  wire [7:0] ri_data;
  wire ri_last;
  wire ri_valid;
  wire ri_ready;
  wire [7:0] ri0_data;
  wire ri0_last;
  wire ri0_valid;
  wire ri0_ready;
  wire [8:0] fi_data;
  wire fi_valid;
  wire fi_ready;
  wire [8:0] fo_data;
  wire fo_valid;
  wire fo_ready;
  wire [2:0] fc;
  wire _t0;
  wire [8:0] _t1;
  wire [7:0] _t2;
  wire ur_i_ready;
  wire [7:0] ur_o_data;
  wire ur_o_last;
  wire ur_o_valid;
  wire ur_peer_valid;
  wire [47:0] ur_peer_mac;
  wire [31:0] ur_peer_ip;
  wire [15:0] ur_peer_port;
  wire ur_ask_valid;
  wire [47:0] ur_ask_mac;
  wire [31:0] ur_ask_ip;
  wire [15:0] ur_n;
  wire sl_src_ready;
  wire [8:0] sl_dst_data;
  wire sl_dst_valid;
  wire [2:0] sl_cnt;
  wire ux_t_ready;
  wire [7:0] ux_o_data;
  wire ux_o_last;
  wire ux_o_valid;
  wire ux_ask_ack;
  wire [15:0] ux_n;
  wire [15:0] ux_na;
  assign _t0 = 1'd0;
  assign _t1 = {_t0, ri_data};
  assign _t2 = _t1[7:0];
  assign erx_ready = ur_i_ready;
  assign ri0_data = ur_o_data;
  assign ri0_last = ur_o_last;
  assign ri0_valid = ur_o_valid;
  assign pr_valid = ur_peer_valid;
  assign pr_mac = ur_peer_mac;
  assign pr_ip = ur_peer_ip;
  assign pr_port = ur_peer_port;
  assign ak_valid = ur_ask_valid;
  assign ak_mac = ur_ask_mac;
  assign ak_ip = ur_ask_ip;
  assign nr = ur_n;
  assign ri_valid = ri0_valid;
  assign ri_data = ri0_data;
  assign ri_last = ri0_last;
  assign ri0_ready = ri_ready;
  assign fi_ready = sl_src_ready;
  assign fo_data = sl_dst_data;
  assign fo_valid = sl_dst_valid;
  assign fc = sl_cnt;
  assign fi_valid = ri_valid;
  assign fi_data = {ri_last, _t2};
  assign ri_ready = fi_ready;
  assign rx_valid = fo_valid;
  assign rx_data = fo_data[7:0];
  assign rx_last = fo_data[8];
  assign fo_ready = rx_ready;
  assign tx_ready = ux_t_ready;
  assign etx_data = ux_o_data;
  assign etx_last = ux_o_last;
  assign etx_valid = ux_o_valid;
  assign ak_ack = ux_ask_ack;
  assign nt = ux_n;
  assign na = ux_na;
  ip4_rx_36500_2200301993985_3232255234_0 ur (
    .clk(clk),
    .rst(rst),
    .i_data(erx_data),
    .i_last(erx_last),
    .i_valid(erx_valid),
    .i_ready(ur_i_ready),
    .o_data(ur_o_data),
    .o_last(ur_o_last),
    .o_valid(ur_o_valid),
    .o_ready(ri0_ready),
    .peer_valid(ur_peer_valid),
    .peer_mac(ur_peer_mac),
    .peer_ip(ur_peer_ip),
    .peer_port(ur_peer_port),
    .ask_valid(ur_ask_valid),
    .ask_mac(ur_ask_mac),
    .ask_ip(ur_ask_ip),
    .ask_ack(ak_ack),
    .n(ur_n)
  );
  fifo_9_4 sl (
    .clk(clk),
    .rst(rst),
    .src_data(fi_data),
    .src_valid(fi_valid),
    .src_ready(sl_src_ready),
    .dst_data(sl_dst_data),
    .dst_valid(sl_dst_valid),
    .dst_ready(fo_ready),
    .cnt(sl_cnt)
  );
  ip4_tx_36500_2200301993985_3232255234_2048_1 ux (
    .clk(clk),
    .rst(rst),
    .t_data(tx_data),
    .t_last(tx_last),
    .t_valid(tx_valid),
    .t_ready(ux_t_ready),
    .o_data(ux_o_data),
    .o_last(ux_o_last),
    .o_valid(ux_o_valid),
    .o_ready(etx_ready),
    .peer_valid(pr_valid),
    .peer_mac(pr_mac),
    .peer_ip(pr_ip),
    .peer_port(pr_port),
    .ask_valid(ak_valid),
    .ask_mac(ak_mac),
    .ask_ip(ak_ip),
    .ask_ack(ux_ask_ack),
    .n(ux_n),
    .na(ux_na)
  );
endmodule
`default_nettype wire

`default_nettype none
module ip4_rx_36490_2200301993985_3232255234_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  output wire peer_valid,
  output wire [47:0] peer_mac,
  output wire [31:0] peer_ip,
  output wire [15:0] peer_port,
  output wire ask_valid,
  output wire [47:0] ask_mac,
  output wire [31:0] ask_ip,
  input  wire ask_ack,
  output reg  [15:0] n
);
  reg  [5:0] idx;
  reg  oku;
  reg  oka;
  reg  bc;
  reg  [15:0] left;
  reg  pv;
  reg  [47:0] pmac;
  reg  [31:0] pip;
  reg  [15:0] pprt;
  reg  [47:0] tmac;
  reg  [31:0] tip;
  reg  [15:0] tprt;
  reg  [31:0] aip;
  reg  av;
  wire [47:0] amac;
  wire [31:0] arip;
  wire pay;
  wire [7:0] d;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire [39:0] _t8;
  wire [47:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [47:0] _t13;
  wire [7:0] _t14;
  wire [31:0] _t15;
  wire [47:0] _t16;
  wire _t17;
  wire _t18;
  wire [47:0] _t19;
  wire [15:0] _t20;
  wire [23:0] _t21;
  wire [47:0] _t22;
  wire _t23;
  wire _t24;
  wire [47:0] _t25;
  wire [23:0] _t26;
  wire [15:0] _t27;
  wire [47:0] _t28;
  wire _t29;
  wire _t30;
  wire [47:0] _t31;
  wire [31:0] _t32;
  wire [7:0] _t33;
  wire [47:0] _t34;
  wire _t35;
  wire _t36;
  wire [47:0] _t37;
  wire [39:0] _t38;
  wire [47:0] _t39;
  wire _t40;
  wire _t41;
  wire [23:0] _t42;
  wire [31:0] _t43;
  wire _t44;
  wire _t45;
  wire [23:0] _t46;
  wire [31:0] _t47;
  wire _t48;
  wire _t49;
  wire [31:0] _t50;
  wire [7:0] _t51;
  wire [15:0] _t52;
  wire [31:0] _t53;
  wire _t54;
  wire _t55;
  wire [31:0] _t56;
  wire [7:0] _t57;
  wire [15:0] _t58;
  wire [31:0] _t59;
  wire _t60;
  wire _t61;
  wire [31:0] _t62;
  wire [15:0] _t63;
  wire [7:0] _t64;
  wire [31:0] _t65;
  wire _t66;
  wire _t67;
  wire [31:0] _t68;
  wire [15:0] _t69;
  wire [7:0] _t70;
  wire [31:0] _t71;
  wire _t72;
  wire _t73;
  wire [31:0] _t74;
  wire [23:0] _t75;
  wire [31:0] _t76;
  wire _t77;
  wire _t78;
  wire [31:0] _t79;
  wire [23:0] _t80;
  wire [31:0] _t81;
  wire _t82;
  wire _t83;
  wire [7:0] _t84;
  wire [15:0] _t85;
  wire _t86;
  wire _t87;
  wire [15:0] _t88;
  wire [7:0] _t89;
  wire [15:0] _t90;
  wire _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [15:0] _t94;
  wire _t95;
  wire _t96;
  wire [15:0] _t97;
  wire [7:0] _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire [15:0] _t101;
  wire [15:0] _t102;
  wire [15:0] _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire _t109;
  wire [15:0] _t110;
  wire [15:0] _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire [5:0] _t121;
  wire [5:0] _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire _t158;
  wire _t159;
  wire _t160;
  wire _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire _t187;
  wire _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [15:0] _t261;
  wire _t262;
  wire [47:0] _t263;
  wire [31:0] _t264;
  wire [31:0] _t265;
  wire [15:0] _t266;
  wire [15:0] _t267;
  wire _t268;
  wire [5:0] _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire [47:0] _t273;
  wire [31:0] _t274;
  wire [15:0] _t275;
  wire [15:0] _t276;
  wire _t277;
  assign _t0 = (left != 16'd0);
  assign _t1 = ((|i_valid) && (|pay));
  assign _t2 = ((|_t1) && (|oku));
  assign _t3 = (left != 16'd0);
  assign _t4 = ((|pay) && (|oku));
  assign _t5 = ((|_t4) && (|_t3));
  assign _t6 = ((|_t5) ? o_ready : 1'd0);
  assign _t7 = (~_t5);
  assign _t8 = tmac[47:8];
  assign _t9 = {_t8, d};
  assign _t10 = (idx == 6'd6);
  assign _t11 = ((|i_valid) && (|i_ready));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? _t9 : tmac);
  assign _t14 = _t13[7:0];
  assign _t15 = _t13[47:16];
  assign _t16 = {_t15, d, _t14};
  assign _t17 = (idx == 6'd7);
  assign _t18 = ((|_t11) && (|_t17));
  assign _t19 = ((|_t18) ? _t16 : _t13);
  assign _t20 = _t19[15:0];
  assign _t21 = _t19[47:24];
  assign _t22 = {_t21, d, _t20};
  assign _t23 = (idx == 6'd8);
  assign _t24 = ((|_t11) && (|_t23));
  assign _t25 = ((|_t24) ? _t22 : _t19);
  assign _t26 = _t25[23:0];
  assign _t27 = _t25[47:32];
  assign _t28 = {_t27, d, _t26};
  assign _t29 = (idx == 6'd9);
  assign _t30 = ((|_t11) && (|_t29));
  assign _t31 = ((|_t30) ? _t28 : _t25);
  assign _t32 = _t31[31:0];
  assign _t33 = _t31[47:40];
  assign _t34 = {_t33, d, _t32};
  assign _t35 = (idx == 6'd10);
  assign _t36 = ((|_t11) && (|_t35));
  assign _t37 = ((|_t36) ? _t34 : _t31);
  assign _t38 = _t37[39:0];
  assign _t39 = {d, _t38};
  assign _t40 = (idx == 6'd11);
  assign _t41 = ((|_t11) && (|_t40));
  assign _t42 = tip[31:8];
  assign _t43 = {_t42, d};
  assign _t44 = (idx == 6'd26);
  assign _t45 = ((|_t11) && (|_t44));
  assign _t46 = aip[31:8];
  assign _t47 = {_t46, d};
  assign _t48 = (idx == 6'd28);
  assign _t49 = ((|_t11) && (|_t48));
  assign _t50 = ((|_t45) ? _t43 : tip);
  assign _t51 = _t50[7:0];
  assign _t52 = _t50[31:16];
  assign _t53 = {_t52, d, _t51};
  assign _t54 = (idx == 6'd27);
  assign _t55 = ((|_t11) && (|_t54));
  assign _t56 = ((|_t49) ? _t47 : aip);
  assign _t57 = _t56[7:0];
  assign _t58 = _t56[31:16];
  assign _t59 = {_t58, d, _t57};
  assign _t60 = (idx == 6'd29);
  assign _t61 = ((|_t11) && (|_t60));
  assign _t62 = ((|_t55) ? _t53 : _t50);
  assign _t63 = _t62[15:0];
  assign _t64 = _t62[31:24];
  assign _t65 = {_t64, d, _t63};
  assign _t66 = (idx == 6'd28);
  assign _t67 = ((|_t11) && (|_t66));
  assign _t68 = ((|_t61) ? _t59 : _t56);
  assign _t69 = _t68[15:0];
  assign _t70 = _t68[31:24];
  assign _t71 = {_t70, d, _t69};
  assign _t72 = (idx == 6'd30);
  assign _t73 = ((|_t11) && (|_t72));
  assign _t74 = ((|_t67) ? _t65 : _t62);
  assign _t75 = _t74[23:0];
  assign _t76 = {d, _t75};
  assign _t77 = (idx == 6'd29);
  assign _t78 = ((|_t11) && (|_t77));
  assign _t79 = ((|_t73) ? _t71 : _t68);
  assign _t80 = _t79[23:0];
  assign _t81 = {d, _t80};
  assign _t82 = (idx == 6'd31);
  assign _t83 = ((|_t11) && (|_t82));
  assign _t84 = tprt[7:0];
  assign _t85 = {d, _t84};
  assign _t86 = (idx == 6'd34);
  assign _t87 = ((|_t11) && (|_t86));
  assign _t88 = ((|_t87) ? _t85 : tprt);
  assign _t89 = _t88[15:8];
  assign _t90 = {_t89, d};
  assign _t91 = (idx == 6'd35);
  assign _t92 = ((|_t11) && (|_t91));
  assign _t93 = left[7:0];
  assign _t94 = {d, _t93};
  assign _t95 = (idx == 6'd38);
  assign _t96 = ((|_t11) && (|_t95));
  assign _t97 = {8'b0, d};
  assign _t98 = left[15:8];
  assign _t99 = {8'b0, _t98};
  assign _t100 = (_t99 << 32'd8);
  assign _t101 = (_t100 + _t97);
  assign _t102 = ((|_t96) ? _t94 : left);
  assign _t103 = (_t101 - 16'd8);
  assign _t104 = (idx == 6'd39);
  assign _t105 = ((|_t11) && (|_t104));
  assign _t106 = (d != 8'd255);
  assign _t107 = (idx < 6'd6);
  assign _t108 = ((|_t107) && (|_t106));
  assign _t109 = ((|_t11) && (|_t108));
  assign _t110 = ((|_t105) ? _t103 : _t102);
  assign _t111 = (left - 16'd1);
  assign _t112 = (left != 16'd0);
  assign _t113 = ((|pay) && (|oku));
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t11) && (|_t114));
  assign _t116 = ((|_t11) && (|i_last));
  assign _t117 = ((|_t11) && (|i_last));
  assign _t118 = ((|_t11) && (|i_last));
  assign _t119 = ((|_t109) ? 1'd0 : bc);
  assign _t120 = ((|_t11) && (|i_last));
  assign _t121 = ((|_t116) ? 6'd0 : idx);
  assign _t122 = (idx + 6'd1);
  assign _t123 = (~pay);
  assign _t124 = (~i_last);
  assign _t125 = ((|_t11) && (|_t124));
  assign _t126 = ((|_t125) && (|_t123));
  assign _t127 = ((|_t117) ? 1'd1 : oku);
  assign _t128 = (d != 8'd2);
  assign _t129 = (idx == 6'd33);
  assign _t130 = ((|_t129) && (|_t128));
  assign _t131 = (d != 8'd77);
  assign _t132 = (idx == 6'd32);
  assign _t133 = ((|_t132) && (|_t131));
  assign _t134 = (d != 8'd168);
  assign _t135 = (idx == 6'd31);
  assign _t136 = ((|_t135) && (|_t134));
  assign _t137 = (d != 8'd192);
  assign _t138 = (idx == 6'd30);
  assign _t139 = ((|_t138) && (|_t137));
  assign _t140 = (d != 8'd138);
  assign _t141 = (idx == 6'd37);
  assign _t142 = ((|_t141) && (|_t140));
  assign _t143 = (d != 8'd142);
  assign _t144 = (idx == 6'd36);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = (d != 8'd17);
  assign _t147 = (idx == 6'd23);
  assign _t148 = ((|_t147) && (|_t146));
  assign _t149 = (d != 8'd69);
  assign _t150 = (idx == 6'd14);
  assign _t151 = ((|_t150) && (|_t149));
  assign _t152 = (d != 8'd0);
  assign _t153 = (idx == 6'd13);
  assign _t154 = ((|_t153) && (|_t152));
  assign _t155 = (d != 8'd8);
  assign _t156 = (idx == 6'd12);
  assign _t157 = ((|_t156) && (|_t155));
  assign _t158 = (d == 8'd255);
  assign _t159 = ((|bc) && (|_t158));
  assign _t160 = (~_t159);
  assign _t161 = (d != 8'd1);
  assign _t162 = (idx == 6'd5);
  assign _t163 = ((|_t162) && (|_t161));
  assign _t164 = ((|_t163) && (|_t160));
  assign _t165 = (d == 8'd255);
  assign _t166 = ((|bc) && (|_t165));
  assign _t167 = (~_t166);
  assign _t168 = (d != 8'd0);
  assign _t169 = (idx == 6'd4);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t170) && (|_t167));
  assign _t172 = (d == 8'd255);
  assign _t173 = ((|bc) && (|_t172));
  assign _t174 = (~_t173);
  assign _t175 = (d != 8'd56);
  assign _t176 = (idx == 6'd3);
  assign _t177 = ((|_t176) && (|_t175));
  assign _t178 = ((|_t177) && (|_t174));
  assign _t179 = (d == 8'd255);
  assign _t180 = ((|bc) && (|_t179));
  assign _t181 = (~_t180);
  assign _t182 = (d != 8'd76);
  assign _t183 = (idx == 6'd2);
  assign _t184 = ((|_t183) && (|_t182));
  assign _t185 = ((|_t184) && (|_t181));
  assign _t186 = (d == 8'd255);
  assign _t187 = ((|bc) && (|_t186));
  assign _t188 = (~_t187);
  assign _t189 = (d != 8'd0);
  assign _t190 = (idx == 6'd1);
  assign _t191 = ((|_t190) && (|_t189));
  assign _t192 = ((|_t191) && (|_t188));
  assign _t193 = (d == 8'd255);
  assign _t194 = ((|bc) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (d != 8'd2);
  assign _t197 = (idx == 6'd0);
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = ((|_t198) && (|_t195));
  assign _t200 = ((|1'd0) || (|_t199));
  assign _t201 = ((|_t200) || (|_t192));
  assign _t202 = ((|_t201) || (|_t185));
  assign _t203 = ((|_t202) || (|_t178));
  assign _t204 = ((|_t203) || (|_t171));
  assign _t205 = ((|_t204) || (|_t164));
  assign _t206 = ((|_t205) || (|_t157));
  assign _t207 = ((|_t206) || (|_t154));
  assign _t208 = ((|_t207) || (|_t151));
  assign _t209 = ((|_t208) || (|_t148));
  assign _t210 = ((|_t209) || (|_t145));
  assign _t211 = ((|_t210) || (|_t142));
  assign _t212 = ((|_t211) || (|_t139));
  assign _t213 = ((|_t212) || (|_t136));
  assign _t214 = ((|_t213) || (|_t133));
  assign _t215 = ((|_t214) || (|_t130));
  assign _t216 = ((|_t11) && (|_t124));
  assign _t217 = ((|_t216) && (|_t215));
  assign _t218 = ((|_t118) ? 1'd1 : oka);
  assign _t219 = (d != 8'd2);
  assign _t220 = (idx == 6'd41);
  assign _t221 = ((|_t220) && (|_t219));
  assign _t222 = (d != 8'd77);
  assign _t223 = (idx == 6'd40);
  assign _t224 = ((|_t223) && (|_t222));
  assign _t225 = (d != 8'd168);
  assign _t226 = (idx == 6'd39);
  assign _t227 = ((|_t226) && (|_t225));
  assign _t228 = (d != 8'd192);
  assign _t229 = (idx == 6'd38);
  assign _t230 = ((|_t229) && (|_t228));
  assign _t231 = (d != 8'd1);
  assign _t232 = (idx == 6'd21);
  assign _t233 = ((|_t232) && (|_t231));
  assign _t234 = (d != 8'd0);
  assign _t235 = (idx == 6'd20);
  assign _t236 = ((|_t235) && (|_t234));
  assign _t237 = (d != 8'd6);
  assign _t238 = (idx == 6'd13);
  assign _t239 = ((|_t238) && (|_t237));
  assign _t240 = (d != 8'd8);
  assign _t241 = (idx == 6'd12);
  assign _t242 = ((|_t241) && (|_t240));
  assign _t243 = ((|_t205) || (|_t242));
  assign _t244 = ((|_t243) || (|_t239));
  assign _t245 = ((|_t244) || (|_t236));
  assign _t246 = ((|_t245) || (|_t233));
  assign _t247 = ((|_t246) || (|_t230));
  assign _t248 = ((|_t247) || (|_t227));
  assign _t249 = ((|_t248) || (|_t224));
  assign _t250 = ((|_t249) || (|_t221));
  assign _t251 = ((|_t11) && (|_t124));
  assign _t252 = ((|_t251) && (|_t250));
  assign _t253 = (idx == 6'd41);
  assign _t254 = (~_t215);
  assign _t255 = ((|oku) && (|_t254));
  assign _t256 = ((|_t255) && (|_t253));
  assign _t257 = ((|_t11) && (|_t256));
  assign _t258 = ((|_t11) && (|_t256));
  assign _t259 = ((|_t11) && (|_t256));
  assign _t260 = ((|_t11) && (|_t256));
  assign _t261 = (n + 16'd1);
  assign _t262 = ((|_t11) && (|_t256));
  assign d = i_data;
  assign pay = (idx == 6'd42);
  assign o_valid = ((|_t2) && (|_t0));
  assign o_data = d;
  assign o_last = (left == 16'd1);
  assign i_ready = ((|_t7) ? 1'd1 : _t6);
  assign _t263 = ((|_t41) ? _t39 : _t37);
  assign _t264 = ((|_t78) ? _t76 : _t74);
  assign _t265 = ((|_t83) ? _t81 : _t79);
  assign _t266 = ((|_t92) ? _t90 : _t88);
  assign _t267 = ((|_t115) ? _t111 : _t110);
  assign _t268 = ((|_t120) ? 1'd1 : _t119);
  assign _t269 = ((|_t126) ? _t122 : _t121);
  assign _t270 = ((|_t217) ? 1'd0 : _t127);
  assign _t271 = ((|_t252) ? 1'd0 : _t218);
  assign _t272 = ((|_t257) ? 1'd1 : pv);
  assign _t273 = ((|_t258) ? tmac : pmac);
  assign _t274 = ((|_t259) ? tip : pip);
  assign _t275 = ((|_t260) ? tprt : pprt);
  assign _t276 = ((|_t262) ? _t261 : n);
  assign _t277 = ((|ask_ack) ? 1'd0 : av);
  assign peer_valid = pv;
  assign peer_mac = pmac;
  assign peer_ip = pip;
  assign peer_port = pprt;
  assign ask_valid = av;
  assign ask_mac = amac;
  assign ask_ip = arip;
  assign amac = 48'd0;
  assign arip = 32'd0;
  always @(posedge clk) begin
    if (rst) begin
      idx <= 6'd0;
      oku <= 1'd1;
      oka <= 1'd1;
      bc <= 1'd1;
      left <= 16'd0;
      n <= 16'd0;
      pv <= 1'd0;
      pmac <= 48'd0;
      pip <= 32'd0;
      pprt <= 16'd0;
      tmac <= 48'd0;
      tip <= 32'd0;
      tprt <= 16'd0;
      aip <= 32'd0;
      av <= 1'd0;
    end else begin
      idx <= _t269;
      oku <= _t270;
      oka <= _t271;
      bc <= _t268;
      left <= _t267;
      n <= _t276;
      pv <= _t272;
      pmac <= _t273;
      pip <= _t274;
      pprt <= _t275;
      tmac <= _t263;
      tip <= _t264;
      tprt <= _t266;
      aip <= _t265;
      av <= _t277;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ip4_tx_36490_2200301993985_3232255234_2048_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  input  wire peer_valid,
  input  wire [47:0] peer_mac,
  input  wire [31:0] peer_ip,
  input  wire [15:0] peer_port,
  input  wire ask_valid,
  input  wire [47:0] ask_mac,
  input  wire [31:0] ask_ip,
  output wire ask_ack,
  output reg  [15:0] n,
  output reg  [15:0] na
);
  reg  [15:0] len;
  reg  [31:0] acc;
  reg  [31:0] iac;
  reg  [15:0] ck;
  reg  [15:0] ick;
  reg  [5:0] hi;
  reg  [47:0] dmac;
  reg  [31:0] dip;
  reg  [15:0] dprt;
  wire [15:0] ulen;
  wire [15:0] tlen;
  wire [31:0] dipw;
  wire [7:0] hb;
  wire [7:0] ab;
  wire w;
  wire cm;
  wire full;
  wire ffull;
  wire [7:0] fo_data;
  wire fo_last;
  wire fo_valid;
  wire fo_ready;
  reg  [2:0] ut3_state;
  wire [7:0] _t0;
  wire [31:0] _t1;
  wire [7:0] _t2;
  wire [31:0] _t3;
  wire [31:0] _t4;
  wire [7:0] _t5;
  wire [31:0] _t6;
  wire [7:0] _t7;
  wire [31:0] _t8;
  wire [31:0] _t9;
  wire [31:0] _t10;
  wire [31:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire _t15;
  wire [7:0] _t16;
  wire [7:0] _t17;
  wire _t18;
  wire [7:0] _t19;
  wire _t20;
  wire [7:0] _t21;
  wire [7:0] _t22;
  wire _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire _t30;
  wire [7:0] _t31;
  wire [7:0] _t32;
  wire _t33;
  wire [7:0] _t34;
  wire _t35;
  wire [7:0] _t36;
  wire [7:0] _t37;
  wire _t38;
  wire [7:0] _t39;
  wire _t40;
  wire [7:0] _t41;
  wire _t42;
  wire [7:0] _t43;
  wire _t44;
  wire [7:0] _t45;
  wire [7:0] _t46;
  wire _t47;
  wire [7:0] _t48;
  wire [7:0] _t49;
  wire _t50;
  wire [7:0] _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire [7:0] _t55;
  wire _t56;
  wire [7:0] _t57;
  wire [7:0] _t58;
  wire _t59;
  wire [7:0] _t60;
  wire [7:0] _t61;
  wire _t62;
  wire [7:0] _t63;
  wire _t64;
  wire [7:0] _t65;
  wire [7:0] _t66;
  wire _t67;
  wire [7:0] _t68;
  wire _t69;
  wire [7:0] _t70;
  wire [7:0] _t71;
  wire _t72;
  wire [7:0] _t73;
  wire _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire _t77;
  wire [7:0] _t78;
  wire _t79;
  wire [7:0] _t80;
  wire [7:0] _t81;
  wire _t82;
  wire [7:0] _t83;
  wire _t84;
  wire [7:0] _t85;
  wire _t86;
  wire [7:0] _t87;
  wire [7:0] _t88;
  wire _t89;
  wire [7:0] _t90;
  wire [7:0] _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [7:0] _t94;
  wire _t95;
  wire [7:0] _t96;
  wire [7:0] _t97;
  wire _t98;
  wire [7:0] _t99;
  wire [7:0] _t100;
  wire _t101;
  wire [7:0] _t102;
  wire [7:0] _t103;
  wire _t104;
  wire [7:0] _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire [7:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire [7:0] _t113;
  wire [7:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire [7:0] _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire [7:0] _t122;
  wire [7:0] _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire [7:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire [7:0] _t131;
  wire [7:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire [7:0] _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire [7:0] _t140;
  wire [7:0] _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire [7:0] _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire [7:0] _t149;
  wire [7:0] _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [7:0] _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire [7:0] _t158;
  wire _t159;
  wire [7:0] _t160;
  wire [7:0] _t161;
  wire _t162;
  wire [7:0] _t163;
  wire _t164;
  wire [7:0] _t165;
  wire [7:0] _t166;
  wire _t167;
  wire [7:0] _t168;
  wire _t169;
  wire [7:0] _t170;
  wire [7:0] _t171;
  wire _t172;
  wire [7:0] _t173;
  wire _t174;
  wire [7:0] _t175;
  wire [7:0] _t176;
  wire _t177;
  wire [7:0] _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [7:0] _t182;
  wire _t183;
  wire [7:0] _t184;
  wire _t185;
  wire [7:0] _t186;
  wire _t187;
  wire [7:0] _t188;
  wire _t189;
  wire [7:0] _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire [15:0] _t210;
  wire _t211;
  wire _t212;
  wire [31:0] _t213;
  wire [31:0] _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire [31:0] _t219;
  wire [31:0] _t220;
  wire [31:0] _t221;
  wire [31:0] _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire [47:0] _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire [31:0] _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire [15:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [2:0] _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [2:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire _t274;
  wire _t275;
  wire [7:0] _t276;
  wire _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire _t281;
  wire [31:0] _t282;
  wire [31:0] _t283;
  wire [31:0] _t284;
  wire [31:0] _t285;
  wire [31:0] _t286;
  wire _t287;
  wire [31:0] _t288;
  wire _t289;
  wire [2:0] _t290;
  wire _t291;
  wire _t292;
  wire _t293;
  wire _t294;
  wire _t295;
  wire _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire [7:0] _t302;
  wire _t303;
  wire _t304;
  wire _t305;
  wire _t306;
  wire _t307;
  wire [31:0] _t308;
  wire [31:0] _t309;
  wire [31:0] _t310;
  wire [31:0] _t311;
  wire [31:0] _t312;
  wire _t313;
  wire [31:0] _t314;
  wire [31:0] _t315;
  wire [31:0] _t316;
  wire _t317;
  wire [2:0] _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire _t323;
  wire _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [7:0] _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire _t334;
  wire _t335;
  wire [15:0] _t336;
  wire [31:0] _t337;
  wire [15:0] _t338;
  wire [31:0] _t339;
  wire [31:0] _t340;
  wire [31:0] _t341;
  wire [15:0] _t342;
  wire _t343;
  wire [15:0] _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire [15:0] _t349;
  wire [31:0] _t350;
  wire [15:0] _t351;
  wire [31:0] _t352;
  wire [31:0] _t353;
  wire [31:0] _t354;
  wire _t355;
  wire _t356;
  wire [2:0] _t357;
  wire _t358;
  wire _t359;
  wire [15:0] _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire [15:0] _t366;
  wire [15:0] _t367;
  wire [15:0] _t368;
  wire _t369;
  wire _t370;
  wire _t371;
  wire _t372;
  wire [15:0] _t373;
  wire [15:0] _t374;
  wire _t375;
  wire _t376;
  wire [5:0] _t377;
  wire _t378;
  wire _t379;
  wire [2:0] _t380;
  wire _t381;
  wire _t382;
  wire _t383;
  wire _t384;
  wire _t385;
  wire _t386;
  wire _t387;
  wire _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire _t392;
  wire [7:0] _t393;
  wire _t394;
  wire _t395;
  wire _t396;
  wire _t397;
  wire _t398;
  wire [5:0] _t399;
  wire [5:0] _t400;
  wire _t401;
  wire _t402;
  wire [2:0] _t403;
  wire _t404;
  wire _t405;
  wire _t406;
  wire _t407;
  wire [2:0] _t408;
  wire _t409;
  wire _t410;
  wire _t411;
  wire _t412;
  wire _t413;
  wire _t414;
  wire _t415;
  wire _t416;
  wire _t417;
  wire _t418;
  wire _t419;
  wire _t420;
  wire _t421;
  wire [7:0] _t422;
  wire _t423;
  wire _t424;
  wire _t425;
  wire _t426;
  wire _t427;
  wire [15:0] _t428;
  wire _t429;
  wire _t430;
  wire _t431;
  wire _t432;
  wire [31:0] _t433;
  wire _t434;
  wire _t435;
  wire [15:0] _t436;
  wire _t437;
  wire _t438;
  wire [2:0] _t439;
  wire _t440;
  wire _t441;
  wire [2:0] _t442;
  wire _t443;
  wire _t444;
  wire _t445;
  wire _t446;
  wire _t447;
  wire _t448;
  wire _t449;
  wire _t450;
  wire _t451;
  wire _t452;
  wire _t453;
  wire _t454;
  wire _t455;
  wire _t456;
  wire [7:0] _t457;
  wire _t458;
  wire _t459;
  wire _t460;
  wire _t461;
  wire _t462;
  wire _t463;
  wire _t464;
  wire [5:0] _t465;
  wire [5:0] _t466;
  wire _t467;
  wire _t468;
  wire [15:0] _t469;
  wire _t470;
  wire _t471;
  wire _t472;
  wire _t473;
  wire [2:0] _t474;
  wire _t475;
  wire _t476;
  wire [2:0] _t477;
  wire _t478;
  wire _t479;
  wire _t480;
  wire [15:0] _t481;
  wire [31:0] _t482;
  wire [47:0] _t483;
  wire [31:0] _t484;
  wire [15:0] _t485;
  wire [2:0] _t486;
  wire [5:0] _t487;
  wire [31:0] _t488;
  wire [15:0] _t489;
  wire [15:0] _t490;
  wire [15:0] _t491;
  wire [15:0] _t492;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  assign _t0 = dip[31:24];
  assign _t1 = {24'b0, _t0};
  assign _t2 = dip[23:16];
  assign _t3 = {24'b0, _t2};
  assign _t4 = (_t3 << 32'd8);
  assign _t5 = dip[15:8];
  assign _t6 = {24'b0, _t5};
  assign _t7 = dip[7:0];
  assign _t8 = {24'b0, _t7};
  assign _t9 = (_t8 << 32'd8);
  assign _t10 = (_t9 + _t6);
  assign _t11 = (_t10 + _t4);
  assign _t12 = dmac[7:0];
  assign _t13 = (hi == 6'd0);
  assign _t14 = ((|_t13) ? _t12 : 8'd0);
  assign _t15 = (hi == 6'd6);
  assign _t16 = ((|_t15) ? 8'd2 : _t14);
  assign _t17 = dmac[15:8];
  assign _t18 = (hi == 6'd1);
  assign _t19 = ((|_t18) ? _t17 : _t16);
  assign _t20 = (hi == 6'd7);
  assign _t21 = ((|_t20) ? 8'd0 : _t19);
  assign _t22 = dmac[23:16];
  assign _t23 = (hi == 6'd2);
  assign _t24 = ((|_t23) ? _t22 : _t21);
  assign _t25 = (hi == 6'd8);
  assign _t26 = ((|_t25) ? 8'd76 : _t24);
  assign _t27 = dmac[31:24];
  assign _t28 = (hi == 6'd3);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = (hi == 6'd9);
  assign _t31 = ((|_t30) ? 8'd56 : _t29);
  assign _t32 = dmac[39:32];
  assign _t33 = (hi == 6'd4);
  assign _t34 = ((|_t33) ? _t32 : _t31);
  assign _t35 = (hi == 6'd10);
  assign _t36 = ((|_t35) ? 8'd0 : _t34);
  assign _t37 = dmac[47:40];
  assign _t38 = (hi == 6'd5);
  assign _t39 = ((|_t38) ? _t37 : _t36);
  assign _t40 = (hi == 6'd11);
  assign _t41 = ((|_t40) ? 8'd1 : _t39);
  assign _t42 = (hi == 6'd12);
  assign _t43 = ((|_t42) ? 8'd8 : _t41);
  assign _t44 = (hi == 6'd14);
  assign _t45 = ((|_t44) ? 8'd69 : _t43);
  assign _t46 = tlen[15:8];
  assign _t47 = (hi == 6'd16);
  assign _t48 = ((|_t47) ? _t46 : _t45);
  assign _t49 = tlen[7:0];
  assign _t50 = (hi == 6'd17);
  assign _t51 = ((|_t50) ? _t49 : _t48);
  assign _t52 = (hi == 6'd20);
  assign _t53 = ((|_t52) ? 8'd64 : _t51);
  assign _t54 = (hi == 6'd22);
  assign _t55 = ((|_t54) ? 8'd64 : _t53);
  assign _t56 = (hi == 6'd23);
  assign _t57 = ((|_t56) ? 8'd17 : _t55);
  assign _t58 = ick[15:8];
  assign _t59 = (hi == 6'd24);
  assign _t60 = ((|_t59) ? _t58 : _t57);
  assign _t61 = ick[7:0];
  assign _t62 = (hi == 6'd25);
  assign _t63 = ((|_t62) ? _t61 : _t60);
  assign _t64 = (hi == 6'd26);
  assign _t65 = ((|_t64) ? 8'd192 : _t63);
  assign _t66 = dip[7:0];
  assign _t67 = (hi == 6'd30);
  assign _t68 = ((|_t67) ? _t66 : _t65);
  assign _t69 = (hi == 6'd27);
  assign _t70 = ((|_t69) ? 8'd168 : _t68);
  assign _t71 = dip[15:8];
  assign _t72 = (hi == 6'd31);
  assign _t73 = ((|_t72) ? _t71 : _t70);
  assign _t74 = (hi == 6'd28);
  assign _t75 = ((|_t74) ? 8'd77 : _t73);
  assign _t76 = dip[23:16];
  assign _t77 = (hi == 6'd32);
  assign _t78 = ((|_t77) ? _t76 : _t75);
  assign _t79 = (hi == 6'd29);
  assign _t80 = ((|_t79) ? 8'd2 : _t78);
  assign _t81 = dip[31:24];
  assign _t82 = (hi == 6'd33);
  assign _t83 = ((|_t82) ? _t81 : _t80);
  assign _t84 = (hi == 6'd34);
  assign _t85 = ((|_t84) ? 8'd142 : _t83);
  assign _t86 = (hi == 6'd35);
  assign _t87 = ((|_t86) ? 8'd138 : _t85);
  assign _t88 = dprt[15:8];
  assign _t89 = (hi == 6'd36);
  assign _t90 = ((|_t89) ? _t88 : _t87);
  assign _t91 = dprt[7:0];
  assign _t92 = (hi == 6'd37);
  assign _t93 = ((|_t92) ? _t91 : _t90);
  assign _t94 = ulen[15:8];
  assign _t95 = (hi == 6'd38);
  assign _t96 = ((|_t95) ? _t94 : _t93);
  assign _t97 = ulen[7:0];
  assign _t98 = (hi == 6'd39);
  assign _t99 = ((|_t98) ? _t97 : _t96);
  assign _t100 = ck[15:8];
  assign _t101 = (hi == 6'd40);
  assign _t102 = ((|_t101) ? _t100 : _t99);
  assign _t103 = ck[7:0];
  assign _t104 = (hi == 6'd41);
  assign _t105 = ask_mac[7:0];
  assign _t106 = (hi == 6'd32);
  assign _t107 = (hi == 6'd0);
  assign _t108 = ((|_t107) || (|_t106));
  assign _t109 = ((|_t108) ? _t105 : 8'd0);
  assign _t110 = (hi == 6'd22);
  assign _t111 = (hi == 6'd6);
  assign _t112 = ((|_t111) || (|_t110));
  assign _t113 = ((|_t112) ? 8'd2 : _t109);
  assign _t114 = ask_mac[15:8];
  assign _t115 = (hi == 6'd33);
  assign _t116 = (hi == 6'd1);
  assign _t117 = ((|_t116) || (|_t115));
  assign _t118 = ((|_t117) ? _t114 : _t113);
  assign _t119 = (hi == 6'd23);
  assign _t120 = (hi == 6'd7);
  assign _t121 = ((|_t120) || (|_t119));
  assign _t122 = ((|_t121) ? 8'd0 : _t118);
  assign _t123 = ask_mac[23:16];
  assign _t124 = (hi == 6'd34);
  assign _t125 = (hi == 6'd2);
  assign _t126 = ((|_t125) || (|_t124));
  assign _t127 = ((|_t126) ? _t123 : _t122);
  assign _t128 = (hi == 6'd24);
  assign _t129 = (hi == 6'd8);
  assign _t130 = ((|_t129) || (|_t128));
  assign _t131 = ((|_t130) ? 8'd76 : _t127);
  assign _t132 = ask_mac[31:24];
  assign _t133 = (hi == 6'd35);
  assign _t134 = (hi == 6'd3);
  assign _t135 = ((|_t134) || (|_t133));
  assign _t136 = ((|_t135) ? _t132 : _t131);
  assign _t137 = (hi == 6'd25);
  assign _t138 = (hi == 6'd9);
  assign _t139 = ((|_t138) || (|_t137));
  assign _t140 = ((|_t139) ? 8'd56 : _t136);
  assign _t141 = ask_mac[39:32];
  assign _t142 = (hi == 6'd36);
  assign _t143 = (hi == 6'd4);
  assign _t144 = ((|_t143) || (|_t142));
  assign _t145 = ((|_t144) ? _t141 : _t140);
  assign _t146 = (hi == 6'd26);
  assign _t147 = (hi == 6'd10);
  assign _t148 = ((|_t147) || (|_t146));
  assign _t149 = ((|_t148) ? 8'd0 : _t145);
  assign _t150 = ask_mac[47:40];
  assign _t151 = (hi == 6'd37);
  assign _t152 = (hi == 6'd5);
  assign _t153 = ((|_t152) || (|_t151));
  assign _t154 = ((|_t153) ? _t150 : _t149);
  assign _t155 = (hi == 6'd27);
  assign _t156 = (hi == 6'd11);
  assign _t157 = ((|_t156) || (|_t155));
  assign _t158 = ((|_t157) ? 8'd1 : _t154);
  assign _t159 = (hi == 6'd28);
  assign _t160 = ((|_t159) ? 8'd192 : _t158);
  assign _t161 = ask_ip[7:0];
  assign _t162 = (hi == 6'd38);
  assign _t163 = ((|_t162) ? _t161 : _t160);
  assign _t164 = (hi == 6'd29);
  assign _t165 = ((|_t164) ? 8'd168 : _t163);
  assign _t166 = ask_ip[15:8];
  assign _t167 = (hi == 6'd39);
  assign _t168 = ((|_t167) ? _t166 : _t165);
  assign _t169 = (hi == 6'd30);
  assign _t170 = ((|_t169) ? 8'd77 : _t168);
  assign _t171 = ask_ip[23:16];
  assign _t172 = (hi == 6'd40);
  assign _t173 = ((|_t172) ? _t171 : _t170);
  assign _t174 = (hi == 6'd31);
  assign _t175 = ((|_t174) ? 8'd2 : _t173);
  assign _t176 = ask_ip[31:24];
  assign _t177 = (hi == 6'd41);
  assign _t178 = ((|_t177) ? _t176 : _t175);
  assign _t179 = (hi == 6'd12);
  assign _t180 = ((|_t179) ? 8'd8 : _t178);
  assign _t181 = (hi == 6'd13);
  assign _t182 = ((|_t181) ? 8'd6 : _t180);
  assign _t183 = (hi == 6'd15);
  assign _t184 = ((|_t183) ? 8'd1 : _t182);
  assign _t185 = (hi == 6'd16);
  assign _t186 = ((|_t185) ? 8'd8 : _t184);
  assign _t187 = (hi == 6'd18);
  assign _t188 = ((|_t187) ? 8'd6 : _t186);
  assign _t189 = (hi == 6'd19);
  assign _t190 = ((|_t189) ? 8'd4 : _t188);
  assign _t191 = (hi == 6'd21);
  assign _t192 = ((|peer_valid) || (|1'd1));
  assign _t193 = (len == 16'd0);
  assign _t194 = ((|ask_valid) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (~full);
  assign _t197 = ((|_t196) && (|_t195));
  assign _t198 = ((|_t197) && (|_t192));
  assign _t199 = ({29'b0, ut3_state} == 32'd0);
  assign _t200 = ((|t_valid) && (|t_ready));
  assign _t201 = ({29'b0, ut3_state} == 32'd0);
  assign _t202 = ((|t_valid) && (|t_ready));
  assign _t203 = ((|_t202) && (|t_last));
  assign _t204 = ({29'b0, ut3_state} == 32'd0);
  assign _t205 = ({29'b0, ut3_state} == 32'd0);
  assign _t206 = ({29'b0, ut3_state} == 32'd0);
  assign _t207 = ({29'b0, ut3_state} == 32'd0);
  assign _t208 = ({29'b0, ut3_state} == 32'd0);
  assign _t209 = ({29'b0, ut3_state} == 32'd0);
  assign _t210 = (len + 16'd1);
  assign _t211 = ({29'b0, ut3_state} == 32'd0);
  assign _t212 = ((|_t211) && (|w));
  assign _t213 = {24'b0, t_data};
  assign _t214 = (acc + _t213);
  assign _t215 = len[0];
  assign _t216 = ((|w) && (|_t215));
  assign _t217 = ({29'b0, ut3_state} == 32'd0);
  assign _t218 = ((|_t217) && (|_t216));
  assign _t219 = {24'b0, t_data};
  assign _t220 = (_t219 << 32'd8);
  assign _t221 = ((|_t218) ? _t214 : acc);
  assign _t222 = (acc + _t220);
  assign _t223 = (~_t215);
  assign _t224 = ((|w) && (|_t223));
  assign _t225 = ({29'b0, ut3_state} == 32'd0);
  assign _t226 = ((|_t225) && (|_t224));
  assign _t227 = ((|cm) && (|peer_valid));
  assign _t228 = ({29'b0, ut3_state} == 32'd0);
  assign _t229 = ((|_t228) && (|_t227));
  assign _t230 = ((|cm) && (|peer_valid));
  assign _t231 = ({29'b0, ut3_state} == 32'd0);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = ((|cm) && (|peer_valid));
  assign _t234 = ({29'b0, ut3_state} == 32'd0);
  assign _t235 = ((|_t234) && (|_t233));
  assign _t236 = ((|_t229) ? peer_mac : dmac);
  assign _t237 = (~peer_valid);
  assign _t238 = ((|cm) && (|_t237));
  assign _t239 = ({29'b0, ut3_state} == 32'd0);
  assign _t240 = ((|_t239) && (|_t238));
  assign _t241 = ((|_t232) ? peer_ip : dip);
  assign _t242 = ((|cm) && (|_t237));
  assign _t243 = ({29'b0, ut3_state} == 32'd0);
  assign _t244 = ((|_t243) && (|_t242));
  assign _t245 = ((|_t235) ? peer_port : dprt);
  assign _t246 = ((|cm) && (|_t237));
  assign _t247 = ({29'b0, ut3_state} == 32'd0);
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ({29'b0, ut3_state} == 32'd0);
  assign _t250 = ((|_t249) && (|cm));
  assign _t251 = (len == 16'd0);
  assign _t252 = ((|ask_valid) && (|_t251));
  assign _t253 = (~cm);
  assign _t254 = ((|_t253) && (|_t252));
  assign _t255 = ({29'b0, ut3_state} == 32'd0);
  assign _t256 = ((|_t255) && (|_t254));
  assign _t257 = ((|_t250) ? 32'd1 : ut3_state);
  assign _t258 = ((|_t253) && (|_t252));
  assign _t259 = ({29'b0, ut3_state} == 32'd0);
  assign _t260 = ((|_t259) && (|_t258));
  assign _t261 = ((|_t260) ? 32'd6 : _t257);
  assign _t262 = (~_t252);
  assign _t263 = ((|_t253) && (|_t262));
  assign _t264 = ({29'b0, ut3_state} == 32'd0);
  assign _t265 = ((|_t264) && (|_t263));
  assign _t266 = ((|_t199) ? _t198 : 1'd0);
  assign _t267 = ({29'b0, ut3_state} == 32'd1);
  assign _t268 = ((|_t201) ? _t200 : 1'd0);
  assign _t269 = ({29'b0, ut3_state} == 32'd1);
  assign _t270 = ((|_t204) ? _t203 : 1'd0);
  assign _t271 = ({29'b0, ut3_state} == 32'd1);
  assign _t272 = ((|_t205) ? 1'd0 : 1'd0);
  assign _t273 = ({29'b0, ut3_state} == 32'd1);
  assign _t274 = ((|_t206) ? 1'd0 : 1'd0);
  assign _t275 = ({29'b0, ut3_state} == 32'd1);
  assign _t276 = ((|_t207) ? hb : 8'd0);
  assign _t277 = ({29'b0, ut3_state} == 32'd1);
  assign _t278 = ((|_t208) ? 1'd0 : 1'd0);
  assign _t279 = ({29'b0, ut3_state} == 32'd1);
  assign _t280 = ((|_t209) ? 1'd0 : 1'd0);
  assign _t281 = ({29'b0, ut3_state} == 32'd1);
  assign _t282 = {16'b0, dprt};
  assign _t283 = (acc + dipw);
  assign _t284 = (_t283 + _t282);
  assign _t285 = ((|_t226) ? _t222 : _t221);
  assign _t286 = (_t284 + 32'd105541);
  assign _t287 = ({29'b0, ut3_state} == 32'd1);
  assign _t288 = (dipw + 32'd119483);
  assign _t289 = ({29'b0, ut3_state} == 32'd1);
  assign _t290 = ((|_t265) ? 32'd0 : _t261);
  assign _t291 = ({29'b0, ut3_state} == 32'd1);
  assign _t292 = ((|_t267) ? 1'd0 : _t266);
  assign _t293 = ({29'b0, ut3_state} == 32'd2);
  assign _t294 = ((|_t269) ? 1'd0 : _t268);
  assign _t295 = ({29'b0, ut3_state} == 32'd2);
  assign _t296 = ((|_t271) ? 1'd0 : _t270);
  assign _t297 = ({29'b0, ut3_state} == 32'd2);
  assign _t298 = ((|_t273) ? 1'd0 : _t272);
  assign _t299 = ({29'b0, ut3_state} == 32'd2);
  assign _t300 = ((|_t275) ? 1'd0 : _t274);
  assign _t301 = ({29'b0, ut3_state} == 32'd2);
  assign _t302 = ((|_t277) ? hb : _t276);
  assign _t303 = ({29'b0, ut3_state} == 32'd2);
  assign _t304 = ((|_t279) ? 1'd0 : _t278);
  assign _t305 = ({29'b0, ut3_state} == 32'd2);
  assign _t306 = ((|_t281) ? 1'd0 : _t280);
  assign _t307 = ({29'b0, ut3_state} == 32'd2);
  assign _t308 = {16'b0, ulen};
  assign _t309 = {16'b0, ulen};
  assign _t310 = (acc + _t309);
  assign _t311 = ((|_t287) ? _t286 : _t285);
  assign _t312 = (_t310 + _t308);
  assign _t313 = ({29'b0, ut3_state} == 32'd2);
  assign _t314 = {16'b0, tlen};
  assign _t315 = ((|_t289) ? _t288 : iac);
  assign _t316 = (iac + _t314);
  assign _t317 = ({29'b0, ut3_state} == 32'd2);
  assign _t318 = ((|_t291) ? 32'd2 : _t290);
  assign _t319 = ({29'b0, ut3_state} == 32'd2);
  assign _t320 = ((|_t293) ? 1'd0 : _t292);
  assign _t321 = ({29'b0, ut3_state} == 32'd3);
  assign _t322 = ((|_t295) ? 1'd0 : _t294);
  assign _t323 = ({29'b0, ut3_state} == 32'd3);
  assign _t324 = ((|_t297) ? 1'd0 : _t296);
  assign _t325 = ({29'b0, ut3_state} == 32'd3);
  assign _t326 = ((|_t299) ? 1'd0 : _t298);
  assign _t327 = ({29'b0, ut3_state} == 32'd3);
  assign _t328 = ((|_t301) ? 1'd0 : _t300);
  assign _t329 = ({29'b0, ut3_state} == 32'd3);
  assign _t330 = ((|_t303) ? hb : _t302);
  assign _t331 = ({29'b0, ut3_state} == 32'd3);
  assign _t332 = ((|_t305) ? 1'd0 : _t304);
  assign _t333 = ({29'b0, ut3_state} == 32'd3);
  assign _t334 = ((|_t307) ? 1'd0 : _t306);
  assign _t335 = ({29'b0, ut3_state} == 32'd3);
  assign _t336 = acc[31:16];
  assign _t337 = {16'b0, _t336};
  assign _t338 = acc[15:0];
  assign _t339 = {16'b0, _t338};
  assign _t340 = ((|_t313) ? _t312 : _t311);
  assign _t341 = (_t339 + _t337);
  assign _t342 = iac[31:16];
  assign _t343 = (_t342 != 16'd0);
  assign _t344 = acc[31:16];
  assign _t345 = (_t344 != 16'd0);
  assign _t346 = ((|_t345) || (|_t343));
  assign _t347 = ({29'b0, ut3_state} == 32'd3);
  assign _t348 = ((|_t347) && (|_t346));
  assign _t349 = iac[31:16];
  assign _t350 = {16'b0, _t349};
  assign _t351 = iac[15:0];
  assign _t352 = {16'b0, _t351};
  assign _t353 = ((|_t317) ? _t316 : _t315);
  assign _t354 = (_t352 + _t350);
  assign _t355 = ({29'b0, ut3_state} == 32'd3);
  assign _t356 = ((|_t355) && (|_t346));
  assign _t357 = ((|_t319) ? 32'd3 : _t318);
  assign _t358 = ({29'b0, ut3_state} == 32'd3);
  assign _t359 = ((|_t358) && (|_t346));
  assign _t360 = acc[15:0];
  assign _t361 = (_t360 == 16'd65535);
  assign _t362 = (~_t346);
  assign _t363 = ((|_t362) && (|_t361));
  assign _t364 = ({29'b0, ut3_state} == 32'd3);
  assign _t365 = ((|_t364) && (|_t363));
  assign _t366 = acc[15:0];
  assign _t367 = ((|_t365) ? 16'd65535 : ck);
  assign _t368 = (_t366 ^ 16'd65535);
  assign _t369 = (~_t361);
  assign _t370 = ((|_t362) && (|_t369));
  assign _t371 = ({29'b0, ut3_state} == 32'd3);
  assign _t372 = ((|_t371) && (|_t370));
  assign _t373 = iac[15:0];
  assign _t374 = (_t373 ^ 16'd65535);
  assign _t375 = ({29'b0, ut3_state} == 32'd3);
  assign _t376 = ((|_t375) && (|_t362));
  assign _t377 = ((|_t256) ? 6'd0 : hi);
  assign _t378 = ({29'b0, ut3_state} == 32'd3);
  assign _t379 = ((|_t378) && (|_t362));
  assign _t380 = ((|_t359) ? 32'd3 : _t357);
  assign _t381 = ({29'b0, ut3_state} == 32'd3);
  assign _t382 = ((|_t381) && (|_t362));
  assign _t383 = ((|_t321) ? 1'd0 : _t320);
  assign _t384 = ({29'b0, ut3_state} == 32'd4);
  assign _t385 = ((|_t323) ? 1'd0 : _t322);
  assign _t386 = ({29'b0, ut3_state} == 32'd4);
  assign _t387 = ((|_t325) ? 1'd0 : _t324);
  assign _t388 = ({29'b0, ut3_state} == 32'd4);
  assign _t389 = ((|_t327) ? 1'd0 : _t326);
  assign _t390 = ({29'b0, ut3_state} == 32'd4);
  assign _t391 = ((|_t329) ? 1'd0 : _t328);
  assign _t392 = ({29'b0, ut3_state} == 32'd4);
  assign _t393 = ((|_t331) ? hb : _t330);
  assign _t394 = ({29'b0, ut3_state} == 32'd4);
  assign _t395 = ((|_t333) ? 1'd0 : _t332);
  assign _t396 = ({29'b0, ut3_state} == 32'd4);
  assign _t397 = ((|_t335) ? 1'd0 : _t334);
  assign _t398 = ({29'b0, ut3_state} == 32'd4);
  assign _t399 = ((|_t379) ? 6'd0 : _t377);
  assign _t400 = (hi + 6'd1);
  assign _t401 = ({29'b0, ut3_state} == 32'd4);
  assign _t402 = ((|_t401) && (|o_ready));
  assign _t403 = ((|_t382) ? 32'd4 : _t380);
  assign _t404 = (hi == 6'd41);
  assign _t405 = ((|o_ready) && (|_t404));
  assign _t406 = ({29'b0, ut3_state} == 32'd4);
  assign _t407 = ((|_t406) && (|_t405));
  assign _t408 = ((|_t407) ? 32'd5 : _t403);
  assign _t409 = (~_t405);
  assign _t410 = ({29'b0, ut3_state} == 32'd4);
  assign _t411 = ((|_t410) && (|_t409));
  assign _t412 = ((|_t384) ? 1'd0 : _t383);
  assign _t413 = ({29'b0, ut3_state} == 32'd5);
  assign _t414 = ((|_t386) ? 1'd0 : _t385);
  assign _t415 = ({29'b0, ut3_state} == 32'd5);
  assign _t416 = ((|_t388) ? 1'd0 : _t387);
  assign _t417 = ({29'b0, ut3_state} == 32'd5);
  assign _t418 = ((|_t390) ? 1'd1 : _t389);
  assign _t419 = ({29'b0, ut3_state} == 32'd5);
  assign _t420 = ((|_t392) ? 1'd0 : _t391);
  assign _t421 = ({29'b0, ut3_state} == 32'd5);
  assign _t422 = ((|_t394) ? hb : _t393);
  assign _t423 = ({29'b0, ut3_state} == 32'd5);
  assign _t424 = ((|_t396) ? 1'd0 : _t395);
  assign _t425 = ({29'b0, ut3_state} == 32'd5);
  assign _t426 = ((|_t398) ? 1'd0 : _t397);
  assign _t427 = ({29'b0, ut3_state} == 32'd5);
  assign _t428 = ((|_t212) ? _t210 : len);
  assign _t429 = ((|fo_valid) && (|o_ready));
  assign _t430 = ((|_t429) && (|fo_last));
  assign _t431 = ({29'b0, ut3_state} == 32'd5);
  assign _t432 = ((|_t431) && (|_t430));
  assign _t433 = ((|_t348) ? _t341 : _t340);
  assign _t434 = ({29'b0, ut3_state} == 32'd5);
  assign _t435 = ((|_t434) && (|_t430));
  assign _t436 = (n + 16'd1);
  assign _t437 = ({29'b0, ut3_state} == 32'd5);
  assign _t438 = ((|_t437) && (|_t430));
  assign _t439 = ((|_t411) ? 32'd4 : _t408);
  assign _t440 = ({29'b0, ut3_state} == 32'd5);
  assign _t441 = ((|_t440) && (|_t430));
  assign _t442 = ((|_t441) ? 32'd0 : _t439);
  assign _t443 = (~_t430);
  assign _t444 = ({29'b0, ut3_state} == 32'd5);
  assign _t445 = ((|_t444) && (|_t443));
  assign _t446 = ((|_t413) ? 1'd0 : _t412);
  assign _t447 = ({29'b0, ut3_state} == 32'd6);
  assign _t448 = ((|_t415) ? 1'd0 : _t414);
  assign _t449 = ({29'b0, ut3_state} == 32'd6);
  assign _t450 = ((|_t417) ? 1'd0 : _t416);
  assign _t451 = ({29'b0, ut3_state} == 32'd6);
  assign _t452 = ((|_t419) ? fo_valid : _t418);
  assign _t453 = ({29'b0, ut3_state} == 32'd6);
  assign _t454 = ((|_t421) ? fo_last : _t420);
  assign _t455 = (hi == 6'd41);
  assign _t456 = ({29'b0, ut3_state} == 32'd6);
  assign _t457 = ((|_t423) ? fo_data : _t422);
  assign _t458 = ({29'b0, ut3_state} == 32'd6);
  assign _t459 = ((|_t425) ? o_ready : _t424);
  assign _t460 = ({29'b0, ut3_state} == 32'd6);
  assign _t461 = (hi == 6'd41);
  assign _t462 = ((|_t427) ? 1'd0 : _t426);
  assign _t463 = ((|o_ready) && (|_t461));
  assign _t464 = ({29'b0, ut3_state} == 32'd6);
  assign _t465 = ((|_t402) ? _t400 : _t399);
  assign _t466 = (hi + 6'd1);
  assign _t467 = ({29'b0, ut3_state} == 32'd6);
  assign _t468 = ((|_t467) && (|o_ready));
  assign _t469 = (na + 16'd1);
  assign _t470 = (hi == 6'd41);
  assign _t471 = ((|o_ready) && (|_t470));
  assign _t472 = ({29'b0, ut3_state} == 32'd6);
  assign _t473 = ((|_t472) && (|_t471));
  assign _t474 = ((|_t445) ? 32'd5 : _t442);
  assign _t475 = ({29'b0, ut3_state} == 32'd6);
  assign _t476 = ((|_t475) && (|_t471));
  assign _t477 = ((|_t476) ? 32'd0 : _t474);
  assign _t478 = (~_t471);
  assign _t479 = ({29'b0, ut3_state} == 32'd6);
  assign _t480 = ((|_t479) && (|_t478));
  assign fo_data = q_dst_data;
  assign fo_last = q_dst_last;
  assign fo_valid = q_dst_valid;
  assign ffull = q_full;
  assign full = q_tight;
  assign ulen = (len + 16'd8);
  assign tlen = (len + 16'd28);
  assign dipw = (_t11 + _t1);
  assign hb = ((|_t104) ? _t103 : _t102);
  assign ab = ((|_t191) ? 8'd2 : _t190);
  assign t_ready = ((|_t447) ? 1'd0 : _t446);
  assign w = ((|_t449) ? 1'd0 : _t448);
  assign cm = ((|_t451) ? 1'd0 : _t450);
  assign o_valid = ((|_t453) ? 1'd1 : _t452);
  assign o_last = ((|_t456) ? _t455 : _t454);
  assign o_data = ((|_t458) ? ab : _t457);
  assign fo_ready = ((|_t460) ? 1'd0 : _t459);
  assign ask_ack = ((|_t464) ? _t463 : _t462);
  assign _t481 = ((|_t432) ? 16'd0 : _t428);
  assign _t482 = ((|_t435) ? 32'd0 : _t433);
  assign _t483 = ((|_t240) ? 48'd281474976710655 : _t236);
  assign _t484 = ((|_t244) ? 32'd4294967295 : _t241);
  assign _t485 = ((|_t248) ? 16'd36491 : _t245);
  assign _t486 = ((|_t480) ? 32'd6 : _t477);
  assign _t487 = ((|_t468) ? _t466 : _t465);
  assign _t488 = ((|_t356) ? _t354 : _t353);
  assign _t489 = ((|_t372) ? _t368 : _t367);
  assign _t490 = ((|_t376) ? _t374 : ick);
  assign _t491 = ((|_t438) ? _t436 : n);
  assign _t492 = ((|_t473) ? _t469 : na);
  always @(posedge clk) begin
    if (rst) begin
      len <= 16'd0;
      acc <= 32'd0;
      iac <= 32'd0;
      ck <= 16'd0;
      ick <= 16'd0;
      hi <= 6'd0;
      n <= 16'd0;
      na <= 16'd0;
      dmac <= 48'd0;
      dip <= 32'd0;
      dprt <= 16'd0;
      ut3_state <= 3'd0;
    end else begin
      len <= _t481;
      acc <= _t482;
      iac <= _t488;
      ck <= _t489;
      ick <= _t490;
      hi <= _t487;
      n <= _t491;
      na <= _t492;
      dmac <= _t483;
      dip <= _t484;
      dprt <= _t485;
      ut3_state <= _t486;
    end
  end
  pktfifo_8_2048 q (
    .clk(clk),
    .rst(rst),
    .wr(w),
    .wdata(t_data),
    .wlast(t_last),
    .commit(cm),
    .rewind(1'd0),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(fo_ready),
    .full(q_full),
    .tight(q_tight)
  );
endmodule
`default_nettype wire

`default_nettype none
module udp4_port_36490_2200301993985_3232255234_2048_0_0_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] erx_data,
  input  wire erx_last,
  input  wire erx_valid,
  output wire erx_ready,
  output wire [7:0] etx_data,
  output wire etx_last,
  output wire etx_valid,
  input  wire etx_ready,
  output wire [7:0] rx_data,
  output wire rx_last,
  output wire rx_valid,
  input  wire rx_ready,
  input  wire [7:0] tx_data,
  input  wire tx_last,
  input  wire tx_valid,
  output wire tx_ready,
  output wire [15:0] nr,
  output wire [15:0] nt,
  output wire [15:0] na,
  output wire pr_valid
);
  wire [47:0] pr_mac;
  wire [31:0] pr_ip;
  wire [15:0] pr_port;
  wire ak_valid;
  wire [47:0] ak_mac;
  wire [31:0] ak_ip;
  wire ak_ack;
  wire [7:0] ri_data;
  wire ri_last;
  wire ri_valid;
  wire ri_ready;
  wire [7:0] ri0_data;
  wire ri0_last;
  wire ri0_valid;
  wire ri0_ready;
  wire [8:0] fi_data;
  wire fi_valid;
  wire fi_ready;
  wire [8:0] fo_data;
  wire fo_valid;
  wire fo_ready;
  wire [2:0] fc;
  wire pt_valid;
  wire [47:0] pt_mac;
  wire [31:0] pt_ip;
  wire [15:0] pt_port;
  wire [7:0] tx2_data;
  wire tx2_last;
  wire tx2_valid;
  wire tx2_ready;
  wire _t0;
  wire [8:0] _t1;
  wire [7:0] _t2;
  wire ur_i_ready;
  wire [7:0] ur_o_data;
  wire ur_o_last;
  wire ur_o_valid;
  wire ur_peer_valid;
  wire [47:0] ur_peer_mac;
  wire [31:0] ur_peer_ip;
  wire [15:0] ur_peer_port;
  wire ur_ask_valid;
  wire [47:0] ur_ask_mac;
  wire [31:0] ur_ask_ip;
  wire [15:0] ur_n;
  wire phd_i_ready;
  wire [7:0] phd_o_data;
  wire phd_o_last;
  wire phd_o_valid;
  wire sl_src_ready;
  wire [8:0] sl_dst_data;
  wire sl_dst_valid;
  wire [2:0] sl_cnt;
  wire ptl_i_ready;
  wire [7:0] ptl_o_data;
  wire ptl_o_last;
  wire ptl_o_valid;
  wire ptl_pt_valid;
  wire [47:0] ptl_pt_mac;
  wire [31:0] ptl_pt_ip;
  wire [15:0] ptl_pt_port;
  wire ux_t_ready;
  wire [7:0] ux_o_data;
  wire ux_o_last;
  wire ux_o_valid;
  wire ux_ask_ack;
  wire [15:0] ux_n;
  wire [15:0] ux_na;
  assign _t0 = 1'd0;
  assign _t1 = {_t0, ri_data};
  assign _t2 = _t1[7:0];
  assign erx_ready = ur_i_ready;
  assign ri0_data = ur_o_data;
  assign ri0_last = ur_o_last;
  assign ri0_valid = ur_o_valid;
  assign pr_valid = ur_peer_valid;
  assign pr_mac = ur_peer_mac;
  assign pr_ip = ur_peer_ip;
  assign pr_port = ur_peer_port;
  assign ak_valid = ur_ask_valid;
  assign ak_mac = ur_ask_mac;
  assign ak_ip = ur_ask_ip;
  assign nr = ur_n;
  assign ri0_ready = phd_i_ready;
  assign ri_data = phd_o_data;
  assign ri_last = phd_o_last;
  assign ri_valid = phd_o_valid;
  assign fi_ready = sl_src_ready;
  assign fo_data = sl_dst_data;
  assign fo_valid = sl_dst_valid;
  assign fc = sl_cnt;
  assign fi_valid = ri_valid;
  assign fi_data = {ri_last, _t2};
  assign ri_ready = fi_ready;
  assign rx_valid = fo_valid;
  assign rx_data = fo_data[7:0];
  assign rx_last = fo_data[8];
  assign fo_ready = rx_ready;
  assign tx_ready = ptl_i_ready;
  assign tx2_data = ptl_o_data;
  assign tx2_last = ptl_o_last;
  assign tx2_valid = ptl_o_valid;
  assign pt_valid = ptl_pt_valid;
  assign pt_mac = ptl_pt_mac;
  assign pt_ip = ptl_pt_ip;
  assign pt_port = ptl_pt_port;
  assign tx2_ready = ux_t_ready;
  assign etx_data = ux_o_data;
  assign etx_last = ux_o_last;
  assign etx_valid = ux_o_valid;
  assign ak_ack = ux_ask_ack;
  assign nt = ux_n;
  assign na = ux_na;
  ip4_rx_36490_2200301993985_3232255234_0 ur (
    .clk(clk),
    .rst(rst),
    .i_data(erx_data),
    .i_last(erx_last),
    .i_valid(erx_valid),
    .i_ready(ur_i_ready),
    .o_data(ur_o_data),
    .o_last(ur_o_last),
    .o_valid(ur_o_valid),
    .o_ready(ri0_ready),
    .peer_valid(ur_peer_valid),
    .peer_mac(ur_peer_mac),
    .peer_ip(ur_peer_ip),
    .peer_port(ur_peer_port),
    .ask_valid(ur_ask_valid),
    .ask_mac(ur_ask_mac),
    .ask_ip(ur_ask_ip),
    .ask_ack(ak_ack),
    .n(ur_n)
  );
  peer_head phd (
    .clk(clk),
    .rst(rst),
    .i_data(ri0_data),
    .i_last(ri0_last),
    .i_valid(ri0_valid),
    .i_ready(phd_i_ready),
    .o_data(phd_o_data),
    .o_last(phd_o_last),
    .o_valid(phd_o_valid),
    .o_ready(ri_ready),
    .pr_valid(pr_valid),
    .pr_mac(pr_mac),
    .pr_ip(pr_ip),
    .pr_port(pr_port)
  );
  fifo_9_4 sl (
    .clk(clk),
    .rst(rst),
    .src_data(fi_data),
    .src_valid(fi_valid),
    .src_ready(sl_src_ready),
    .dst_data(sl_dst_data),
    .dst_valid(sl_dst_valid),
    .dst_ready(fo_ready),
    .cnt(sl_cnt)
  );
  peer_tail ptl (
    .clk(clk),
    .rst(rst),
    .i_data(tx_data),
    .i_last(tx_last),
    .i_valid(tx_valid),
    .i_ready(ptl_i_ready),
    .o_data(ptl_o_data),
    .o_last(ptl_o_last),
    .o_valid(ptl_o_valid),
    .o_ready(tx2_ready),
    .pt_valid(ptl_pt_valid),
    .pt_mac(ptl_pt_mac),
    .pt_ip(ptl_pt_ip),
    .pt_port(ptl_pt_port)
  );
  ip4_tx_36490_2200301993985_3232255234_2048_0 ux (
    .clk(clk),
    .rst(rst),
    .t_data(tx2_data),
    .t_last(tx2_last),
    .t_valid(tx2_valid),
    .t_ready(ux_t_ready),
    .o_data(ux_o_data),
    .o_last(ux_o_last),
    .o_valid(ux_o_valid),
    .o_ready(etx_ready),
    .peer_valid(pt_valid),
    .peer_mac(pt_mac),
    .peer_ip(pt_ip),
    .peer_port(pt_port),
    .ask_valid(ak_valid),
    .ask_mac(ak_mac),
    .ask_ip(ak_ip),
    .ask_ack(ux_ask_ack),
    .n(ux_n),
    .na(ux_na)
  );
endmodule
`default_nettype wire

`default_nettype none
module ip4_rx_36488_2200301993985_3232255234_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  output wire peer_valid,
  output wire [47:0] peer_mac,
  output wire [31:0] peer_ip,
  output wire [15:0] peer_port,
  output wire ask_valid,
  output wire [47:0] ask_mac,
  output wire [31:0] ask_ip,
  input  wire ask_ack,
  output reg  [15:0] n
);
  reg  [5:0] idx;
  reg  oku;
  reg  oka;
  reg  bc;
  reg  [15:0] left;
  reg  pv;
  reg  [47:0] pmac;
  reg  [31:0] pip;
  reg  [15:0] pprt;
  reg  [47:0] tmac;
  reg  [31:0] tip;
  reg  [15:0] tprt;
  reg  [31:0] aip;
  reg  av;
  wire [47:0] amac;
  wire [31:0] arip;
  wire pay;
  wire [7:0] d;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire [39:0] _t8;
  wire [47:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [47:0] _t13;
  wire [7:0] _t14;
  wire [31:0] _t15;
  wire [47:0] _t16;
  wire _t17;
  wire _t18;
  wire [47:0] _t19;
  wire [15:0] _t20;
  wire [23:0] _t21;
  wire [47:0] _t22;
  wire _t23;
  wire _t24;
  wire [47:0] _t25;
  wire [23:0] _t26;
  wire [15:0] _t27;
  wire [47:0] _t28;
  wire _t29;
  wire _t30;
  wire [47:0] _t31;
  wire [31:0] _t32;
  wire [7:0] _t33;
  wire [47:0] _t34;
  wire _t35;
  wire _t36;
  wire [47:0] _t37;
  wire [39:0] _t38;
  wire [47:0] _t39;
  wire _t40;
  wire _t41;
  wire [23:0] _t42;
  wire [31:0] _t43;
  wire _t44;
  wire _t45;
  wire [23:0] _t46;
  wire [31:0] _t47;
  wire _t48;
  wire _t49;
  wire [31:0] _t50;
  wire [7:0] _t51;
  wire [15:0] _t52;
  wire [31:0] _t53;
  wire _t54;
  wire _t55;
  wire [31:0] _t56;
  wire [7:0] _t57;
  wire [15:0] _t58;
  wire [31:0] _t59;
  wire _t60;
  wire _t61;
  wire [31:0] _t62;
  wire [15:0] _t63;
  wire [7:0] _t64;
  wire [31:0] _t65;
  wire _t66;
  wire _t67;
  wire [31:0] _t68;
  wire [15:0] _t69;
  wire [7:0] _t70;
  wire [31:0] _t71;
  wire _t72;
  wire _t73;
  wire [31:0] _t74;
  wire [23:0] _t75;
  wire [31:0] _t76;
  wire _t77;
  wire _t78;
  wire [31:0] _t79;
  wire [23:0] _t80;
  wire [31:0] _t81;
  wire _t82;
  wire _t83;
  wire [7:0] _t84;
  wire [15:0] _t85;
  wire _t86;
  wire _t87;
  wire [15:0] _t88;
  wire [7:0] _t89;
  wire [15:0] _t90;
  wire _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [15:0] _t94;
  wire _t95;
  wire _t96;
  wire [15:0] _t97;
  wire [7:0] _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire [15:0] _t101;
  wire [15:0] _t102;
  wire [15:0] _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire _t109;
  wire [15:0] _t110;
  wire [15:0] _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire [5:0] _t121;
  wire [5:0] _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire _t158;
  wire _t159;
  wire _t160;
  wire _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire _t187;
  wire _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [15:0] _t261;
  wire _t262;
  wire [47:0] _t263;
  wire [31:0] _t264;
  wire [31:0] _t265;
  wire [15:0] _t266;
  wire [15:0] _t267;
  wire _t268;
  wire [5:0] _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire [47:0] _t273;
  wire [31:0] _t274;
  wire [15:0] _t275;
  wire [15:0] _t276;
  wire _t277;
  assign _t0 = (left != 16'd0);
  assign _t1 = ((|i_valid) && (|pay));
  assign _t2 = ((|_t1) && (|oku));
  assign _t3 = (left != 16'd0);
  assign _t4 = ((|pay) && (|oku));
  assign _t5 = ((|_t4) && (|_t3));
  assign _t6 = ((|_t5) ? o_ready : 1'd0);
  assign _t7 = (~_t5);
  assign _t8 = tmac[47:8];
  assign _t9 = {_t8, d};
  assign _t10 = (idx == 6'd6);
  assign _t11 = ((|i_valid) && (|i_ready));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? _t9 : tmac);
  assign _t14 = _t13[7:0];
  assign _t15 = _t13[47:16];
  assign _t16 = {_t15, d, _t14};
  assign _t17 = (idx == 6'd7);
  assign _t18 = ((|_t11) && (|_t17));
  assign _t19 = ((|_t18) ? _t16 : _t13);
  assign _t20 = _t19[15:0];
  assign _t21 = _t19[47:24];
  assign _t22 = {_t21, d, _t20};
  assign _t23 = (idx == 6'd8);
  assign _t24 = ((|_t11) && (|_t23));
  assign _t25 = ((|_t24) ? _t22 : _t19);
  assign _t26 = _t25[23:0];
  assign _t27 = _t25[47:32];
  assign _t28 = {_t27, d, _t26};
  assign _t29 = (idx == 6'd9);
  assign _t30 = ((|_t11) && (|_t29));
  assign _t31 = ((|_t30) ? _t28 : _t25);
  assign _t32 = _t31[31:0];
  assign _t33 = _t31[47:40];
  assign _t34 = {_t33, d, _t32};
  assign _t35 = (idx == 6'd10);
  assign _t36 = ((|_t11) && (|_t35));
  assign _t37 = ((|_t36) ? _t34 : _t31);
  assign _t38 = _t37[39:0];
  assign _t39 = {d, _t38};
  assign _t40 = (idx == 6'd11);
  assign _t41 = ((|_t11) && (|_t40));
  assign _t42 = tip[31:8];
  assign _t43 = {_t42, d};
  assign _t44 = (idx == 6'd26);
  assign _t45 = ((|_t11) && (|_t44));
  assign _t46 = aip[31:8];
  assign _t47 = {_t46, d};
  assign _t48 = (idx == 6'd28);
  assign _t49 = ((|_t11) && (|_t48));
  assign _t50 = ((|_t45) ? _t43 : tip);
  assign _t51 = _t50[7:0];
  assign _t52 = _t50[31:16];
  assign _t53 = {_t52, d, _t51};
  assign _t54 = (idx == 6'd27);
  assign _t55 = ((|_t11) && (|_t54));
  assign _t56 = ((|_t49) ? _t47 : aip);
  assign _t57 = _t56[7:0];
  assign _t58 = _t56[31:16];
  assign _t59 = {_t58, d, _t57};
  assign _t60 = (idx == 6'd29);
  assign _t61 = ((|_t11) && (|_t60));
  assign _t62 = ((|_t55) ? _t53 : _t50);
  assign _t63 = _t62[15:0];
  assign _t64 = _t62[31:24];
  assign _t65 = {_t64, d, _t63};
  assign _t66 = (idx == 6'd28);
  assign _t67 = ((|_t11) && (|_t66));
  assign _t68 = ((|_t61) ? _t59 : _t56);
  assign _t69 = _t68[15:0];
  assign _t70 = _t68[31:24];
  assign _t71 = {_t70, d, _t69};
  assign _t72 = (idx == 6'd30);
  assign _t73 = ((|_t11) && (|_t72));
  assign _t74 = ((|_t67) ? _t65 : _t62);
  assign _t75 = _t74[23:0];
  assign _t76 = {d, _t75};
  assign _t77 = (idx == 6'd29);
  assign _t78 = ((|_t11) && (|_t77));
  assign _t79 = ((|_t73) ? _t71 : _t68);
  assign _t80 = _t79[23:0];
  assign _t81 = {d, _t80};
  assign _t82 = (idx == 6'd31);
  assign _t83 = ((|_t11) && (|_t82));
  assign _t84 = tprt[7:0];
  assign _t85 = {d, _t84};
  assign _t86 = (idx == 6'd34);
  assign _t87 = ((|_t11) && (|_t86));
  assign _t88 = ((|_t87) ? _t85 : tprt);
  assign _t89 = _t88[15:8];
  assign _t90 = {_t89, d};
  assign _t91 = (idx == 6'd35);
  assign _t92 = ((|_t11) && (|_t91));
  assign _t93 = left[7:0];
  assign _t94 = {d, _t93};
  assign _t95 = (idx == 6'd38);
  assign _t96 = ((|_t11) && (|_t95));
  assign _t97 = {8'b0, d};
  assign _t98 = left[15:8];
  assign _t99 = {8'b0, _t98};
  assign _t100 = (_t99 << 32'd8);
  assign _t101 = (_t100 + _t97);
  assign _t102 = ((|_t96) ? _t94 : left);
  assign _t103 = (_t101 - 16'd8);
  assign _t104 = (idx == 6'd39);
  assign _t105 = ((|_t11) && (|_t104));
  assign _t106 = (d != 8'd255);
  assign _t107 = (idx < 6'd6);
  assign _t108 = ((|_t107) && (|_t106));
  assign _t109 = ((|_t11) && (|_t108));
  assign _t110 = ((|_t105) ? _t103 : _t102);
  assign _t111 = (left - 16'd1);
  assign _t112 = (left != 16'd0);
  assign _t113 = ((|pay) && (|oku));
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t11) && (|_t114));
  assign _t116 = ((|_t11) && (|i_last));
  assign _t117 = ((|_t11) && (|i_last));
  assign _t118 = ((|_t11) && (|i_last));
  assign _t119 = ((|_t109) ? 1'd0 : bc);
  assign _t120 = ((|_t11) && (|i_last));
  assign _t121 = ((|_t116) ? 6'd0 : idx);
  assign _t122 = (idx + 6'd1);
  assign _t123 = (~pay);
  assign _t124 = (~i_last);
  assign _t125 = ((|_t11) && (|_t124));
  assign _t126 = ((|_t125) && (|_t123));
  assign _t127 = ((|_t117) ? 1'd1 : oku);
  assign _t128 = (d != 8'd2);
  assign _t129 = (idx == 6'd33);
  assign _t130 = ((|_t129) && (|_t128));
  assign _t131 = (d != 8'd77);
  assign _t132 = (idx == 6'd32);
  assign _t133 = ((|_t132) && (|_t131));
  assign _t134 = (d != 8'd168);
  assign _t135 = (idx == 6'd31);
  assign _t136 = ((|_t135) && (|_t134));
  assign _t137 = (d != 8'd192);
  assign _t138 = (idx == 6'd30);
  assign _t139 = ((|_t138) && (|_t137));
  assign _t140 = (d != 8'd136);
  assign _t141 = (idx == 6'd37);
  assign _t142 = ((|_t141) && (|_t140));
  assign _t143 = (d != 8'd142);
  assign _t144 = (idx == 6'd36);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = (d != 8'd17);
  assign _t147 = (idx == 6'd23);
  assign _t148 = ((|_t147) && (|_t146));
  assign _t149 = (d != 8'd69);
  assign _t150 = (idx == 6'd14);
  assign _t151 = ((|_t150) && (|_t149));
  assign _t152 = (d != 8'd0);
  assign _t153 = (idx == 6'd13);
  assign _t154 = ((|_t153) && (|_t152));
  assign _t155 = (d != 8'd8);
  assign _t156 = (idx == 6'd12);
  assign _t157 = ((|_t156) && (|_t155));
  assign _t158 = (d == 8'd255);
  assign _t159 = ((|bc) && (|_t158));
  assign _t160 = (~_t159);
  assign _t161 = (d != 8'd1);
  assign _t162 = (idx == 6'd5);
  assign _t163 = ((|_t162) && (|_t161));
  assign _t164 = ((|_t163) && (|_t160));
  assign _t165 = (d == 8'd255);
  assign _t166 = ((|bc) && (|_t165));
  assign _t167 = (~_t166);
  assign _t168 = (d != 8'd0);
  assign _t169 = (idx == 6'd4);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t170) && (|_t167));
  assign _t172 = (d == 8'd255);
  assign _t173 = ((|bc) && (|_t172));
  assign _t174 = (~_t173);
  assign _t175 = (d != 8'd56);
  assign _t176 = (idx == 6'd3);
  assign _t177 = ((|_t176) && (|_t175));
  assign _t178 = ((|_t177) && (|_t174));
  assign _t179 = (d == 8'd255);
  assign _t180 = ((|bc) && (|_t179));
  assign _t181 = (~_t180);
  assign _t182 = (d != 8'd76);
  assign _t183 = (idx == 6'd2);
  assign _t184 = ((|_t183) && (|_t182));
  assign _t185 = ((|_t184) && (|_t181));
  assign _t186 = (d == 8'd255);
  assign _t187 = ((|bc) && (|_t186));
  assign _t188 = (~_t187);
  assign _t189 = (d != 8'd0);
  assign _t190 = (idx == 6'd1);
  assign _t191 = ((|_t190) && (|_t189));
  assign _t192 = ((|_t191) && (|_t188));
  assign _t193 = (d == 8'd255);
  assign _t194 = ((|bc) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (d != 8'd2);
  assign _t197 = (idx == 6'd0);
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = ((|_t198) && (|_t195));
  assign _t200 = ((|1'd0) || (|_t199));
  assign _t201 = ((|_t200) || (|_t192));
  assign _t202 = ((|_t201) || (|_t185));
  assign _t203 = ((|_t202) || (|_t178));
  assign _t204 = ((|_t203) || (|_t171));
  assign _t205 = ((|_t204) || (|_t164));
  assign _t206 = ((|_t205) || (|_t157));
  assign _t207 = ((|_t206) || (|_t154));
  assign _t208 = ((|_t207) || (|_t151));
  assign _t209 = ((|_t208) || (|_t148));
  assign _t210 = ((|_t209) || (|_t145));
  assign _t211 = ((|_t210) || (|_t142));
  assign _t212 = ((|_t211) || (|_t139));
  assign _t213 = ((|_t212) || (|_t136));
  assign _t214 = ((|_t213) || (|_t133));
  assign _t215 = ((|_t214) || (|_t130));
  assign _t216 = ((|_t11) && (|_t124));
  assign _t217 = ((|_t216) && (|_t215));
  assign _t218 = ((|_t118) ? 1'd1 : oka);
  assign _t219 = (d != 8'd2);
  assign _t220 = (idx == 6'd41);
  assign _t221 = ((|_t220) && (|_t219));
  assign _t222 = (d != 8'd77);
  assign _t223 = (idx == 6'd40);
  assign _t224 = ((|_t223) && (|_t222));
  assign _t225 = (d != 8'd168);
  assign _t226 = (idx == 6'd39);
  assign _t227 = ((|_t226) && (|_t225));
  assign _t228 = (d != 8'd192);
  assign _t229 = (idx == 6'd38);
  assign _t230 = ((|_t229) && (|_t228));
  assign _t231 = (d != 8'd1);
  assign _t232 = (idx == 6'd21);
  assign _t233 = ((|_t232) && (|_t231));
  assign _t234 = (d != 8'd0);
  assign _t235 = (idx == 6'd20);
  assign _t236 = ((|_t235) && (|_t234));
  assign _t237 = (d != 8'd6);
  assign _t238 = (idx == 6'd13);
  assign _t239 = ((|_t238) && (|_t237));
  assign _t240 = (d != 8'd8);
  assign _t241 = (idx == 6'd12);
  assign _t242 = ((|_t241) && (|_t240));
  assign _t243 = ((|_t205) || (|_t242));
  assign _t244 = ((|_t243) || (|_t239));
  assign _t245 = ((|_t244) || (|_t236));
  assign _t246 = ((|_t245) || (|_t233));
  assign _t247 = ((|_t246) || (|_t230));
  assign _t248 = ((|_t247) || (|_t227));
  assign _t249 = ((|_t248) || (|_t224));
  assign _t250 = ((|_t249) || (|_t221));
  assign _t251 = ((|_t11) && (|_t124));
  assign _t252 = ((|_t251) && (|_t250));
  assign _t253 = (idx == 6'd41);
  assign _t254 = (~_t215);
  assign _t255 = ((|oku) && (|_t254));
  assign _t256 = ((|_t255) && (|_t253));
  assign _t257 = ((|_t11) && (|_t256));
  assign _t258 = ((|_t11) && (|_t256));
  assign _t259 = ((|_t11) && (|_t256));
  assign _t260 = ((|_t11) && (|_t256));
  assign _t261 = (n + 16'd1);
  assign _t262 = ((|_t11) && (|_t256));
  assign d = i_data;
  assign pay = (idx == 6'd42);
  assign o_valid = ((|_t2) && (|_t0));
  assign o_data = d;
  assign o_last = (left == 16'd1);
  assign i_ready = ((|_t7) ? 1'd1 : _t6);
  assign _t263 = ((|_t41) ? _t39 : _t37);
  assign _t264 = ((|_t78) ? _t76 : _t74);
  assign _t265 = ((|_t83) ? _t81 : _t79);
  assign _t266 = ((|_t92) ? _t90 : _t88);
  assign _t267 = ((|_t115) ? _t111 : _t110);
  assign _t268 = ((|_t120) ? 1'd1 : _t119);
  assign _t269 = ((|_t126) ? _t122 : _t121);
  assign _t270 = ((|_t217) ? 1'd0 : _t127);
  assign _t271 = ((|_t252) ? 1'd0 : _t218);
  assign _t272 = ((|_t257) ? 1'd1 : pv);
  assign _t273 = ((|_t258) ? tmac : pmac);
  assign _t274 = ((|_t259) ? tip : pip);
  assign _t275 = ((|_t260) ? tprt : pprt);
  assign _t276 = ((|_t262) ? _t261 : n);
  assign _t277 = ((|ask_ack) ? 1'd0 : av);
  assign peer_valid = pv;
  assign peer_mac = pmac;
  assign peer_ip = pip;
  assign peer_port = pprt;
  assign ask_valid = av;
  assign ask_mac = amac;
  assign ask_ip = arip;
  assign amac = 48'd0;
  assign arip = 32'd0;
  always @(posedge clk) begin
    if (rst) begin
      idx <= 6'd0;
      oku <= 1'd1;
      oka <= 1'd1;
      bc <= 1'd1;
      left <= 16'd0;
      n <= 16'd0;
      pv <= 1'd0;
      pmac <= 48'd0;
      pip <= 32'd0;
      pprt <= 16'd0;
      tmac <= 48'd0;
      tip <= 32'd0;
      tprt <= 16'd0;
      aip <= 32'd0;
      av <= 1'd0;
    end else begin
      idx <= _t269;
      oku <= _t270;
      oka <= _t271;
      bc <= _t268;
      left <= _t267;
      n <= _t276;
      pv <= _t272;
      pmac <= _t273;
      pip <= _t274;
      pprt <= _t275;
      tmac <= _t263;
      tip <= _t264;
      tprt <= _t266;
      aip <= _t265;
      av <= _t277;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ip4_tx_36488_2200301993985_3232255234_2048_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  input  wire peer_valid,
  input  wire [47:0] peer_mac,
  input  wire [31:0] peer_ip,
  input  wire [15:0] peer_port,
  input  wire ask_valid,
  input  wire [47:0] ask_mac,
  input  wire [31:0] ask_ip,
  output wire ask_ack,
  output reg  [15:0] n,
  output reg  [15:0] na
);
  reg  [15:0] len;
  reg  [31:0] acc;
  reg  [31:0] iac;
  reg  [15:0] ck;
  reg  [15:0] ick;
  reg  [5:0] hi;
  reg  [47:0] dmac;
  reg  [31:0] dip;
  reg  [15:0] dprt;
  wire [15:0] ulen;
  wire [15:0] tlen;
  wire [31:0] dipw;
  wire [7:0] hb;
  wire [7:0] ab;
  wire w;
  wire cm;
  wire full;
  wire ffull;
  wire [7:0] fo_data;
  wire fo_last;
  wire fo_valid;
  wire fo_ready;
  reg  [2:0] ut4_state;
  wire [7:0] _t0;
  wire [31:0] _t1;
  wire [7:0] _t2;
  wire [31:0] _t3;
  wire [31:0] _t4;
  wire [7:0] _t5;
  wire [31:0] _t6;
  wire [7:0] _t7;
  wire [31:0] _t8;
  wire [31:0] _t9;
  wire [31:0] _t10;
  wire [31:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire _t15;
  wire [7:0] _t16;
  wire [7:0] _t17;
  wire _t18;
  wire [7:0] _t19;
  wire _t20;
  wire [7:0] _t21;
  wire [7:0] _t22;
  wire _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire _t30;
  wire [7:0] _t31;
  wire [7:0] _t32;
  wire _t33;
  wire [7:0] _t34;
  wire _t35;
  wire [7:0] _t36;
  wire [7:0] _t37;
  wire _t38;
  wire [7:0] _t39;
  wire _t40;
  wire [7:0] _t41;
  wire _t42;
  wire [7:0] _t43;
  wire _t44;
  wire [7:0] _t45;
  wire [7:0] _t46;
  wire _t47;
  wire [7:0] _t48;
  wire [7:0] _t49;
  wire _t50;
  wire [7:0] _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire [7:0] _t55;
  wire _t56;
  wire [7:0] _t57;
  wire [7:0] _t58;
  wire _t59;
  wire [7:0] _t60;
  wire [7:0] _t61;
  wire _t62;
  wire [7:0] _t63;
  wire _t64;
  wire [7:0] _t65;
  wire [7:0] _t66;
  wire _t67;
  wire [7:0] _t68;
  wire _t69;
  wire [7:0] _t70;
  wire [7:0] _t71;
  wire _t72;
  wire [7:0] _t73;
  wire _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire _t77;
  wire [7:0] _t78;
  wire _t79;
  wire [7:0] _t80;
  wire [7:0] _t81;
  wire _t82;
  wire [7:0] _t83;
  wire _t84;
  wire [7:0] _t85;
  wire _t86;
  wire [7:0] _t87;
  wire [7:0] _t88;
  wire _t89;
  wire [7:0] _t90;
  wire [7:0] _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [7:0] _t94;
  wire _t95;
  wire [7:0] _t96;
  wire [7:0] _t97;
  wire _t98;
  wire [7:0] _t99;
  wire [7:0] _t100;
  wire _t101;
  wire [7:0] _t102;
  wire [7:0] _t103;
  wire _t104;
  wire [7:0] _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire [7:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire [7:0] _t113;
  wire [7:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire [7:0] _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire [7:0] _t122;
  wire [7:0] _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire [7:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire [7:0] _t131;
  wire [7:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire [7:0] _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire [7:0] _t140;
  wire [7:0] _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire [7:0] _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire [7:0] _t149;
  wire [7:0] _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [7:0] _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire [7:0] _t158;
  wire _t159;
  wire [7:0] _t160;
  wire [7:0] _t161;
  wire _t162;
  wire [7:0] _t163;
  wire _t164;
  wire [7:0] _t165;
  wire [7:0] _t166;
  wire _t167;
  wire [7:0] _t168;
  wire _t169;
  wire [7:0] _t170;
  wire [7:0] _t171;
  wire _t172;
  wire [7:0] _t173;
  wire _t174;
  wire [7:0] _t175;
  wire [7:0] _t176;
  wire _t177;
  wire [7:0] _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [7:0] _t182;
  wire _t183;
  wire [7:0] _t184;
  wire _t185;
  wire [7:0] _t186;
  wire _t187;
  wire [7:0] _t188;
  wire _t189;
  wire [7:0] _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire [15:0] _t210;
  wire _t211;
  wire _t212;
  wire [31:0] _t213;
  wire [31:0] _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire [31:0] _t219;
  wire [31:0] _t220;
  wire [31:0] _t221;
  wire [31:0] _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire [47:0] _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire [31:0] _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire [15:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [2:0] _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [2:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire _t274;
  wire _t275;
  wire [7:0] _t276;
  wire _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire _t281;
  wire [31:0] _t282;
  wire [31:0] _t283;
  wire [31:0] _t284;
  wire [31:0] _t285;
  wire [31:0] _t286;
  wire _t287;
  wire [31:0] _t288;
  wire _t289;
  wire [2:0] _t290;
  wire _t291;
  wire _t292;
  wire _t293;
  wire _t294;
  wire _t295;
  wire _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire [7:0] _t302;
  wire _t303;
  wire _t304;
  wire _t305;
  wire _t306;
  wire _t307;
  wire [31:0] _t308;
  wire [31:0] _t309;
  wire [31:0] _t310;
  wire [31:0] _t311;
  wire [31:0] _t312;
  wire _t313;
  wire [31:0] _t314;
  wire [31:0] _t315;
  wire [31:0] _t316;
  wire _t317;
  wire [2:0] _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire _t323;
  wire _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [7:0] _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire _t334;
  wire _t335;
  wire [15:0] _t336;
  wire [31:0] _t337;
  wire [15:0] _t338;
  wire [31:0] _t339;
  wire [31:0] _t340;
  wire [31:0] _t341;
  wire [15:0] _t342;
  wire _t343;
  wire [15:0] _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire [15:0] _t349;
  wire [31:0] _t350;
  wire [15:0] _t351;
  wire [31:0] _t352;
  wire [31:0] _t353;
  wire [31:0] _t354;
  wire _t355;
  wire _t356;
  wire [2:0] _t357;
  wire _t358;
  wire _t359;
  wire [15:0] _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire [15:0] _t366;
  wire [15:0] _t367;
  wire [15:0] _t368;
  wire _t369;
  wire _t370;
  wire _t371;
  wire _t372;
  wire [15:0] _t373;
  wire [15:0] _t374;
  wire _t375;
  wire _t376;
  wire [5:0] _t377;
  wire _t378;
  wire _t379;
  wire [2:0] _t380;
  wire _t381;
  wire _t382;
  wire _t383;
  wire _t384;
  wire _t385;
  wire _t386;
  wire _t387;
  wire _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire _t392;
  wire [7:0] _t393;
  wire _t394;
  wire _t395;
  wire _t396;
  wire _t397;
  wire _t398;
  wire [5:0] _t399;
  wire [5:0] _t400;
  wire _t401;
  wire _t402;
  wire [2:0] _t403;
  wire _t404;
  wire _t405;
  wire _t406;
  wire _t407;
  wire [2:0] _t408;
  wire _t409;
  wire _t410;
  wire _t411;
  wire _t412;
  wire _t413;
  wire _t414;
  wire _t415;
  wire _t416;
  wire _t417;
  wire _t418;
  wire _t419;
  wire _t420;
  wire _t421;
  wire [7:0] _t422;
  wire _t423;
  wire _t424;
  wire _t425;
  wire _t426;
  wire _t427;
  wire [15:0] _t428;
  wire _t429;
  wire _t430;
  wire _t431;
  wire _t432;
  wire [31:0] _t433;
  wire _t434;
  wire _t435;
  wire [15:0] _t436;
  wire _t437;
  wire _t438;
  wire [2:0] _t439;
  wire _t440;
  wire _t441;
  wire [2:0] _t442;
  wire _t443;
  wire _t444;
  wire _t445;
  wire _t446;
  wire _t447;
  wire _t448;
  wire _t449;
  wire _t450;
  wire _t451;
  wire _t452;
  wire _t453;
  wire _t454;
  wire _t455;
  wire _t456;
  wire [7:0] _t457;
  wire _t458;
  wire _t459;
  wire _t460;
  wire _t461;
  wire _t462;
  wire _t463;
  wire _t464;
  wire [5:0] _t465;
  wire [5:0] _t466;
  wire _t467;
  wire _t468;
  wire [15:0] _t469;
  wire _t470;
  wire _t471;
  wire _t472;
  wire _t473;
  wire [2:0] _t474;
  wire _t475;
  wire _t476;
  wire [2:0] _t477;
  wire _t478;
  wire _t479;
  wire _t480;
  wire [15:0] _t481;
  wire [31:0] _t482;
  wire [47:0] _t483;
  wire [31:0] _t484;
  wire [15:0] _t485;
  wire [2:0] _t486;
  wire [5:0] _t487;
  wire [31:0] _t488;
  wire [15:0] _t489;
  wire [15:0] _t490;
  wire [15:0] _t491;
  wire [15:0] _t492;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  assign _t0 = dip[31:24];
  assign _t1 = {24'b0, _t0};
  assign _t2 = dip[23:16];
  assign _t3 = {24'b0, _t2};
  assign _t4 = (_t3 << 32'd8);
  assign _t5 = dip[15:8];
  assign _t6 = {24'b0, _t5};
  assign _t7 = dip[7:0];
  assign _t8 = {24'b0, _t7};
  assign _t9 = (_t8 << 32'd8);
  assign _t10 = (_t9 + _t6);
  assign _t11 = (_t10 + _t4);
  assign _t12 = dmac[7:0];
  assign _t13 = (hi == 6'd0);
  assign _t14 = ((|_t13) ? _t12 : 8'd0);
  assign _t15 = (hi == 6'd6);
  assign _t16 = ((|_t15) ? 8'd2 : _t14);
  assign _t17 = dmac[15:8];
  assign _t18 = (hi == 6'd1);
  assign _t19 = ((|_t18) ? _t17 : _t16);
  assign _t20 = (hi == 6'd7);
  assign _t21 = ((|_t20) ? 8'd0 : _t19);
  assign _t22 = dmac[23:16];
  assign _t23 = (hi == 6'd2);
  assign _t24 = ((|_t23) ? _t22 : _t21);
  assign _t25 = (hi == 6'd8);
  assign _t26 = ((|_t25) ? 8'd76 : _t24);
  assign _t27 = dmac[31:24];
  assign _t28 = (hi == 6'd3);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = (hi == 6'd9);
  assign _t31 = ((|_t30) ? 8'd56 : _t29);
  assign _t32 = dmac[39:32];
  assign _t33 = (hi == 6'd4);
  assign _t34 = ((|_t33) ? _t32 : _t31);
  assign _t35 = (hi == 6'd10);
  assign _t36 = ((|_t35) ? 8'd0 : _t34);
  assign _t37 = dmac[47:40];
  assign _t38 = (hi == 6'd5);
  assign _t39 = ((|_t38) ? _t37 : _t36);
  assign _t40 = (hi == 6'd11);
  assign _t41 = ((|_t40) ? 8'd1 : _t39);
  assign _t42 = (hi == 6'd12);
  assign _t43 = ((|_t42) ? 8'd8 : _t41);
  assign _t44 = (hi == 6'd14);
  assign _t45 = ((|_t44) ? 8'd69 : _t43);
  assign _t46 = tlen[15:8];
  assign _t47 = (hi == 6'd16);
  assign _t48 = ((|_t47) ? _t46 : _t45);
  assign _t49 = tlen[7:0];
  assign _t50 = (hi == 6'd17);
  assign _t51 = ((|_t50) ? _t49 : _t48);
  assign _t52 = (hi == 6'd20);
  assign _t53 = ((|_t52) ? 8'd64 : _t51);
  assign _t54 = (hi == 6'd22);
  assign _t55 = ((|_t54) ? 8'd64 : _t53);
  assign _t56 = (hi == 6'd23);
  assign _t57 = ((|_t56) ? 8'd17 : _t55);
  assign _t58 = ick[15:8];
  assign _t59 = (hi == 6'd24);
  assign _t60 = ((|_t59) ? _t58 : _t57);
  assign _t61 = ick[7:0];
  assign _t62 = (hi == 6'd25);
  assign _t63 = ((|_t62) ? _t61 : _t60);
  assign _t64 = (hi == 6'd26);
  assign _t65 = ((|_t64) ? 8'd192 : _t63);
  assign _t66 = dip[7:0];
  assign _t67 = (hi == 6'd30);
  assign _t68 = ((|_t67) ? _t66 : _t65);
  assign _t69 = (hi == 6'd27);
  assign _t70 = ((|_t69) ? 8'd168 : _t68);
  assign _t71 = dip[15:8];
  assign _t72 = (hi == 6'd31);
  assign _t73 = ((|_t72) ? _t71 : _t70);
  assign _t74 = (hi == 6'd28);
  assign _t75 = ((|_t74) ? 8'd77 : _t73);
  assign _t76 = dip[23:16];
  assign _t77 = (hi == 6'd32);
  assign _t78 = ((|_t77) ? _t76 : _t75);
  assign _t79 = (hi == 6'd29);
  assign _t80 = ((|_t79) ? 8'd2 : _t78);
  assign _t81 = dip[31:24];
  assign _t82 = (hi == 6'd33);
  assign _t83 = ((|_t82) ? _t81 : _t80);
  assign _t84 = (hi == 6'd34);
  assign _t85 = ((|_t84) ? 8'd142 : _t83);
  assign _t86 = (hi == 6'd35);
  assign _t87 = ((|_t86) ? 8'd136 : _t85);
  assign _t88 = dprt[15:8];
  assign _t89 = (hi == 6'd36);
  assign _t90 = ((|_t89) ? _t88 : _t87);
  assign _t91 = dprt[7:0];
  assign _t92 = (hi == 6'd37);
  assign _t93 = ((|_t92) ? _t91 : _t90);
  assign _t94 = ulen[15:8];
  assign _t95 = (hi == 6'd38);
  assign _t96 = ((|_t95) ? _t94 : _t93);
  assign _t97 = ulen[7:0];
  assign _t98 = (hi == 6'd39);
  assign _t99 = ((|_t98) ? _t97 : _t96);
  assign _t100 = ck[15:8];
  assign _t101 = (hi == 6'd40);
  assign _t102 = ((|_t101) ? _t100 : _t99);
  assign _t103 = ck[7:0];
  assign _t104 = (hi == 6'd41);
  assign _t105 = ask_mac[7:0];
  assign _t106 = (hi == 6'd32);
  assign _t107 = (hi == 6'd0);
  assign _t108 = ((|_t107) || (|_t106));
  assign _t109 = ((|_t108) ? _t105 : 8'd0);
  assign _t110 = (hi == 6'd22);
  assign _t111 = (hi == 6'd6);
  assign _t112 = ((|_t111) || (|_t110));
  assign _t113 = ((|_t112) ? 8'd2 : _t109);
  assign _t114 = ask_mac[15:8];
  assign _t115 = (hi == 6'd33);
  assign _t116 = (hi == 6'd1);
  assign _t117 = ((|_t116) || (|_t115));
  assign _t118 = ((|_t117) ? _t114 : _t113);
  assign _t119 = (hi == 6'd23);
  assign _t120 = (hi == 6'd7);
  assign _t121 = ((|_t120) || (|_t119));
  assign _t122 = ((|_t121) ? 8'd0 : _t118);
  assign _t123 = ask_mac[23:16];
  assign _t124 = (hi == 6'd34);
  assign _t125 = (hi == 6'd2);
  assign _t126 = ((|_t125) || (|_t124));
  assign _t127 = ((|_t126) ? _t123 : _t122);
  assign _t128 = (hi == 6'd24);
  assign _t129 = (hi == 6'd8);
  assign _t130 = ((|_t129) || (|_t128));
  assign _t131 = ((|_t130) ? 8'd76 : _t127);
  assign _t132 = ask_mac[31:24];
  assign _t133 = (hi == 6'd35);
  assign _t134 = (hi == 6'd3);
  assign _t135 = ((|_t134) || (|_t133));
  assign _t136 = ((|_t135) ? _t132 : _t131);
  assign _t137 = (hi == 6'd25);
  assign _t138 = (hi == 6'd9);
  assign _t139 = ((|_t138) || (|_t137));
  assign _t140 = ((|_t139) ? 8'd56 : _t136);
  assign _t141 = ask_mac[39:32];
  assign _t142 = (hi == 6'd36);
  assign _t143 = (hi == 6'd4);
  assign _t144 = ((|_t143) || (|_t142));
  assign _t145 = ((|_t144) ? _t141 : _t140);
  assign _t146 = (hi == 6'd26);
  assign _t147 = (hi == 6'd10);
  assign _t148 = ((|_t147) || (|_t146));
  assign _t149 = ((|_t148) ? 8'd0 : _t145);
  assign _t150 = ask_mac[47:40];
  assign _t151 = (hi == 6'd37);
  assign _t152 = (hi == 6'd5);
  assign _t153 = ((|_t152) || (|_t151));
  assign _t154 = ((|_t153) ? _t150 : _t149);
  assign _t155 = (hi == 6'd27);
  assign _t156 = (hi == 6'd11);
  assign _t157 = ((|_t156) || (|_t155));
  assign _t158 = ((|_t157) ? 8'd1 : _t154);
  assign _t159 = (hi == 6'd28);
  assign _t160 = ((|_t159) ? 8'd192 : _t158);
  assign _t161 = ask_ip[7:0];
  assign _t162 = (hi == 6'd38);
  assign _t163 = ((|_t162) ? _t161 : _t160);
  assign _t164 = (hi == 6'd29);
  assign _t165 = ((|_t164) ? 8'd168 : _t163);
  assign _t166 = ask_ip[15:8];
  assign _t167 = (hi == 6'd39);
  assign _t168 = ((|_t167) ? _t166 : _t165);
  assign _t169 = (hi == 6'd30);
  assign _t170 = ((|_t169) ? 8'd77 : _t168);
  assign _t171 = ask_ip[23:16];
  assign _t172 = (hi == 6'd40);
  assign _t173 = ((|_t172) ? _t171 : _t170);
  assign _t174 = (hi == 6'd31);
  assign _t175 = ((|_t174) ? 8'd2 : _t173);
  assign _t176 = ask_ip[31:24];
  assign _t177 = (hi == 6'd41);
  assign _t178 = ((|_t177) ? _t176 : _t175);
  assign _t179 = (hi == 6'd12);
  assign _t180 = ((|_t179) ? 8'd8 : _t178);
  assign _t181 = (hi == 6'd13);
  assign _t182 = ((|_t181) ? 8'd6 : _t180);
  assign _t183 = (hi == 6'd15);
  assign _t184 = ((|_t183) ? 8'd1 : _t182);
  assign _t185 = (hi == 6'd16);
  assign _t186 = ((|_t185) ? 8'd8 : _t184);
  assign _t187 = (hi == 6'd18);
  assign _t188 = ((|_t187) ? 8'd6 : _t186);
  assign _t189 = (hi == 6'd19);
  assign _t190 = ((|_t189) ? 8'd4 : _t188);
  assign _t191 = (hi == 6'd21);
  assign _t192 = ((|peer_valid) || (|1'd1));
  assign _t193 = (len == 16'd0);
  assign _t194 = ((|ask_valid) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (~full);
  assign _t197 = ((|_t196) && (|_t195));
  assign _t198 = ((|_t197) && (|_t192));
  assign _t199 = ({29'b0, ut4_state} == 32'd0);
  assign _t200 = ((|t_valid) && (|t_ready));
  assign _t201 = ({29'b0, ut4_state} == 32'd0);
  assign _t202 = ((|t_valid) && (|t_ready));
  assign _t203 = ((|_t202) && (|t_last));
  assign _t204 = ({29'b0, ut4_state} == 32'd0);
  assign _t205 = ({29'b0, ut4_state} == 32'd0);
  assign _t206 = ({29'b0, ut4_state} == 32'd0);
  assign _t207 = ({29'b0, ut4_state} == 32'd0);
  assign _t208 = ({29'b0, ut4_state} == 32'd0);
  assign _t209 = ({29'b0, ut4_state} == 32'd0);
  assign _t210 = (len + 16'd1);
  assign _t211 = ({29'b0, ut4_state} == 32'd0);
  assign _t212 = ((|_t211) && (|w));
  assign _t213 = {24'b0, t_data};
  assign _t214 = (acc + _t213);
  assign _t215 = len[0];
  assign _t216 = ((|w) && (|_t215));
  assign _t217 = ({29'b0, ut4_state} == 32'd0);
  assign _t218 = ((|_t217) && (|_t216));
  assign _t219 = {24'b0, t_data};
  assign _t220 = (_t219 << 32'd8);
  assign _t221 = ((|_t218) ? _t214 : acc);
  assign _t222 = (acc + _t220);
  assign _t223 = (~_t215);
  assign _t224 = ((|w) && (|_t223));
  assign _t225 = ({29'b0, ut4_state} == 32'd0);
  assign _t226 = ((|_t225) && (|_t224));
  assign _t227 = ((|cm) && (|peer_valid));
  assign _t228 = ({29'b0, ut4_state} == 32'd0);
  assign _t229 = ((|_t228) && (|_t227));
  assign _t230 = ((|cm) && (|peer_valid));
  assign _t231 = ({29'b0, ut4_state} == 32'd0);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = ((|cm) && (|peer_valid));
  assign _t234 = ({29'b0, ut4_state} == 32'd0);
  assign _t235 = ((|_t234) && (|_t233));
  assign _t236 = ((|_t229) ? peer_mac : dmac);
  assign _t237 = (~peer_valid);
  assign _t238 = ((|cm) && (|_t237));
  assign _t239 = ({29'b0, ut4_state} == 32'd0);
  assign _t240 = ((|_t239) && (|_t238));
  assign _t241 = ((|_t232) ? peer_ip : dip);
  assign _t242 = ((|cm) && (|_t237));
  assign _t243 = ({29'b0, ut4_state} == 32'd0);
  assign _t244 = ((|_t243) && (|_t242));
  assign _t245 = ((|_t235) ? peer_port : dprt);
  assign _t246 = ((|cm) && (|_t237));
  assign _t247 = ({29'b0, ut4_state} == 32'd0);
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ({29'b0, ut4_state} == 32'd0);
  assign _t250 = ((|_t249) && (|cm));
  assign _t251 = (len == 16'd0);
  assign _t252 = ((|ask_valid) && (|_t251));
  assign _t253 = (~cm);
  assign _t254 = ((|_t253) && (|_t252));
  assign _t255 = ({29'b0, ut4_state} == 32'd0);
  assign _t256 = ((|_t255) && (|_t254));
  assign _t257 = ((|_t250) ? 32'd1 : ut4_state);
  assign _t258 = ((|_t253) && (|_t252));
  assign _t259 = ({29'b0, ut4_state} == 32'd0);
  assign _t260 = ((|_t259) && (|_t258));
  assign _t261 = ((|_t260) ? 32'd6 : _t257);
  assign _t262 = (~_t252);
  assign _t263 = ((|_t253) && (|_t262));
  assign _t264 = ({29'b0, ut4_state} == 32'd0);
  assign _t265 = ((|_t264) && (|_t263));
  assign _t266 = ((|_t199) ? _t198 : 1'd0);
  assign _t267 = ({29'b0, ut4_state} == 32'd1);
  assign _t268 = ((|_t201) ? _t200 : 1'd0);
  assign _t269 = ({29'b0, ut4_state} == 32'd1);
  assign _t270 = ((|_t204) ? _t203 : 1'd0);
  assign _t271 = ({29'b0, ut4_state} == 32'd1);
  assign _t272 = ((|_t205) ? 1'd0 : 1'd0);
  assign _t273 = ({29'b0, ut4_state} == 32'd1);
  assign _t274 = ((|_t206) ? 1'd0 : 1'd0);
  assign _t275 = ({29'b0, ut4_state} == 32'd1);
  assign _t276 = ((|_t207) ? hb : 8'd0);
  assign _t277 = ({29'b0, ut4_state} == 32'd1);
  assign _t278 = ((|_t208) ? 1'd0 : 1'd0);
  assign _t279 = ({29'b0, ut4_state} == 32'd1);
  assign _t280 = ((|_t209) ? 1'd0 : 1'd0);
  assign _t281 = ({29'b0, ut4_state} == 32'd1);
  assign _t282 = {16'b0, dprt};
  assign _t283 = (acc + dipw);
  assign _t284 = (_t283 + _t282);
  assign _t285 = ((|_t226) ? _t222 : _t221);
  assign _t286 = (_t284 + 32'd105539);
  assign _t287 = ({29'b0, ut4_state} == 32'd1);
  assign _t288 = (dipw + 32'd119483);
  assign _t289 = ({29'b0, ut4_state} == 32'd1);
  assign _t290 = ((|_t265) ? 32'd0 : _t261);
  assign _t291 = ({29'b0, ut4_state} == 32'd1);
  assign _t292 = ((|_t267) ? 1'd0 : _t266);
  assign _t293 = ({29'b0, ut4_state} == 32'd2);
  assign _t294 = ((|_t269) ? 1'd0 : _t268);
  assign _t295 = ({29'b0, ut4_state} == 32'd2);
  assign _t296 = ((|_t271) ? 1'd0 : _t270);
  assign _t297 = ({29'b0, ut4_state} == 32'd2);
  assign _t298 = ((|_t273) ? 1'd0 : _t272);
  assign _t299 = ({29'b0, ut4_state} == 32'd2);
  assign _t300 = ((|_t275) ? 1'd0 : _t274);
  assign _t301 = ({29'b0, ut4_state} == 32'd2);
  assign _t302 = ((|_t277) ? hb : _t276);
  assign _t303 = ({29'b0, ut4_state} == 32'd2);
  assign _t304 = ((|_t279) ? 1'd0 : _t278);
  assign _t305 = ({29'b0, ut4_state} == 32'd2);
  assign _t306 = ((|_t281) ? 1'd0 : _t280);
  assign _t307 = ({29'b0, ut4_state} == 32'd2);
  assign _t308 = {16'b0, ulen};
  assign _t309 = {16'b0, ulen};
  assign _t310 = (acc + _t309);
  assign _t311 = ((|_t287) ? _t286 : _t285);
  assign _t312 = (_t310 + _t308);
  assign _t313 = ({29'b0, ut4_state} == 32'd2);
  assign _t314 = {16'b0, tlen};
  assign _t315 = ((|_t289) ? _t288 : iac);
  assign _t316 = (iac + _t314);
  assign _t317 = ({29'b0, ut4_state} == 32'd2);
  assign _t318 = ((|_t291) ? 32'd2 : _t290);
  assign _t319 = ({29'b0, ut4_state} == 32'd2);
  assign _t320 = ((|_t293) ? 1'd0 : _t292);
  assign _t321 = ({29'b0, ut4_state} == 32'd3);
  assign _t322 = ((|_t295) ? 1'd0 : _t294);
  assign _t323 = ({29'b0, ut4_state} == 32'd3);
  assign _t324 = ((|_t297) ? 1'd0 : _t296);
  assign _t325 = ({29'b0, ut4_state} == 32'd3);
  assign _t326 = ((|_t299) ? 1'd0 : _t298);
  assign _t327 = ({29'b0, ut4_state} == 32'd3);
  assign _t328 = ((|_t301) ? 1'd0 : _t300);
  assign _t329 = ({29'b0, ut4_state} == 32'd3);
  assign _t330 = ((|_t303) ? hb : _t302);
  assign _t331 = ({29'b0, ut4_state} == 32'd3);
  assign _t332 = ((|_t305) ? 1'd0 : _t304);
  assign _t333 = ({29'b0, ut4_state} == 32'd3);
  assign _t334 = ((|_t307) ? 1'd0 : _t306);
  assign _t335 = ({29'b0, ut4_state} == 32'd3);
  assign _t336 = acc[31:16];
  assign _t337 = {16'b0, _t336};
  assign _t338 = acc[15:0];
  assign _t339 = {16'b0, _t338};
  assign _t340 = ((|_t313) ? _t312 : _t311);
  assign _t341 = (_t339 + _t337);
  assign _t342 = iac[31:16];
  assign _t343 = (_t342 != 16'd0);
  assign _t344 = acc[31:16];
  assign _t345 = (_t344 != 16'd0);
  assign _t346 = ((|_t345) || (|_t343));
  assign _t347 = ({29'b0, ut4_state} == 32'd3);
  assign _t348 = ((|_t347) && (|_t346));
  assign _t349 = iac[31:16];
  assign _t350 = {16'b0, _t349};
  assign _t351 = iac[15:0];
  assign _t352 = {16'b0, _t351};
  assign _t353 = ((|_t317) ? _t316 : _t315);
  assign _t354 = (_t352 + _t350);
  assign _t355 = ({29'b0, ut4_state} == 32'd3);
  assign _t356 = ((|_t355) && (|_t346));
  assign _t357 = ((|_t319) ? 32'd3 : _t318);
  assign _t358 = ({29'b0, ut4_state} == 32'd3);
  assign _t359 = ((|_t358) && (|_t346));
  assign _t360 = acc[15:0];
  assign _t361 = (_t360 == 16'd65535);
  assign _t362 = (~_t346);
  assign _t363 = ((|_t362) && (|_t361));
  assign _t364 = ({29'b0, ut4_state} == 32'd3);
  assign _t365 = ((|_t364) && (|_t363));
  assign _t366 = acc[15:0];
  assign _t367 = ((|_t365) ? 16'd65535 : ck);
  assign _t368 = (_t366 ^ 16'd65535);
  assign _t369 = (~_t361);
  assign _t370 = ((|_t362) && (|_t369));
  assign _t371 = ({29'b0, ut4_state} == 32'd3);
  assign _t372 = ((|_t371) && (|_t370));
  assign _t373 = iac[15:0];
  assign _t374 = (_t373 ^ 16'd65535);
  assign _t375 = ({29'b0, ut4_state} == 32'd3);
  assign _t376 = ((|_t375) && (|_t362));
  assign _t377 = ((|_t256) ? 6'd0 : hi);
  assign _t378 = ({29'b0, ut4_state} == 32'd3);
  assign _t379 = ((|_t378) && (|_t362));
  assign _t380 = ((|_t359) ? 32'd3 : _t357);
  assign _t381 = ({29'b0, ut4_state} == 32'd3);
  assign _t382 = ((|_t381) && (|_t362));
  assign _t383 = ((|_t321) ? 1'd0 : _t320);
  assign _t384 = ({29'b0, ut4_state} == 32'd4);
  assign _t385 = ((|_t323) ? 1'd0 : _t322);
  assign _t386 = ({29'b0, ut4_state} == 32'd4);
  assign _t387 = ((|_t325) ? 1'd0 : _t324);
  assign _t388 = ({29'b0, ut4_state} == 32'd4);
  assign _t389 = ((|_t327) ? 1'd0 : _t326);
  assign _t390 = ({29'b0, ut4_state} == 32'd4);
  assign _t391 = ((|_t329) ? 1'd0 : _t328);
  assign _t392 = ({29'b0, ut4_state} == 32'd4);
  assign _t393 = ((|_t331) ? hb : _t330);
  assign _t394 = ({29'b0, ut4_state} == 32'd4);
  assign _t395 = ((|_t333) ? 1'd0 : _t332);
  assign _t396 = ({29'b0, ut4_state} == 32'd4);
  assign _t397 = ((|_t335) ? 1'd0 : _t334);
  assign _t398 = ({29'b0, ut4_state} == 32'd4);
  assign _t399 = ((|_t379) ? 6'd0 : _t377);
  assign _t400 = (hi + 6'd1);
  assign _t401 = ({29'b0, ut4_state} == 32'd4);
  assign _t402 = ((|_t401) && (|o_ready));
  assign _t403 = ((|_t382) ? 32'd4 : _t380);
  assign _t404 = (hi == 6'd41);
  assign _t405 = ((|o_ready) && (|_t404));
  assign _t406 = ({29'b0, ut4_state} == 32'd4);
  assign _t407 = ((|_t406) && (|_t405));
  assign _t408 = ((|_t407) ? 32'd5 : _t403);
  assign _t409 = (~_t405);
  assign _t410 = ({29'b0, ut4_state} == 32'd4);
  assign _t411 = ((|_t410) && (|_t409));
  assign _t412 = ((|_t384) ? 1'd0 : _t383);
  assign _t413 = ({29'b0, ut4_state} == 32'd5);
  assign _t414 = ((|_t386) ? 1'd0 : _t385);
  assign _t415 = ({29'b0, ut4_state} == 32'd5);
  assign _t416 = ((|_t388) ? 1'd0 : _t387);
  assign _t417 = ({29'b0, ut4_state} == 32'd5);
  assign _t418 = ((|_t390) ? 1'd1 : _t389);
  assign _t419 = ({29'b0, ut4_state} == 32'd5);
  assign _t420 = ((|_t392) ? 1'd0 : _t391);
  assign _t421 = ({29'b0, ut4_state} == 32'd5);
  assign _t422 = ((|_t394) ? hb : _t393);
  assign _t423 = ({29'b0, ut4_state} == 32'd5);
  assign _t424 = ((|_t396) ? 1'd0 : _t395);
  assign _t425 = ({29'b0, ut4_state} == 32'd5);
  assign _t426 = ((|_t398) ? 1'd0 : _t397);
  assign _t427 = ({29'b0, ut4_state} == 32'd5);
  assign _t428 = ((|_t212) ? _t210 : len);
  assign _t429 = ((|fo_valid) && (|o_ready));
  assign _t430 = ((|_t429) && (|fo_last));
  assign _t431 = ({29'b0, ut4_state} == 32'd5);
  assign _t432 = ((|_t431) && (|_t430));
  assign _t433 = ((|_t348) ? _t341 : _t340);
  assign _t434 = ({29'b0, ut4_state} == 32'd5);
  assign _t435 = ((|_t434) && (|_t430));
  assign _t436 = (n + 16'd1);
  assign _t437 = ({29'b0, ut4_state} == 32'd5);
  assign _t438 = ((|_t437) && (|_t430));
  assign _t439 = ((|_t411) ? 32'd4 : _t408);
  assign _t440 = ({29'b0, ut4_state} == 32'd5);
  assign _t441 = ((|_t440) && (|_t430));
  assign _t442 = ((|_t441) ? 32'd0 : _t439);
  assign _t443 = (~_t430);
  assign _t444 = ({29'b0, ut4_state} == 32'd5);
  assign _t445 = ((|_t444) && (|_t443));
  assign _t446 = ((|_t413) ? 1'd0 : _t412);
  assign _t447 = ({29'b0, ut4_state} == 32'd6);
  assign _t448 = ((|_t415) ? 1'd0 : _t414);
  assign _t449 = ({29'b0, ut4_state} == 32'd6);
  assign _t450 = ((|_t417) ? 1'd0 : _t416);
  assign _t451 = ({29'b0, ut4_state} == 32'd6);
  assign _t452 = ((|_t419) ? fo_valid : _t418);
  assign _t453 = ({29'b0, ut4_state} == 32'd6);
  assign _t454 = ((|_t421) ? fo_last : _t420);
  assign _t455 = (hi == 6'd41);
  assign _t456 = ({29'b0, ut4_state} == 32'd6);
  assign _t457 = ((|_t423) ? fo_data : _t422);
  assign _t458 = ({29'b0, ut4_state} == 32'd6);
  assign _t459 = ((|_t425) ? o_ready : _t424);
  assign _t460 = ({29'b0, ut4_state} == 32'd6);
  assign _t461 = (hi == 6'd41);
  assign _t462 = ((|_t427) ? 1'd0 : _t426);
  assign _t463 = ((|o_ready) && (|_t461));
  assign _t464 = ({29'b0, ut4_state} == 32'd6);
  assign _t465 = ((|_t402) ? _t400 : _t399);
  assign _t466 = (hi + 6'd1);
  assign _t467 = ({29'b0, ut4_state} == 32'd6);
  assign _t468 = ((|_t467) && (|o_ready));
  assign _t469 = (na + 16'd1);
  assign _t470 = (hi == 6'd41);
  assign _t471 = ((|o_ready) && (|_t470));
  assign _t472 = ({29'b0, ut4_state} == 32'd6);
  assign _t473 = ((|_t472) && (|_t471));
  assign _t474 = ((|_t445) ? 32'd5 : _t442);
  assign _t475 = ({29'b0, ut4_state} == 32'd6);
  assign _t476 = ((|_t475) && (|_t471));
  assign _t477 = ((|_t476) ? 32'd0 : _t474);
  assign _t478 = (~_t471);
  assign _t479 = ({29'b0, ut4_state} == 32'd6);
  assign _t480 = ((|_t479) && (|_t478));
  assign fo_data = q_dst_data;
  assign fo_last = q_dst_last;
  assign fo_valid = q_dst_valid;
  assign ffull = q_full;
  assign full = q_tight;
  assign ulen = (len + 16'd8);
  assign tlen = (len + 16'd28);
  assign dipw = (_t11 + _t1);
  assign hb = ((|_t104) ? _t103 : _t102);
  assign ab = ((|_t191) ? 8'd2 : _t190);
  assign t_ready = ((|_t447) ? 1'd0 : _t446);
  assign w = ((|_t449) ? 1'd0 : _t448);
  assign cm = ((|_t451) ? 1'd0 : _t450);
  assign o_valid = ((|_t453) ? 1'd1 : _t452);
  assign o_last = ((|_t456) ? _t455 : _t454);
  assign o_data = ((|_t458) ? ab : _t457);
  assign fo_ready = ((|_t460) ? 1'd0 : _t459);
  assign ask_ack = ((|_t464) ? _t463 : _t462);
  assign _t481 = ((|_t432) ? 16'd0 : _t428);
  assign _t482 = ((|_t435) ? 32'd0 : _t433);
  assign _t483 = ((|_t240) ? 48'd281474976710655 : _t236);
  assign _t484 = ((|_t244) ? 32'd4294967295 : _t241);
  assign _t485 = ((|_t248) ? 16'd36489 : _t245);
  assign _t486 = ((|_t480) ? 32'd6 : _t477);
  assign _t487 = ((|_t468) ? _t466 : _t465);
  assign _t488 = ((|_t356) ? _t354 : _t353);
  assign _t489 = ((|_t372) ? _t368 : _t367);
  assign _t490 = ((|_t376) ? _t374 : ick);
  assign _t491 = ((|_t438) ? _t436 : n);
  assign _t492 = ((|_t473) ? _t469 : na);
  always @(posedge clk) begin
    if (rst) begin
      len <= 16'd0;
      acc <= 32'd0;
      iac <= 32'd0;
      ck <= 16'd0;
      ick <= 16'd0;
      hi <= 6'd0;
      n <= 16'd0;
      na <= 16'd0;
      dmac <= 48'd0;
      dip <= 32'd0;
      dprt <= 16'd0;
      ut4_state <= 3'd0;
    end else begin
      len <= _t481;
      acc <= _t482;
      iac <= _t488;
      ck <= _t489;
      ick <= _t490;
      hi <= _t487;
      n <= _t491;
      na <= _t492;
      dmac <= _t483;
      dip <= _t484;
      dprt <= _t485;
      ut4_state <= _t486;
    end
  end
  pktfifo_8_2048 q (
    .clk(clk),
    .rst(rst),
    .wr(w),
    .wdata(t_data),
    .wlast(t_last),
    .commit(cm),
    .rewind(1'd0),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(fo_ready),
    .full(q_full),
    .tight(q_tight)
  );
endmodule
`default_nettype wire

`default_nettype none
module udp4_port_36488_2200301993985_3232255234_2048_0_0_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] erx_data,
  input  wire erx_last,
  input  wire erx_valid,
  output wire erx_ready,
  output wire [7:0] etx_data,
  output wire etx_last,
  output wire etx_valid,
  input  wire etx_ready,
  output wire [7:0] rx_data,
  output wire rx_last,
  output wire rx_valid,
  input  wire rx_ready,
  input  wire [7:0] tx_data,
  input  wire tx_last,
  input  wire tx_valid,
  output wire tx_ready,
  output wire [15:0] nr,
  output wire [15:0] nt,
  output wire [15:0] na,
  output wire pr_valid
);
  wire [47:0] pr_mac;
  wire [31:0] pr_ip;
  wire [15:0] pr_port;
  wire ak_valid;
  wire [47:0] ak_mac;
  wire [31:0] ak_ip;
  wire ak_ack;
  wire [7:0] ri_data;
  wire ri_last;
  wire ri_valid;
  wire ri_ready;
  wire [7:0] ri0_data;
  wire ri0_last;
  wire ri0_valid;
  wire ri0_ready;
  wire [8:0] fi_data;
  wire fi_valid;
  wire fi_ready;
  wire [8:0] fo_data;
  wire fo_valid;
  wire fo_ready;
  wire [2:0] fc;
  wire pt_valid;
  wire [47:0] pt_mac;
  wire [31:0] pt_ip;
  wire [15:0] pt_port;
  wire [7:0] tx2_data;
  wire tx2_last;
  wire tx2_valid;
  wire tx2_ready;
  wire _t0;
  wire [8:0] _t1;
  wire [7:0] _t2;
  wire ur_i_ready;
  wire [7:0] ur_o_data;
  wire ur_o_last;
  wire ur_o_valid;
  wire ur_peer_valid;
  wire [47:0] ur_peer_mac;
  wire [31:0] ur_peer_ip;
  wire [15:0] ur_peer_port;
  wire ur_ask_valid;
  wire [47:0] ur_ask_mac;
  wire [31:0] ur_ask_ip;
  wire [15:0] ur_n;
  wire phd_i_ready;
  wire [7:0] phd_o_data;
  wire phd_o_last;
  wire phd_o_valid;
  wire sl_src_ready;
  wire [8:0] sl_dst_data;
  wire sl_dst_valid;
  wire [2:0] sl_cnt;
  wire ptl_i_ready;
  wire [7:0] ptl_o_data;
  wire ptl_o_last;
  wire ptl_o_valid;
  wire ptl_pt_valid;
  wire [47:0] ptl_pt_mac;
  wire [31:0] ptl_pt_ip;
  wire [15:0] ptl_pt_port;
  wire ux_t_ready;
  wire [7:0] ux_o_data;
  wire ux_o_last;
  wire ux_o_valid;
  wire ux_ask_ack;
  wire [15:0] ux_n;
  wire [15:0] ux_na;
  assign _t0 = 1'd0;
  assign _t1 = {_t0, ri_data};
  assign _t2 = _t1[7:0];
  assign erx_ready = ur_i_ready;
  assign ri0_data = ur_o_data;
  assign ri0_last = ur_o_last;
  assign ri0_valid = ur_o_valid;
  assign pr_valid = ur_peer_valid;
  assign pr_mac = ur_peer_mac;
  assign pr_ip = ur_peer_ip;
  assign pr_port = ur_peer_port;
  assign ak_valid = ur_ask_valid;
  assign ak_mac = ur_ask_mac;
  assign ak_ip = ur_ask_ip;
  assign nr = ur_n;
  assign ri0_ready = phd_i_ready;
  assign ri_data = phd_o_data;
  assign ri_last = phd_o_last;
  assign ri_valid = phd_o_valid;
  assign fi_ready = sl_src_ready;
  assign fo_data = sl_dst_data;
  assign fo_valid = sl_dst_valid;
  assign fc = sl_cnt;
  assign fi_valid = ri_valid;
  assign fi_data = {ri_last, _t2};
  assign ri_ready = fi_ready;
  assign rx_valid = fo_valid;
  assign rx_data = fo_data[7:0];
  assign rx_last = fo_data[8];
  assign fo_ready = rx_ready;
  assign tx_ready = ptl_i_ready;
  assign tx2_data = ptl_o_data;
  assign tx2_last = ptl_o_last;
  assign tx2_valid = ptl_o_valid;
  assign pt_valid = ptl_pt_valid;
  assign pt_mac = ptl_pt_mac;
  assign pt_ip = ptl_pt_ip;
  assign pt_port = ptl_pt_port;
  assign tx2_ready = ux_t_ready;
  assign etx_data = ux_o_data;
  assign etx_last = ux_o_last;
  assign etx_valid = ux_o_valid;
  assign ak_ack = ux_ask_ack;
  assign nt = ux_n;
  assign na = ux_na;
  ip4_rx_36488_2200301993985_3232255234_0 ur (
    .clk(clk),
    .rst(rst),
    .i_data(erx_data),
    .i_last(erx_last),
    .i_valid(erx_valid),
    .i_ready(ur_i_ready),
    .o_data(ur_o_data),
    .o_last(ur_o_last),
    .o_valid(ur_o_valid),
    .o_ready(ri0_ready),
    .peer_valid(ur_peer_valid),
    .peer_mac(ur_peer_mac),
    .peer_ip(ur_peer_ip),
    .peer_port(ur_peer_port),
    .ask_valid(ur_ask_valid),
    .ask_mac(ur_ask_mac),
    .ask_ip(ur_ask_ip),
    .ask_ack(ak_ack),
    .n(ur_n)
  );
  peer_head phd (
    .clk(clk),
    .rst(rst),
    .i_data(ri0_data),
    .i_last(ri0_last),
    .i_valid(ri0_valid),
    .i_ready(phd_i_ready),
    .o_data(phd_o_data),
    .o_last(phd_o_last),
    .o_valid(phd_o_valid),
    .o_ready(ri_ready),
    .pr_valid(pr_valid),
    .pr_mac(pr_mac),
    .pr_ip(pr_ip),
    .pr_port(pr_port)
  );
  fifo_9_4 sl (
    .clk(clk),
    .rst(rst),
    .src_data(fi_data),
    .src_valid(fi_valid),
    .src_ready(sl_src_ready),
    .dst_data(sl_dst_data),
    .dst_valid(sl_dst_valid),
    .dst_ready(fo_ready),
    .cnt(sl_cnt)
  );
  peer_tail ptl (
    .clk(clk),
    .rst(rst),
    .i_data(tx_data),
    .i_last(tx_last),
    .i_valid(tx_valid),
    .i_ready(ptl_i_ready),
    .o_data(ptl_o_data),
    .o_last(ptl_o_last),
    .o_valid(ptl_o_valid),
    .o_ready(tx2_ready),
    .pt_valid(ptl_pt_valid),
    .pt_mac(ptl_pt_mac),
    .pt_ip(ptl_pt_ip),
    .pt_port(ptl_pt_port)
  );
  ip4_tx_36488_2200301993985_3232255234_2048_0 ux (
    .clk(clk),
    .rst(rst),
    .t_data(tx2_data),
    .t_last(tx2_last),
    .t_valid(tx2_valid),
    .t_ready(ux_t_ready),
    .o_data(ux_o_data),
    .o_last(ux_o_last),
    .o_valid(ux_o_valid),
    .o_ready(etx_ready),
    .peer_valid(pt_valid),
    .peer_mac(pt_mac),
    .peer_ip(pt_ip),
    .peer_port(pt_port),
    .ask_valid(ak_valid),
    .ask_mac(ak_mac),
    .ask_ip(ak_ip),
    .ask_ack(ux_ask_ack),
    .n(ux_n),
    .na(ux_na)
  );
endmodule
`default_nettype wire

`default_nettype none
module ip4_rx_36486_2200301993985_3232255234_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  output wire peer_valid,
  output wire [47:0] peer_mac,
  output wire [31:0] peer_ip,
  output wire [15:0] peer_port,
  output wire ask_valid,
  output wire [47:0] ask_mac,
  output wire [31:0] ask_ip,
  input  wire ask_ack,
  output reg  [15:0] n
);
  reg  [5:0] idx;
  reg  oku;
  reg  oka;
  reg  bc;
  reg  [15:0] left;
  reg  pv;
  reg  [47:0] pmac;
  reg  [31:0] pip;
  reg  [15:0] pprt;
  reg  [47:0] tmac;
  reg  [31:0] tip;
  reg  [15:0] tprt;
  reg  [31:0] aip;
  reg  av;
  wire [47:0] amac;
  wire [31:0] arip;
  wire pay;
  wire [7:0] d;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire [39:0] _t8;
  wire [47:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [47:0] _t13;
  wire [7:0] _t14;
  wire [31:0] _t15;
  wire [47:0] _t16;
  wire _t17;
  wire _t18;
  wire [47:0] _t19;
  wire [15:0] _t20;
  wire [23:0] _t21;
  wire [47:0] _t22;
  wire _t23;
  wire _t24;
  wire [47:0] _t25;
  wire [23:0] _t26;
  wire [15:0] _t27;
  wire [47:0] _t28;
  wire _t29;
  wire _t30;
  wire [47:0] _t31;
  wire [31:0] _t32;
  wire [7:0] _t33;
  wire [47:0] _t34;
  wire _t35;
  wire _t36;
  wire [47:0] _t37;
  wire [39:0] _t38;
  wire [47:0] _t39;
  wire _t40;
  wire _t41;
  wire [23:0] _t42;
  wire [31:0] _t43;
  wire _t44;
  wire _t45;
  wire [23:0] _t46;
  wire [31:0] _t47;
  wire _t48;
  wire _t49;
  wire [31:0] _t50;
  wire [7:0] _t51;
  wire [15:0] _t52;
  wire [31:0] _t53;
  wire _t54;
  wire _t55;
  wire [31:0] _t56;
  wire [7:0] _t57;
  wire [15:0] _t58;
  wire [31:0] _t59;
  wire _t60;
  wire _t61;
  wire [31:0] _t62;
  wire [15:0] _t63;
  wire [7:0] _t64;
  wire [31:0] _t65;
  wire _t66;
  wire _t67;
  wire [31:0] _t68;
  wire [15:0] _t69;
  wire [7:0] _t70;
  wire [31:0] _t71;
  wire _t72;
  wire _t73;
  wire [31:0] _t74;
  wire [23:0] _t75;
  wire [31:0] _t76;
  wire _t77;
  wire _t78;
  wire [31:0] _t79;
  wire [23:0] _t80;
  wire [31:0] _t81;
  wire _t82;
  wire _t83;
  wire [7:0] _t84;
  wire [15:0] _t85;
  wire _t86;
  wire _t87;
  wire [15:0] _t88;
  wire [7:0] _t89;
  wire [15:0] _t90;
  wire _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [15:0] _t94;
  wire _t95;
  wire _t96;
  wire [15:0] _t97;
  wire [7:0] _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire [15:0] _t101;
  wire [15:0] _t102;
  wire [15:0] _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire _t109;
  wire [15:0] _t110;
  wire [15:0] _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire [5:0] _t121;
  wire [5:0] _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire _t158;
  wire _t159;
  wire _t160;
  wire _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire _t187;
  wire _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [15:0] _t261;
  wire _t262;
  wire [47:0] _t263;
  wire [31:0] _t264;
  wire [31:0] _t265;
  wire [15:0] _t266;
  wire [15:0] _t267;
  wire _t268;
  wire [5:0] _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire [47:0] _t273;
  wire [31:0] _t274;
  wire [15:0] _t275;
  wire [15:0] _t276;
  wire _t277;
  assign _t0 = (left != 16'd0);
  assign _t1 = ((|i_valid) && (|pay));
  assign _t2 = ((|_t1) && (|oku));
  assign _t3 = (left != 16'd0);
  assign _t4 = ((|pay) && (|oku));
  assign _t5 = ((|_t4) && (|_t3));
  assign _t6 = ((|_t5) ? o_ready : 1'd0);
  assign _t7 = (~_t5);
  assign _t8 = tmac[47:8];
  assign _t9 = {_t8, d};
  assign _t10 = (idx == 6'd6);
  assign _t11 = ((|i_valid) && (|i_ready));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? _t9 : tmac);
  assign _t14 = _t13[7:0];
  assign _t15 = _t13[47:16];
  assign _t16 = {_t15, d, _t14};
  assign _t17 = (idx == 6'd7);
  assign _t18 = ((|_t11) && (|_t17));
  assign _t19 = ((|_t18) ? _t16 : _t13);
  assign _t20 = _t19[15:0];
  assign _t21 = _t19[47:24];
  assign _t22 = {_t21, d, _t20};
  assign _t23 = (idx == 6'd8);
  assign _t24 = ((|_t11) && (|_t23));
  assign _t25 = ((|_t24) ? _t22 : _t19);
  assign _t26 = _t25[23:0];
  assign _t27 = _t25[47:32];
  assign _t28 = {_t27, d, _t26};
  assign _t29 = (idx == 6'd9);
  assign _t30 = ((|_t11) && (|_t29));
  assign _t31 = ((|_t30) ? _t28 : _t25);
  assign _t32 = _t31[31:0];
  assign _t33 = _t31[47:40];
  assign _t34 = {_t33, d, _t32};
  assign _t35 = (idx == 6'd10);
  assign _t36 = ((|_t11) && (|_t35));
  assign _t37 = ((|_t36) ? _t34 : _t31);
  assign _t38 = _t37[39:0];
  assign _t39 = {d, _t38};
  assign _t40 = (idx == 6'd11);
  assign _t41 = ((|_t11) && (|_t40));
  assign _t42 = tip[31:8];
  assign _t43 = {_t42, d};
  assign _t44 = (idx == 6'd26);
  assign _t45 = ((|_t11) && (|_t44));
  assign _t46 = aip[31:8];
  assign _t47 = {_t46, d};
  assign _t48 = (idx == 6'd28);
  assign _t49 = ((|_t11) && (|_t48));
  assign _t50 = ((|_t45) ? _t43 : tip);
  assign _t51 = _t50[7:0];
  assign _t52 = _t50[31:16];
  assign _t53 = {_t52, d, _t51};
  assign _t54 = (idx == 6'd27);
  assign _t55 = ((|_t11) && (|_t54));
  assign _t56 = ((|_t49) ? _t47 : aip);
  assign _t57 = _t56[7:0];
  assign _t58 = _t56[31:16];
  assign _t59 = {_t58, d, _t57};
  assign _t60 = (idx == 6'd29);
  assign _t61 = ((|_t11) && (|_t60));
  assign _t62 = ((|_t55) ? _t53 : _t50);
  assign _t63 = _t62[15:0];
  assign _t64 = _t62[31:24];
  assign _t65 = {_t64, d, _t63};
  assign _t66 = (idx == 6'd28);
  assign _t67 = ((|_t11) && (|_t66));
  assign _t68 = ((|_t61) ? _t59 : _t56);
  assign _t69 = _t68[15:0];
  assign _t70 = _t68[31:24];
  assign _t71 = {_t70, d, _t69};
  assign _t72 = (idx == 6'd30);
  assign _t73 = ((|_t11) && (|_t72));
  assign _t74 = ((|_t67) ? _t65 : _t62);
  assign _t75 = _t74[23:0];
  assign _t76 = {d, _t75};
  assign _t77 = (idx == 6'd29);
  assign _t78 = ((|_t11) && (|_t77));
  assign _t79 = ((|_t73) ? _t71 : _t68);
  assign _t80 = _t79[23:0];
  assign _t81 = {d, _t80};
  assign _t82 = (idx == 6'd31);
  assign _t83 = ((|_t11) && (|_t82));
  assign _t84 = tprt[7:0];
  assign _t85 = {d, _t84};
  assign _t86 = (idx == 6'd34);
  assign _t87 = ((|_t11) && (|_t86));
  assign _t88 = ((|_t87) ? _t85 : tprt);
  assign _t89 = _t88[15:8];
  assign _t90 = {_t89, d};
  assign _t91 = (idx == 6'd35);
  assign _t92 = ((|_t11) && (|_t91));
  assign _t93 = left[7:0];
  assign _t94 = {d, _t93};
  assign _t95 = (idx == 6'd38);
  assign _t96 = ((|_t11) && (|_t95));
  assign _t97 = {8'b0, d};
  assign _t98 = left[15:8];
  assign _t99 = {8'b0, _t98};
  assign _t100 = (_t99 << 32'd8);
  assign _t101 = (_t100 + _t97);
  assign _t102 = ((|_t96) ? _t94 : left);
  assign _t103 = (_t101 - 16'd8);
  assign _t104 = (idx == 6'd39);
  assign _t105 = ((|_t11) && (|_t104));
  assign _t106 = (d != 8'd255);
  assign _t107 = (idx < 6'd6);
  assign _t108 = ((|_t107) && (|_t106));
  assign _t109 = ((|_t11) && (|_t108));
  assign _t110 = ((|_t105) ? _t103 : _t102);
  assign _t111 = (left - 16'd1);
  assign _t112 = (left != 16'd0);
  assign _t113 = ((|pay) && (|oku));
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t11) && (|_t114));
  assign _t116 = ((|_t11) && (|i_last));
  assign _t117 = ((|_t11) && (|i_last));
  assign _t118 = ((|_t11) && (|i_last));
  assign _t119 = ((|_t109) ? 1'd0 : bc);
  assign _t120 = ((|_t11) && (|i_last));
  assign _t121 = ((|_t116) ? 6'd0 : idx);
  assign _t122 = (idx + 6'd1);
  assign _t123 = (~pay);
  assign _t124 = (~i_last);
  assign _t125 = ((|_t11) && (|_t124));
  assign _t126 = ((|_t125) && (|_t123));
  assign _t127 = ((|_t117) ? 1'd1 : oku);
  assign _t128 = (d != 8'd2);
  assign _t129 = (idx == 6'd33);
  assign _t130 = ((|_t129) && (|_t128));
  assign _t131 = (d != 8'd77);
  assign _t132 = (idx == 6'd32);
  assign _t133 = ((|_t132) && (|_t131));
  assign _t134 = (d != 8'd168);
  assign _t135 = (idx == 6'd31);
  assign _t136 = ((|_t135) && (|_t134));
  assign _t137 = (d != 8'd192);
  assign _t138 = (idx == 6'd30);
  assign _t139 = ((|_t138) && (|_t137));
  assign _t140 = (d != 8'd134);
  assign _t141 = (idx == 6'd37);
  assign _t142 = ((|_t141) && (|_t140));
  assign _t143 = (d != 8'd142);
  assign _t144 = (idx == 6'd36);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = (d != 8'd17);
  assign _t147 = (idx == 6'd23);
  assign _t148 = ((|_t147) && (|_t146));
  assign _t149 = (d != 8'd69);
  assign _t150 = (idx == 6'd14);
  assign _t151 = ((|_t150) && (|_t149));
  assign _t152 = (d != 8'd0);
  assign _t153 = (idx == 6'd13);
  assign _t154 = ((|_t153) && (|_t152));
  assign _t155 = (d != 8'd8);
  assign _t156 = (idx == 6'd12);
  assign _t157 = ((|_t156) && (|_t155));
  assign _t158 = (d == 8'd255);
  assign _t159 = ((|bc) && (|_t158));
  assign _t160 = (~_t159);
  assign _t161 = (d != 8'd1);
  assign _t162 = (idx == 6'd5);
  assign _t163 = ((|_t162) && (|_t161));
  assign _t164 = ((|_t163) && (|_t160));
  assign _t165 = (d == 8'd255);
  assign _t166 = ((|bc) && (|_t165));
  assign _t167 = (~_t166);
  assign _t168 = (d != 8'd0);
  assign _t169 = (idx == 6'd4);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t170) && (|_t167));
  assign _t172 = (d == 8'd255);
  assign _t173 = ((|bc) && (|_t172));
  assign _t174 = (~_t173);
  assign _t175 = (d != 8'd56);
  assign _t176 = (idx == 6'd3);
  assign _t177 = ((|_t176) && (|_t175));
  assign _t178 = ((|_t177) && (|_t174));
  assign _t179 = (d == 8'd255);
  assign _t180 = ((|bc) && (|_t179));
  assign _t181 = (~_t180);
  assign _t182 = (d != 8'd76);
  assign _t183 = (idx == 6'd2);
  assign _t184 = ((|_t183) && (|_t182));
  assign _t185 = ((|_t184) && (|_t181));
  assign _t186 = (d == 8'd255);
  assign _t187 = ((|bc) && (|_t186));
  assign _t188 = (~_t187);
  assign _t189 = (d != 8'd0);
  assign _t190 = (idx == 6'd1);
  assign _t191 = ((|_t190) && (|_t189));
  assign _t192 = ((|_t191) && (|_t188));
  assign _t193 = (d == 8'd255);
  assign _t194 = ((|bc) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (d != 8'd2);
  assign _t197 = (idx == 6'd0);
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = ((|_t198) && (|_t195));
  assign _t200 = ((|1'd0) || (|_t199));
  assign _t201 = ((|_t200) || (|_t192));
  assign _t202 = ((|_t201) || (|_t185));
  assign _t203 = ((|_t202) || (|_t178));
  assign _t204 = ((|_t203) || (|_t171));
  assign _t205 = ((|_t204) || (|_t164));
  assign _t206 = ((|_t205) || (|_t157));
  assign _t207 = ((|_t206) || (|_t154));
  assign _t208 = ((|_t207) || (|_t151));
  assign _t209 = ((|_t208) || (|_t148));
  assign _t210 = ((|_t209) || (|_t145));
  assign _t211 = ((|_t210) || (|_t142));
  assign _t212 = ((|_t211) || (|_t139));
  assign _t213 = ((|_t212) || (|_t136));
  assign _t214 = ((|_t213) || (|_t133));
  assign _t215 = ((|_t214) || (|_t130));
  assign _t216 = ((|_t11) && (|_t124));
  assign _t217 = ((|_t216) && (|_t215));
  assign _t218 = ((|_t118) ? 1'd1 : oka);
  assign _t219 = (d != 8'd2);
  assign _t220 = (idx == 6'd41);
  assign _t221 = ((|_t220) && (|_t219));
  assign _t222 = (d != 8'd77);
  assign _t223 = (idx == 6'd40);
  assign _t224 = ((|_t223) && (|_t222));
  assign _t225 = (d != 8'd168);
  assign _t226 = (idx == 6'd39);
  assign _t227 = ((|_t226) && (|_t225));
  assign _t228 = (d != 8'd192);
  assign _t229 = (idx == 6'd38);
  assign _t230 = ((|_t229) && (|_t228));
  assign _t231 = (d != 8'd1);
  assign _t232 = (idx == 6'd21);
  assign _t233 = ((|_t232) && (|_t231));
  assign _t234 = (d != 8'd0);
  assign _t235 = (idx == 6'd20);
  assign _t236 = ((|_t235) && (|_t234));
  assign _t237 = (d != 8'd6);
  assign _t238 = (idx == 6'd13);
  assign _t239 = ((|_t238) && (|_t237));
  assign _t240 = (d != 8'd8);
  assign _t241 = (idx == 6'd12);
  assign _t242 = ((|_t241) && (|_t240));
  assign _t243 = ((|_t205) || (|_t242));
  assign _t244 = ((|_t243) || (|_t239));
  assign _t245 = ((|_t244) || (|_t236));
  assign _t246 = ((|_t245) || (|_t233));
  assign _t247 = ((|_t246) || (|_t230));
  assign _t248 = ((|_t247) || (|_t227));
  assign _t249 = ((|_t248) || (|_t224));
  assign _t250 = ((|_t249) || (|_t221));
  assign _t251 = ((|_t11) && (|_t124));
  assign _t252 = ((|_t251) && (|_t250));
  assign _t253 = (idx == 6'd41);
  assign _t254 = (~_t215);
  assign _t255 = ((|oku) && (|_t254));
  assign _t256 = ((|_t255) && (|_t253));
  assign _t257 = ((|_t11) && (|_t256));
  assign _t258 = ((|_t11) && (|_t256));
  assign _t259 = ((|_t11) && (|_t256));
  assign _t260 = ((|_t11) && (|_t256));
  assign _t261 = (n + 16'd1);
  assign _t262 = ((|_t11) && (|_t256));
  assign d = i_data;
  assign pay = (idx == 6'd42);
  assign o_valid = ((|_t2) && (|_t0));
  assign o_data = d;
  assign o_last = (left == 16'd1);
  assign i_ready = ((|_t7) ? 1'd1 : _t6);
  assign _t263 = ((|_t41) ? _t39 : _t37);
  assign _t264 = ((|_t78) ? _t76 : _t74);
  assign _t265 = ((|_t83) ? _t81 : _t79);
  assign _t266 = ((|_t92) ? _t90 : _t88);
  assign _t267 = ((|_t115) ? _t111 : _t110);
  assign _t268 = ((|_t120) ? 1'd1 : _t119);
  assign _t269 = ((|_t126) ? _t122 : _t121);
  assign _t270 = ((|_t217) ? 1'd0 : _t127);
  assign _t271 = ((|_t252) ? 1'd0 : _t218);
  assign _t272 = ((|_t257) ? 1'd1 : pv);
  assign _t273 = ((|_t258) ? tmac : pmac);
  assign _t274 = ((|_t259) ? tip : pip);
  assign _t275 = ((|_t260) ? tprt : pprt);
  assign _t276 = ((|_t262) ? _t261 : n);
  assign _t277 = ((|ask_ack) ? 1'd0 : av);
  assign peer_valid = pv;
  assign peer_mac = pmac;
  assign peer_ip = pip;
  assign peer_port = pprt;
  assign ask_valid = av;
  assign ask_mac = amac;
  assign ask_ip = arip;
  assign amac = 48'd0;
  assign arip = 32'd0;
  always @(posedge clk) begin
    if (rst) begin
      idx <= 6'd0;
      oku <= 1'd1;
      oka <= 1'd1;
      bc <= 1'd1;
      left <= 16'd0;
      n <= 16'd0;
      pv <= 1'd0;
      pmac <= 48'd0;
      pip <= 32'd0;
      pprt <= 16'd0;
      tmac <= 48'd0;
      tip <= 32'd0;
      tprt <= 16'd0;
      aip <= 32'd0;
      av <= 1'd0;
    end else begin
      idx <= _t269;
      oku <= _t270;
      oka <= _t271;
      bc <= _t268;
      left <= _t267;
      n <= _t276;
      pv <= _t272;
      pmac <= _t273;
      pip <= _t274;
      pprt <= _t275;
      tmac <= _t263;
      tip <= _t264;
      tprt <= _t266;
      aip <= _t265;
      av <= _t277;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ip4_tx_36486_2200301993985_3232255234_2048_0 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready,
  input  wire peer_valid,
  input  wire [47:0] peer_mac,
  input  wire [31:0] peer_ip,
  input  wire [15:0] peer_port,
  input  wire ask_valid,
  input  wire [47:0] ask_mac,
  input  wire [31:0] ask_ip,
  output wire ask_ack,
  output reg  [15:0] n,
  output reg  [15:0] na
);
  reg  [15:0] len;
  reg  [31:0] acc;
  reg  [31:0] iac;
  reg  [15:0] ck;
  reg  [15:0] ick;
  reg  [5:0] hi;
  reg  [47:0] dmac;
  reg  [31:0] dip;
  reg  [15:0] dprt;
  wire [15:0] ulen;
  wire [15:0] tlen;
  wire [31:0] dipw;
  wire [7:0] hb;
  wire [7:0] ab;
  wire w;
  wire cm;
  wire full;
  wire ffull;
  wire [7:0] fo_data;
  wire fo_last;
  wire fo_valid;
  wire fo_ready;
  reg  [2:0] ut5_state;
  wire [7:0] _t0;
  wire [31:0] _t1;
  wire [7:0] _t2;
  wire [31:0] _t3;
  wire [31:0] _t4;
  wire [7:0] _t5;
  wire [31:0] _t6;
  wire [7:0] _t7;
  wire [31:0] _t8;
  wire [31:0] _t9;
  wire [31:0] _t10;
  wire [31:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire _t15;
  wire [7:0] _t16;
  wire [7:0] _t17;
  wire _t18;
  wire [7:0] _t19;
  wire _t20;
  wire [7:0] _t21;
  wire [7:0] _t22;
  wire _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire _t30;
  wire [7:0] _t31;
  wire [7:0] _t32;
  wire _t33;
  wire [7:0] _t34;
  wire _t35;
  wire [7:0] _t36;
  wire [7:0] _t37;
  wire _t38;
  wire [7:0] _t39;
  wire _t40;
  wire [7:0] _t41;
  wire _t42;
  wire [7:0] _t43;
  wire _t44;
  wire [7:0] _t45;
  wire [7:0] _t46;
  wire _t47;
  wire [7:0] _t48;
  wire [7:0] _t49;
  wire _t50;
  wire [7:0] _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire [7:0] _t55;
  wire _t56;
  wire [7:0] _t57;
  wire [7:0] _t58;
  wire _t59;
  wire [7:0] _t60;
  wire [7:0] _t61;
  wire _t62;
  wire [7:0] _t63;
  wire _t64;
  wire [7:0] _t65;
  wire [7:0] _t66;
  wire _t67;
  wire [7:0] _t68;
  wire _t69;
  wire [7:0] _t70;
  wire [7:0] _t71;
  wire _t72;
  wire [7:0] _t73;
  wire _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire _t77;
  wire [7:0] _t78;
  wire _t79;
  wire [7:0] _t80;
  wire [7:0] _t81;
  wire _t82;
  wire [7:0] _t83;
  wire _t84;
  wire [7:0] _t85;
  wire _t86;
  wire [7:0] _t87;
  wire [7:0] _t88;
  wire _t89;
  wire [7:0] _t90;
  wire [7:0] _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [7:0] _t94;
  wire _t95;
  wire [7:0] _t96;
  wire [7:0] _t97;
  wire _t98;
  wire [7:0] _t99;
  wire [7:0] _t100;
  wire _t101;
  wire [7:0] _t102;
  wire [7:0] _t103;
  wire _t104;
  wire [7:0] _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire [7:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire [7:0] _t113;
  wire [7:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire [7:0] _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire [7:0] _t122;
  wire [7:0] _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire [7:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire [7:0] _t131;
  wire [7:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire [7:0] _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire [7:0] _t140;
  wire [7:0] _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire [7:0] _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire [7:0] _t149;
  wire [7:0] _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [7:0] _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire [7:0] _t158;
  wire _t159;
  wire [7:0] _t160;
  wire [7:0] _t161;
  wire _t162;
  wire [7:0] _t163;
  wire _t164;
  wire [7:0] _t165;
  wire [7:0] _t166;
  wire _t167;
  wire [7:0] _t168;
  wire _t169;
  wire [7:0] _t170;
  wire [7:0] _t171;
  wire _t172;
  wire [7:0] _t173;
  wire _t174;
  wire [7:0] _t175;
  wire [7:0] _t176;
  wire _t177;
  wire [7:0] _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [7:0] _t182;
  wire _t183;
  wire [7:0] _t184;
  wire _t185;
  wire [7:0] _t186;
  wire _t187;
  wire [7:0] _t188;
  wire _t189;
  wire [7:0] _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire [15:0] _t210;
  wire _t211;
  wire _t212;
  wire [31:0] _t213;
  wire [31:0] _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire [31:0] _t219;
  wire [31:0] _t220;
  wire [31:0] _t221;
  wire [31:0] _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire [47:0] _t236;
  wire _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire [31:0] _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire [15:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [2:0] _t257;
  wire _t258;
  wire _t259;
  wire _t260;
  wire [2:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire _t274;
  wire _t275;
  wire [7:0] _t276;
  wire _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire _t281;
  wire [31:0] _t282;
  wire [31:0] _t283;
  wire [31:0] _t284;
  wire [31:0] _t285;
  wire [31:0] _t286;
  wire _t287;
  wire [31:0] _t288;
  wire _t289;
  wire [2:0] _t290;
  wire _t291;
  wire _t292;
  wire _t293;
  wire _t294;
  wire _t295;
  wire _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire [7:0] _t302;
  wire _t303;
  wire _t304;
  wire _t305;
  wire _t306;
  wire _t307;
  wire [31:0] _t308;
  wire [31:0] _t309;
  wire [31:0] _t310;
  wire [31:0] _t311;
  wire [31:0] _t312;
  wire _t313;
  wire [31:0] _t314;
  wire [31:0] _t315;
  wire [31:0] _t316;
  wire _t317;
  wire [2:0] _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire _t323;
  wire _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [7:0] _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire _t334;
  wire _t335;
  wire [15:0] _t336;
  wire [31:0] _t337;
  wire [15:0] _t338;
  wire [31:0] _t339;
  wire [31:0] _t340;
  wire [31:0] _t341;
  wire [15:0] _t342;
  wire _t343;
  wire [15:0] _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire [15:0] _t349;
  wire [31:0] _t350;
  wire [15:0] _t351;
  wire [31:0] _t352;
  wire [31:0] _t353;
  wire [31:0] _t354;
  wire _t355;
  wire _t356;
  wire [2:0] _t357;
  wire _t358;
  wire _t359;
  wire [15:0] _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire [15:0] _t366;
  wire [15:0] _t367;
  wire [15:0] _t368;
  wire _t369;
  wire _t370;
  wire _t371;
  wire _t372;
  wire [15:0] _t373;
  wire [15:0] _t374;
  wire _t375;
  wire _t376;
  wire [5:0] _t377;
  wire _t378;
  wire _t379;
  wire [2:0] _t380;
  wire _t381;
  wire _t382;
  wire _t383;
  wire _t384;
  wire _t385;
  wire _t386;
  wire _t387;
  wire _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire _t392;
  wire [7:0] _t393;
  wire _t394;
  wire _t395;
  wire _t396;
  wire _t397;
  wire _t398;
  wire [5:0] _t399;
  wire [5:0] _t400;
  wire _t401;
  wire _t402;
  wire [2:0] _t403;
  wire _t404;
  wire _t405;
  wire _t406;
  wire _t407;
  wire [2:0] _t408;
  wire _t409;
  wire _t410;
  wire _t411;
  wire _t412;
  wire _t413;
  wire _t414;
  wire _t415;
  wire _t416;
  wire _t417;
  wire _t418;
  wire _t419;
  wire _t420;
  wire _t421;
  wire [7:0] _t422;
  wire _t423;
  wire _t424;
  wire _t425;
  wire _t426;
  wire _t427;
  wire [15:0] _t428;
  wire _t429;
  wire _t430;
  wire _t431;
  wire _t432;
  wire [31:0] _t433;
  wire _t434;
  wire _t435;
  wire [15:0] _t436;
  wire _t437;
  wire _t438;
  wire [2:0] _t439;
  wire _t440;
  wire _t441;
  wire [2:0] _t442;
  wire _t443;
  wire _t444;
  wire _t445;
  wire _t446;
  wire _t447;
  wire _t448;
  wire _t449;
  wire _t450;
  wire _t451;
  wire _t452;
  wire _t453;
  wire _t454;
  wire _t455;
  wire _t456;
  wire [7:0] _t457;
  wire _t458;
  wire _t459;
  wire _t460;
  wire _t461;
  wire _t462;
  wire _t463;
  wire _t464;
  wire [5:0] _t465;
  wire [5:0] _t466;
  wire _t467;
  wire _t468;
  wire [15:0] _t469;
  wire _t470;
  wire _t471;
  wire _t472;
  wire _t473;
  wire [2:0] _t474;
  wire _t475;
  wire _t476;
  wire [2:0] _t477;
  wire _t478;
  wire _t479;
  wire _t480;
  wire [15:0] _t481;
  wire [31:0] _t482;
  wire [47:0] _t483;
  wire [31:0] _t484;
  wire [15:0] _t485;
  wire [2:0] _t486;
  wire [5:0] _t487;
  wire [31:0] _t488;
  wire [15:0] _t489;
  wire [15:0] _t490;
  wire [15:0] _t491;
  wire [15:0] _t492;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  assign _t0 = dip[31:24];
  assign _t1 = {24'b0, _t0};
  assign _t2 = dip[23:16];
  assign _t3 = {24'b0, _t2};
  assign _t4 = (_t3 << 32'd8);
  assign _t5 = dip[15:8];
  assign _t6 = {24'b0, _t5};
  assign _t7 = dip[7:0];
  assign _t8 = {24'b0, _t7};
  assign _t9 = (_t8 << 32'd8);
  assign _t10 = (_t9 + _t6);
  assign _t11 = (_t10 + _t4);
  assign _t12 = dmac[7:0];
  assign _t13 = (hi == 6'd0);
  assign _t14 = ((|_t13) ? _t12 : 8'd0);
  assign _t15 = (hi == 6'd6);
  assign _t16 = ((|_t15) ? 8'd2 : _t14);
  assign _t17 = dmac[15:8];
  assign _t18 = (hi == 6'd1);
  assign _t19 = ((|_t18) ? _t17 : _t16);
  assign _t20 = (hi == 6'd7);
  assign _t21 = ((|_t20) ? 8'd0 : _t19);
  assign _t22 = dmac[23:16];
  assign _t23 = (hi == 6'd2);
  assign _t24 = ((|_t23) ? _t22 : _t21);
  assign _t25 = (hi == 6'd8);
  assign _t26 = ((|_t25) ? 8'd76 : _t24);
  assign _t27 = dmac[31:24];
  assign _t28 = (hi == 6'd3);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = (hi == 6'd9);
  assign _t31 = ((|_t30) ? 8'd56 : _t29);
  assign _t32 = dmac[39:32];
  assign _t33 = (hi == 6'd4);
  assign _t34 = ((|_t33) ? _t32 : _t31);
  assign _t35 = (hi == 6'd10);
  assign _t36 = ((|_t35) ? 8'd0 : _t34);
  assign _t37 = dmac[47:40];
  assign _t38 = (hi == 6'd5);
  assign _t39 = ((|_t38) ? _t37 : _t36);
  assign _t40 = (hi == 6'd11);
  assign _t41 = ((|_t40) ? 8'd1 : _t39);
  assign _t42 = (hi == 6'd12);
  assign _t43 = ((|_t42) ? 8'd8 : _t41);
  assign _t44 = (hi == 6'd14);
  assign _t45 = ((|_t44) ? 8'd69 : _t43);
  assign _t46 = tlen[15:8];
  assign _t47 = (hi == 6'd16);
  assign _t48 = ((|_t47) ? _t46 : _t45);
  assign _t49 = tlen[7:0];
  assign _t50 = (hi == 6'd17);
  assign _t51 = ((|_t50) ? _t49 : _t48);
  assign _t52 = (hi == 6'd20);
  assign _t53 = ((|_t52) ? 8'd64 : _t51);
  assign _t54 = (hi == 6'd22);
  assign _t55 = ((|_t54) ? 8'd64 : _t53);
  assign _t56 = (hi == 6'd23);
  assign _t57 = ((|_t56) ? 8'd17 : _t55);
  assign _t58 = ick[15:8];
  assign _t59 = (hi == 6'd24);
  assign _t60 = ((|_t59) ? _t58 : _t57);
  assign _t61 = ick[7:0];
  assign _t62 = (hi == 6'd25);
  assign _t63 = ((|_t62) ? _t61 : _t60);
  assign _t64 = (hi == 6'd26);
  assign _t65 = ((|_t64) ? 8'd192 : _t63);
  assign _t66 = dip[7:0];
  assign _t67 = (hi == 6'd30);
  assign _t68 = ((|_t67) ? _t66 : _t65);
  assign _t69 = (hi == 6'd27);
  assign _t70 = ((|_t69) ? 8'd168 : _t68);
  assign _t71 = dip[15:8];
  assign _t72 = (hi == 6'd31);
  assign _t73 = ((|_t72) ? _t71 : _t70);
  assign _t74 = (hi == 6'd28);
  assign _t75 = ((|_t74) ? 8'd77 : _t73);
  assign _t76 = dip[23:16];
  assign _t77 = (hi == 6'd32);
  assign _t78 = ((|_t77) ? _t76 : _t75);
  assign _t79 = (hi == 6'd29);
  assign _t80 = ((|_t79) ? 8'd2 : _t78);
  assign _t81 = dip[31:24];
  assign _t82 = (hi == 6'd33);
  assign _t83 = ((|_t82) ? _t81 : _t80);
  assign _t84 = (hi == 6'd34);
  assign _t85 = ((|_t84) ? 8'd142 : _t83);
  assign _t86 = (hi == 6'd35);
  assign _t87 = ((|_t86) ? 8'd134 : _t85);
  assign _t88 = dprt[15:8];
  assign _t89 = (hi == 6'd36);
  assign _t90 = ((|_t89) ? _t88 : _t87);
  assign _t91 = dprt[7:0];
  assign _t92 = (hi == 6'd37);
  assign _t93 = ((|_t92) ? _t91 : _t90);
  assign _t94 = ulen[15:8];
  assign _t95 = (hi == 6'd38);
  assign _t96 = ((|_t95) ? _t94 : _t93);
  assign _t97 = ulen[7:0];
  assign _t98 = (hi == 6'd39);
  assign _t99 = ((|_t98) ? _t97 : _t96);
  assign _t100 = ck[15:8];
  assign _t101 = (hi == 6'd40);
  assign _t102 = ((|_t101) ? _t100 : _t99);
  assign _t103 = ck[7:0];
  assign _t104 = (hi == 6'd41);
  assign _t105 = ask_mac[7:0];
  assign _t106 = (hi == 6'd32);
  assign _t107 = (hi == 6'd0);
  assign _t108 = ((|_t107) || (|_t106));
  assign _t109 = ((|_t108) ? _t105 : 8'd0);
  assign _t110 = (hi == 6'd22);
  assign _t111 = (hi == 6'd6);
  assign _t112 = ((|_t111) || (|_t110));
  assign _t113 = ((|_t112) ? 8'd2 : _t109);
  assign _t114 = ask_mac[15:8];
  assign _t115 = (hi == 6'd33);
  assign _t116 = (hi == 6'd1);
  assign _t117 = ((|_t116) || (|_t115));
  assign _t118 = ((|_t117) ? _t114 : _t113);
  assign _t119 = (hi == 6'd23);
  assign _t120 = (hi == 6'd7);
  assign _t121 = ((|_t120) || (|_t119));
  assign _t122 = ((|_t121) ? 8'd0 : _t118);
  assign _t123 = ask_mac[23:16];
  assign _t124 = (hi == 6'd34);
  assign _t125 = (hi == 6'd2);
  assign _t126 = ((|_t125) || (|_t124));
  assign _t127 = ((|_t126) ? _t123 : _t122);
  assign _t128 = (hi == 6'd24);
  assign _t129 = (hi == 6'd8);
  assign _t130 = ((|_t129) || (|_t128));
  assign _t131 = ((|_t130) ? 8'd76 : _t127);
  assign _t132 = ask_mac[31:24];
  assign _t133 = (hi == 6'd35);
  assign _t134 = (hi == 6'd3);
  assign _t135 = ((|_t134) || (|_t133));
  assign _t136 = ((|_t135) ? _t132 : _t131);
  assign _t137 = (hi == 6'd25);
  assign _t138 = (hi == 6'd9);
  assign _t139 = ((|_t138) || (|_t137));
  assign _t140 = ((|_t139) ? 8'd56 : _t136);
  assign _t141 = ask_mac[39:32];
  assign _t142 = (hi == 6'd36);
  assign _t143 = (hi == 6'd4);
  assign _t144 = ((|_t143) || (|_t142));
  assign _t145 = ((|_t144) ? _t141 : _t140);
  assign _t146 = (hi == 6'd26);
  assign _t147 = (hi == 6'd10);
  assign _t148 = ((|_t147) || (|_t146));
  assign _t149 = ((|_t148) ? 8'd0 : _t145);
  assign _t150 = ask_mac[47:40];
  assign _t151 = (hi == 6'd37);
  assign _t152 = (hi == 6'd5);
  assign _t153 = ((|_t152) || (|_t151));
  assign _t154 = ((|_t153) ? _t150 : _t149);
  assign _t155 = (hi == 6'd27);
  assign _t156 = (hi == 6'd11);
  assign _t157 = ((|_t156) || (|_t155));
  assign _t158 = ((|_t157) ? 8'd1 : _t154);
  assign _t159 = (hi == 6'd28);
  assign _t160 = ((|_t159) ? 8'd192 : _t158);
  assign _t161 = ask_ip[7:0];
  assign _t162 = (hi == 6'd38);
  assign _t163 = ((|_t162) ? _t161 : _t160);
  assign _t164 = (hi == 6'd29);
  assign _t165 = ((|_t164) ? 8'd168 : _t163);
  assign _t166 = ask_ip[15:8];
  assign _t167 = (hi == 6'd39);
  assign _t168 = ((|_t167) ? _t166 : _t165);
  assign _t169 = (hi == 6'd30);
  assign _t170 = ((|_t169) ? 8'd77 : _t168);
  assign _t171 = ask_ip[23:16];
  assign _t172 = (hi == 6'd40);
  assign _t173 = ((|_t172) ? _t171 : _t170);
  assign _t174 = (hi == 6'd31);
  assign _t175 = ((|_t174) ? 8'd2 : _t173);
  assign _t176 = ask_ip[31:24];
  assign _t177 = (hi == 6'd41);
  assign _t178 = ((|_t177) ? _t176 : _t175);
  assign _t179 = (hi == 6'd12);
  assign _t180 = ((|_t179) ? 8'd8 : _t178);
  assign _t181 = (hi == 6'd13);
  assign _t182 = ((|_t181) ? 8'd6 : _t180);
  assign _t183 = (hi == 6'd15);
  assign _t184 = ((|_t183) ? 8'd1 : _t182);
  assign _t185 = (hi == 6'd16);
  assign _t186 = ((|_t185) ? 8'd8 : _t184);
  assign _t187 = (hi == 6'd18);
  assign _t188 = ((|_t187) ? 8'd6 : _t186);
  assign _t189 = (hi == 6'd19);
  assign _t190 = ((|_t189) ? 8'd4 : _t188);
  assign _t191 = (hi == 6'd21);
  assign _t192 = ((|peer_valid) || (|1'd1));
  assign _t193 = (len == 16'd0);
  assign _t194 = ((|ask_valid) && (|_t193));
  assign _t195 = (~_t194);
  assign _t196 = (~full);
  assign _t197 = ((|_t196) && (|_t195));
  assign _t198 = ((|_t197) && (|_t192));
  assign _t199 = ({29'b0, ut5_state} == 32'd0);
  assign _t200 = ((|t_valid) && (|t_ready));
  assign _t201 = ({29'b0, ut5_state} == 32'd0);
  assign _t202 = ((|t_valid) && (|t_ready));
  assign _t203 = ((|_t202) && (|t_last));
  assign _t204 = ({29'b0, ut5_state} == 32'd0);
  assign _t205 = ({29'b0, ut5_state} == 32'd0);
  assign _t206 = ({29'b0, ut5_state} == 32'd0);
  assign _t207 = ({29'b0, ut5_state} == 32'd0);
  assign _t208 = ({29'b0, ut5_state} == 32'd0);
  assign _t209 = ({29'b0, ut5_state} == 32'd0);
  assign _t210 = (len + 16'd1);
  assign _t211 = ({29'b0, ut5_state} == 32'd0);
  assign _t212 = ((|_t211) && (|w));
  assign _t213 = {24'b0, t_data};
  assign _t214 = (acc + _t213);
  assign _t215 = len[0];
  assign _t216 = ((|w) && (|_t215));
  assign _t217 = ({29'b0, ut5_state} == 32'd0);
  assign _t218 = ((|_t217) && (|_t216));
  assign _t219 = {24'b0, t_data};
  assign _t220 = (_t219 << 32'd8);
  assign _t221 = ((|_t218) ? _t214 : acc);
  assign _t222 = (acc + _t220);
  assign _t223 = (~_t215);
  assign _t224 = ((|w) && (|_t223));
  assign _t225 = ({29'b0, ut5_state} == 32'd0);
  assign _t226 = ((|_t225) && (|_t224));
  assign _t227 = ((|cm) && (|peer_valid));
  assign _t228 = ({29'b0, ut5_state} == 32'd0);
  assign _t229 = ((|_t228) && (|_t227));
  assign _t230 = ((|cm) && (|peer_valid));
  assign _t231 = ({29'b0, ut5_state} == 32'd0);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = ((|cm) && (|peer_valid));
  assign _t234 = ({29'b0, ut5_state} == 32'd0);
  assign _t235 = ((|_t234) && (|_t233));
  assign _t236 = ((|_t229) ? peer_mac : dmac);
  assign _t237 = (~peer_valid);
  assign _t238 = ((|cm) && (|_t237));
  assign _t239 = ({29'b0, ut5_state} == 32'd0);
  assign _t240 = ((|_t239) && (|_t238));
  assign _t241 = ((|_t232) ? peer_ip : dip);
  assign _t242 = ((|cm) && (|_t237));
  assign _t243 = ({29'b0, ut5_state} == 32'd0);
  assign _t244 = ((|_t243) && (|_t242));
  assign _t245 = ((|_t235) ? peer_port : dprt);
  assign _t246 = ((|cm) && (|_t237));
  assign _t247 = ({29'b0, ut5_state} == 32'd0);
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ({29'b0, ut5_state} == 32'd0);
  assign _t250 = ((|_t249) && (|cm));
  assign _t251 = (len == 16'd0);
  assign _t252 = ((|ask_valid) && (|_t251));
  assign _t253 = (~cm);
  assign _t254 = ((|_t253) && (|_t252));
  assign _t255 = ({29'b0, ut5_state} == 32'd0);
  assign _t256 = ((|_t255) && (|_t254));
  assign _t257 = ((|_t250) ? 32'd1 : ut5_state);
  assign _t258 = ((|_t253) && (|_t252));
  assign _t259 = ({29'b0, ut5_state} == 32'd0);
  assign _t260 = ((|_t259) && (|_t258));
  assign _t261 = ((|_t260) ? 32'd6 : _t257);
  assign _t262 = (~_t252);
  assign _t263 = ((|_t253) && (|_t262));
  assign _t264 = ({29'b0, ut5_state} == 32'd0);
  assign _t265 = ((|_t264) && (|_t263));
  assign _t266 = ((|_t199) ? _t198 : 1'd0);
  assign _t267 = ({29'b0, ut5_state} == 32'd1);
  assign _t268 = ((|_t201) ? _t200 : 1'd0);
  assign _t269 = ({29'b0, ut5_state} == 32'd1);
  assign _t270 = ((|_t204) ? _t203 : 1'd0);
  assign _t271 = ({29'b0, ut5_state} == 32'd1);
  assign _t272 = ((|_t205) ? 1'd0 : 1'd0);
  assign _t273 = ({29'b0, ut5_state} == 32'd1);
  assign _t274 = ((|_t206) ? 1'd0 : 1'd0);
  assign _t275 = ({29'b0, ut5_state} == 32'd1);
  assign _t276 = ((|_t207) ? hb : 8'd0);
  assign _t277 = ({29'b0, ut5_state} == 32'd1);
  assign _t278 = ((|_t208) ? 1'd0 : 1'd0);
  assign _t279 = ({29'b0, ut5_state} == 32'd1);
  assign _t280 = ((|_t209) ? 1'd0 : 1'd0);
  assign _t281 = ({29'b0, ut5_state} == 32'd1);
  assign _t282 = {16'b0, dprt};
  assign _t283 = (acc + dipw);
  assign _t284 = (_t283 + _t282);
  assign _t285 = ((|_t226) ? _t222 : _t221);
  assign _t286 = (_t284 + 32'd105537);
  assign _t287 = ({29'b0, ut5_state} == 32'd1);
  assign _t288 = (dipw + 32'd119483);
  assign _t289 = ({29'b0, ut5_state} == 32'd1);
  assign _t290 = ((|_t265) ? 32'd0 : _t261);
  assign _t291 = ({29'b0, ut5_state} == 32'd1);
  assign _t292 = ((|_t267) ? 1'd0 : _t266);
  assign _t293 = ({29'b0, ut5_state} == 32'd2);
  assign _t294 = ((|_t269) ? 1'd0 : _t268);
  assign _t295 = ({29'b0, ut5_state} == 32'd2);
  assign _t296 = ((|_t271) ? 1'd0 : _t270);
  assign _t297 = ({29'b0, ut5_state} == 32'd2);
  assign _t298 = ((|_t273) ? 1'd0 : _t272);
  assign _t299 = ({29'b0, ut5_state} == 32'd2);
  assign _t300 = ((|_t275) ? 1'd0 : _t274);
  assign _t301 = ({29'b0, ut5_state} == 32'd2);
  assign _t302 = ((|_t277) ? hb : _t276);
  assign _t303 = ({29'b0, ut5_state} == 32'd2);
  assign _t304 = ((|_t279) ? 1'd0 : _t278);
  assign _t305 = ({29'b0, ut5_state} == 32'd2);
  assign _t306 = ((|_t281) ? 1'd0 : _t280);
  assign _t307 = ({29'b0, ut5_state} == 32'd2);
  assign _t308 = {16'b0, ulen};
  assign _t309 = {16'b0, ulen};
  assign _t310 = (acc + _t309);
  assign _t311 = ((|_t287) ? _t286 : _t285);
  assign _t312 = (_t310 + _t308);
  assign _t313 = ({29'b0, ut5_state} == 32'd2);
  assign _t314 = {16'b0, tlen};
  assign _t315 = ((|_t289) ? _t288 : iac);
  assign _t316 = (iac + _t314);
  assign _t317 = ({29'b0, ut5_state} == 32'd2);
  assign _t318 = ((|_t291) ? 32'd2 : _t290);
  assign _t319 = ({29'b0, ut5_state} == 32'd2);
  assign _t320 = ((|_t293) ? 1'd0 : _t292);
  assign _t321 = ({29'b0, ut5_state} == 32'd3);
  assign _t322 = ((|_t295) ? 1'd0 : _t294);
  assign _t323 = ({29'b0, ut5_state} == 32'd3);
  assign _t324 = ((|_t297) ? 1'd0 : _t296);
  assign _t325 = ({29'b0, ut5_state} == 32'd3);
  assign _t326 = ((|_t299) ? 1'd0 : _t298);
  assign _t327 = ({29'b0, ut5_state} == 32'd3);
  assign _t328 = ((|_t301) ? 1'd0 : _t300);
  assign _t329 = ({29'b0, ut5_state} == 32'd3);
  assign _t330 = ((|_t303) ? hb : _t302);
  assign _t331 = ({29'b0, ut5_state} == 32'd3);
  assign _t332 = ((|_t305) ? 1'd0 : _t304);
  assign _t333 = ({29'b0, ut5_state} == 32'd3);
  assign _t334 = ((|_t307) ? 1'd0 : _t306);
  assign _t335 = ({29'b0, ut5_state} == 32'd3);
  assign _t336 = acc[31:16];
  assign _t337 = {16'b0, _t336};
  assign _t338 = acc[15:0];
  assign _t339 = {16'b0, _t338};
  assign _t340 = ((|_t313) ? _t312 : _t311);
  assign _t341 = (_t339 + _t337);
  assign _t342 = iac[31:16];
  assign _t343 = (_t342 != 16'd0);
  assign _t344 = acc[31:16];
  assign _t345 = (_t344 != 16'd0);
  assign _t346 = ((|_t345) || (|_t343));
  assign _t347 = ({29'b0, ut5_state} == 32'd3);
  assign _t348 = ((|_t347) && (|_t346));
  assign _t349 = iac[31:16];
  assign _t350 = {16'b0, _t349};
  assign _t351 = iac[15:0];
  assign _t352 = {16'b0, _t351};
  assign _t353 = ((|_t317) ? _t316 : _t315);
  assign _t354 = (_t352 + _t350);
  assign _t355 = ({29'b0, ut5_state} == 32'd3);
  assign _t356 = ((|_t355) && (|_t346));
  assign _t357 = ((|_t319) ? 32'd3 : _t318);
  assign _t358 = ({29'b0, ut5_state} == 32'd3);
  assign _t359 = ((|_t358) && (|_t346));
  assign _t360 = acc[15:0];
  assign _t361 = (_t360 == 16'd65535);
  assign _t362 = (~_t346);
  assign _t363 = ((|_t362) && (|_t361));
  assign _t364 = ({29'b0, ut5_state} == 32'd3);
  assign _t365 = ((|_t364) && (|_t363));
  assign _t366 = acc[15:0];
  assign _t367 = ((|_t365) ? 16'd65535 : ck);
  assign _t368 = (_t366 ^ 16'd65535);
  assign _t369 = (~_t361);
  assign _t370 = ((|_t362) && (|_t369));
  assign _t371 = ({29'b0, ut5_state} == 32'd3);
  assign _t372 = ((|_t371) && (|_t370));
  assign _t373 = iac[15:0];
  assign _t374 = (_t373 ^ 16'd65535);
  assign _t375 = ({29'b0, ut5_state} == 32'd3);
  assign _t376 = ((|_t375) && (|_t362));
  assign _t377 = ((|_t256) ? 6'd0 : hi);
  assign _t378 = ({29'b0, ut5_state} == 32'd3);
  assign _t379 = ((|_t378) && (|_t362));
  assign _t380 = ((|_t359) ? 32'd3 : _t357);
  assign _t381 = ({29'b0, ut5_state} == 32'd3);
  assign _t382 = ((|_t381) && (|_t362));
  assign _t383 = ((|_t321) ? 1'd0 : _t320);
  assign _t384 = ({29'b0, ut5_state} == 32'd4);
  assign _t385 = ((|_t323) ? 1'd0 : _t322);
  assign _t386 = ({29'b0, ut5_state} == 32'd4);
  assign _t387 = ((|_t325) ? 1'd0 : _t324);
  assign _t388 = ({29'b0, ut5_state} == 32'd4);
  assign _t389 = ((|_t327) ? 1'd0 : _t326);
  assign _t390 = ({29'b0, ut5_state} == 32'd4);
  assign _t391 = ((|_t329) ? 1'd0 : _t328);
  assign _t392 = ({29'b0, ut5_state} == 32'd4);
  assign _t393 = ((|_t331) ? hb : _t330);
  assign _t394 = ({29'b0, ut5_state} == 32'd4);
  assign _t395 = ((|_t333) ? 1'd0 : _t332);
  assign _t396 = ({29'b0, ut5_state} == 32'd4);
  assign _t397 = ((|_t335) ? 1'd0 : _t334);
  assign _t398 = ({29'b0, ut5_state} == 32'd4);
  assign _t399 = ((|_t379) ? 6'd0 : _t377);
  assign _t400 = (hi + 6'd1);
  assign _t401 = ({29'b0, ut5_state} == 32'd4);
  assign _t402 = ((|_t401) && (|o_ready));
  assign _t403 = ((|_t382) ? 32'd4 : _t380);
  assign _t404 = (hi == 6'd41);
  assign _t405 = ((|o_ready) && (|_t404));
  assign _t406 = ({29'b0, ut5_state} == 32'd4);
  assign _t407 = ((|_t406) && (|_t405));
  assign _t408 = ((|_t407) ? 32'd5 : _t403);
  assign _t409 = (~_t405);
  assign _t410 = ({29'b0, ut5_state} == 32'd4);
  assign _t411 = ((|_t410) && (|_t409));
  assign _t412 = ((|_t384) ? 1'd0 : _t383);
  assign _t413 = ({29'b0, ut5_state} == 32'd5);
  assign _t414 = ((|_t386) ? 1'd0 : _t385);
  assign _t415 = ({29'b0, ut5_state} == 32'd5);
  assign _t416 = ((|_t388) ? 1'd0 : _t387);
  assign _t417 = ({29'b0, ut5_state} == 32'd5);
  assign _t418 = ((|_t390) ? 1'd1 : _t389);
  assign _t419 = ({29'b0, ut5_state} == 32'd5);
  assign _t420 = ((|_t392) ? 1'd0 : _t391);
  assign _t421 = ({29'b0, ut5_state} == 32'd5);
  assign _t422 = ((|_t394) ? hb : _t393);
  assign _t423 = ({29'b0, ut5_state} == 32'd5);
  assign _t424 = ((|_t396) ? 1'd0 : _t395);
  assign _t425 = ({29'b0, ut5_state} == 32'd5);
  assign _t426 = ((|_t398) ? 1'd0 : _t397);
  assign _t427 = ({29'b0, ut5_state} == 32'd5);
  assign _t428 = ((|_t212) ? _t210 : len);
  assign _t429 = ((|fo_valid) && (|o_ready));
  assign _t430 = ((|_t429) && (|fo_last));
  assign _t431 = ({29'b0, ut5_state} == 32'd5);
  assign _t432 = ((|_t431) && (|_t430));
  assign _t433 = ((|_t348) ? _t341 : _t340);
  assign _t434 = ({29'b0, ut5_state} == 32'd5);
  assign _t435 = ((|_t434) && (|_t430));
  assign _t436 = (n + 16'd1);
  assign _t437 = ({29'b0, ut5_state} == 32'd5);
  assign _t438 = ((|_t437) && (|_t430));
  assign _t439 = ((|_t411) ? 32'd4 : _t408);
  assign _t440 = ({29'b0, ut5_state} == 32'd5);
  assign _t441 = ((|_t440) && (|_t430));
  assign _t442 = ((|_t441) ? 32'd0 : _t439);
  assign _t443 = (~_t430);
  assign _t444 = ({29'b0, ut5_state} == 32'd5);
  assign _t445 = ((|_t444) && (|_t443));
  assign _t446 = ((|_t413) ? 1'd0 : _t412);
  assign _t447 = ({29'b0, ut5_state} == 32'd6);
  assign _t448 = ((|_t415) ? 1'd0 : _t414);
  assign _t449 = ({29'b0, ut5_state} == 32'd6);
  assign _t450 = ((|_t417) ? 1'd0 : _t416);
  assign _t451 = ({29'b0, ut5_state} == 32'd6);
  assign _t452 = ((|_t419) ? fo_valid : _t418);
  assign _t453 = ({29'b0, ut5_state} == 32'd6);
  assign _t454 = ((|_t421) ? fo_last : _t420);
  assign _t455 = (hi == 6'd41);
  assign _t456 = ({29'b0, ut5_state} == 32'd6);
  assign _t457 = ((|_t423) ? fo_data : _t422);
  assign _t458 = ({29'b0, ut5_state} == 32'd6);
  assign _t459 = ((|_t425) ? o_ready : _t424);
  assign _t460 = ({29'b0, ut5_state} == 32'd6);
  assign _t461 = (hi == 6'd41);
  assign _t462 = ((|_t427) ? 1'd0 : _t426);
  assign _t463 = ((|o_ready) && (|_t461));
  assign _t464 = ({29'b0, ut5_state} == 32'd6);
  assign _t465 = ((|_t402) ? _t400 : _t399);
  assign _t466 = (hi + 6'd1);
  assign _t467 = ({29'b0, ut5_state} == 32'd6);
  assign _t468 = ((|_t467) && (|o_ready));
  assign _t469 = (na + 16'd1);
  assign _t470 = (hi == 6'd41);
  assign _t471 = ((|o_ready) && (|_t470));
  assign _t472 = ({29'b0, ut5_state} == 32'd6);
  assign _t473 = ((|_t472) && (|_t471));
  assign _t474 = ((|_t445) ? 32'd5 : _t442);
  assign _t475 = ({29'b0, ut5_state} == 32'd6);
  assign _t476 = ((|_t475) && (|_t471));
  assign _t477 = ((|_t476) ? 32'd0 : _t474);
  assign _t478 = (~_t471);
  assign _t479 = ({29'b0, ut5_state} == 32'd6);
  assign _t480 = ((|_t479) && (|_t478));
  assign fo_data = q_dst_data;
  assign fo_last = q_dst_last;
  assign fo_valid = q_dst_valid;
  assign ffull = q_full;
  assign full = q_tight;
  assign ulen = (len + 16'd8);
  assign tlen = (len + 16'd28);
  assign dipw = (_t11 + _t1);
  assign hb = ((|_t104) ? _t103 : _t102);
  assign ab = ((|_t191) ? 8'd2 : _t190);
  assign t_ready = ((|_t447) ? 1'd0 : _t446);
  assign w = ((|_t449) ? 1'd0 : _t448);
  assign cm = ((|_t451) ? 1'd0 : _t450);
  assign o_valid = ((|_t453) ? 1'd1 : _t452);
  assign o_last = ((|_t456) ? _t455 : _t454);
  assign o_data = ((|_t458) ? ab : _t457);
  assign fo_ready = ((|_t460) ? 1'd0 : _t459);
  assign ask_ack = ((|_t464) ? _t463 : _t462);
  assign _t481 = ((|_t432) ? 16'd0 : _t428);
  assign _t482 = ((|_t435) ? 32'd0 : _t433);
  assign _t483 = ((|_t240) ? 48'd281474976710655 : _t236);
  assign _t484 = ((|_t244) ? 32'd4294967295 : _t241);
  assign _t485 = ((|_t248) ? 16'd36487 : _t245);
  assign _t486 = ((|_t480) ? 32'd6 : _t477);
  assign _t487 = ((|_t468) ? _t466 : _t465);
  assign _t488 = ((|_t356) ? _t354 : _t353);
  assign _t489 = ((|_t372) ? _t368 : _t367);
  assign _t490 = ((|_t376) ? _t374 : ick);
  assign _t491 = ((|_t438) ? _t436 : n);
  assign _t492 = ((|_t473) ? _t469 : na);
  always @(posedge clk) begin
    if (rst) begin
      len <= 16'd0;
      acc <= 32'd0;
      iac <= 32'd0;
      ck <= 16'd0;
      ick <= 16'd0;
      hi <= 6'd0;
      n <= 16'd0;
      na <= 16'd0;
      dmac <= 48'd0;
      dip <= 32'd0;
      dprt <= 16'd0;
      ut5_state <= 3'd0;
    end else begin
      len <= _t481;
      acc <= _t482;
      iac <= _t488;
      ck <= _t489;
      ick <= _t490;
      hi <= _t487;
      n <= _t491;
      na <= _t492;
      dmac <= _t483;
      dip <= _t484;
      dprt <= _t485;
      ut5_state <= _t486;
    end
  end
  pktfifo_8_2048 q (
    .clk(clk),
    .rst(rst),
    .wr(w),
    .wdata(t_data),
    .wlast(t_last),
    .commit(cm),
    .rewind(1'd0),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(fo_ready),
    .full(q_full),
    .tight(q_tight)
  );
endmodule
`default_nettype wire

`default_nettype none
module udp4_port_36486_2200301993985_3232255234_2048_0_0_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] erx_data,
  input  wire erx_last,
  input  wire erx_valid,
  output wire erx_ready,
  output wire [7:0] etx_data,
  output wire etx_last,
  output wire etx_valid,
  input  wire etx_ready,
  output wire [7:0] rx_data,
  output wire rx_last,
  output wire rx_valid,
  input  wire rx_ready,
  input  wire [7:0] tx_data,
  input  wire tx_last,
  input  wire tx_valid,
  output wire tx_ready,
  output wire [15:0] nr,
  output wire [15:0] nt,
  output wire [15:0] na,
  output wire pr_valid
);
  wire [47:0] pr_mac;
  wire [31:0] pr_ip;
  wire [15:0] pr_port;
  wire ak_valid;
  wire [47:0] ak_mac;
  wire [31:0] ak_ip;
  wire ak_ack;
  wire [7:0] ri_data;
  wire ri_last;
  wire ri_valid;
  wire ri_ready;
  wire [7:0] ri0_data;
  wire ri0_last;
  wire ri0_valid;
  wire ri0_ready;
  wire [8:0] fi_data;
  wire fi_valid;
  wire fi_ready;
  wire [8:0] fo_data;
  wire fo_valid;
  wire fo_ready;
  wire [2:0] fc;
  wire pt_valid;
  wire [47:0] pt_mac;
  wire [31:0] pt_ip;
  wire [15:0] pt_port;
  wire [7:0] tx2_data;
  wire tx2_last;
  wire tx2_valid;
  wire tx2_ready;
  wire _t0;
  wire [8:0] _t1;
  wire [7:0] _t2;
  wire ur_i_ready;
  wire [7:0] ur_o_data;
  wire ur_o_last;
  wire ur_o_valid;
  wire ur_peer_valid;
  wire [47:0] ur_peer_mac;
  wire [31:0] ur_peer_ip;
  wire [15:0] ur_peer_port;
  wire ur_ask_valid;
  wire [47:0] ur_ask_mac;
  wire [31:0] ur_ask_ip;
  wire [15:0] ur_n;
  wire phd_i_ready;
  wire [7:0] phd_o_data;
  wire phd_o_last;
  wire phd_o_valid;
  wire sl_src_ready;
  wire [8:0] sl_dst_data;
  wire sl_dst_valid;
  wire [2:0] sl_cnt;
  wire ptl_i_ready;
  wire [7:0] ptl_o_data;
  wire ptl_o_last;
  wire ptl_o_valid;
  wire ptl_pt_valid;
  wire [47:0] ptl_pt_mac;
  wire [31:0] ptl_pt_ip;
  wire [15:0] ptl_pt_port;
  wire ux_t_ready;
  wire [7:0] ux_o_data;
  wire ux_o_last;
  wire ux_o_valid;
  wire ux_ask_ack;
  wire [15:0] ux_n;
  wire [15:0] ux_na;
  assign _t0 = 1'd0;
  assign _t1 = {_t0, ri_data};
  assign _t2 = _t1[7:0];
  assign erx_ready = ur_i_ready;
  assign ri0_data = ur_o_data;
  assign ri0_last = ur_o_last;
  assign ri0_valid = ur_o_valid;
  assign pr_valid = ur_peer_valid;
  assign pr_mac = ur_peer_mac;
  assign pr_ip = ur_peer_ip;
  assign pr_port = ur_peer_port;
  assign ak_valid = ur_ask_valid;
  assign ak_mac = ur_ask_mac;
  assign ak_ip = ur_ask_ip;
  assign nr = ur_n;
  assign ri0_ready = phd_i_ready;
  assign ri_data = phd_o_data;
  assign ri_last = phd_o_last;
  assign ri_valid = phd_o_valid;
  assign fi_ready = sl_src_ready;
  assign fo_data = sl_dst_data;
  assign fo_valid = sl_dst_valid;
  assign fc = sl_cnt;
  assign fi_valid = ri_valid;
  assign fi_data = {ri_last, _t2};
  assign ri_ready = fi_ready;
  assign rx_valid = fo_valid;
  assign rx_data = fo_data[7:0];
  assign rx_last = fo_data[8];
  assign fo_ready = rx_ready;
  assign tx_ready = ptl_i_ready;
  assign tx2_data = ptl_o_data;
  assign tx2_last = ptl_o_last;
  assign tx2_valid = ptl_o_valid;
  assign pt_valid = ptl_pt_valid;
  assign pt_mac = ptl_pt_mac;
  assign pt_ip = ptl_pt_ip;
  assign pt_port = ptl_pt_port;
  assign tx2_ready = ux_t_ready;
  assign etx_data = ux_o_data;
  assign etx_last = ux_o_last;
  assign etx_valid = ux_o_valid;
  assign ak_ack = ux_ask_ack;
  assign nt = ux_n;
  assign na = ux_na;
  ip4_rx_36486_2200301993985_3232255234_0 ur (
    .clk(clk),
    .rst(rst),
    .i_data(erx_data),
    .i_last(erx_last),
    .i_valid(erx_valid),
    .i_ready(ur_i_ready),
    .o_data(ur_o_data),
    .o_last(ur_o_last),
    .o_valid(ur_o_valid),
    .o_ready(ri0_ready),
    .peer_valid(ur_peer_valid),
    .peer_mac(ur_peer_mac),
    .peer_ip(ur_peer_ip),
    .peer_port(ur_peer_port),
    .ask_valid(ur_ask_valid),
    .ask_mac(ur_ask_mac),
    .ask_ip(ur_ask_ip),
    .ask_ack(ak_ack),
    .n(ur_n)
  );
  peer_head phd (
    .clk(clk),
    .rst(rst),
    .i_data(ri0_data),
    .i_last(ri0_last),
    .i_valid(ri0_valid),
    .i_ready(phd_i_ready),
    .o_data(phd_o_data),
    .o_last(phd_o_last),
    .o_valid(phd_o_valid),
    .o_ready(ri_ready),
    .pr_valid(pr_valid),
    .pr_mac(pr_mac),
    .pr_ip(pr_ip),
    .pr_port(pr_port)
  );
  fifo_9_4 sl (
    .clk(clk),
    .rst(rst),
    .src_data(fi_data),
    .src_valid(fi_valid),
    .src_ready(sl_src_ready),
    .dst_data(sl_dst_data),
    .dst_valid(sl_dst_valid),
    .dst_ready(fo_ready),
    .cnt(sl_cnt)
  );
  peer_tail ptl (
    .clk(clk),
    .rst(rst),
    .i_data(tx_data),
    .i_last(tx_last),
    .i_valid(tx_valid),
    .i_ready(ptl_i_ready),
    .o_data(ptl_o_data),
    .o_last(ptl_o_last),
    .o_valid(ptl_o_valid),
    .o_ready(tx2_ready),
    .pt_valid(ptl_pt_valid),
    .pt_mac(ptl_pt_mac),
    .pt_ip(ptl_pt_ip),
    .pt_port(ptl_pt_port)
  );
  ip4_tx_36486_2200301993985_3232255234_2048_0 ux (
    .clk(clk),
    .rst(rst),
    .t_data(tx2_data),
    .t_last(tx2_last),
    .t_valid(tx2_valid),
    .t_ready(ux_t_ready),
    .o_data(ux_o_data),
    .o_last(ux_o_last),
    .o_valid(ux_o_valid),
    .o_ready(etx_ready),
    .peer_valid(pt_valid),
    .peer_mac(pt_mac),
    .peer_ip(pt_ip),
    .peer_port(pt_port),
    .ask_valid(ak_valid),
    .ask_mac(ak_mac),
    .ask_ip(ak_ip),
    .ask_ack(ux_ask_ack),
    .n(ux_n),
    .na(ux_na)
  );
endmodule
`default_nettype wire

`default_nettype none
module frame_prefer_8 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] hi_data,
  input  wire hi_last,
  input  wire hi_valid,
  output wire hi_ready,
  input  wire [7:0] lo_data,
  input  wire lo_last,
  input  wire lo_valid,
  output wire lo_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [1:0] g;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire [1:0] _t11;
  wire [1:0] _t12;
  wire _t13;
  wire [1:0] _t14;
  assign _t0 = (~hi_valid);
  assign _t1 = (g == 2'd0);
  assign _t2 = ((|_t1) && (|_t0));
  assign _t3 = ((|_t2) && (|lo_valid));
  assign _t4 = (g == 2'd2);
  assign _t5 = ((|_t4) || (|_t3));
  assign _t6 = ((|_t5) ? lo_valid : 1'd0);
  assign _t7 = (g == 2'd0);
  assign _t8 = ((|_t7) && (|hi_valid));
  assign _t9 = (g == 2'd1);
  assign _t10 = ((|_t9) || (|_t8));
  assign _t11 = ((|_t10) ? 2'd1 : 2'd2);
  assign _t12 = ((|o_last) ? 2'd0 : _t11);
  assign _t13 = ((|o_valid) && (|o_ready));
  assign o_valid = ((|_t10) ? hi_valid : _t6);
  assign o_data = ((|_t10) ? hi_data : lo_data);
  assign o_last = ((|_t10) ? hi_last : lo_last);
  assign hi_ready = ((|_t10) && (|o_ready));
  assign lo_ready = ((|_t5) && (|o_ready));
  assign _t14 = ((|_t13) ? _t12 : g);
  always @(posedge clk) begin
    if (rst) begin
      g <= 2'd0;
    end else begin
      g <= _t14;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module frame_out (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  assign o_valid = i_valid;
  assign o_data = i_data;
  assign o_last = i_last;
  assign i_ready = o_ready;
endmodule
`default_nettype wire

`default_nettype none
module xfifo_9_4_16_1 (
  input  wire clk,
  input  wire rst,
  input  wire wclk,
  input  wire wrst,
  input  wire rclk,
  input  wire rrst,
  input  wire [8:0] src_data,
  input  wire src_valid,
  output wire src_ready,
  output wire [8:0] dst_data,
  output wire dst_valid,
  input  wire dst_ready
);
  reg  [4:0] wp;
  reg  [4:0] rp;
  reg  [4:0] wg;
  reg  [4:0] rg;
  wire [4:0] rg_w;
  wire [4:0] wg_r;
  wire [3:0] mem_rd0_addr;
  wire [8:0] mem_rd0_data;
  wire [3:0] mem_wr0_addr;
  wire [8:0] mem_wr0_data;
  wire mem_wr0_we;
  wire [4:0] wn;
  wire [4:0] wng;
  wire [4:0] rn;
  wire [4:0] rng;
  reg  [4:0] rg_w_sync20;
  reg  [4:0] rg_w_sync21;
  reg  [4:0] wg_r_sync20;
  reg  [4:0] wg_r_sync21;
  wire _t0;
  wire _t1;
  wire _t2;
  wire [3:0] _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire [3:0] _t7;
  wire _t8;
  wire _t9;
  wire [4:0] _t10;
  wire _t11;
  wire _t12;
  wire [2:0] _t13;
  wire _t14;
  wire _t15;
  wire [4:0] _t16;
  wire _t17;
  wire _t18;
  wire [2:0] _t19;
  wire _t20;
  wire _t21;
  wire [4:0] _t22;
  wire [1:0] _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire [4:0] _t28;
  wire [1:0] _t29;
  wire _t30;
  wire [1:0] _t31;
  wire _t32;
  wire _t33;
  wire [4:0] _t34;
  wire [2:0] _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire [4:0] _t40;
  wire [2:0] _t41;
  wire _t42;
  wire _t43;
  wire [4:0] _t44;
  wire [3:0] _t45;
  wire _t46;
  wire [4:0] _t47;
  wire [3:0] _t48;
  wire _t49;
  wire [2:0] _t50;
  wire [2:0] _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire [3:0] _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire [4:0] _t66;
  wire [4:0] _t67;
  wire [4:0] _t68;
  wire [4:0] _t69;
  assign _t0 = wn[1];
  assign _t1 = wn[0];
  assign _t2 = (_t1 ^ _t0);
  assign _t3 = 4'd0;
  assign _t4 = rn[1];
  assign _t5 = rn[0];
  assign _t6 = (_t5 ^ _t4);
  assign _t7 = 4'd0;
  assign _t8 = wn[2];
  assign _t9 = wn[1];
  assign _t10 = {_t3, _t2};
  assign _t11 = _t10[0:0];
  assign _t12 = (_t9 ^ _t8);
  assign _t13 = _t10[4:2];
  assign _t14 = rn[2];
  assign _t15 = rn[1];
  assign _t16 = {_t7, _t6};
  assign _t17 = _t16[0:0];
  assign _t18 = (_t15 ^ _t14);
  assign _t19 = _t16[4:2];
  assign _t20 = wn[3];
  assign _t21 = wn[2];
  assign _t22 = {_t13, _t12, _t11};
  assign _t23 = _t22[1:0];
  assign _t24 = (_t21 ^ _t20);
  assign _t25 = _t22[4:3];
  assign _t26 = rn[3];
  assign _t27 = rn[2];
  assign _t28 = {_t19, _t18, _t17};
  assign _t29 = _t28[1:0];
  assign _t30 = (_t27 ^ _t26);
  assign _t31 = _t28[4:3];
  assign _t32 = wn[4];
  assign _t33 = wn[3];
  assign _t34 = {_t25, _t24, _t23};
  assign _t35 = _t34[2:0];
  assign _t36 = (_t33 ^ _t32);
  assign _t37 = _t34[4:4];
  assign _t38 = rn[4];
  assign _t39 = rn[3];
  assign _t40 = {_t31, _t30, _t29};
  assign _t41 = _t40[2:0];
  assign _t42 = (_t39 ^ _t38);
  assign _t43 = _t40[4:4];
  assign _t44 = {_t37, _t36, _t35};
  assign _t45 = _t44[3:0];
  assign _t46 = wn[4];
  assign _t47 = {_t43, _t42, _t41};
  assign _t48 = _t47[3:0];
  assign _t49 = rn[4];
  assign _t50 = rg_w[2:0];
  assign _t51 = wg[2:0];
  assign _t52 = (_t51 == _t50);
  assign _t53 = rg_w[3];
  assign _t54 = wg[3];
  assign _t55 = (_t54 != _t53);
  assign _t56 = rg_w[4];
  assign _t57 = wg[4];
  assign _t58 = (_t57 != _t56);
  assign _t59 = ((|_t58) && (|_t55));
  assign _t60 = ((|_t59) && (|_t52));
  assign _t61 = wp[3:0];
  assign _t62 = (~_t60);
  assign _t63 = ((|src_valid) && (|_t62));
  assign _t64 = (rg == wg_r);
  assign _t65 = ((|dst_valid) && (|dst_ready));
  assign wn = (wp + 5'd1);
  assign rn = (rp + 5'd1);
  assign wng = {_t46, _t45};
  assign rng = {_t49, _t48};
  assign rg_w = rg_w_sync21;
  assign src_ready = (~_t60);
  assign mem_wr0_addr = ((|_t63) ? _t61 : 4'd0);
  assign mem_wr0_data = ((|_t63) ? src_data : 9'd0);
  assign mem_wr0_we = ((|_t63) ? 1'd1 : 1'd0);
  assign _t66 = ((|_t63) ? wn : wp);
  assign _t67 = ((|_t63) ? wng : wg);
  assign wg_r = wg_r_sync21;
  assign dst_valid = (~_t64);
  assign mem_rd0_addr = rp[3:0];
  assign dst_data = mem_rd0_data;
  assign _t68 = ((|_t65) ? rn : rp);
  assign _t69 = ((|_t65) ? rng : rg);
  always @(posedge wclk) begin
    if (wrst) begin
      wp <= 5'd0;
      wg <= 5'd0;
      rg_w_sync20 <= 5'd0;
      rg_w_sync21 <= 5'd0;
    end else begin
      wp <= _t66;
      wg <= _t67;
      rg_w_sync20 <= rg;
      rg_w_sync21 <= rg_w_sync20;
    end
  end
  always @(posedge rclk) begin
    if (rrst) begin
      rp <= 5'd0;
      rg <= 5'd0;
      wg_r_sync20 <= 5'd0;
      wg_r_sync21 <= 5'd0;
    end else begin
      rp <= _t68;
      rg <= _t69;
      wg_r_sync20 <= wg;
      wg_r_sync21 <= wg_r_sync20;
    end
  end
  l8_ram_9x16_r1_w1_d _meminst_0_mem (
    .clk(wclk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module pktfifo_8_2048_1 (
  input  wire clk,
  input  wire rst,
  input  wire wr,
  input  wire [7:0] wdata,
  input  wire wlast,
  input  wire commit,
  input  wire rewind,
  output wire [7:0] dst_data,
  output wire dst_last,
  output wire dst_valid,
  input  wire dst_ready,
  output wire full,
  output reg  tight
);
  reg  [11:0] wps;
  reg  [11:0] wpc;
  reg  [11:0] rp;
  wire [11:0] nxt;
  wire [11:0] used;
  wire take;
  wire [8:0] word;
  wire [8:0] rdw;
  wire [11:0] rnx;
  reg  [11:0] seen;
  reg  fresh;
  wire adv;
  wire [10:0] mem_rd0_addr;
  wire [8:0] mem_rd0_data;
  wire [10:0] mem_wr0_addr;
  wire [8:0] mem_wr0_data;
  wire mem_wr0_we;
  wire _t0;
  wire [11:0] _t1;
  wire [11:0] _t2;
  wire _t3;
  wire [11:0] _t4;
  wire _t5;
  wire [11:0] _t6;
  wire [11:0] _t7;
  wire [11:0] _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire [8:0] _t12;
  wire [7:0] _t13;
  wire [11:0] _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire [11:0] _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire [11:0] _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire [11:0] _t29;
  wire [11:0] _t30;
  wire _t31;
  wire [10:0] _t32;
  wire _t33;
  wire [8:0] _t34;
  wire _t35;
  wire [8:0] _t36;
  wire _t37;
  wire [11:0] _t38;
  wire [11:0] _t39;
  wire [11:0] _t40;
  assign _t0 = (wps == 12'd2047);
  assign _t1 = ((|_t0) ? 12'd0 : 12'd0);
  assign _t2 = (wps + 12'd1);
  assign _t3 = (~_t0);
  assign _t4 = (wps - rp);
  assign _t5 = (wps >= rp);
  assign _t6 = (wps + 12'd2048);
  assign _t7 = ((|_t5) ? _t4 : 12'd0);
  assign _t8 = (_t6 - rp);
  assign _t9 = (~_t5);
  assign _t10 = (~full);
  assign _t11 = 1'd0;
  assign _t12 = {_t11, wdata};
  assign _t13 = _t12[7:0];
  assign _t14 = ((|rewind) ? wpc : wps);
  assign _t15 = (~rewind);
  assign _t16 = ((|_t15) && (|commit));
  assign _t17 = ((|_t16) && (|take));
  assign _t18 = ((|_t15) && (|commit));
  assign _t19 = ((|_t18) && (|take));
  assign _t20 = ((|_t19) ? nxt : wpc);
  assign _t21 = (~take);
  assign _t22 = ((|_t15) && (|commit));
  assign _t23 = ((|_t22) && (|_t21));
  assign _t24 = ((|_t17) ? nxt : _t14);
  assign _t25 = (~commit);
  assign _t26 = ((|_t15) && (|_t25));
  assign _t27 = ((|_t26) && (|take));
  assign _t28 = (rp == 12'd2047);
  assign _t29 = ((|_t28) ? 12'd0 : 12'd0);
  assign _t30 = (rp + 12'd1);
  assign _t31 = (~_t28);
  assign _t32 = ((|adv) ? rnx[10:0] : 11'd0);
  assign _t33 = (~adv);
  assign _t34 = ((|adv) ? mem_rd0_data : 9'd0);
  assign _t35 = (rp != seen);
  assign nxt = ((|_t3) ? _t2 : _t1);
  assign full = (nxt == rp);
  assign used = ((|_t9) ? _t8 : _t7);
  assign _t37 = (used >= 12'd2044);
  assign take = ((|wr) && (|_t10));
  assign word = {wlast, _t13};
  assign mem_wr0_addr = ((|take) ? wps[10:0] : 11'd0);
  assign mem_wr0_data = ((|take) ? word : 9'd0);
  assign mem_wr0_we = ((|take) ? 1'd1 : 1'd0);
  assign _t38 = ((|_t27) ? nxt : _t24);
  assign _t39 = ((|_t23) ? wps : _t20);
  assign rnx = ((|_t31) ? _t30 : _t29);
  assign adv = ((|dst_valid) && (|dst_ready));
  assign mem_rd0_addr = ((|_t33) ? rp[10:0] : _t32);
  assign rdw = ((|_t33) ? mem_rd0_data : _t34);
  assign dst_valid = ((|_t35) && (|fresh));
  assign dst_data = rdw[7:0];
  assign dst_last = rdw[8];
  assign _t40 = ((|adv) ? rnx : rp);
  always @(posedge clk) begin
    if (rst) begin
      wps <= 12'd0;
      wpc <= 12'd0;
      rp <= 12'd0;
      tight <= 1'd0;
      seen <= 12'd0;
      fresh <= 1'd0;
    end else begin
      wps <= _t38;
      wpc <= _t39;
      rp <= _t40;
      tight <= _t37;
      seen <= wpc;
      fresh <= 1'd1;
    end
  end
  l8_ram_9x2048_r1_w1_b _meminst_0_mem (
    .clk(clk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module fifo_8_16 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] src_data,
  input  wire src_valid,
  output wire src_ready,
  output wire [7:0] dst_data,
  output wire dst_valid,
  input  wire dst_ready,
  output reg  [4:0] cnt
);
  reg  [4:0] wp;
  reg  [4:0] rp;
  wire [3:0] mem_rd0_addr;
  wire [7:0] mem_rd0_data;
  wire [3:0] mem_wr0_addr;
  wire [7:0] mem_wr0_data;
  wire mem_wr0_we;
  wire inF;
  wire outF;
  wire _t0;
  wire _t1;
  wire _t2;
  wire [4:0] _t3;
  wire [4:0] _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire [4:0] _t10;
  wire [4:0] _t11;
  wire _t12;
  wire _t13;
  wire [4:0] _t14;
  wire _t15;
  wire _t16;
  wire [4:0] _t17;
  wire [4:0] _t18;
  wire _t19;
  wire _t20;
  wire [4:0] _t21;
  wire [4:0] _t22;
  wire [4:0] _t23;
  assign _t0 = ((|src_valid) && (|src_ready));
  assign _t1 = (wp == 5'd15);
  assign _t2 = ((|_t0) && (|_t1));
  assign _t3 = ((|_t2) ? 5'd0 : wp);
  assign _t4 = (wp + 5'd1);
  assign _t5 = (~_t1);
  assign _t6 = ((|_t0) && (|_t5));
  assign _t7 = ((|dst_valid) && (|dst_ready));
  assign _t8 = (rp == 5'd15);
  assign _t9 = ((|_t7) && (|_t8));
  assign _t10 = ((|_t9) ? 5'd0 : rp);
  assign _t11 = (rp + 5'd1);
  assign _t12 = (~_t8);
  assign _t13 = ((|_t7) && (|_t12));
  assign _t14 = (cnt + 5'd1);
  assign _t15 = (~outF);
  assign _t16 = ((|inF) && (|_t15));
  assign _t17 = ((|_t16) ? _t14 : cnt);
  assign _t18 = (cnt - 5'd1);
  assign _t19 = (~inF);
  assign _t20 = ((|outF) && (|_t19));
  assign src_ready = (cnt != 5'd16);
  assign dst_valid = (cnt != 5'd0);
  assign mem_rd0_addr = rp;
  assign dst_data = mem_rd0_data;
  assign inF = ((|_t0) ? 1'd1 : 1'd0);
  assign mem_wr0_addr = ((|_t0) ? wp[3:0] : 4'd0);
  assign mem_wr0_data = ((|_t0) ? src_data : 8'd0);
  assign mem_wr0_we = ((|_t0) ? 1'd1 : 1'd0);
  assign _t21 = ((|_t6) ? _t4 : _t3);
  assign outF = ((|_t7) ? 1'd1 : 1'd0);
  assign _t22 = ((|_t13) ? _t11 : _t10);
  assign _t23 = ((|_t20) ? _t18 : _t17);
  always @(posedge clk) begin
    if (rst) begin
      wp <= 5'd0;
      rp <= 5'd0;
      cnt <= 5'd0;
    end else begin
      wp <= _t21;
      rp <= _t22;
      cnt <= _t23;
    end
  end
  l8_ram_8x16_r1_w1_d _meminst_0_mem (
    .clk(clk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module slip_rx_2048 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data_v,
  input  wire i_data_err,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] f_data,
  output wire f_last,
  output wire f_valid,
  input  wire f_ready,
  output wire [7:0] con_data,
  output wire con_valid,
  input  wire con_ready,
  output reg  [15:0] drops
);
  reg  inf;
  reg  esc;
  reg  bad;
  reg  lost;
  reg  [11:0] n;
  reg  [15:0] crc;
  reg  [7:0] d1;
  reg  [7:0] d2;
  reg  [7:0] d3;
  wire full;
  wire tight;
  wire [7:0] cs_data;
  wire cs_valid;
  wire cs_ready;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire _t53;
  wire [15:0] _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire _t69;
  wire _t70;
  wire _t71;
  wire _t72;
  wire [7:0] _t73;
  wire _t74;
  wire _t75;
  wire [7:0] _t76;
  wire [15:0] _t77;
  wire [15:0] _t78;
  wire [15:0] _t79;
  wire [15:0] _t80;
  wire [15:0] _t81;
  wire [15:0] _t82;
  wire _t83;
  wire [15:0] _t84;
  wire [15:0] _t85;
  wire [15:0] _t86;
  wire [15:0] _t87;
  wire _t88;
  wire [15:0] _t89;
  wire [15:0] _t90;
  wire [15:0] _t91;
  wire [15:0] _t92;
  wire _t93;
  wire [15:0] _t94;
  wire [15:0] _t95;
  wire [15:0] _t96;
  wire [15:0] _t97;
  wire _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire [15:0] _t101;
  wire [15:0] _t102;
  wire _t103;
  wire [15:0] _t104;
  wire [15:0] _t105;
  wire [15:0] _t106;
  wire [15:0] _t107;
  wire _t108;
  wire [15:0] _t109;
  wire [15:0] _t110;
  wire [15:0] _t111;
  wire [15:0] _t112;
  wire _t113;
  wire [15:0] _t114;
  wire [15:0] _t115;
  wire [15:0] _t116;
  wire [15:0] _t117;
  wire _t118;
  wire [15:0] _t119;
  wire [15:0] _t120;
  wire [15:0] _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire [11:0] _t125;
  wire [11:0] _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire [7:0] _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire [11:0] _t147;
  wire [15:0] _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire [15:0] _t152;
  wire [7:0] _t153;
  wire [7:0] _t154;
  wire [7:0] _t155;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  wire cf_src_ready;
  wire [7:0] cf_dst_data;
  wire cf_dst_valid;
  wire [4:0] cf_cnt;
  assign _t0 = (n >= 12'd4);
  assign _t1 = (n != 12'd0);
  assign _t2 = (i_data_v == 8'd192);
  assign _t3 = ((|i_valid) && (|inf));
  assign _t4 = ((|_t3) && (|_t2));
  assign _t5 = ((|_t4) && (|_t1));
  assign _t6 = ((|_t5) && (|_t0));
  assign _t7 = (n >= 12'd3);
  assign _t8 = (~esc);
  assign _t9 = (i_data_v == 8'd219);
  assign _t10 = ((|_t9) && (|_t8));
  assign _t11 = (~_t10);
  assign _t12 = (~_t2);
  assign _t13 = ((|i_valid) && (|inf));
  assign _t14 = ((|_t13) && (|_t12));
  assign _t15 = ((|_t14) && (|_t11));
  assign _t16 = ((|_t15) && (|_t7));
  assign _t17 = ((|_t16) || (|_t6));
  assign _t18 = (~i_data_err);
  assign _t19 = (~lost);
  assign _t20 = (~bad);
  assign _t21 = (crc == 16'd0);
  assign _t22 = (n >= 12'd4);
  assign _t23 = ((|_t22) && (|_t21));
  assign _t24 = ((|_t23) && (|_t20));
  assign _t25 = ((|_t24) && (|_t19));
  assign _t26 = ((|_t25) && (|_t18));
  assign _t27 = ((|_t5) && (|_t26));
  assign _t28 = (~_t26);
  assign _t29 = ((|_t5) && (|_t28));
  assign _t30 = (~i_data_err);
  assign _t31 = (~_t2);
  assign _t32 = (~inf);
  assign _t33 = ((|i_valid) && (|_t32));
  assign _t34 = ((|_t33) && (|_t31));
  assign _t35 = (~inf);
  assign _t36 = ((|i_valid) && (|_t35));
  assign _t37 = ((|_t36) && (|_t2));
  assign _t38 = ((|i_valid) && (|_t35));
  assign _t39 = ((|_t38) && (|_t2));
  assign _t40 = ((|i_valid) && (|_t35));
  assign _t41 = ((|_t40) && (|_t2));
  assign _t42 = ((|i_valid) && (|_t35));
  assign _t43 = ((|_t42) && (|_t2));
  assign _t44 = ((|i_valid) && (|_t35));
  assign _t45 = ((|_t44) && (|_t2));
  assign _t46 = ((|i_valid) && (|_t35));
  assign _t47 = ((|_t46) && (|_t2));
  assign _t48 = ((|_t37) ? 1'd1 : inf);
  assign _t49 = (n != 12'd0);
  assign _t50 = (~_t35);
  assign _t51 = ((|i_valid) && (|_t50));
  assign _t52 = ((|_t51) && (|_t2));
  assign _t53 = ((|_t52) && (|_t49));
  assign _t54 = (drops + 16'd1);
  assign _t55 = (~_t26);
  assign _t56 = ((|i_valid) && (|_t50));
  assign _t57 = ((|_t56) && (|_t2));
  assign _t58 = ((|_t57) && (|_t49));
  assign _t59 = ((|_t58) && (|_t55));
  assign _t60 = (~esc);
  assign _t61 = (i_data_v == 8'd219);
  assign _t62 = ((|_t47) ? 1'd0 : esc);
  assign _t63 = ((|_t61) && (|_t60));
  assign _t64 = (~_t2);
  assign _t65 = ((|i_valid) && (|_t50));
  assign _t66 = ((|_t65) && (|_t64));
  assign _t67 = ((|_t43) ? 1'd0 : bad);
  assign _t68 = ((|i_valid) && (|_t50));
  assign _t69 = ((|_t68) && (|_t64));
  assign _t70 = ((|_t69) && (|i_data_err));
  assign _t71 = (i_data_v == 8'd221);
  assign _t72 = ((|esc) && (|_t71));
  assign _t73 = ((|_t72) ? 8'd219 : i_data_v);
  assign _t74 = (i_data_v == 8'd220);
  assign _t75 = ((|esc) && (|_t74));
  assign _t76 = ((|_t75) ? 8'd192 : _t73);
  assign _t77 = {8'b0, _t76};
  assign _t78 = (_t77 << 32'd8);
  assign _t79 = (crc ^ _t78);
  assign _t80 = (_t79 << 32'd1);
  assign _t81 = (_t79 << 32'd1);
  assign _t82 = (_t81 ^ 16'd4129);
  assign _t83 = _t79[15];
  assign _t84 = ((|_t83) ? _t82 : _t80);
  assign _t85 = (_t84 << 32'd1);
  assign _t86 = (_t84 << 32'd1);
  assign _t87 = (_t86 ^ 16'd4129);
  assign _t88 = _t84[15];
  assign _t89 = ((|_t88) ? _t87 : _t85);
  assign _t90 = (_t89 << 32'd1);
  assign _t91 = (_t89 << 32'd1);
  assign _t92 = (_t91 ^ 16'd4129);
  assign _t93 = _t89[15];
  assign _t94 = ((|_t93) ? _t92 : _t90);
  assign _t95 = (_t94 << 32'd1);
  assign _t96 = (_t94 << 32'd1);
  assign _t97 = (_t96 ^ 16'd4129);
  assign _t98 = _t94[15];
  assign _t99 = ((|_t98) ? _t97 : _t95);
  assign _t100 = (_t99 << 32'd1);
  assign _t101 = (_t99 << 32'd1);
  assign _t102 = (_t101 ^ 16'd4129);
  assign _t103 = _t99[15];
  assign _t104 = ((|_t103) ? _t102 : _t100);
  assign _t105 = (_t104 << 32'd1);
  assign _t106 = (_t104 << 32'd1);
  assign _t107 = (_t106 ^ 16'd4129);
  assign _t108 = _t104[15];
  assign _t109 = ((|_t108) ? _t107 : _t105);
  assign _t110 = (_t109 << 32'd1);
  assign _t111 = (_t109 << 32'd1);
  assign _t112 = (_t111 ^ 16'd4129);
  assign _t113 = _t109[15];
  assign _t114 = ((|_t113) ? _t112 : _t110);
  assign _t115 = (_t114 << 32'd1);
  assign _t116 = (_t114 << 32'd1);
  assign _t117 = (_t116 ^ 16'd4129);
  assign _t118 = _t114[15];
  assign _t119 = ((|_t118) ? _t117 : _t115);
  assign _t120 = ((|_t41) ? 16'd65535 : crc);
  assign _t121 = _t119;
  assign _t122 = ((|i_valid) && (|_t50));
  assign _t123 = ((|_t122) && (|_t64));
  assign _t124 = ((|_t123) && (|_t15));
  assign _t125 = ((|_t39) ? 12'd0 : n);
  assign _t126 = (n + 12'd1);
  assign _t127 = ((|i_valid) && (|_t50));
  assign _t128 = ((|_t127) && (|_t64));
  assign _t129 = ((|_t128) && (|_t15));
  assign _t130 = ((|_t75) ? 8'd192 : _t73);
  assign _t131 = ((|i_valid) && (|_t50));
  assign _t132 = ((|_t131) && (|_t64));
  assign _t133 = ((|_t132) && (|_t15));
  assign _t134 = ((|i_valid) && (|_t50));
  assign _t135 = ((|_t134) && (|_t64));
  assign _t136 = ((|_t135) && (|_t15));
  assign _t137 = ((|i_valid) && (|_t50));
  assign _t138 = ((|_t137) && (|_t64));
  assign _t139 = ((|_t138) && (|_t15));
  assign _t140 = ((|_t45) ? 1'd0 : lost);
  assign _t141 = ((|_t17) && (|full));
  assign _t142 = ((|i_valid) && (|_t50));
  assign _t143 = ((|_t142) && (|_t64));
  assign _t144 = ((|_t143) && (|_t15));
  assign _t145 = ((|_t144) && (|_t141));
  assign i_ready = 1'd1;
  assign f_data = q_dst_data;
  assign f_last = q_dst_last;
  assign f_valid = q_dst_valid;
  assign full = q_full;
  assign tight = q_tight;
  assign cs_ready = cf_src_ready;
  assign con_data = cf_dst_data;
  assign con_valid = cf_dst_valid;
  assign cs_valid = ((|_t34) && (|_t30));
  assign cs_data = i_data_v;
  assign _t146 = ((|_t53) ? 1'd0 : _t48);
  assign _t147 = ((|_t129) ? _t126 : _t125);
  assign _t148 = ((|_t124) ? _t121 : _t120);
  assign _t149 = ((|_t70) ? 1'd1 : _t67);
  assign _t150 = ((|_t145) ? 1'd1 : _t140);
  assign _t151 = ((|_t66) ? _t63 : _t62);
  assign _t152 = ((|_t59) ? _t54 : drops);
  assign _t153 = ((|_t133) ? _t130 : d1);
  assign _t154 = ((|_t136) ? d1 : d2);
  assign _t155 = ((|_t139) ? d2 : d3);
  always @(posedge clk) begin
    if (rst) begin
      inf <= 1'd0;
      esc <= 1'd0;
      bad <= 1'd0;
      lost <= 1'd0;
      n <= 12'd0;
      crc <= 16'd65535;
      d1 <= 8'd0;
      d2 <= 8'd0;
      d3 <= 8'd0;
      drops <= 16'd0;
    end else begin
      inf <= _t146;
      esc <= _t151;
      bad <= _t149;
      lost <= _t150;
      n <= _t147;
      crc <= _t148;
      d1 <= _t153;
      d2 <= _t154;
      d3 <= _t155;
      drops <= _t152;
    end
  end
  pktfifo_8_2048_1 q (
    .clk(clk),
    .rst(rst),
    .wr(_t17),
    .wdata(d3),
    .wlast(_t5),
    .commit(_t27),
    .rewind(_t29),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(f_ready),
    .full(q_full),
    .tight(q_tight)
  );
  fifo_8_16 cf (
    .clk(clk),
    .rst(rst),
    .src_data(cs_data),
    .src_valid(cs_valid),
    .src_ready(cf_src_ready),
    .dst_data(cf_dst_data),
    .dst_valid(cf_dst_valid),
    .dst_ready(con_ready),
    .cnt(cf_cnt)
  );
endmodule
`default_nettype wire

`default_nettype none
module ud_rx_36492_1_2 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [7:0] lo;
  reg  [3:0] k;
  wire [7:0] hb;
  reg  [2:0] r_state;
  wire _t0;
  wire [7:0] _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire [2:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [2:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [2:0] _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire [2:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [3:0] _t42;
  wire [3:0] _t43;
  wire _t44;
  wire _t45;
  wire [2:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [2:0] _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire [2:0] _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [7:0] _t69;
  wire [2:0] _t70;
  wire [3:0] _t71;
  assign _t0 = (k == 4'd9);
  assign _t1 = ((|_t0) ? 8'd2 : 8'd0);
  assign _t2 = (k < 4'd6);
  assign _t3 = ({29'b0, r_state} == 32'd0);
  assign _t4 = ({29'b0, r_state} == 32'd0);
  assign _t5 = ((|_t4) && (|i_valid));
  assign _t6 = ((|i_valid) && (|i_last));
  assign _t7 = ({29'b0, r_state} == 32'd0);
  assign _t8 = ((|_t7) && (|_t6));
  assign _t9 = ((|_t8) ? 32'd0 : r_state);
  assign _t10 = (~i_last);
  assign _t11 = ((|i_valid) && (|_t10));
  assign _t12 = ({29'b0, r_state} == 32'd0);
  assign _t13 = ((|_t12) && (|_t11));
  assign _t14 = ((|_t3) ? 1'd1 : 1'd0);
  assign _t15 = ({29'b0, r_state} == 32'd1);
  assign _t16 = ((|_t13) ? 32'd1 : _t9);
  assign _t17 = (i_data == 8'd142);
  assign _t18 = (lo == 8'd140);
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = (~_t19);
  assign _t21 = ((|i_last) || (|_t20));
  assign _t22 = ((|i_valid) && (|_t21));
  assign _t23 = ((|_t22) && (|i_last));
  assign _t24 = ({29'b0, r_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t25) ? 32'd0 : _t16);
  assign _t27 = (~i_last);
  assign _t28 = ((|i_valid) && (|_t21));
  assign _t29 = ((|_t28) && (|_t27));
  assign _t30 = ({29'b0, r_state} == 32'd1);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = (~_t21);
  assign _t33 = ((|i_valid) && (|_t32));
  assign _t34 = ({29'b0, r_state} == 32'd1);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ((|_t31) ? 32'd4 : _t26);
  assign _t37 = ((|i_valid) && (|_t32));
  assign _t38 = ({29'b0, r_state} == 32'd1);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ({29'b0, r_state} == 32'd2);
  assign _t41 = ({29'b0, r_state} == 32'd2);
  assign _t42 = ((|_t35) ? 4'd0 : k);
  assign _t43 = (k + 4'd1);
  assign _t44 = ({29'b0, r_state} == 32'd2);
  assign _t45 = ((|_t44) && (|o_ready));
  assign _t46 = ((|_t39) ? 32'd2 : _t36);
  assign _t47 = (k == 4'd11);
  assign _t48 = ((|o_ready) && (|_t47));
  assign _t49 = ({29'b0, r_state} == 32'd2);
  assign _t50 = ((|_t49) && (|_t48));
  assign _t51 = ((|_t40) ? 1'd1 : 1'd0);
  assign _t52 = ({29'b0, r_state} == 32'd3);
  assign _t53 = ((|_t41) ? hb : 8'd0);
  assign _t54 = ({29'b0, r_state} == 32'd3);
  assign _t55 = ({29'b0, r_state} == 32'd3);
  assign _t56 = ((|_t15) ? 1'd1 : _t14);
  assign _t57 = ({29'b0, r_state} == 32'd3);
  assign _t58 = ((|_t50) ? 32'd3 : _t46);
  assign _t59 = ((|i_valid) && (|o_ready));
  assign _t60 = ((|_t59) && (|i_last));
  assign _t61 = ({29'b0, r_state} == 32'd3);
  assign _t62 = ((|_t61) && (|_t60));
  assign _t63 = ((|_t57) ? o_ready : _t56);
  assign _t64 = ({29'b0, r_state} == 32'd4);
  assign _t65 = ((|_t62) ? 32'd0 : _t58);
  assign _t66 = ((|i_valid) && (|i_last));
  assign _t67 = ({29'b0, r_state} == 32'd4);
  assign _t68 = ((|_t67) && (|_t66));
  assign o_valid = ((|_t52) ? i_valid : _t51);
  assign o_data = ((|_t54) ? i_data : _t53);
  assign o_last = ((|_t55) ? i_last : 1'd0);
  assign i_ready = ((|_t64) ? 1'd1 : _t63);
  assign hb = ((|_t2) ? 8'd255 : _t1);
  assign _t69 = ((|_t5) ? i_data : lo);
  assign _t70 = ((|_t68) ? 32'd0 : _t65);
  assign _t71 = ((|_t45) ? _t43 : _t42);
  always @(posedge clk) begin
    if (rst) begin
      lo <= 8'd0;
      k <= 4'd0;
      r_state <= 3'd0;
    end else begin
      lo <= _t69;
      k <= _t71;
      r_state <= _t70;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_tx_36492_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [3:0] k;
  reg  [1:0] s_state;
  wire _t0;
  wire [3:0] _t1;
  wire _t2;
  wire _t3;
  wire [3:0] _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire [3:0] _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire [1:0] _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire [7:0] _t31;
  wire _t32;
  wire [1:0] _t33;
  wire _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire [7:0] _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire [1:0] _t43;
  wire _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire [3:0] _t48;
  wire [1:0] _t49;
  assign _t0 = ({30'b0, s_state} == 32'd0);
  assign _t1 = (k + 4'd1);
  assign _t2 = ({30'b0, s_state} == 32'd0);
  assign _t3 = ((|_t2) && (|t_valid));
  assign _t4 = ((|_t3) ? _t1 : k);
  assign _t5 = ((|t_valid) && (|t_last));
  assign _t6 = ({30'b0, s_state} == 32'd0);
  assign _t7 = ((|_t6) && (|_t5));
  assign _t8 = ((|t_valid) && (|t_last));
  assign _t9 = ({30'b0, s_state} == 32'd0);
  assign _t10 = ((|_t9) && (|_t8));
  assign _t11 = ((|_t7) ? 4'd0 : _t4);
  assign _t12 = (k == 4'd11);
  assign _t13 = (~t_last);
  assign _t14 = ((|t_valid) && (|_t13));
  assign _t15 = ((|_t14) && (|_t12));
  assign _t16 = ({30'b0, s_state} == 32'd0);
  assign _t17 = ((|_t16) && (|_t15));
  assign _t18 = ((|_t10) ? 32'd0 : s_state);
  assign _t19 = ((|t_valid) && (|_t13));
  assign _t20 = ((|_t19) && (|_t12));
  assign _t21 = ({30'b0, s_state} == 32'd0);
  assign _t22 = ((|_t21) && (|_t20));
  assign _t23 = ({30'b0, s_state} == 32'd1);
  assign _t24 = ({30'b0, s_state} == 32'd1);
  assign _t25 = ((|_t22) ? 32'd1 : _t18);
  assign _t26 = ((|t_valid) && (|o_ready));
  assign _t27 = ({30'b0, s_state} == 32'd1);
  assign _t28 = ((|_t27) && (|_t26));
  assign _t29 = ((|_t23) ? t_valid : 1'd0);
  assign _t30 = ({30'b0, s_state} == 32'd2);
  assign _t31 = ((|_t24) ? 8'd140 : 8'd0);
  assign _t32 = ({30'b0, s_state} == 32'd2);
  assign _t33 = ((|_t28) ? 32'd2 : _t25);
  assign _t34 = ({30'b0, s_state} == 32'd2);
  assign _t35 = ((|_t34) && (|o_ready));
  assign _t36 = ((|_t30) ? 1'd1 : _t29);
  assign _t37 = ({30'b0, s_state} == 32'd3);
  assign _t38 = ((|_t32) ? 8'd142 : _t31);
  assign _t39 = ({30'b0, s_state} == 32'd3);
  assign _t40 = ({30'b0, s_state} == 32'd3);
  assign _t41 = ((|_t0) ? 1'd1 : 1'd0);
  assign _t42 = ({30'b0, s_state} == 32'd3);
  assign _t43 = ((|_t35) ? 32'd3 : _t33);
  assign _t44 = ((|t_valid) && (|o_ready));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ({30'b0, s_state} == 32'd3);
  assign _t47 = ((|_t46) && (|_t45));
  assign o_valid = ((|_t37) ? t_valid : _t36);
  assign o_data = ((|_t39) ? t_data : _t38);
  assign o_last = ((|_t40) ? t_last : 1'd0);
  assign t_ready = ((|_t42) ? o_ready : _t41);
  assign _t48 = ((|_t17) ? 4'd0 : _t11);
  assign _t49 = ((|_t47) ? 32'd0 : _t43);
  always @(posedge clk) begin
    if (rst) begin
      k <= 4'd0;
      s_state <= 2'd0;
    end else begin
      k <= _t48;
      s_state <= _t49;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_rx_36500_0_2 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [7:0] lo;
  reg  [3:0] k;
  wire [7:0] hb;
  reg  [2:0] r2_state;
  wire _t0;
  wire [7:0] _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire [2:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [2:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [2:0] _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire [2:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [3:0] _t42;
  wire [3:0] _t43;
  wire _t44;
  wire _t45;
  wire [2:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [2:0] _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire [2:0] _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [7:0] _t69;
  wire [2:0] _t70;
  wire [3:0] _t71;
  assign _t0 = (k == 4'd9);
  assign _t1 = ((|_t0) ? 8'd2 : 8'd0);
  assign _t2 = (k < 4'd6);
  assign _t3 = ({29'b0, r2_state} == 32'd0);
  assign _t4 = ({29'b0, r2_state} == 32'd0);
  assign _t5 = ((|_t4) && (|i_valid));
  assign _t6 = ((|i_valid) && (|i_last));
  assign _t7 = ({29'b0, r2_state} == 32'd0);
  assign _t8 = ((|_t7) && (|_t6));
  assign _t9 = ((|_t8) ? 32'd0 : r2_state);
  assign _t10 = (~i_last);
  assign _t11 = ((|i_valid) && (|_t10));
  assign _t12 = ({29'b0, r2_state} == 32'd0);
  assign _t13 = ((|_t12) && (|_t11));
  assign _t14 = ((|_t3) ? 1'd1 : 1'd0);
  assign _t15 = ({29'b0, r2_state} == 32'd1);
  assign _t16 = ((|_t13) ? 32'd1 : _t9);
  assign _t17 = (i_data == 8'd142);
  assign _t18 = (lo == 8'd148);
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = (~_t19);
  assign _t21 = ((|i_last) || (|_t20));
  assign _t22 = ((|i_valid) && (|_t21));
  assign _t23 = ((|_t22) && (|i_last));
  assign _t24 = ({29'b0, r2_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t25) ? 32'd0 : _t16);
  assign _t27 = (~i_last);
  assign _t28 = ((|i_valid) && (|_t21));
  assign _t29 = ((|_t28) && (|_t27));
  assign _t30 = ({29'b0, r2_state} == 32'd1);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = (~_t21);
  assign _t33 = ((|i_valid) && (|_t32));
  assign _t34 = ({29'b0, r2_state} == 32'd1);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ((|_t31) ? 32'd4 : _t26);
  assign _t37 = ((|i_valid) && (|_t32));
  assign _t38 = ({29'b0, r2_state} == 32'd1);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ({29'b0, r2_state} == 32'd2);
  assign _t41 = ({29'b0, r2_state} == 32'd2);
  assign _t42 = ((|_t35) ? 4'd0 : k);
  assign _t43 = (k + 4'd1);
  assign _t44 = ({29'b0, r2_state} == 32'd2);
  assign _t45 = ((|_t44) && (|o_ready));
  assign _t46 = ((|_t39) ? 32'd3 : _t36);
  assign _t47 = (k == 4'd11);
  assign _t48 = ((|o_ready) && (|_t47));
  assign _t49 = ({29'b0, r2_state} == 32'd2);
  assign _t50 = ((|_t49) && (|_t48));
  assign _t51 = ((|_t40) ? 1'd1 : 1'd0);
  assign _t52 = ({29'b0, r2_state} == 32'd3);
  assign _t53 = ((|_t41) ? hb : 8'd0);
  assign _t54 = ({29'b0, r2_state} == 32'd3);
  assign _t55 = ({29'b0, r2_state} == 32'd3);
  assign _t56 = ((|_t15) ? 1'd1 : _t14);
  assign _t57 = ({29'b0, r2_state} == 32'd3);
  assign _t58 = ((|_t50) ? 32'd3 : _t46);
  assign _t59 = ((|i_valid) && (|o_ready));
  assign _t60 = ((|_t59) && (|i_last));
  assign _t61 = ({29'b0, r2_state} == 32'd3);
  assign _t62 = ((|_t61) && (|_t60));
  assign _t63 = ((|_t57) ? o_ready : _t56);
  assign _t64 = ({29'b0, r2_state} == 32'd4);
  assign _t65 = ((|_t62) ? 32'd0 : _t58);
  assign _t66 = ((|i_valid) && (|i_last));
  assign _t67 = ({29'b0, r2_state} == 32'd4);
  assign _t68 = ((|_t67) && (|_t66));
  assign o_valid = ((|_t52) ? i_valid : _t51);
  assign o_data = ((|_t54) ? i_data : _t53);
  assign o_last = ((|_t55) ? i_last : 1'd0);
  assign i_ready = ((|_t64) ? 1'd1 : _t63);
  assign hb = ((|_t2) ? 8'd255 : _t1);
  assign _t69 = ((|_t5) ? i_data : lo);
  assign _t70 = ((|_t68) ? 32'd0 : _t65);
  assign _t71 = ((|_t45) ? _t43 : _t42);
  always @(posedge clk) begin
    if (rst) begin
      lo <= 8'd0;
      k <= 4'd0;
      r2_state <= 3'd0;
    end else begin
      lo <= _t69;
      k <= _t71;
      r2_state <= _t70;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_raw_in (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  assign o_valid = i_valid;
  assign o_data = i_data;
  assign o_last = 1'd1;
  assign i_ready = o_ready;
endmodule
`default_nettype wire

`default_nettype none
module frame_pass_u (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  assign o_valid = i_valid;
  assign o_data = i_data;
  assign o_last = i_last;
  assign i_ready = o_ready;
endmodule
`default_nettype wire

`default_nettype none
module ud_raw_out (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_valid,
  input  wire o_ready
);
  assign o_valid = i_valid;
  assign o_data = i_data;
  assign i_ready = o_ready;
endmodule
`default_nettype wire

`default_nettype none
module ud_rx_36490_1_2 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [7:0] lo;
  reg  [3:0] k;
  wire [7:0] hb;
  reg  [2:0] r3_state;
  wire _t0;
  wire [7:0] _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire [2:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [2:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [2:0] _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire [2:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [3:0] _t42;
  wire [3:0] _t43;
  wire _t44;
  wire _t45;
  wire [2:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [2:0] _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire [2:0] _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [7:0] _t69;
  wire [2:0] _t70;
  wire [3:0] _t71;
  assign _t0 = (k == 4'd9);
  assign _t1 = ((|_t0) ? 8'd2 : 8'd0);
  assign _t2 = (k < 4'd6);
  assign _t3 = ({29'b0, r3_state} == 32'd0);
  assign _t4 = ({29'b0, r3_state} == 32'd0);
  assign _t5 = ((|_t4) && (|i_valid));
  assign _t6 = ((|i_valid) && (|i_last));
  assign _t7 = ({29'b0, r3_state} == 32'd0);
  assign _t8 = ((|_t7) && (|_t6));
  assign _t9 = ((|_t8) ? 32'd0 : r3_state);
  assign _t10 = (~i_last);
  assign _t11 = ((|i_valid) && (|_t10));
  assign _t12 = ({29'b0, r3_state} == 32'd0);
  assign _t13 = ((|_t12) && (|_t11));
  assign _t14 = ((|_t3) ? 1'd1 : 1'd0);
  assign _t15 = ({29'b0, r3_state} == 32'd1);
  assign _t16 = ((|_t13) ? 32'd1 : _t9);
  assign _t17 = (i_data == 8'd142);
  assign _t18 = (lo == 8'd138);
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = (~_t19);
  assign _t21 = ((|i_last) || (|_t20));
  assign _t22 = ((|i_valid) && (|_t21));
  assign _t23 = ((|_t22) && (|i_last));
  assign _t24 = ({29'b0, r3_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t25) ? 32'd0 : _t16);
  assign _t27 = (~i_last);
  assign _t28 = ((|i_valid) && (|_t21));
  assign _t29 = ((|_t28) && (|_t27));
  assign _t30 = ({29'b0, r3_state} == 32'd1);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = (~_t21);
  assign _t33 = ((|i_valid) && (|_t32));
  assign _t34 = ({29'b0, r3_state} == 32'd1);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ((|_t31) ? 32'd4 : _t26);
  assign _t37 = ((|i_valid) && (|_t32));
  assign _t38 = ({29'b0, r3_state} == 32'd1);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ({29'b0, r3_state} == 32'd2);
  assign _t41 = ({29'b0, r3_state} == 32'd2);
  assign _t42 = ((|_t35) ? 4'd0 : k);
  assign _t43 = (k + 4'd1);
  assign _t44 = ({29'b0, r3_state} == 32'd2);
  assign _t45 = ((|_t44) && (|o_ready));
  assign _t46 = ((|_t39) ? 32'd2 : _t36);
  assign _t47 = (k == 4'd11);
  assign _t48 = ((|o_ready) && (|_t47));
  assign _t49 = ({29'b0, r3_state} == 32'd2);
  assign _t50 = ((|_t49) && (|_t48));
  assign _t51 = ((|_t40) ? 1'd1 : 1'd0);
  assign _t52 = ({29'b0, r3_state} == 32'd3);
  assign _t53 = ((|_t41) ? hb : 8'd0);
  assign _t54 = ({29'b0, r3_state} == 32'd3);
  assign _t55 = ({29'b0, r3_state} == 32'd3);
  assign _t56 = ((|_t15) ? 1'd1 : _t14);
  assign _t57 = ({29'b0, r3_state} == 32'd3);
  assign _t58 = ((|_t50) ? 32'd3 : _t46);
  assign _t59 = ((|i_valid) && (|o_ready));
  assign _t60 = ((|_t59) && (|i_last));
  assign _t61 = ({29'b0, r3_state} == 32'd3);
  assign _t62 = ((|_t61) && (|_t60));
  assign _t63 = ((|_t57) ? o_ready : _t56);
  assign _t64 = ({29'b0, r3_state} == 32'd4);
  assign _t65 = ((|_t62) ? 32'd0 : _t58);
  assign _t66 = ((|i_valid) && (|i_last));
  assign _t67 = ({29'b0, r3_state} == 32'd4);
  assign _t68 = ((|_t67) && (|_t66));
  assign o_valid = ((|_t52) ? i_valid : _t51);
  assign o_data = ((|_t54) ? i_data : _t53);
  assign o_last = ((|_t55) ? i_last : 1'd0);
  assign i_ready = ((|_t64) ? 1'd1 : _t63);
  assign hb = ((|_t2) ? 8'd255 : _t1);
  assign _t69 = ((|_t5) ? i_data : lo);
  assign _t70 = ((|_t68) ? 32'd0 : _t65);
  assign _t71 = ((|_t45) ? _t43 : _t42);
  always @(posedge clk) begin
    if (rst) begin
      lo <= 8'd0;
      k <= 4'd0;
      r3_state <= 3'd0;
    end else begin
      lo <= _t69;
      k <= _t71;
      r3_state <= _t70;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_tx_36490_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [3:0] k;
  reg  [1:0] s2_state;
  wire _t0;
  wire [3:0] _t1;
  wire _t2;
  wire _t3;
  wire [3:0] _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire [3:0] _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire [1:0] _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire [7:0] _t31;
  wire _t32;
  wire [1:0] _t33;
  wire _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire [7:0] _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire [1:0] _t43;
  wire _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire [3:0] _t48;
  wire [1:0] _t49;
  assign _t0 = ({30'b0, s2_state} == 32'd0);
  assign _t1 = (k + 4'd1);
  assign _t2 = ({30'b0, s2_state} == 32'd0);
  assign _t3 = ((|_t2) && (|t_valid));
  assign _t4 = ((|_t3) ? _t1 : k);
  assign _t5 = ((|t_valid) && (|t_last));
  assign _t6 = ({30'b0, s2_state} == 32'd0);
  assign _t7 = ((|_t6) && (|_t5));
  assign _t8 = ((|t_valid) && (|t_last));
  assign _t9 = ({30'b0, s2_state} == 32'd0);
  assign _t10 = ((|_t9) && (|_t8));
  assign _t11 = ((|_t7) ? 4'd0 : _t4);
  assign _t12 = (k == 4'd11);
  assign _t13 = (~t_last);
  assign _t14 = ((|t_valid) && (|_t13));
  assign _t15 = ((|_t14) && (|_t12));
  assign _t16 = ({30'b0, s2_state} == 32'd0);
  assign _t17 = ((|_t16) && (|_t15));
  assign _t18 = ((|_t10) ? 32'd0 : s2_state);
  assign _t19 = ((|t_valid) && (|_t13));
  assign _t20 = ((|_t19) && (|_t12));
  assign _t21 = ({30'b0, s2_state} == 32'd0);
  assign _t22 = ((|_t21) && (|_t20));
  assign _t23 = ({30'b0, s2_state} == 32'd1);
  assign _t24 = ({30'b0, s2_state} == 32'd1);
  assign _t25 = ((|_t22) ? 32'd1 : _t18);
  assign _t26 = ((|t_valid) && (|o_ready));
  assign _t27 = ({30'b0, s2_state} == 32'd1);
  assign _t28 = ((|_t27) && (|_t26));
  assign _t29 = ((|_t23) ? t_valid : 1'd0);
  assign _t30 = ({30'b0, s2_state} == 32'd2);
  assign _t31 = ((|_t24) ? 8'd138 : 8'd0);
  assign _t32 = ({30'b0, s2_state} == 32'd2);
  assign _t33 = ((|_t28) ? 32'd2 : _t25);
  assign _t34 = ({30'b0, s2_state} == 32'd2);
  assign _t35 = ((|_t34) && (|o_ready));
  assign _t36 = ((|_t30) ? 1'd1 : _t29);
  assign _t37 = ({30'b0, s2_state} == 32'd3);
  assign _t38 = ((|_t32) ? 8'd142 : _t31);
  assign _t39 = ({30'b0, s2_state} == 32'd3);
  assign _t40 = ({30'b0, s2_state} == 32'd3);
  assign _t41 = ((|_t0) ? 1'd1 : 1'd0);
  assign _t42 = ({30'b0, s2_state} == 32'd3);
  assign _t43 = ((|_t35) ? 32'd3 : _t33);
  assign _t44 = ((|t_valid) && (|o_ready));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ({30'b0, s2_state} == 32'd3);
  assign _t47 = ((|_t46) && (|_t45));
  assign o_valid = ((|_t37) ? t_valid : _t36);
  assign o_data = ((|_t39) ? t_data : _t38);
  assign o_last = ((|_t40) ? t_last : 1'd0);
  assign t_ready = ((|_t42) ? o_ready : _t41);
  assign _t48 = ((|_t17) ? 4'd0 : _t11);
  assign _t49 = ((|_t47) ? 32'd0 : _t43);
  always @(posedge clk) begin
    if (rst) begin
      k <= 4'd0;
      s2_state <= 2'd0;
    end else begin
      k <= _t48;
      s2_state <= _t49;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_rx_36488_1_2 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [7:0] lo;
  reg  [3:0] k;
  wire [7:0] hb;
  reg  [2:0] r4_state;
  wire _t0;
  wire [7:0] _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire [2:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [2:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [2:0] _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire [2:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [3:0] _t42;
  wire [3:0] _t43;
  wire _t44;
  wire _t45;
  wire [2:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [2:0] _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire [2:0] _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [7:0] _t69;
  wire [2:0] _t70;
  wire [3:0] _t71;
  assign _t0 = (k == 4'd9);
  assign _t1 = ((|_t0) ? 8'd2 : 8'd0);
  assign _t2 = (k < 4'd6);
  assign _t3 = ({29'b0, r4_state} == 32'd0);
  assign _t4 = ({29'b0, r4_state} == 32'd0);
  assign _t5 = ((|_t4) && (|i_valid));
  assign _t6 = ((|i_valid) && (|i_last));
  assign _t7 = ({29'b0, r4_state} == 32'd0);
  assign _t8 = ((|_t7) && (|_t6));
  assign _t9 = ((|_t8) ? 32'd0 : r4_state);
  assign _t10 = (~i_last);
  assign _t11 = ((|i_valid) && (|_t10));
  assign _t12 = ({29'b0, r4_state} == 32'd0);
  assign _t13 = ((|_t12) && (|_t11));
  assign _t14 = ((|_t3) ? 1'd1 : 1'd0);
  assign _t15 = ({29'b0, r4_state} == 32'd1);
  assign _t16 = ((|_t13) ? 32'd1 : _t9);
  assign _t17 = (i_data == 8'd142);
  assign _t18 = (lo == 8'd136);
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = (~_t19);
  assign _t21 = ((|i_last) || (|_t20));
  assign _t22 = ((|i_valid) && (|_t21));
  assign _t23 = ((|_t22) && (|i_last));
  assign _t24 = ({29'b0, r4_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t25) ? 32'd0 : _t16);
  assign _t27 = (~i_last);
  assign _t28 = ((|i_valid) && (|_t21));
  assign _t29 = ((|_t28) && (|_t27));
  assign _t30 = ({29'b0, r4_state} == 32'd1);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = (~_t21);
  assign _t33 = ((|i_valid) && (|_t32));
  assign _t34 = ({29'b0, r4_state} == 32'd1);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ((|_t31) ? 32'd4 : _t26);
  assign _t37 = ((|i_valid) && (|_t32));
  assign _t38 = ({29'b0, r4_state} == 32'd1);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ({29'b0, r4_state} == 32'd2);
  assign _t41 = ({29'b0, r4_state} == 32'd2);
  assign _t42 = ((|_t35) ? 4'd0 : k);
  assign _t43 = (k + 4'd1);
  assign _t44 = ({29'b0, r4_state} == 32'd2);
  assign _t45 = ((|_t44) && (|o_ready));
  assign _t46 = ((|_t39) ? 32'd2 : _t36);
  assign _t47 = (k == 4'd11);
  assign _t48 = ((|o_ready) && (|_t47));
  assign _t49 = ({29'b0, r4_state} == 32'd2);
  assign _t50 = ((|_t49) && (|_t48));
  assign _t51 = ((|_t40) ? 1'd1 : 1'd0);
  assign _t52 = ({29'b0, r4_state} == 32'd3);
  assign _t53 = ((|_t41) ? hb : 8'd0);
  assign _t54 = ({29'b0, r4_state} == 32'd3);
  assign _t55 = ({29'b0, r4_state} == 32'd3);
  assign _t56 = ((|_t15) ? 1'd1 : _t14);
  assign _t57 = ({29'b0, r4_state} == 32'd3);
  assign _t58 = ((|_t50) ? 32'd3 : _t46);
  assign _t59 = ((|i_valid) && (|o_ready));
  assign _t60 = ((|_t59) && (|i_last));
  assign _t61 = ({29'b0, r4_state} == 32'd3);
  assign _t62 = ((|_t61) && (|_t60));
  assign _t63 = ((|_t57) ? o_ready : _t56);
  assign _t64 = ({29'b0, r4_state} == 32'd4);
  assign _t65 = ((|_t62) ? 32'd0 : _t58);
  assign _t66 = ((|i_valid) && (|i_last));
  assign _t67 = ({29'b0, r4_state} == 32'd4);
  assign _t68 = ((|_t67) && (|_t66));
  assign o_valid = ((|_t52) ? i_valid : _t51);
  assign o_data = ((|_t54) ? i_data : _t53);
  assign o_last = ((|_t55) ? i_last : 1'd0);
  assign i_ready = ((|_t64) ? 1'd1 : _t63);
  assign hb = ((|_t2) ? 8'd255 : _t1);
  assign _t69 = ((|_t5) ? i_data : lo);
  assign _t70 = ((|_t68) ? 32'd0 : _t65);
  assign _t71 = ((|_t45) ? _t43 : _t42);
  always @(posedge clk) begin
    if (rst) begin
      lo <= 8'd0;
      k <= 4'd0;
      r4_state <= 3'd0;
    end else begin
      lo <= _t69;
      k <= _t71;
      r4_state <= _t70;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_tx_36488_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [3:0] k;
  reg  [1:0] s3_state;
  wire _t0;
  wire [3:0] _t1;
  wire _t2;
  wire _t3;
  wire [3:0] _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire [3:0] _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire [1:0] _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire [7:0] _t31;
  wire _t32;
  wire [1:0] _t33;
  wire _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire [7:0] _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire [1:0] _t43;
  wire _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire [3:0] _t48;
  wire [1:0] _t49;
  assign _t0 = ({30'b0, s3_state} == 32'd0);
  assign _t1 = (k + 4'd1);
  assign _t2 = ({30'b0, s3_state} == 32'd0);
  assign _t3 = ((|_t2) && (|t_valid));
  assign _t4 = ((|_t3) ? _t1 : k);
  assign _t5 = ((|t_valid) && (|t_last));
  assign _t6 = ({30'b0, s3_state} == 32'd0);
  assign _t7 = ((|_t6) && (|_t5));
  assign _t8 = ((|t_valid) && (|t_last));
  assign _t9 = ({30'b0, s3_state} == 32'd0);
  assign _t10 = ((|_t9) && (|_t8));
  assign _t11 = ((|_t7) ? 4'd0 : _t4);
  assign _t12 = (k == 4'd11);
  assign _t13 = (~t_last);
  assign _t14 = ((|t_valid) && (|_t13));
  assign _t15 = ((|_t14) && (|_t12));
  assign _t16 = ({30'b0, s3_state} == 32'd0);
  assign _t17 = ((|_t16) && (|_t15));
  assign _t18 = ((|_t10) ? 32'd0 : s3_state);
  assign _t19 = ((|t_valid) && (|_t13));
  assign _t20 = ((|_t19) && (|_t12));
  assign _t21 = ({30'b0, s3_state} == 32'd0);
  assign _t22 = ((|_t21) && (|_t20));
  assign _t23 = ({30'b0, s3_state} == 32'd1);
  assign _t24 = ({30'b0, s3_state} == 32'd1);
  assign _t25 = ((|_t22) ? 32'd1 : _t18);
  assign _t26 = ((|t_valid) && (|o_ready));
  assign _t27 = ({30'b0, s3_state} == 32'd1);
  assign _t28 = ((|_t27) && (|_t26));
  assign _t29 = ((|_t23) ? t_valid : 1'd0);
  assign _t30 = ({30'b0, s3_state} == 32'd2);
  assign _t31 = ((|_t24) ? 8'd136 : 8'd0);
  assign _t32 = ({30'b0, s3_state} == 32'd2);
  assign _t33 = ((|_t28) ? 32'd2 : _t25);
  assign _t34 = ({30'b0, s3_state} == 32'd2);
  assign _t35 = ((|_t34) && (|o_ready));
  assign _t36 = ((|_t30) ? 1'd1 : _t29);
  assign _t37 = ({30'b0, s3_state} == 32'd3);
  assign _t38 = ((|_t32) ? 8'd142 : _t31);
  assign _t39 = ({30'b0, s3_state} == 32'd3);
  assign _t40 = ({30'b0, s3_state} == 32'd3);
  assign _t41 = ((|_t0) ? 1'd1 : 1'd0);
  assign _t42 = ({30'b0, s3_state} == 32'd3);
  assign _t43 = ((|_t35) ? 32'd3 : _t33);
  assign _t44 = ((|t_valid) && (|o_ready));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ({30'b0, s3_state} == 32'd3);
  assign _t47 = ((|_t46) && (|_t45));
  assign o_valid = ((|_t37) ? t_valid : _t36);
  assign o_data = ((|_t39) ? t_data : _t38);
  assign o_last = ((|_t40) ? t_last : 1'd0);
  assign t_ready = ((|_t42) ? o_ready : _t41);
  assign _t48 = ((|_t17) ? 4'd0 : _t11);
  assign _t49 = ((|_t47) ? 32'd0 : _t43);
  always @(posedge clk) begin
    if (rst) begin
      k <= 4'd0;
      s3_state <= 2'd0;
    end else begin
      k <= _t48;
      s3_state <= _t49;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_rx_36486_1_2 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [7:0] lo;
  reg  [3:0] k;
  wire [7:0] hb;
  reg  [2:0] r5_state;
  wire _t0;
  wire [7:0] _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire [2:0] _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [2:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [2:0] _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire [2:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [3:0] _t42;
  wire [3:0] _t43;
  wire _t44;
  wire _t45;
  wire [2:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire [7:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [2:0] _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire [2:0] _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [7:0] _t69;
  wire [2:0] _t70;
  wire [3:0] _t71;
  assign _t0 = (k == 4'd9);
  assign _t1 = ((|_t0) ? 8'd2 : 8'd0);
  assign _t2 = (k < 4'd6);
  assign _t3 = ({29'b0, r5_state} == 32'd0);
  assign _t4 = ({29'b0, r5_state} == 32'd0);
  assign _t5 = ((|_t4) && (|i_valid));
  assign _t6 = ((|i_valid) && (|i_last));
  assign _t7 = ({29'b0, r5_state} == 32'd0);
  assign _t8 = ((|_t7) && (|_t6));
  assign _t9 = ((|_t8) ? 32'd0 : r5_state);
  assign _t10 = (~i_last);
  assign _t11 = ((|i_valid) && (|_t10));
  assign _t12 = ({29'b0, r5_state} == 32'd0);
  assign _t13 = ((|_t12) && (|_t11));
  assign _t14 = ((|_t3) ? 1'd1 : 1'd0);
  assign _t15 = ({29'b0, r5_state} == 32'd1);
  assign _t16 = ((|_t13) ? 32'd1 : _t9);
  assign _t17 = (i_data == 8'd142);
  assign _t18 = (lo == 8'd134);
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = (~_t19);
  assign _t21 = ((|i_last) || (|_t20));
  assign _t22 = ((|i_valid) && (|_t21));
  assign _t23 = ((|_t22) && (|i_last));
  assign _t24 = ({29'b0, r5_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t25) ? 32'd0 : _t16);
  assign _t27 = (~i_last);
  assign _t28 = ((|i_valid) && (|_t21));
  assign _t29 = ((|_t28) && (|_t27));
  assign _t30 = ({29'b0, r5_state} == 32'd1);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = (~_t21);
  assign _t33 = ((|i_valid) && (|_t32));
  assign _t34 = ({29'b0, r5_state} == 32'd1);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ((|_t31) ? 32'd4 : _t26);
  assign _t37 = ((|i_valid) && (|_t32));
  assign _t38 = ({29'b0, r5_state} == 32'd1);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ({29'b0, r5_state} == 32'd2);
  assign _t41 = ({29'b0, r5_state} == 32'd2);
  assign _t42 = ((|_t35) ? 4'd0 : k);
  assign _t43 = (k + 4'd1);
  assign _t44 = ({29'b0, r5_state} == 32'd2);
  assign _t45 = ((|_t44) && (|o_ready));
  assign _t46 = ((|_t39) ? 32'd2 : _t36);
  assign _t47 = (k == 4'd11);
  assign _t48 = ((|o_ready) && (|_t47));
  assign _t49 = ({29'b0, r5_state} == 32'd2);
  assign _t50 = ((|_t49) && (|_t48));
  assign _t51 = ((|_t40) ? 1'd1 : 1'd0);
  assign _t52 = ({29'b0, r5_state} == 32'd3);
  assign _t53 = ((|_t41) ? hb : 8'd0);
  assign _t54 = ({29'b0, r5_state} == 32'd3);
  assign _t55 = ({29'b0, r5_state} == 32'd3);
  assign _t56 = ((|_t15) ? 1'd1 : _t14);
  assign _t57 = ({29'b0, r5_state} == 32'd3);
  assign _t58 = ((|_t50) ? 32'd3 : _t46);
  assign _t59 = ((|i_valid) && (|o_ready));
  assign _t60 = ((|_t59) && (|i_last));
  assign _t61 = ({29'b0, r5_state} == 32'd3);
  assign _t62 = ((|_t61) && (|_t60));
  assign _t63 = ((|_t57) ? o_ready : _t56);
  assign _t64 = ({29'b0, r5_state} == 32'd4);
  assign _t65 = ((|_t62) ? 32'd0 : _t58);
  assign _t66 = ((|i_valid) && (|i_last));
  assign _t67 = ({29'b0, r5_state} == 32'd4);
  assign _t68 = ((|_t67) && (|_t66));
  assign o_valid = ((|_t52) ? i_valid : _t51);
  assign o_data = ((|_t54) ? i_data : _t53);
  assign o_last = ((|_t55) ? i_last : 1'd0);
  assign i_ready = ((|_t64) ? 1'd1 : _t63);
  assign hb = ((|_t2) ? 8'd255 : _t1);
  assign _t69 = ((|_t5) ? i_data : lo);
  assign _t70 = ((|_t68) ? 32'd0 : _t65);
  assign _t71 = ((|_t45) ? _t43 : _t42);
  always @(posedge clk) begin
    if (rst) begin
      lo <= 8'd0;
      k <= 4'd0;
      r5_state <= 3'd0;
    end else begin
      lo <= _t69;
      k <= _t71;
      r5_state <= _t70;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module ud_tx_36486_1 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  output wire [7:0] o_data,
  output wire o_last,
  output wire o_valid,
  input  wire o_ready
);
  reg  [3:0] k;
  reg  [1:0] s4_state;
  wire _t0;
  wire [3:0] _t1;
  wire _t2;
  wire _t3;
  wire [3:0] _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire [3:0] _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire [1:0] _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire [7:0] _t31;
  wire _t32;
  wire [1:0] _t33;
  wire _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire [7:0] _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire [1:0] _t43;
  wire _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire [3:0] _t48;
  wire [1:0] _t49;
  assign _t0 = ({30'b0, s4_state} == 32'd0);
  assign _t1 = (k + 4'd1);
  assign _t2 = ({30'b0, s4_state} == 32'd0);
  assign _t3 = ((|_t2) && (|t_valid));
  assign _t4 = ((|_t3) ? _t1 : k);
  assign _t5 = ((|t_valid) && (|t_last));
  assign _t6 = ({30'b0, s4_state} == 32'd0);
  assign _t7 = ((|_t6) && (|_t5));
  assign _t8 = ((|t_valid) && (|t_last));
  assign _t9 = ({30'b0, s4_state} == 32'd0);
  assign _t10 = ((|_t9) && (|_t8));
  assign _t11 = ((|_t7) ? 4'd0 : _t4);
  assign _t12 = (k == 4'd11);
  assign _t13 = (~t_last);
  assign _t14 = ((|t_valid) && (|_t13));
  assign _t15 = ((|_t14) && (|_t12));
  assign _t16 = ({30'b0, s4_state} == 32'd0);
  assign _t17 = ((|_t16) && (|_t15));
  assign _t18 = ((|_t10) ? 32'd0 : s4_state);
  assign _t19 = ((|t_valid) && (|_t13));
  assign _t20 = ((|_t19) && (|_t12));
  assign _t21 = ({30'b0, s4_state} == 32'd0);
  assign _t22 = ((|_t21) && (|_t20));
  assign _t23 = ({30'b0, s4_state} == 32'd1);
  assign _t24 = ({30'b0, s4_state} == 32'd1);
  assign _t25 = ((|_t22) ? 32'd1 : _t18);
  assign _t26 = ((|t_valid) && (|o_ready));
  assign _t27 = ({30'b0, s4_state} == 32'd1);
  assign _t28 = ((|_t27) && (|_t26));
  assign _t29 = ((|_t23) ? t_valid : 1'd0);
  assign _t30 = ({30'b0, s4_state} == 32'd2);
  assign _t31 = ((|_t24) ? 8'd134 : 8'd0);
  assign _t32 = ({30'b0, s4_state} == 32'd2);
  assign _t33 = ((|_t28) ? 32'd2 : _t25);
  assign _t34 = ({30'b0, s4_state} == 32'd2);
  assign _t35 = ((|_t34) && (|o_ready));
  assign _t36 = ((|_t30) ? 1'd1 : _t29);
  assign _t37 = ({30'b0, s4_state} == 32'd3);
  assign _t38 = ((|_t32) ? 8'd142 : _t31);
  assign _t39 = ({30'b0, s4_state} == 32'd3);
  assign _t40 = ({30'b0, s4_state} == 32'd3);
  assign _t41 = ((|_t0) ? 1'd1 : 1'd0);
  assign _t42 = ({30'b0, s4_state} == 32'd3);
  assign _t43 = ((|_t35) ? 32'd3 : _t33);
  assign _t44 = ((|t_valid) && (|o_ready));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ({30'b0, s4_state} == 32'd3);
  assign _t47 = ((|_t46) && (|_t45));
  assign o_valid = ((|_t37) ? t_valid : _t36);
  assign o_data = ((|_t39) ? t_data : _t38);
  assign o_last = ((|_t40) ? t_last : 1'd0);
  assign t_ready = ((|_t42) ? o_ready : _t41);
  assign _t48 = ((|_t17) ? 4'd0 : _t11);
  assign _t49 = ((|_t47) ? 32'd0 : _t43);
  always @(posedge clk) begin
    if (rst) begin
      k <= 4'd0;
      s4_state <= 2'd0;
    end else begin
      k <= _t48;
      s4_state <= _t49;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module xfifo_8_4_16 (
  input  wire clk,
  input  wire rst,
  input  wire wclk,
  input  wire wrst,
  input  wire rclk,
  input  wire rrst,
  input  wire [7:0] src_data,
  input  wire src_valid,
  output wire src_ready,
  output wire [7:0] dst_data,
  output wire dst_valid,
  input  wire dst_ready
);
  reg  [4:0] wp;
  reg  [4:0] rp;
  reg  [4:0] wg;
  reg  [4:0] rg;
  wire [4:0] rg_w;
  wire [4:0] wg_r;
  wire [3:0] mem_rd0_addr;
  wire [7:0] mem_rd0_data;
  wire [3:0] mem_wr0_addr;
  wire [7:0] mem_wr0_data;
  wire mem_wr0_we;
  wire [4:0] wn;
  wire [4:0] wng;
  wire [4:0] rn;
  wire [4:0] rng;
  reg  [4:0] rg_w_sync30;
  reg  [4:0] rg_w_sync31;
  reg  [4:0] wg_r_sync30;
  reg  [4:0] wg_r_sync31;
  wire _t0;
  wire _t1;
  wire _t2;
  wire [3:0] _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire [3:0] _t7;
  wire _t8;
  wire _t9;
  wire [4:0] _t10;
  wire _t11;
  wire _t12;
  wire [2:0] _t13;
  wire _t14;
  wire _t15;
  wire [4:0] _t16;
  wire _t17;
  wire _t18;
  wire [2:0] _t19;
  wire _t20;
  wire _t21;
  wire [4:0] _t22;
  wire [1:0] _t23;
  wire _t24;
  wire [1:0] _t25;
  wire _t26;
  wire _t27;
  wire [4:0] _t28;
  wire [1:0] _t29;
  wire _t30;
  wire [1:0] _t31;
  wire _t32;
  wire _t33;
  wire [4:0] _t34;
  wire [2:0] _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire [4:0] _t40;
  wire [2:0] _t41;
  wire _t42;
  wire _t43;
  wire [4:0] _t44;
  wire [3:0] _t45;
  wire _t46;
  wire [4:0] _t47;
  wire [3:0] _t48;
  wire _t49;
  wire [2:0] _t50;
  wire [2:0] _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire [3:0] _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire [4:0] _t66;
  wire [4:0] _t67;
  wire [4:0] _t68;
  wire [4:0] _t69;
  assign _t0 = wn[1];
  assign _t1 = wn[0];
  assign _t2 = (_t1 ^ _t0);
  assign _t3 = 4'd0;
  assign _t4 = rn[1];
  assign _t5 = rn[0];
  assign _t6 = (_t5 ^ _t4);
  assign _t7 = 4'd0;
  assign _t8 = wn[2];
  assign _t9 = wn[1];
  assign _t10 = {_t3, _t2};
  assign _t11 = _t10[0:0];
  assign _t12 = (_t9 ^ _t8);
  assign _t13 = _t10[4:2];
  assign _t14 = rn[2];
  assign _t15 = rn[1];
  assign _t16 = {_t7, _t6};
  assign _t17 = _t16[0:0];
  assign _t18 = (_t15 ^ _t14);
  assign _t19 = _t16[4:2];
  assign _t20 = wn[3];
  assign _t21 = wn[2];
  assign _t22 = {_t13, _t12, _t11};
  assign _t23 = _t22[1:0];
  assign _t24 = (_t21 ^ _t20);
  assign _t25 = _t22[4:3];
  assign _t26 = rn[3];
  assign _t27 = rn[2];
  assign _t28 = {_t19, _t18, _t17};
  assign _t29 = _t28[1:0];
  assign _t30 = (_t27 ^ _t26);
  assign _t31 = _t28[4:3];
  assign _t32 = wn[4];
  assign _t33 = wn[3];
  assign _t34 = {_t25, _t24, _t23};
  assign _t35 = _t34[2:0];
  assign _t36 = (_t33 ^ _t32);
  assign _t37 = _t34[4:4];
  assign _t38 = rn[4];
  assign _t39 = rn[3];
  assign _t40 = {_t31, _t30, _t29};
  assign _t41 = _t40[2:0];
  assign _t42 = (_t39 ^ _t38);
  assign _t43 = _t40[4:4];
  assign _t44 = {_t37, _t36, _t35};
  assign _t45 = _t44[3:0];
  assign _t46 = wn[4];
  assign _t47 = {_t43, _t42, _t41};
  assign _t48 = _t47[3:0];
  assign _t49 = rn[4];
  assign _t50 = rg_w[2:0];
  assign _t51 = wg[2:0];
  assign _t52 = (_t51 == _t50);
  assign _t53 = rg_w[3];
  assign _t54 = wg[3];
  assign _t55 = (_t54 != _t53);
  assign _t56 = rg_w[4];
  assign _t57 = wg[4];
  assign _t58 = (_t57 != _t56);
  assign _t59 = ((|_t58) && (|_t55));
  assign _t60 = ((|_t59) && (|_t52));
  assign _t61 = wp[3:0];
  assign _t62 = (~_t60);
  assign _t63 = ((|src_valid) && (|_t62));
  assign _t64 = (rg == wg_r);
  assign _t65 = ((|dst_valid) && (|dst_ready));
  assign wn = (wp + 5'd1);
  assign rn = (rp + 5'd1);
  assign wng = {_t46, _t45};
  assign rng = {_t49, _t48};
  assign rg_w = rg_w_sync31;
  assign src_ready = (~_t60);
  assign mem_wr0_addr = ((|_t63) ? _t61 : 4'd0);
  assign mem_wr0_data = ((|_t63) ? src_data : 8'd0);
  assign mem_wr0_we = ((|_t63) ? 1'd1 : 1'd0);
  assign _t66 = ((|_t63) ? wn : wp);
  assign _t67 = ((|_t63) ? wng : wg);
  assign wg_r = wg_r_sync31;
  assign dst_valid = (~_t64);
  assign mem_rd0_addr = rp[3:0];
  assign dst_data = mem_rd0_data;
  assign _t68 = ((|_t65) ? rn : rp);
  assign _t69 = ((|_t65) ? rng : rg);
  always @(posedge wclk) begin
    if (wrst) begin
      wp <= 5'd0;
      wg <= 5'd0;
      rg_w_sync30 <= 5'd0;
      rg_w_sync31 <= 5'd0;
    end else begin
      wp <= _t66;
      wg <= _t67;
      rg_w_sync30 <= rg;
      rg_w_sync31 <= rg_w_sync30;
    end
  end
  always @(posedge rclk) begin
    if (rrst) begin
      rp <= 5'd0;
      rg <= 5'd0;
      wg_r_sync30 <= 5'd0;
      wg_r_sync31 <= 5'd0;
    end else begin
      rp <= _t68;
      rg <= _t69;
      wg_r_sync30 <= wg;
      wg_r_sync31 <= wg_r_sync30;
    end
  end
  l8_ram_8x16_r1_w1_d _meminst_0_mem (
    .clk(wclk),
    .rd0_addr(mem_rd0_addr),
    .rd0_data(mem_rd0_data),
    .wr0_we(mem_wr0_we),
    .wr0_addr(mem_wr0_addr),
    .wr0_data(mem_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module slip_tx (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] f_data,
  input  wire f_last,
  input  wire f_valid,
  output wire f_ready,
  input  wire [7:0] con_data,
  input  wire con_valid,
  output wire con_ready,
  output wire [7:0] o_data,
  output wire o_valid,
  input  wire o_ready
);
  reg  [15:0] crc;
  reg  [7:0] pb;
  reg  lastb;
  reg  [1:0] ph;
  reg  [2:0] t_state;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire [7:0] _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire [15:0] _t31;
  wire [15:0] _t32;
  wire [15:0] _t33;
  wire [15:0] _t34;
  wire [15:0] _t35;
  wire [15:0] _t36;
  wire _t37;
  wire [15:0] _t38;
  wire [15:0] _t39;
  wire [15:0] _t40;
  wire [15:0] _t41;
  wire _t42;
  wire [15:0] _t43;
  wire [15:0] _t44;
  wire [15:0] _t45;
  wire [15:0] _t46;
  wire _t47;
  wire [15:0] _t48;
  wire [15:0] _t49;
  wire [15:0] _t50;
  wire [15:0] _t51;
  wire _t52;
  wire [15:0] _t53;
  wire [15:0] _t54;
  wire [15:0] _t55;
  wire [15:0] _t56;
  wire _t57;
  wire [15:0] _t58;
  wire [15:0] _t59;
  wire [15:0] _t60;
  wire [15:0] _t61;
  wire _t62;
  wire [15:0] _t63;
  wire [15:0] _t64;
  wire [15:0] _t65;
  wire [15:0] _t66;
  wire _t67;
  wire [15:0] _t68;
  wire [15:0] _t69;
  wire [15:0] _t70;
  wire [15:0] _t71;
  wire _t72;
  wire [15:0] _t73;
  wire [15:0] _t74;
  wire [15:0] _t75;
  wire _t76;
  wire _t77;
  wire _t78;
  wire [2:0] _t79;
  wire _t80;
  wire _t81;
  wire _t82;
  wire [7:0] _t83;
  wire [7:0] _t84;
  wire _t85;
  wire [7:0] _t86;
  wire [7:0] _t87;
  wire _t88;
  wire _t89;
  wire _t90;
  wire [2:0] _t91;
  wire _t92;
  wire _t93;
  wire _t94;
  wire _t95;
  wire _t96;
  wire _t97;
  wire _t98;
  wire [7:0] _t99;
  wire [7:0] _t100;
  wire _t101;
  wire [2:0] _t102;
  wire _t103;
  wire _t104;
  wire _t105;
  wire [2:0] _t106;
  wire _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire [7:0] _t114;
  wire [7:0] _t115;
  wire _t116;
  wire [2:0] _t117;
  wire _t118;
  wire _t119;
  wire [2:0] _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire [1:0] _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire [2:0] _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire [1:0] _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire [2:0] _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire [7:0] _t146;
  wire _t147;
  wire [2:0] _t148;
  wire _t149;
  wire _t150;
  wire [15:0] _t151;
  wire [1:0] _t152;
  wire [2:0] _t153;
  wire [7:0] _t154;
  wire _t155;
  assign _t0 = ({29'b0, t_state} == 32'd0);
  assign _t1 = ((|_t0) && (|f_valid));
  assign _t2 = ({29'b0, t_state} == 32'd0);
  assign _t3 = ((|_t2) && (|f_valid));
  assign _t4 = ((|f_valid) && (|o_ready));
  assign _t5 = ({29'b0, t_state} == 32'd0);
  assign _t6 = ((|_t5) && (|_t4));
  assign _t7 = ((|f_valid) && (|o_ready));
  assign _t8 = ({29'b0, t_state} == 32'd0);
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = ((|f_valid) && (|o_ready));
  assign _t11 = ({29'b0, t_state} == 32'd0);
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t1) ? 1'd1 : 1'd0);
  assign _t14 = (~f_valid);
  assign _t15 = ({29'b0, t_state} == 32'd0);
  assign _t16 = ((|_t15) && (|_t14));
  assign _t17 = ((|_t3) ? 8'd192 : 8'd0);
  assign _t18 = ({29'b0, t_state} == 32'd0);
  assign _t19 = ((|_t18) && (|_t14));
  assign _t20 = ({29'b0, t_state} == 32'd0);
  assign _t21 = ((|_t20) && (|_t14));
  assign _t22 = (ph == 2'd0);
  assign _t23 = ({29'b0, t_state} == 32'd1);
  assign _t24 = ((|_t23) && (|_t22));
  assign _t25 = ((|_t22) && (|f_valid));
  assign _t26 = ({29'b0, t_state} == 32'd1);
  assign _t27 = ((|_t26) && (|_t25));
  assign _t28 = ((|_t22) && (|f_valid));
  assign _t29 = ({29'b0, t_state} == 32'd1);
  assign _t30 = ((|_t29) && (|_t28));
  assign _t31 = {8'b0, f_data};
  assign _t32 = (_t31 << 32'd8);
  assign _t33 = (crc ^ _t32);
  assign _t34 = (_t33 << 32'd1);
  assign _t35 = (_t33 << 32'd1);
  assign _t36 = (_t35 ^ 16'd4129);
  assign _t37 = _t33[15];
  assign _t38 = ((|_t37) ? _t36 : _t34);
  assign _t39 = (_t38 << 32'd1);
  assign _t40 = (_t38 << 32'd1);
  assign _t41 = (_t40 ^ 16'd4129);
  assign _t42 = _t38[15];
  assign _t43 = ((|_t42) ? _t41 : _t39);
  assign _t44 = (_t43 << 32'd1);
  assign _t45 = (_t43 << 32'd1);
  assign _t46 = (_t45 ^ 16'd4129);
  assign _t47 = _t43[15];
  assign _t48 = ((|_t47) ? _t46 : _t44);
  assign _t49 = (_t48 << 32'd1);
  assign _t50 = (_t48 << 32'd1);
  assign _t51 = (_t50 ^ 16'd4129);
  assign _t52 = _t48[15];
  assign _t53 = ((|_t52) ? _t51 : _t49);
  assign _t54 = (_t53 << 32'd1);
  assign _t55 = (_t53 << 32'd1);
  assign _t56 = (_t55 ^ 16'd4129);
  assign _t57 = _t53[15];
  assign _t58 = ((|_t57) ? _t56 : _t54);
  assign _t59 = (_t58 << 32'd1);
  assign _t60 = (_t58 << 32'd1);
  assign _t61 = (_t60 ^ 16'd4129);
  assign _t62 = _t58[15];
  assign _t63 = ((|_t62) ? _t61 : _t59);
  assign _t64 = (_t63 << 32'd1);
  assign _t65 = (_t63 << 32'd1);
  assign _t66 = (_t65 ^ 16'd4129);
  assign _t67 = _t63[15];
  assign _t68 = ((|_t67) ? _t66 : _t64);
  assign _t69 = (_t68 << 32'd1);
  assign _t70 = (_t68 << 32'd1);
  assign _t71 = (_t70 ^ 16'd4129);
  assign _t72 = _t68[15];
  assign _t73 = ((|_t72) ? _t71 : _t69);
  assign _t74 = ((|_t6) ? 16'd65535 : crc);
  assign _t75 = _t73;
  assign _t76 = ((|_t22) && (|f_valid));
  assign _t77 = ({29'b0, t_state} == 32'd1);
  assign _t78 = ((|_t77) && (|_t76));
  assign _t79 = ((|_t12) ? 32'd1 : t_state);
  assign _t80 = ((|_t22) && (|f_valid));
  assign _t81 = ({29'b0, t_state} == 32'd1);
  assign _t82 = ((|_t81) && (|_t80));
  assign _t83 = crc[7:0];
  assign _t84 = crc[15:8];
  assign _t85 = (ph == 2'd1);
  assign _t86 = ((|_t27) ? f_data : pb);
  assign _t87 = ((|_t85) ? _t84 : _t83);
  assign _t88 = (~_t22);
  assign _t89 = ({29'b0, t_state} == 32'd1);
  assign _t90 = ((|_t89) && (|_t88));
  assign _t91 = ((|_t82) ? 32'd2 : _t79);
  assign _t92 = ({29'b0, t_state} == 32'd1);
  assign _t93 = ((|_t92) && (|_t88));
  assign _t94 = ((|_t16) ? con_valid : _t13);
  assign _t95 = ({29'b0, t_state} == 32'd2);
  assign _t96 = (pb == 8'd219);
  assign _t97 = (pb == 8'd192);
  assign _t98 = ((|_t97) || (|_t96));
  assign _t99 = ((|_t19) ? con_data : _t17);
  assign _t100 = ((|_t98) ? 8'd219 : pb);
  assign _t101 = ({29'b0, t_state} == 32'd2);
  assign _t102 = ((|_t93) ? 32'd2 : _t91);
  assign _t103 = ((|o_ready) && (|_t98));
  assign _t104 = ({29'b0, t_state} == 32'd2);
  assign _t105 = ((|_t104) && (|_t103));
  assign _t106 = ((|_t105) ? 32'd3 : _t102);
  assign _t107 = (~_t98);
  assign _t108 = ((|o_ready) && (|_t107));
  assign _t109 = ({29'b0, t_state} == 32'd2);
  assign _t110 = ((|_t109) && (|_t108));
  assign _t111 = ((|_t95) ? 1'd1 : _t94);
  assign _t112 = ({29'b0, t_state} == 32'd3);
  assign _t113 = (pb == 8'd192);
  assign _t114 = ((|_t101) ? _t100 : _t99);
  assign _t115 = ((|_t113) ? 8'd220 : 8'd221);
  assign _t116 = ({29'b0, t_state} == 32'd3);
  assign _t117 = ((|_t110) ? 32'd4 : _t106);
  assign _t118 = ({29'b0, t_state} == 32'd3);
  assign _t119 = ((|_t118) && (|o_ready));
  assign _t120 = ((|_t119) ? 32'd4 : _t117);
  assign _t121 = (ph == 2'd2);
  assign _t122 = ({29'b0, t_state} == 32'd4);
  assign _t123 = ((|_t122) && (|_t121));
  assign _t124 = ((|_t9) ? 2'd0 : ph);
  assign _t125 = (ph == 2'd1);
  assign _t126 = (~_t121);
  assign _t127 = ((|_t126) && (|_t125));
  assign _t128 = ({29'b0, t_state} == 32'd4);
  assign _t129 = ((|_t128) && (|_t127));
  assign _t130 = ((|_t123) ? 32'd5 : _t120);
  assign _t131 = ((|_t126) && (|_t125));
  assign _t132 = ({29'b0, t_state} == 32'd4);
  assign _t133 = ((|_t132) && (|_t131));
  assign _t134 = ((|_t129) ? 2'd2 : _t124);
  assign _t135 = (~_t125);
  assign _t136 = ((|_t126) && (|_t135));
  assign _t137 = ((|_t136) && (|lastb));
  assign _t138 = ({29'b0, t_state} == 32'd4);
  assign _t139 = ((|_t138) && (|_t137));
  assign _t140 = ((|_t133) ? 32'd1 : _t130);
  assign _t141 = ((|_t126) && (|_t135));
  assign _t142 = ({29'b0, t_state} == 32'd4);
  assign _t143 = ((|_t142) && (|_t141));
  assign _t144 = ((|_t112) ? 1'd1 : _t111);
  assign _t145 = ({29'b0, t_state} == 32'd5);
  assign _t146 = ((|_t116) ? _t115 : _t114);
  assign _t147 = ({29'b0, t_state} == 32'd5);
  assign _t148 = ((|_t143) ? 32'd1 : _t140);
  assign _t149 = ({29'b0, t_state} == 32'd5);
  assign _t150 = ((|_t149) && (|o_ready));
  assign f_ready = ((|_t24) ? 1'd1 : 1'd0);
  assign con_ready = ((|_t21) ? o_ready : 1'd0);
  assign o_valid = ((|_t145) ? 1'd1 : _t144);
  assign o_data = ((|_t147) ? 8'd192 : _t146);
  assign _t151 = ((|_t78) ? _t75 : _t74);
  assign _t152 = ((|_t139) ? 2'd1 : _t134);
  assign _t153 = ((|_t150) ? 32'd0 : _t148);
  assign _t154 = ((|_t90) ? _t87 : _t86);
  assign _t155 = ((|_t30) ? f_last : lastb);
  always @(posedge clk) begin
    if (rst) begin
      crc <= 16'd65535;
      pb <= 8'd0;
      lastb <= 1'd0;
      ph <= 2'd0;
      t_state <= 3'd0;
    end else begin
      crc <= _t151;
      pb <= _t154;
      lastb <= _t155;
      ph <= _t152;
      t_state <= _t153;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module dl_route_0_2_99_99 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] oa_data,
  output wire oa_last,
  output wire oa_valid,
  input  wire oa_ready,
  output wire [7:0] ob_data,
  output wire ob_last,
  output wire ob_valid,
  input  wire ob_ready,
  output wire [7:0] oc_data,
  output wire oc_last,
  output wire oc_valid,
  input  wire oc_ready,
  output wire [7:0] od_data,
  output wire od_last,
  output wire od_valid,
  input  wire od_ready
);
  reg  [95:0] hd;
  reg  [3:0] k;
  reg  [1:0] sel;
  wire [7:0] hb;
  wire ov;
  wire [7:0] odt;
  wire ol;
  wire ordy;
  reg  [1:0] r6_state;
  wire [7:0] _t0;
  wire _t1;
  wire [7:0] _t2;
  wire [7:0] _t3;
  wire _t4;
  wire [7:0] _t5;
  wire [7:0] _t6;
  wire _t7;
  wire [7:0] _t8;
  wire [7:0] _t9;
  wire _t10;
  wire [7:0] _t11;
  wire [7:0] _t12;
  wire _t13;
  wire [7:0] _t14;
  wire [7:0] _t15;
  wire _t16;
  wire [7:0] _t17;
  wire [7:0] _t18;
  wire _t19;
  wire [7:0] _t20;
  wire [7:0] _t21;
  wire _t22;
  wire [7:0] _t23;
  wire [7:0] _t24;
  wire _t25;
  wire [7:0] _t26;
  wire [7:0] _t27;
  wire _t28;
  wire [7:0] _t29;
  wire [7:0] _t30;
  wire _t31;
  wire [7:0] _t32;
  wire [7:0] _t33;
  wire _t34;
  wire _t35;
  wire [87:0] _t36;
  wire [95:0] _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [95:0] _t42;
  wire [7:0] _t43;
  wire [79:0] _t44;
  wire [95:0] _t45;
  wire _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire [95:0] _t50;
  wire [15:0] _t51;
  wire [71:0] _t52;
  wire [95:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [95:0] _t58;
  wire [23:0] _t59;
  wire [63:0] _t60;
  wire [95:0] _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire [95:0] _t66;
  wire [31:0] _t67;
  wire [55:0] _t68;
  wire [95:0] _t69;
  wire _t70;
  wire _t71;
  wire _t72;
  wire _t73;
  wire [95:0] _t74;
  wire [39:0] _t75;
  wire [47:0] _t76;
  wire [95:0] _t77;
  wire _t78;
  wire _t79;
  wire _t80;
  wire _t81;
  wire [95:0] _t82;
  wire [47:0] _t83;
  wire [39:0] _t84;
  wire [95:0] _t85;
  wire _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire [95:0] _t90;
  wire [55:0] _t91;
  wire [31:0] _t92;
  wire [95:0] _t93;
  wire _t94;
  wire _t95;
  wire _t96;
  wire _t97;
  wire [95:0] _t98;
  wire [63:0] _t99;
  wire [23:0] _t100;
  wire [95:0] _t101;
  wire _t102;
  wire _t103;
  wire _t104;
  wire _t105;
  wire [95:0] _t106;
  wire [71:0] _t107;
  wire [15:0] _t108;
  wire [95:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire [95:0] _t114;
  wire [79:0] _t115;
  wire [7:0] _t116;
  wire [95:0] _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire [95:0] _t122;
  wire [87:0] _t123;
  wire [95:0] _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire [3:0] _t129;
  wire _t130;
  wire _t131;
  wire [3:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire [3:0] _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire [1:0] _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire [7:0] _t151;
  wire [7:0] _t152;
  wire [47:0] _t153;
  wire _t154;
  wire [7:0] _t155;
  wire _t156;
  wire [1:0] _t157;
  wire _t158;
  wire [1:0] _t159;
  wire _t160;
  wire [1:0] _t161;
  wire _t162;
  wire [1:0] _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire [3:0] _t167;
  wire [3:0] _t168;
  wire _t169;
  wire _t170;
  wire [3:0] _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire [1:0] _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire _t181;
  wire [7:0] _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire [1:0] _t187;
  wire _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire [95:0] _t201;
  wire [3:0] _t202;
  wire [1:0] _t203;
  wire [1:0] _t204;
  assign _t0 = hd[7:0];
  assign _t1 = (k == 4'd0);
  assign _t2 = ((|_t1) ? _t0 : 8'd0);
  assign _t3 = hd[15:8];
  assign _t4 = (k == 4'd1);
  assign _t5 = ((|_t4) ? _t3 : _t2);
  assign _t6 = hd[23:16];
  assign _t7 = (k == 4'd2);
  assign _t8 = ((|_t7) ? _t6 : _t5);
  assign _t9 = hd[31:24];
  assign _t10 = (k == 4'd3);
  assign _t11 = ((|_t10) ? _t9 : _t8);
  assign _t12 = hd[39:32];
  assign _t13 = (k == 4'd4);
  assign _t14 = ((|_t13) ? _t12 : _t11);
  assign _t15 = hd[47:40];
  assign _t16 = (k == 4'd5);
  assign _t17 = ((|_t16) ? _t15 : _t14);
  assign _t18 = hd[55:48];
  assign _t19 = (k == 4'd6);
  assign _t20 = ((|_t19) ? _t18 : _t17);
  assign _t21 = hd[63:56];
  assign _t22 = (k == 4'd7);
  assign _t23 = ((|_t22) ? _t21 : _t20);
  assign _t24 = hd[71:64];
  assign _t25 = (k == 4'd8);
  assign _t26 = ((|_t25) ? _t24 : _t23);
  assign _t27 = hd[79:72];
  assign _t28 = (k == 4'd9);
  assign _t29 = ((|_t28) ? _t27 : _t26);
  assign _t30 = hd[87:80];
  assign _t31 = (k == 4'd10);
  assign _t32 = ((|_t31) ? _t30 : _t29);
  assign _t33 = hd[95:88];
  assign _t34 = (k == 4'd11);
  assign _t35 = ({30'b0, r6_state} == 32'd0);
  assign _t36 = hd[95:8];
  assign _t37 = {_t36, i_data};
  assign _t38 = (k == 4'd0);
  assign _t39 = ((|i_valid) && (|_t38));
  assign _t40 = ({30'b0, r6_state} == 32'd0);
  assign _t41 = ((|_t40) && (|_t39));
  assign _t42 = ((|_t41) ? _t37 : hd);
  assign _t43 = _t42[7:0];
  assign _t44 = _t42[95:16];
  assign _t45 = {_t44, i_data, _t43};
  assign _t46 = (k == 4'd1);
  assign _t47 = ((|i_valid) && (|_t46));
  assign _t48 = ({30'b0, r6_state} == 32'd0);
  assign _t49 = ((|_t48) && (|_t47));
  assign _t50 = ((|_t49) ? _t45 : _t42);
  assign _t51 = _t50[15:0];
  assign _t52 = _t50[95:24];
  assign _t53 = {_t52, i_data, _t51};
  assign _t54 = (k == 4'd2);
  assign _t55 = ((|i_valid) && (|_t54));
  assign _t56 = ({30'b0, r6_state} == 32'd0);
  assign _t57 = ((|_t56) && (|_t55));
  assign _t58 = ((|_t57) ? _t53 : _t50);
  assign _t59 = _t58[23:0];
  assign _t60 = _t58[95:32];
  assign _t61 = {_t60, i_data, _t59};
  assign _t62 = (k == 4'd3);
  assign _t63 = ((|i_valid) && (|_t62));
  assign _t64 = ({30'b0, r6_state} == 32'd0);
  assign _t65 = ((|_t64) && (|_t63));
  assign _t66 = ((|_t65) ? _t61 : _t58);
  assign _t67 = _t66[31:0];
  assign _t68 = _t66[95:40];
  assign _t69 = {_t68, i_data, _t67};
  assign _t70 = (k == 4'd4);
  assign _t71 = ((|i_valid) && (|_t70));
  assign _t72 = ({30'b0, r6_state} == 32'd0);
  assign _t73 = ((|_t72) && (|_t71));
  assign _t74 = ((|_t73) ? _t69 : _t66);
  assign _t75 = _t74[39:0];
  assign _t76 = _t74[95:48];
  assign _t77 = {_t76, i_data, _t75};
  assign _t78 = (k == 4'd5);
  assign _t79 = ((|i_valid) && (|_t78));
  assign _t80 = ({30'b0, r6_state} == 32'd0);
  assign _t81 = ((|_t80) && (|_t79));
  assign _t82 = ((|_t81) ? _t77 : _t74);
  assign _t83 = _t82[47:0];
  assign _t84 = _t82[95:56];
  assign _t85 = {_t84, i_data, _t83};
  assign _t86 = (k == 4'd6);
  assign _t87 = ((|i_valid) && (|_t86));
  assign _t88 = ({30'b0, r6_state} == 32'd0);
  assign _t89 = ((|_t88) && (|_t87));
  assign _t90 = ((|_t89) ? _t85 : _t82);
  assign _t91 = _t90[55:0];
  assign _t92 = _t90[95:64];
  assign _t93 = {_t92, i_data, _t91};
  assign _t94 = (k == 4'd7);
  assign _t95 = ((|i_valid) && (|_t94));
  assign _t96 = ({30'b0, r6_state} == 32'd0);
  assign _t97 = ((|_t96) && (|_t95));
  assign _t98 = ((|_t97) ? _t93 : _t90);
  assign _t99 = _t98[63:0];
  assign _t100 = _t98[95:72];
  assign _t101 = {_t100, i_data, _t99};
  assign _t102 = (k == 4'd8);
  assign _t103 = ((|i_valid) && (|_t102));
  assign _t104 = ({30'b0, r6_state} == 32'd0);
  assign _t105 = ((|_t104) && (|_t103));
  assign _t106 = ((|_t105) ? _t101 : _t98);
  assign _t107 = _t106[71:0];
  assign _t108 = _t106[95:80];
  assign _t109 = {_t108, i_data, _t107};
  assign _t110 = (k == 4'd9);
  assign _t111 = ((|i_valid) && (|_t110));
  assign _t112 = ({30'b0, r6_state} == 32'd0);
  assign _t113 = ((|_t112) && (|_t111));
  assign _t114 = ((|_t113) ? _t109 : _t106);
  assign _t115 = _t114[79:0];
  assign _t116 = _t114[95:88];
  assign _t117 = {_t116, i_data, _t115};
  assign _t118 = (k == 4'd10);
  assign _t119 = ((|i_valid) && (|_t118));
  assign _t120 = ({30'b0, r6_state} == 32'd0);
  assign _t121 = ((|_t120) && (|_t119));
  assign _t122 = ((|_t121) ? _t117 : _t114);
  assign _t123 = _t122[87:0];
  assign _t124 = {i_data, _t123};
  assign _t125 = (k == 4'd11);
  assign _t126 = ((|i_valid) && (|_t125));
  assign _t127 = ({30'b0, r6_state} == 32'd0);
  assign _t128 = ((|_t127) && (|_t126));
  assign _t129 = (k + 4'd1);
  assign _t130 = ({30'b0, r6_state} == 32'd0);
  assign _t131 = ((|_t130) && (|i_valid));
  assign _t132 = ((|_t131) ? _t129 : k);
  assign _t133 = ((|i_valid) && (|i_last));
  assign _t134 = ({30'b0, r6_state} == 32'd0);
  assign _t135 = ((|_t134) && (|_t133));
  assign _t136 = ((|i_valid) && (|i_last));
  assign _t137 = ({30'b0, r6_state} == 32'd0);
  assign _t138 = ((|_t137) && (|_t136));
  assign _t139 = ((|_t135) ? 4'd0 : _t132);
  assign _t140 = (k == 4'd11);
  assign _t141 = (~i_last);
  assign _t142 = ((|i_valid) && (|_t141));
  assign _t143 = ((|_t142) && (|_t140));
  assign _t144 = ({30'b0, r6_state} == 32'd0);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = ((|_t138) ? 32'd0 : r6_state);
  assign _t147 = ((|i_valid) && (|_t141));
  assign _t148 = ((|_t147) && (|_t140));
  assign _t149 = ({30'b0, r6_state} == 32'd0);
  assign _t150 = ((|_t149) && (|_t148));
  assign _t151 = hd[79:72];
  assign _t152 = _t151;
  assign _t153 = hd[47:0];
  assign _t154 = (_t153 == 48'd281474976710655);
  assign _t155 = ((|_t154) ? _t152 : 8'd0);
  assign _t156 = (_t155 == 8'd99);
  assign _t157 = ((|_t156) ? 2'd3 : 2'd0);
  assign _t158 = (_t155 == 8'd99);
  assign _t159 = ((|_t158) ? 2'd2 : _t157);
  assign _t160 = (_t155 == 8'd2);
  assign _t161 = ((|_t160) ? 2'd1 : _t159);
  assign _t162 = ({30'b0, r6_state} == 32'd1);
  assign _t163 = ((|_t150) ? 32'd1 : _t146);
  assign _t164 = ({30'b0, r6_state} == 32'd1);
  assign _t165 = ({30'b0, r6_state} == 32'd2);
  assign _t166 = ({30'b0, r6_state} == 32'd2);
  assign _t167 = ((|_t145) ? 4'd0 : _t139);
  assign _t168 = (k + 4'd1);
  assign _t169 = ({30'b0, r6_state} == 32'd2);
  assign _t170 = ((|_t169) && (|ordy));
  assign _t171 = ((|_t170) ? _t168 : _t167);
  assign _t172 = (k == 4'd11);
  assign _t173 = ((|ordy) && (|_t172));
  assign _t174 = ({30'b0, r6_state} == 32'd2);
  assign _t175 = ((|_t174) && (|_t173));
  assign _t176 = ((|_t164) ? 32'd2 : _t163);
  assign _t177 = ((|ordy) && (|_t172));
  assign _t178 = ({30'b0, r6_state} == 32'd2);
  assign _t179 = ((|_t178) && (|_t177));
  assign _t180 = ((|_t165) ? 1'd1 : 1'd0);
  assign _t181 = ({30'b0, r6_state} == 32'd3);
  assign _t182 = ((|_t166) ? hb : 8'd0);
  assign _t183 = ({30'b0, r6_state} == 32'd3);
  assign _t184 = ({30'b0, r6_state} == 32'd3);
  assign _t185 = ((|_t35) ? 1'd1 : 1'd0);
  assign _t186 = ({30'b0, r6_state} == 32'd3);
  assign _t187 = ((|_t179) ? 32'd3 : _t176);
  assign _t188 = ((|i_valid) && (|ordy));
  assign _t189 = ((|_t188) && (|i_last));
  assign _t190 = ({30'b0, r6_state} == 32'd3);
  assign _t191 = ((|_t190) && (|_t189));
  assign _t192 = (sel == 2'd0);
  assign _t193 = (sel == 2'd1);
  assign _t194 = (sel == 2'd2);
  assign _t195 = (sel == 2'd3);
  assign _t196 = (sel == 2'd3);
  assign _t197 = ((|_t196) ? od_ready : oa_ready);
  assign _t198 = (sel == 2'd2);
  assign _t199 = ((|_t198) ? oc_ready : _t197);
  assign _t200 = (sel == 2'd1);
  assign hb = ((|_t34) ? _t33 : _t32);
  assign ov = ((|_t181) ? i_valid : _t180);
  assign odt = ((|_t183) ? i_data : _t182);
  assign ol = ((|_t184) ? i_last : 1'd0);
  assign i_ready = ((|_t186) ? ordy : _t185);
  assign _t201 = ((|_t128) ? _t124 : _t122);
  assign _t202 = ((|_t175) ? 4'd0 : _t171);
  assign _t203 = ((|_t191) ? 32'd0 : _t187);
  assign _t204 = ((|_t162) ? _t161 : sel);
  assign oa_valid = ((|ov) && (|_t192));
  assign ob_valid = ((|ov) && (|_t193));
  assign oc_valid = ((|ov) && (|_t194));
  assign od_valid = ((|ov) && (|_t195));
  assign oa_data = odt;
  assign oa_last = ol;
  assign ob_data = odt;
  assign ob_last = ol;
  assign oc_data = odt;
  assign oc_last = ol;
  assign od_data = odt;
  assign od_last = ol;
  assign ordy = ((|_t200) ? ob_ready : _t199);
  always @(posedge clk) begin
    if (rst) begin
      hd <= 96'd0;
      k <= 4'd0;
      sel <= 2'd0;
      r6_state <= 2'd0;
    end else begin
      hd <= _t201;
      k <= _t202;
      sel <= _t204;
      r6_state <= _t203;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module dl_steer (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] i_data,
  input  wire i_last,
  input  wire i_valid,
  output wire i_ready,
  output wire [7:0] oa_data,
  output wire oa_last,
  output wire oa_valid,
  input  wire oa_ready,
  output wire [7:0] ob_data,
  output wire ob_last,
  output wire ob_valid,
  input  wire ob_ready,
  output wire [7:0] oc_data,
  output wire oc_last,
  output wire oc_valid,
  input  wire oc_ready,
  output wire [7:0] od_data,
  output wire od_last,
  output wire od_valid,
  input  wire od_ready,
  input  wire [1:0] sel
);
  reg  mid;
  reg  [1:0] cur;
  wire [1:0] _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire [1:0] _t12;
  wire _t13;
  wire [1:0] _t14;
  assign _t0 = ((|mid) ? cur : sel);
  assign _t1 = (_t0 == 2'd0);
  assign _t2 = (_t0 == 2'd1);
  assign _t3 = (_t0 == 2'd2);
  assign _t4 = (_t0 == 2'd3);
  assign _t5 = (_t0 == 2'd3);
  assign _t6 = ((|_t5) ? od_ready : oa_ready);
  assign _t7 = (_t0 == 2'd2);
  assign _t8 = ((|_t7) ? oc_ready : _t6);
  assign _t9 = (_t0 == 2'd1);
  assign _t10 = (~i_last);
  assign _t11 = ((|i_valid) && (|i_ready));
  assign _t12 = ((|mid) ? cur : sel);
  assign oa_valid = ((|i_valid) && (|_t1));
  assign ob_valid = ((|i_valid) && (|_t2));
  assign oc_valid = ((|i_valid) && (|_t3));
  assign od_valid = ((|i_valid) && (|_t4));
  assign oa_data = i_data;
  assign oa_last = i_last;
  assign ob_data = i_data;
  assign ob_last = i_last;
  assign oc_data = i_data;
  assign oc_last = i_last;
  assign od_data = i_data;
  assign od_last = i_last;
  assign i_ready = ((|_t9) ? ob_ready : _t8);
  assign _t13 = ((|_t11) ? _t10 : mid);
  assign _t14 = ((|_t11) ? _t12 : cur);
  always @(posedge clk) begin
    if (rst) begin
      mid <= 1'd0;
      cur <= 2'd0;
    end else begin
      mid <= _t13;
      cur <= _t14;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module z1013_machine (
  input  wire clk,
  input  wire rst,
  input  wire rst_n,
  input  wire [7:0] key,
  input  wire key_valid,
  input  wire ps2_clk,
  input  wire ps2_data,
  input  wire sd_miso,
  output wire sd_clk,
  output wire sd_cs_n,
  output wire sd_mosi,
  output wire sd_activity,
  output wire de,
  output wire hs,
  output wire vs,
  output wire [7:0] r,
  output wire [7:0] g,
  output wire [7:0] b,
  output wire [15:0] sample
);
  wire [9:0] f1;
  wire [9:0] f2;
  wire [7:0] ctl;
  wire rel;
  wire [4:0] pcm;
  wire cbit;
  wire cact;
  reg  [3:0] rpipe;
  wire mrst_n;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire [3:0] _t8;
  wire _t9;
  wire [3:0] _t10;
  wire [2:0] _t11;
  wire _t12;
  wire [3:0] _t13;
  wire tp_O_de;
  wire tp_O_hs;
  wire tp_O_vs;
  wire [7:0] tp_O_data_r;
  wire [7:0] tp_O_data_g;
  wire [7:0] tp_O_data_b;
  wire tp_O_sd_clk;
  wire tp_O_sd_cs_n;
  wire tp_O_sd_mosi;
  wire tp_O_sd_activity;
  wire [9:0] tp_O_ted_frequency_1;
  wire [9:0] tp_O_ted_frequency_2;
  wire [7:0] tp_O_ted_control;
  wire tp_O_ted_reload;
  wire [4:0] tp_O_pcm_control;
  wire tp_O_cassette_bit;
  wire tp_O_cassette_active;
  wire [15:0] ted_sample;
  assign _t0 = ctl[4];
  assign _t1 = ctl[6];
  assign _t2 = ctl[5];
  assign _t3 = (_t2 | _t1);
  assign _t4 = ctl[5];
  assign _t5 = (~_t4);
  assign _t6 = ctl[6];
  assign _t7 = (_t6 & _t5);
  assign _t8 = ctl[3:0];
  assign _t9 = pcm[4];
  assign _t10 = pcm[3:0];
  assign _t11 = rpipe[2:0];
  assign _t12 = (rpipe == 4'd15);
  assign _t13 = {_t11, 1'd1};
  assign mrst_n = ((|rst_n) && (|_t12));
  assign de = tp_O_de;
  assign hs = tp_O_hs;
  assign vs = tp_O_vs;
  assign r = tp_O_data_r;
  assign g = tp_O_data_g;
  assign b = tp_O_data_b;
  assign sd_clk = tp_O_sd_clk;
  assign sd_cs_n = tp_O_sd_cs_n;
  assign sd_mosi = tp_O_sd_mosi;
  assign sd_activity = tp_O_sd_activity;
  assign f1 = tp_O_ted_frequency_1;
  assign f2 = tp_O_ted_frequency_2;
  assign ctl = tp_O_ted_control;
  assign rel = tp_O_ted_reload;
  assign pcm = tp_O_pcm_control;
  assign cbit = tp_O_cassette_bit;
  assign cact = tp_O_cassette_active;
  assign sample = ted_sample;
  always @(posedge clk) begin
    if (rst) begin
      rpipe <= 4'd0;
    end else begin
      rpipe <= _t13;
    end
  end
  testpattern tp (
    .I_pxl_clk(clk),
    .I_rst_n(mrst_n),
    .I_usb_event(key),
    .I_usb_valid(key_valid),
    .I_ps2_clk(ps2_clk),
    .I_ps2_data(ps2_data),
    .I_sd_miso(sd_miso),
    .I_mode(3'd0),
    .I_single_r(8'd0),
    .I_single_g(8'd255),
    .I_single_b(8'd0),
    .I_h_total(12'd1650),
    .I_h_sync(12'd40),
    .I_h_bporch(12'd220),
    .I_h_res(12'd1280),
    .I_v_total(12'd750),
    .I_v_sync(12'd5),
    .I_v_bporch(12'd20),
    .I_v_res(12'd720),
    .I_hs_pol(1'd1),
    .I_vs_pol(1'd1),
    .O_de(tp_O_de),
    .O_hs(tp_O_hs),
    .O_vs(tp_O_vs),
    .O_data_r(tp_O_data_r),
    .O_data_g(tp_O_data_g),
    .O_data_b(tp_O_data_b),
    .O_sd_clk(tp_O_sd_clk),
    .O_sd_cs_n(tp_O_sd_cs_n),
    .O_sd_mosi(tp_O_sd_mosi),
    .O_sd_activity(tp_O_sd_activity),
    .O_ted_frequency_1(tp_O_ted_frequency_1),
    .O_ted_frequency_2(tp_O_ted_frequency_2),
    .O_ted_control(tp_O_ted_control),
    .O_ted_reload(tp_O_ted_reload),
    .O_pcm_control(tp_O_pcm_control),
    .O_cassette_bit(tp_O_cassette_bit),
    .O_cassette_active(tp_O_cassette_active)
  );
  ted_sound_core ted (
    .clk(clk),
    .reset_n(mrst_n),
    .frequency_1(f1),
    .frequency_2(f2),
    .voice_1_enable(_t0),
    .voice_2_enable(_t3),
    .noise_select(_t7),
    .volume(_t8),
    .sound_reload(rel),
    .pcm_enable(_t9),
    .pcm_sample(_t10),
    .cassette_enable(cact),
    .cassette_bit(cbit),
    .sample(ted_sample)
  );
endmodule
`default_nettype wire

`default_nettype none
module capture_384_104_256 (
  input  wire clk,
  input  wire rst,
  input  wire de,
  input  wire vs,
  input  wire [7:0] r,
  input  wire [7:0] g,
  input  wire [7:0] b,
  input  wire refresh,
  output wire [7:0] t_data,
  output wire t_last,
  output wire t_valid,
  input  wire t_ready,
  output wire [31:0] sent
);
  reg  [11:0] x;
  reg  [11:0] y;
  reg  de1;
  reg  vs1;
  reg  [7:0] fcnt;
  reg  [3:0] lo;
  reg  [15:0] crc;
  reg  wb;
  reg  busy;
  reg  obuf;
  reg  [7:0] orow;
  reg  [8:0] oidx;
  reg  [8:0] clr;
  reg  [31:0] nsent;
  wire [7:0] crcs_rd0_addr;
  wire [16:0] crcs_rd0_data;
  wire [7:0] crcs_wr0_addr;
  wire [16:0] crcs_wr0_data;
  wire crcs_wr0_we;
  wire [7:0] rows_rd0_addr;
  wire [7:0] rows_rd0_data;
  wire [7:0] rows_wr0_addr;
  wire [7:0] rows_wr0_data;
  wire rows_wr0_we;
  wire [11:0] px;
  wire [11:0] py;
  wire [1:0] cr;
  wire [1:0] cg;
  wire [1:0] cb;
  wire [3:0] idx;
  wire [6:0] bx;
  wire [15:0] nc;
  wire [7:0] rowi;
  wire [16:0] old;
  wire [8:0] ob;
  wire _t0;
  wire _t1;
  wire [7:0] _t2;
  wire [11:0] _t3;
  wire [11:0] _t4;
  wire _t5;
  wire _t6;
  wire [11:0] _t7;
  wire [11:0] _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire [3:0] _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [3:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire [7:0] _t45;
  wire _t46;
  wire _t47;
  wire [7:0] _t48;
  wire _t49;
  wire _t50;
  wire [7:0] _t51;
  wire [15:0] _t52;
  wire [15:0] _t53;
  wire [15:0] _t54;
  wire [15:0] _t55;
  wire [15:0] _t56;
  wire [15:0] _t57;
  wire _t58;
  wire [15:0] _t59;
  wire [15:0] _t60;
  wire [15:0] _t61;
  wire [15:0] _t62;
  wire _t63;
  wire [15:0] _t64;
  wire [15:0] _t65;
  wire [15:0] _t66;
  wire [15:0] _t67;
  wire _t68;
  wire [15:0] _t69;
  wire [15:0] _t70;
  wire [15:0] _t71;
  wire [15:0] _t72;
  wire _t73;
  wire [15:0] _t74;
  wire [15:0] _t75;
  wire [15:0] _t76;
  wire [15:0] _t77;
  wire _t78;
  wire [15:0] _t79;
  wire [15:0] _t80;
  wire [15:0] _t81;
  wire [15:0] _t82;
  wire _t83;
  wire [15:0] _t84;
  wire [15:0] _t85;
  wire [15:0] _t86;
  wire [15:0] _t87;
  wire _t88;
  wire [15:0] _t89;
  wire [15:0] _t90;
  wire [15:0] _t91;
  wire [15:0] _t92;
  wire _t93;
  wire [15:0] _t94;
  wire [15:0] _t95;
  wire _t96;
  wire _t97;
  wire [15:0] _t98;
  wire _t99;
  wire _t100;
  wire _t101;
  wire _t102;
  wire _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire [7:0] _t107;
  wire _t108;
  wire [15:0] _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire [16:0] _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire [8:0] _t127;
  wire _t128;
  wire _t129;
  wire [7:0] _t130;
  wire [7:0] _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire [16:0] _t135;
  wire _t136;
  wire [8:0] _t137;
  wire [7:0] _t138;
  wire _t139;
  wire [8:0] _t140;
  wire [8:0] _t141;
  wire [6:0] _t142;
  wire _t143;
  wire [7:0] _t144;
  wire _t145;
  wire [8:0] _t146;
  wire [8:0] _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire [31:0] _t152;
  wire _t153;
  wire [11:0] _t154;
  wire [7:0] _t155;
  wire [11:0] _t156;
  wire [3:0] _t157;
  wire [15:0] _t158;
  wire _t159;
  wire _t160;
  wire [7:0] _t161;
  wire [8:0] _t162;
  wire _t163;
  wire [8:0] _t164;
  wire [31:0] _t165;
  assign _t0 = (~vs1);
  assign _t1 = ((|vs) && (|_t0));
  assign _t2 = (fcnt + 8'd1);
  assign _t3 = (x + 12'd1);
  assign _t4 = ((|de) ? _t3 : x);
  assign _t5 = (~de);
  assign _t6 = ((|_t5) && (|de1));
  assign _t7 = ((|_t1) ? 12'd0 : y);
  assign _t8 = (y + 12'd1);
  assign _t9 = (cb >= 2'd2);
  assign _t10 = (cg >= 2'd1);
  assign _t11 = (cr >= 2'd1);
  assign _t12 = {1'd0, _t11, _t10, _t9};
  assign _t13 = (cb == 2'd3);
  assign _t14 = (cg == 2'd3);
  assign _t15 = (cr == 2'd3);
  assign _t16 = {1'd1, _t15, _t14, _t13};
  assign _t17 = (cb == 2'd1);
  assign _t18 = (cg == 2'd1);
  assign _t19 = (cr == 2'd1);
  assign _t20 = ((|_t19) && (|_t18));
  assign _t21 = ((|_t20) && (|_t17));
  assign _t22 = (cb == 2'd3);
  assign _t23 = (cg == 2'd3);
  assign _t24 = (cr == 2'd3);
  assign _t25 = ((|_t24) || (|_t23));
  assign _t26 = ((|_t25) || (|_t22));
  assign _t27 = ((|_t26) || (|_t21));
  assign _t28 = px[1];
  assign _t29 = (~_t28);
  assign _t30 = py[0];
  assign _t31 = (~_t30);
  assign _t32 = px[0];
  assign _t33 = (~_t32);
  assign _t34 = (y < 12'd616);
  assign _t35 = (y >= 12'd104);
  assign _t36 = ((|_t35) && (|_t34));
  assign _t37 = (x < 12'd896);
  assign _t38 = (x >= 12'd384);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ((|de) && (|_t39));
  assign _t41 = ((|_t40) && (|_t36));
  assign _t42 = ((|_t41) && (|_t33));
  assign _t43 = ((|_t42) && (|_t31));
  assign _t44 = ((|_t43) && (|_t29));
  assign _t45 = {wb, bx};
  assign _t46 = (~_t29);
  assign _t47 = ((|_t43) && (|_t46));
  assign _t48 = {idx, lo};
  assign _t49 = ((|_t43) && (|_t46));
  assign _t50 = ((|_t43) && (|_t46));
  assign _t51 = {idx, lo};
  assign _t52 = {8'b0, _t51};
  assign _t53 = (_t52 << 32'd8);
  assign _t54 = (crc ^ _t53);
  assign _t55 = (_t54 << 32'd1);
  assign _t56 = (_t54 << 32'd1);
  assign _t57 = (_t56 ^ 16'd4129);
  assign _t58 = _t54[15];
  assign _t59 = ((|_t58) ? _t57 : _t55);
  assign _t60 = (_t59 << 32'd1);
  assign _t61 = (_t59 << 32'd1);
  assign _t62 = (_t61 ^ 16'd4129);
  assign _t63 = _t59[15];
  assign _t64 = ((|_t63) ? _t62 : _t60);
  assign _t65 = (_t64 << 32'd1);
  assign _t66 = (_t64 << 32'd1);
  assign _t67 = (_t66 ^ 16'd4129);
  assign _t68 = _t64[15];
  assign _t69 = ((|_t68) ? _t67 : _t65);
  assign _t70 = (_t69 << 32'd1);
  assign _t71 = (_t69 << 32'd1);
  assign _t72 = (_t71 ^ 16'd4129);
  assign _t73 = _t69[15];
  assign _t74 = ((|_t73) ? _t72 : _t70);
  assign _t75 = (_t74 << 32'd1);
  assign _t76 = (_t74 << 32'd1);
  assign _t77 = (_t76 ^ 16'd4129);
  assign _t78 = _t74[15];
  assign _t79 = ((|_t78) ? _t77 : _t75);
  assign _t80 = (_t79 << 32'd1);
  assign _t81 = (_t79 << 32'd1);
  assign _t82 = (_t81 ^ 16'd4129);
  assign _t83 = _t79[15];
  assign _t84 = ((|_t83) ? _t82 : _t80);
  assign _t85 = (_t84 << 32'd1);
  assign _t86 = (_t84 << 32'd1);
  assign _t87 = (_t86 ^ 16'd4129);
  assign _t88 = _t84[15];
  assign _t89 = ((|_t88) ? _t87 : _t85);
  assign _t90 = (_t89 << 32'd1);
  assign _t91 = (_t89 << 32'd1);
  assign _t92 = (_t91 ^ 16'd4129);
  assign _t93 = _t89[15];
  assign _t94 = ((|_t93) ? _t92 : _t90);
  assign _t95 = _t94;
  assign _t96 = ((|_t43) && (|_t46));
  assign _t97 = ((|_t43) && (|_t46));
  assign _t98 = ((|_t97) ? nc : crc);
  assign _t99 = py[0];
  assign _t100 = (~_t99);
  assign _t101 = (~de);
  assign _t102 = ((|_t101) && (|de1));
  assign _t103 = ((|_t102) && (|_t36));
  assign _t104 = ((|_t103) && (|_t100));
  assign _t105 = (clr == 9'd0);
  assign _t106 = (~busy);
  assign _t107 = fcnt[7:0];
  assign _t108 = (rowi == _t107);
  assign _t109 = old[15:0];
  assign _t110 = (_t109 != crc);
  assign _t111 = old[16];
  assign _t112 = (~_t111);
  assign _t113 = ((|_t112) || (|_t110));
  assign _t114 = ((|_t113) || (|_t108));
  assign _t115 = ((|_t114) && (|_t106));
  assign _t116 = ((|_t115) && (|_t105));
  assign _t117 = ((|_t104) && (|_t116));
  assign _t118 = {1'd1, crc};
  assign _t119 = ((|_t104) && (|_t116));
  assign _t120 = ((|_t104) && (|_t116));
  assign _t121 = ((|_t104) && (|_t116));
  assign _t122 = ((|_t104) && (|_t116));
  assign _t123 = ((|_t104) && (|_t116));
  assign _t124 = ((|_t104) && (|_t116));
  assign _t125 = (~wb);
  assign _t126 = ((|_t104) && (|_t116));
  assign _t127 = {1'd1, 8'd0};
  assign _t128 = (clr == 9'd0);
  assign _t129 = ((|refresh) && (|_t128));
  assign _t130 = ((|_t117) ? rowi : 8'd0);
  assign _t131 = clr[7:0];
  assign _t132 = (~_t104);
  assign _t133 = (clr != 9'd0);
  assign _t134 = ((|_t133) && (|_t132));
  assign _t135 = ((|_t119) ? _t118 : 17'd0);
  assign _t136 = ((|_t120) ? 1'd1 : 1'd0);
  assign _t137 = (clr + 9'd1);
  assign _t138 = clr[7:0];
  assign _t139 = (_t138 == 8'd255);
  assign _t140 = ((|_t129) ? _t127 : clr);
  assign _t141 = ((|_t139) ? 9'd0 : _t137);
  assign _t142 = ob[6:0];
  assign _t143 = (oidx == 9'd1);
  assign _t144 = ((|_t143) ? fcnt : rows_rd0_data);
  assign _t145 = (oidx == 9'd0);
  assign _t146 = ((|_t124) ? 9'd0 : oidx);
  assign _t147 = (oidx + 9'd1);
  assign _t148 = ((|busy) && (|t_ready));
  assign _t149 = ((|_t121) ? 1'd1 : busy);
  assign _t150 = (oidx == 9'd129);
  assign _t151 = ((|_t148) && (|_t150));
  assign _t152 = (nsent + 32'd1);
  assign _t153 = ((|_t148) && (|_t150));
  assign sent = nsent;
  assign _t154 = ((|_t6) ? _t8 : _t7);
  assign _t155 = ((|_t1) ? _t2 : fcnt);
  assign _t156 = ((|_t6) ? 12'd0 : _t4);
  assign px = (x - 12'd384);
  assign py = (y - 12'd104);
  assign cr = r[7:6];
  assign cg = g[7:6];
  assign cb = b[7:6];
  assign idx = ((|_t27) ? _t16 : _t12);
  assign bx = px[8:2];
  assign _t157 = ((|_t44) ? idx : lo);
  assign rows_wr0_addr = ((|_t47) ? _t45 : 8'd0);
  assign rows_wr0_data = ((|_t49) ? _t48 : 8'd0);
  assign rows_wr0_we = ((|_t50) ? 1'd1 : 1'd0);
  assign nc = ((|_t96) ? _t95 : 16'd0);
  assign _t158 = ((|_t104) ? 16'd65535 : _t98);
  assign rowi = py[8:1];
  assign crcs_rd0_addr = rowi;
  assign old = crcs_rd0_data;
  assign crcs_wr0_addr = ((|_t134) ? _t131 : _t130);
  assign crcs_wr0_data = ((|_t134) ? 17'd0 : _t135);
  assign crcs_wr0_we = ((|_t134) ? 1'd1 : _t136);
  assign _t159 = ((|_t151) ? 1'd0 : _t149);
  assign _t160 = ((|_t122) ? wb : obuf);
  assign _t161 = ((|_t123) ? rowi : orow);
  assign _t162 = ((|_t148) ? _t147 : _t146);
  assign _t163 = ((|_t126) ? _t125 : wb);
  assign _t164 = ((|_t134) ? _t141 : _t140);
  assign t_valid = busy;
  assign ob = (oidx - 9'd2);
  assign rows_rd0_addr = {obuf, _t142};
  assign t_data = ((|_t145) ? orow : _t144);
  assign t_last = (oidx == 9'd129);
  assign _t165 = ((|_t153) ? _t152 : nsent);
  always @(posedge clk) begin
    if (rst) begin
      x <= 12'd0;
      y <= 12'd0;
      de1 <= 1'd0;
      vs1 <= 1'd0;
      fcnt <= 8'd0;
      lo <= 4'd0;
      crc <= 16'd65535;
      wb <= 1'd0;
      busy <= 1'd0;
      obuf <= 1'd0;
      orow <= 8'd0;
      oidx <= 9'd0;
      clr <= 9'd0;
      nsent <= 32'd0;
    end else begin
      x <= _t156;
      y <= _t154;
      de1 <= de;
      vs1 <= vs;
      fcnt <= _t155;
      lo <= _t157;
      crc <= _t158;
      wb <= _t163;
      busy <= _t159;
      obuf <= _t160;
      orow <= _t161;
      oidx <= _t162;
      clr <= _t164;
      nsent <= _t165;
    end
  end
  l8_ram_17x256_r1_w1_d _meminst_0_crcs (
    .clk(clk),
    .rd0_addr(crcs_rd0_addr),
    .rd0_data(crcs_rd0_data),
    .wr0_we(crcs_wr0_we),
    .wr0_addr(crcs_wr0_addr),
    .wr0_data(crcs_wr0_data)
  );
  l8_ram_8x256_r1_w1_d _meminst_1_rows (
    .clk(clk),
    .rd0_addr(rows_rd0_addr),
    .rd0_data(rows_rd0_data),
    .wr0_we(rows_wr0_we),
    .wr0_addr(rows_wr0_addr),
    .wr0_data(rows_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module dbg_peer (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] arx_data,
  input  wire arx_last,
  input  wire arx_valid,
  output wire arx_ready,
  output wire [7:0] atx_data,
  output wire atx_last,
  output wire atx_valid,
  input  wire atx_ready,
  output wire [7:0] prx_data,
  output wire prx_last,
  output wire prx_valid,
  input  wire prx_ready,
  input  wire [7:0] ptx_data,
  input  wire ptx_last,
  input  wire ptx_valid,
  output wire ptx_ready
);
  reg  [3:0] ik;
  reg  [95:0] isnd;
  reg  [95:0] peer;
  reg  have;
  reg  [3:0] ok;
  reg  [95:0] osnd;
  wire [7:0] rb;
  wire [87:0] _t0;
  wire [95:0] _t1;
  wire _t2;
  wire _t3;
  wire [3:0] _t4;
  wire [3:0] _t5;
  wire _t6;
  wire [87:0] _t7;
  wire [95:0] _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire [3:0] _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire [7:0] _t22;
  wire _t23;
  wire [87:0] _t24;
  wire [95:0] _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire [7:0] _t34;
  wire [7:0] _t35;
  wire _t36;
  wire [87:0] _t37;
  wire [95:0] _t38;
  wire [95:0] _t39;
  wire _t40;
  wire _t41;
  wire [3:0] _t42;
  wire [3:0] _t43;
  wire _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire _t48;
  wire [7:0] _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire [3:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire [95:0] _t58;
  wire [3:0] _t59;
  wire [95:0] _t60;
  wire _t61;
  wire [95:0] _t62;
  wire [3:0] _t63;
  assign _t0 = isnd[95:8];
  assign _t1 = {rb, _t0};
  assign _t2 = (ik < 4'd12);
  assign _t3 = ((|_t2) && (|arx_valid));
  assign _t4 = (ik + 4'd1);
  assign _t5 = ((|arx_last) ? 4'd0 : _t4);
  assign _t6 = ((|_t2) && (|arx_valid));
  assign _t7 = isnd[95:8];
  assign _t8 = {rb, _t7};
  assign _t9 = (ik == 4'd11);
  assign _t10 = ((|_t2) && (|arx_valid));
  assign _t11 = ((|_t10) && (|_t9));
  assign _t12 = ((|_t2) && (|arx_valid));
  assign _t13 = ((|_t12) && (|_t9));
  assign _t14 = (~_t2);
  assign _t15 = ((|_t6) ? _t5 : ik);
  assign _t16 = ((|arx_valid) && (|prx_ready));
  assign _t17 = ((|_t16) && (|arx_last));
  assign _t18 = ((|_t14) && (|_t17));
  assign _t19 = ((|have) && (|ptx_valid));
  assign _t20 = (ok == 4'd0);
  assign _t21 = ((|_t20) && (|_t19));
  assign _t22 = peer[7:0];
  assign _t23 = ((|_t20) && (|_t19));
  assign _t24 = peer[95:8];
  assign _t25 = {8'd0, _t24};
  assign _t26 = ((|_t20) && (|_t19));
  assign _t27 = ((|_t26) && (|atx_ready));
  assign _t28 = ((|_t20) && (|_t19));
  assign _t29 = ((|_t28) && (|atx_ready));
  assign _t30 = ((|_t21) ? 1'd1 : 1'd0);
  assign _t31 = (ok < 4'd12);
  assign _t32 = (~_t20);
  assign _t33 = ((|_t32) && (|_t31));
  assign _t34 = ((|_t23) ? _t22 : 8'd0);
  assign _t35 = osnd[7:0];
  assign _t36 = ((|_t32) && (|_t31));
  assign _t37 = osnd[95:8];
  assign _t38 = ((|_t27) ? _t25 : osnd);
  assign _t39 = {8'd0, _t37};
  assign _t40 = ((|_t32) && (|_t31));
  assign _t41 = ((|_t40) && (|atx_ready));
  assign _t42 = ((|_t29) ? 4'd1 : ok);
  assign _t43 = (ok + 4'd1);
  assign _t44 = ((|_t32) && (|_t31));
  assign _t45 = ((|_t44) && (|atx_ready));
  assign _t46 = ((|_t33) ? 1'd1 : _t30);
  assign _t47 = (~_t31);
  assign _t48 = ((|_t32) && (|_t47));
  assign _t49 = ((|_t36) ? _t35 : _t34);
  assign _t50 = ((|_t32) && (|_t47));
  assign _t51 = ((|_t32) && (|_t47));
  assign _t52 = ((|_t32) && (|_t47));
  assign _t53 = ((|_t45) ? _t43 : _t42);
  assign _t54 = ((|ptx_valid) && (|atx_ready));
  assign _t55 = ((|_t54) && (|ptx_last));
  assign _t56 = ((|_t32) && (|_t47));
  assign _t57 = ((|_t56) && (|_t55));
  assign rb = arx_data;
  assign prx_valid = ((|_t14) ? arx_valid : 1'd0);
  assign prx_data = ((|_t14) ? arx_data : 8'd0);
  assign prx_last = ((|_t14) ? arx_last : 1'd0);
  assign arx_ready = ((|_t14) ? prx_ready : 1'd1);
  assign _t58 = ((|_t3) ? _t1 : isnd);
  assign _t59 = ((|_t18) ? 4'd0 : _t15);
  assign _t60 = ((|_t11) ? _t8 : peer);
  assign _t61 = ((|_t13) ? 1'd1 : have);
  assign atx_valid = ((|_t48) ? ptx_valid : _t46);
  assign atx_data = ((|_t50) ? ptx_data : _t49);
  assign atx_last = ((|_t51) ? ptx_last : 1'd0);
  assign ptx_ready = ((|_t52) ? atx_ready : 1'd0);
  assign _t62 = ((|_t41) ? _t39 : _t38);
  assign _t63 = ((|_t57) ? 4'd0 : _t53);
  always @(posedge clk) begin
    if (rst) begin
      ik <= 4'd0;
      isnd <= 96'd0;
      peer <= 96'd0;
      have <= 1'd0;
      ok <= 4'd0;
      osnd <= 96'd0;
    end else begin
      ik <= _t59;
      isnd <= _t58;
      peer <= _t60;
      have <= _t61;
      ok <= _t63;
      osnd <= _t62;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module stream_tx_8_2048_256_1_200000 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  input  wire [7:0] rx_data,
  input  wire rx_last,
  input  wire rx_valid,
  output wire rx_ready,
  output wire [7:0] tx_data,
  output wire tx_last,
  output wire tx_valid,
  input  wire tx_ready,
  output reg  err
);
  wire [10:0] ring_rd0_addr;
  wire [8:0] ring_rd0_data;
  wire [10:0] ring_wr0_addr;
  wire [8:0] ring_wr0_data;
  wire ring_wr0_we;
  wire [10:0] hdr_rd0_addr;
  wire [28:0] hdr_rd0_data;
  wire [10:0] hdr_wr0_addr;
  wire [28:0] hdr_wr0_data;
  wire hdr_wr0_we;
  reg  [11:0] wp;
  reg  [11:0] sp;
  reg  [11:0] rp;
  reg  [15:0] fw;
  reg  [15:0] fs;
  reg  [15:0] fr;
  reg  inf;
  reg  drop;
  reg  [15:0] wn;
  reg  [15:0] lost;
  reg  [3:0] ok;
  reg  [7:0] ob;
  reg  [39:0] oh;
  reg  [11:0] fstart;
  reg  [15:0] credit;
  reg  ack;
  reg  [15:0] base;
  reg  [31:0] rtx;
  reg  pnak;
  reg  [15:0] pnseq;
  reg  [11:0] pnsp;
  reg  [5:0] ik;
  reg  [39:0] ic;
  wire [7:0] ptx_data;
  wire ptx_last;
  wire ptx_valid;
  wire ptx_ready;
  wire [7:0] prx_data;
  wire prx_last;
  wire prx_valid;
  wire prx_ready;
  wire [11:0] cnt;
  wire [12:0] free;
  wire [7:0] rb;
  wire [15:0] aseqw;
  wire [15:0] aseq;
  wire [15:0] acred;
  wire [28:0] hv;
  wire [15:0] adist;
  wire [15:0] fdist;
  wire [28:0] hs;
  wire [8:0] wv;
  wire [15:0] seqw;
  wire [7:0] hflg;
  wire [15:0] hlost;
  wire [12:0] _t0;
  wire _t1;
  wire [15:0] _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [10:0] _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire [8:0] _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [11:0] _t26;
  wire _t27;
  wire _t28;
  wire [10:0] _t29;
  wire _t30;
  wire _t31;
  wire [11:0] _t32;
  wire _t33;
  wire [28:0] _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire [15:0] _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire _t45;
  wire [15:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire [15:0] _t62;
  wire [15:0] _t63;
  wire _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [31:0] _t69;
  wire [39:0] _t70;
  wire _t71;
  wire _t72;
  wire [5:0] _t73;
  wire [5:0] _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire [15:0] _t77;
  wire [7:0] _t78;
  wire [7:0] _t79;
  wire [15:0] _t80;
  wire _t81;
  wire _t82;
  wire _t83;
  wire _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire _t90;
  wire _t91;
  wire _t92;
  wire _t93;
  wire _t94;
  wire _t95;
  wire _t96;
  wire _t97;
  wire _t98;
  wire _t99;
  wire _t100;
  wire _t101;
  wire _t102;
  wire [15:0] _t103;
  wire [31:0] _t104;
  wire [11:0] _t105;
  wire _t106;
  wire [11:0] _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire [11:0] _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire [15:0] _t124;
  wire _t125;
  wire _t126;
  wire [11:0] _t127;
  wire [11:0] _t128;
  wire _t129;
  wire _t130;
  wire [15:0] _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire [11:0] _t137;
  wire _t138;
  wire [31:0] _t139;
  wire [31:0] _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire [15:0] _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [11:0] _t154;
  wire [31:0] _t155;
  wire _t156;
  wire [6:0] _t157;
  wire [39:0] _t158;
  wire _t159;
  wire _t160;
  wire [15:0] _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire [11:0] _t171;
  wire [11:0] _t172;
  wire _t173;
  wire _t174;
  wire [31:0] _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [31:0] _t182;
  wire [39:0] _t183;
  wire [39:0] _t184;
  wire _t185;
  wire _t186;
  wire [3:0] _t187;
  wire [3:0] _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire [7:0] _t194;
  wire [7:0] _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire [11:0] _t207;
  wire [11:0] _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire [3:0] _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire [15:0] _t218;
  wire [15:0] _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire [7:0] _t224;
  wire [7:0] _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire [15:0] _t230;
  wire _t231;
  wire [11:0] _t232;
  wire [15:0] _t233;
  wire [15:0] _t234;
  wire _t235;
  wire _t236;
  wire [11:0] _t237;
  wire [39:0] _t238;
  wire [5:0] _t239;
  wire [15:0] _t240;
  wire _t241;
  wire [15:0] _t242;
  wire [31:0] _t243;
  wire _t244;
  wire [15:0] _t245;
  wire [11:0] _t246;
  wire [11:0] _t247;
  wire [15:0] _t248;
  wire [15:0] _t249;
  wire [11:0] _t250;
  wire [39:0] _t251;
  wire [3:0] _t252;
  wire [7:0] _t253;
  wire pr_arx_ready;
  wire [7:0] pr_atx_data;
  wire pr_atx_last;
  wire pr_atx_valid;
  wire [7:0] pr_prx_data;
  wire pr_prx_last;
  wire pr_prx_valid;
  wire pr_ptx_ready;
  assign _t0 = {1'b0, cnt};
  assign _t1 = (free >= 13'd256);
  assign _t2 = (lost + 16'd1);
  assign _t3 = (~_t1);
  assign _t4 = (~drop);
  assign _t5 = (~inf);
  assign _t6 = ((|_t5) && (|_t4));
  assign _t7 = ((|_t6) && (|_t3));
  assign _t8 = ((|t_valid) && (|t_ready));
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = (~t_last);
  assign _t11 = ((|_t8) && (|_t7));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = wp[10:0];
  assign _t14 = (wn < 16'd256);
  assign _t15 = ((|_t6) && (|_t1));
  assign _t16 = ((|inf) || (|_t15));
  assign _t17 = ((|_t8) && (|_t16));
  assign _t18 = ((|_t17) && (|_t14));
  assign _t19 = (wn == 16'd255);
  assign _t20 = ((|t_last) || (|_t19));
  assign _t21 = {_t20, t_data};
  assign _t22 = ((|_t8) && (|_t16));
  assign _t23 = ((|_t22) && (|_t14));
  assign _t24 = ((|_t8) && (|_t16));
  assign _t25 = ((|_t24) && (|_t14));
  assign _t26 = (wp + 12'd1);
  assign _t27 = ((|_t8) && (|_t16));
  assign _t28 = ((|_t27) && (|_t14));
  assign _t29 = fw[10:0];
  assign _t30 = ((|_t8) && (|_t16));
  assign _t31 = ((|_t30) && (|t_last));
  assign _t32 = ((|inf) ? fstart : wp);
  assign _t33 = (wn >= 16'd256);
  assign _t34 = {_t33, lost, _t32};
  assign _t35 = ((|_t8) && (|_t16));
  assign _t36 = ((|_t35) && (|t_last));
  assign _t37 = ((|_t8) && (|_t16));
  assign _t38 = ((|_t37) && (|t_last));
  assign _t39 = (fw + 16'd1);
  assign _t40 = ((|_t8) && (|_t16));
  assign _t41 = ((|_t40) && (|t_last));
  assign _t42 = ((|_t8) && (|_t16));
  assign _t43 = ((|_t42) && (|t_last));
  assign _t44 = ((|_t8) && (|_t16));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ((|_t9) ? _t2 : lost);
  assign _t47 = ((|_t8) && (|_t16));
  assign _t48 = ((|_t47) && (|t_last));
  assign _t49 = (wn >= 16'd256);
  assign _t50 = ((|1'd1) && (|_t49));
  assign _t51 = ((|_t8) && (|_t16));
  assign _t52 = ((|_t51) && (|t_last));
  assign _t53 = ((|_t52) && (|_t50));
  assign _t54 = (~inf);
  assign _t55 = (~t_last);
  assign _t56 = ((|_t8) && (|_t16));
  assign _t57 = ((|_t56) && (|_t55));
  assign _t58 = ((|_t57) && (|_t54));
  assign _t59 = ((|_t45) ? 1'd0 : inf);
  assign _t60 = ((|_t8) && (|_t16));
  assign _t61 = ((|_t60) && (|_t55));
  assign _t62 = ((|_t43) ? 16'd0 : wn);
  assign _t63 = (wn + 16'd1);
  assign _t64 = ((|_t8) && (|_t16));
  assign _t65 = ((|_t64) && (|_t55));
  assign _t66 = ((|_t12) ? 1'd1 : drop);
  assign _t67 = ((|drop) && (|t_last));
  assign _t68 = ((|_t8) && (|_t67));
  assign _t69 = ic[39:8];
  assign _t70 = {rb, _t69};
  assign _t71 = (ik < 6'd5);
  assign _t72 = ((|prx_valid) && (|_t71));
  assign _t73 = (ik + 6'd1);
  assign _t74 = ((|prx_last) ? 6'd0 : _t73);
  assign _t75 = ic[15:8];
  assign _t76 = ic[23:16];
  assign _t77 = (aseqw - base);
  assign _t78 = ic[31:24];
  assign _t79 = ic[39:32];
  assign _t80 = (aseqw - fr);
  assign _t81 = (~ack);
  assign _t82 = rb[7];
  assign _t83 = (ik == 6'd4);
  assign _t84 = ((|prx_valid) && (|prx_last));
  assign _t85 = ((|_t84) && (|_t83));
  assign _t86 = ((|_t85) && (|_t82));
  assign _t87 = ((|1'd1) && (|_t86));
  assign _t88 = ((|_t87) && (|_t81));
  assign _t89 = rb[5];
  assign _t90 = ((|1'd1) && (|_t86));
  assign _t91 = ((|_t90) && (|_t89));
  assign _t92 = (fs != fr);
  assign _t93 = ((|_t91) && (|_t92));
  assign _t94 = ((|_t91) && (|_t92));
  assign _t95 = ((|_t91) && (|_t92));
  assign _t96 = ((|_t91) ? 1'd1 : ack);
  assign _t97 = (adist <= fdist);
  assign _t98 = rb[5];
  assign _t99 = (~_t98);
  assign _t100 = ((|1'd1) && (|_t86));
  assign _t101 = ((|_t100) && (|_t99));
  assign _t102 = ((|_t101) && (|_t97));
  assign _t103 = ((|_t91) ? acred : credit);
  assign _t104 = ((|_t91) ? 32'd0 : rtx);
  assign _t105 = hv[11:0];
  assign _t106 = (aseq == fw);
  assign _t107 = ((|_t106) ? wp : _t105);
  assign _t108 = (adist != 16'd0);
  assign _t109 = ((|_t102) && (|_t108));
  assign _t110 = ((|_t102) && (|_t108));
  assign _t111 = (ok == 4'd0);
  assign _t112 = (fs != aseq);
  assign _t113 = rb[6];
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t102) && (|_t114));
  assign _t116 = ((|_t115) && (|_t111));
  assign _t117 = hv[11:0];
  assign _t118 = ((|_t102) && (|_t114));
  assign _t119 = ((|_t118) && (|_t111));
  assign _t120 = ((|_t93) ? 1'd1 : pnak);
  assign _t121 = (~_t111);
  assign _t122 = ((|_t102) && (|_t114));
  assign _t123 = ((|_t122) && (|_t121));
  assign _t124 = ((|_t94) ? fr : pnseq);
  assign _t125 = ((|_t102) && (|_t114));
  assign _t126 = ((|_t125) && (|_t121));
  assign _t127 = ((|_t95) ? rp : pnsp);
  assign _t128 = hv[11:0];
  assign _t129 = ((|_t102) && (|_t114));
  assign _t130 = ((|_t129) && (|_t121));
  assign _t131 = ((|_t116) ? aseq : fs);
  assign _t132 = (~_t86);
  assign _t133 = (ok == 4'd0);
  assign _t134 = ((|1'd1) && (|pnak));
  assign _t135 = ((|_t134) && (|_t133));
  assign _t136 = ((|_t135) && (|_t132));
  assign _t137 = ((|_t119) ? _t117 : sp);
  assign _t138 = ((|_t123) ? 1'd1 : _t120);
  assign _t139 = ((|_t102) ? 32'd0 : _t104);
  assign _t140 = (rtx + 32'd1);
  assign _t141 = (~_t86);
  assign _t142 = (fs != fr);
  assign _t143 = (ok == 4'd0);
  assign _t144 = ((|1'd1) && (|_t143));
  assign _t145 = ((|_t144) && (|_t142));
  assign _t146 = ((|_t145) && (|_t141));
  assign _t147 = ((|_t136) ? pnseq : _t131);
  assign _t148 = (rtx >= 32'd200000);
  assign _t149 = (fs != fr);
  assign _t150 = (ok == 4'd0);
  assign _t151 = ((|1'd1) && (|_t150));
  assign _t152 = ((|_t151) && (|_t149));
  assign _t153 = ((|_t152) && (|_t148));
  assign _t154 = ((|_t136) ? pnsp : _t137);
  assign _t155 = ((|_t146) ? _t140 : _t139);
  assign _t156 = hs[28];
  assign _t157 = 7'd0;
  assign _t158 = {hflg, hlost, seqw};
  assign _t159 = (~pnak);
  assign _t160 = (~_t153);
  assign _t161 = (fs - fr);
  assign _t162 = (_t161 < credit);
  assign _t163 = ((|ack) && (|_t162));
  assign _t164 = ((|1'd0) || (|_t163));
  assign _t165 = (fs != fw);
  assign _t166 = ((|_t165) && (|_t164));
  assign _t167 = ((|_t166) && (|_t160));
  assign _t168 = ((|_t167) && (|_t159));
  assign _t169 = (ok == 4'd0);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t153) ? rp : _t154);
  assign _t172 = hs[11:0];
  assign _t173 = ((|_t169) && (|_t168));
  assign _t174 = ((|_t169) && (|_t168));
  assign _t175 = ((|_t153) ? 32'd0 : _t155);
  assign _t176 = ((|_t169) && (|_t168));
  assign _t177 = (ok <= 4'd5);
  assign _t178 = (~_t169);
  assign _t179 = ((|_t178) && (|_t177));
  assign _t180 = oh[7:0];
  assign _t181 = ((|_t178) && (|_t177));
  assign _t182 = oh[39:8];
  assign _t183 = ((|_t170) ? _t158 : oh);
  assign _t184 = {8'd0, _t182};
  assign _t185 = ((|_t178) && (|_t177));
  assign _t186 = ((|_t185) && (|ptx_ready));
  assign _t187 = ((|_t174) ? 4'd1 : ok);
  assign _t188 = (ok + 4'd1);
  assign _t189 = ((|_t178) && (|_t177));
  assign _t190 = ((|_t189) && (|ptx_ready));
  assign _t191 = ((|_t179) ? 1'd1 : 1'd0);
  assign _t192 = (~_t177);
  assign _t193 = ((|_t178) && (|_t192));
  assign _t194 = ((|_t181) ? _t180 : 8'd0);
  assign _t195 = wv[7:0];
  assign _t196 = (ob == 8'd0);
  assign _t197 = ((|_t178) && (|_t192));
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = wv[8];
  assign _t200 = (ob == 8'd0);
  assign _t201 = ((|_t200) && (|_t199));
  assign _t202 = ((|_t178) && (|_t192));
  assign _t203 = (ob == 8'd0);
  assign _t204 = ((|_t178) && (|_t192));
  assign _t205 = ((|_t204) && (|ptx_ready));
  assign _t206 = ((|_t205) && (|_t203));
  assign _t207 = ((|_t173) ? _t172 : _t171);
  assign _t208 = (sp + 12'd1);
  assign _t209 = ((|_t178) && (|_t192));
  assign _t210 = ((|_t209) && (|ptx_ready));
  assign _t211 = ((|_t210) && (|_t203));
  assign _t212 = ((|_t190) ? _t188 : _t187);
  assign _t213 = wv[8];
  assign _t214 = ((|_t178) && (|_t192));
  assign _t215 = ((|_t214) && (|ptx_ready));
  assign _t216 = ((|_t215) && (|_t203));
  assign _t217 = ((|_t216) && (|_t213));
  assign _t218 = ((|_t153) ? fr : _t147);
  assign _t219 = (fs + 16'd1);
  assign _t220 = ((|_t178) && (|_t192));
  assign _t221 = ((|_t220) && (|ptx_ready));
  assign _t222 = ((|_t221) && (|_t203));
  assign _t223 = ((|_t222) && (|_t213));
  assign _t224 = ((|_t206) ? 8'd0 : ob);
  assign _t225 = (ob + 8'd1);
  assign _t226 = (~_t203);
  assign _t227 = ((|_t178) && (|_t192));
  assign _t228 = ((|_t227) && (|ptx_ready));
  assign _t229 = ((|_t228) && (|_t226));
  assign rx_ready = pr_arx_ready;
  assign tx_data = pr_atx_data;
  assign tx_last = pr_atx_last;
  assign tx_valid = pr_atx_valid;
  assign prx_data = pr_prx_data;
  assign prx_last = pr_prx_last;
  assign prx_valid = pr_prx_valid;
  assign ptx_ready = pr_ptx_ready;
  assign cnt = (wp - rp);
  assign free = (13'd2048 - _t0);
  assign t_ready = ((|inf) || (|_t1));
  assign _t230 = ((|_t48) ? 16'd0 : _t46);
  assign _t231 = ((|_t68) ? 1'd0 : _t66);
  assign ring_wr0_addr = ((|_t18) ? _t13 : 11'd0);
  assign ring_wr0_data = ((|_t23) ? _t21 : 9'd0);
  assign ring_wr0_we = ((|_t25) ? 1'd1 : 1'd0);
  assign _t232 = ((|_t28) ? _t26 : wp);
  assign hdr_wr0_addr = ((|_t31) ? _t29 : 11'd0);
  assign hdr_wr0_data = ((|_t36) ? _t34 : 29'd0);
  assign hdr_wr0_we = ((|_t38) ? 1'd1 : 1'd0);
  assign _t233 = ((|_t41) ? _t39 : fw);
  assign _t234 = ((|_t65) ? _t63 : _t62);
  assign _t235 = ((|_t61) ? 1'd1 : _t59);
  assign _t236 = ((|_t53) ? 1'd1 : err);
  assign _t237 = ((|_t58) ? wp : fstart);
  assign prx_ready = 1'd1;
  assign rb = prx_data;
  assign _t238 = ((|_t72) ? _t70 : ic);
  assign _t239 = ((|prx_valid) ? _t74 : ik);
  assign aseqw = {_t76, _t75};
  assign aseq = ((|ack) ? _t77 : fr);
  assign acred = {_t79, _t78};
  assign hdr_rd0_addr = fs[10:0];
  assign hv = hdr_rd0_data;
  assign adist = (aseq - fr);
  assign fdist = (fs - fr);
  assign _t240 = ((|_t88) ? _t80 : base);
  assign _t241 = ((|_t102) ? 1'd1 : _t96);
  assign _t242 = ((|_t102) ? acred : _t103);
  assign _t243 = ((|_t176) ? 32'd0 : _t175);
  assign _t244 = ((|_t136) ? 1'd0 : _t138);
  assign _t245 = ((|_t126) ? aseq : _t124);
  assign _t246 = ((|_t130) ? _t128 : _t127);
  assign _t247 = ((|_t109) ? _t107 : rp);
  assign _t248 = ((|_t110) ? aseq : fr);
  assign _t249 = ((|_t223) ? _t219 : _t218);
  assign _t250 = ((|_t211) ? _t208 : _t207);
  assign hs = hdr_rd0_data;
  assign ring_rd0_addr = sp[10:0];
  assign wv = ring_rd0_data;
  assign seqw = (fs + base);
  assign hflg = {_t157, _t156};
  assign hlost = hs[27:12];
  assign ptx_valid = ((|_t193) ? 1'd1 : _t191);
  assign ptx_data = ((|_t198) ? _t195 : _t194);
  assign ptx_last = ((|_t202) ? _t201 : 1'd0);
  assign _t251 = ((|_t186) ? _t184 : _t183);
  assign _t252 = ((|_t217) ? 4'd0 : _t212);
  assign _t253 = ((|_t229) ? _t225 : _t224);
  always @(posedge clk) begin
    if (rst) begin
      wp <= 12'd0;
      sp <= 12'd0;
      rp <= 12'd0;
      fw <= 16'd0;
      fs <= 16'd0;
      fr <= 16'd0;
      inf <= 1'd0;
      drop <= 1'd0;
      wn <= 16'd0;
      lost <= 16'd0;
      err <= 1'd0;
      ok <= 4'd0;
      ob <= 8'd0;
      oh <= 40'd0;
      fstart <= 12'd0;
      credit <= 16'd0;
      ack <= 1'd0;
      base <= 16'd0;
      rtx <= 32'd0;
      pnak <= 1'd0;
      pnseq <= 16'd0;
      pnsp <= 12'd0;
      ik <= 6'd0;
      ic <= 40'd0;
    end else begin
      wp <= _t232;
      sp <= _t250;
      rp <= _t247;
      fw <= _t233;
      fs <= _t249;
      fr <= _t248;
      inf <= _t235;
      drop <= _t231;
      wn <= _t234;
      lost <= _t230;
      err <= _t236;
      ok <= _t252;
      ob <= _t253;
      oh <= _t251;
      fstart <= _t237;
      credit <= _t242;
      ack <= _t241;
      base <= _t240;
      rtx <= _t243;
      pnak <= _t244;
      pnseq <= _t245;
      pnsp <= _t246;
      ik <= _t239;
      ic <= _t238;
    end
  end
  l8_ram_9x2048_r1_w1_d _meminst_0_ring (
    .clk(clk),
    .rd0_addr(ring_rd0_addr),
    .rd0_data(ring_rd0_data),
    .wr0_we(ring_wr0_we),
    .wr0_addr(ring_wr0_addr),
    .wr0_data(ring_wr0_data)
  );
  l8_ram_29x2048_r1_w1_d _meminst_1_hdr (
    .clk(clk),
    .rd0_addr(hdr_rd0_addr),
    .rd0_data(hdr_rd0_data),
    .wr0_we(hdr_wr0_we),
    .wr0_addr(hdr_wr0_addr),
    .wr0_data(hdr_wr0_data)
  );
  dbg_peer pr (
    .clk(clk),
    .rst(rst),
    .arx_data(rx_data),
    .arx_last(rx_last),
    .arx_valid(rx_valid),
    .arx_ready(pr_arx_ready),
    .atx_data(pr_atx_data),
    .atx_last(pr_atx_last),
    .atx_valid(pr_atx_valid),
    .atx_ready(tx_ready),
    .prx_data(pr_prx_data),
    .prx_last(pr_prx_last),
    .prx_valid(pr_prx_valid),
    .prx_ready(prx_ready),
    .ptx_data(ptx_data),
    .ptx_last(ptx_last),
    .ptx_valid(ptx_valid),
    .ptx_ready(pr_ptx_ready)
  );
endmodule
`default_nettype wire

`default_nettype none
module pcm_74285714_22050_64 (
  input  wire clk,
  input  wire rst,
  input  wire [15:0] sample,
  output wire [7:0] t_data,
  output wire t_last,
  output wire t_valid,
  input  wire t_ready,
  output wire [31:0] drops
);
  reg  [31:0] ph;
  reg  [39:0] acc;
  reg  [6:0] wi;
  reg  full;
  reg  [7:0] oi;
  reg  [31:0] ndrop;
  wire [5:0] buf_rd0_addr;
  wire [15:0] buf_rd0_data;
  wire [5:0] buf_wr0_addr;
  wire [15:0] buf_wr0_data;
  wire buf_wr0_we;
  wire [32:0] nph;
  reg  [15:0] sr;
  wire [39:0] sx;
  reg  v1;
  reg  v2;
  reg  v3;
  reg  [39:0] sum;
  reg  neg;
  reg  [39:0] mag;
  reg  [71:0] prod;
  wire [15:0] q;
  wire [15:0] out;
  wire [15:0] w;
  wire [32:0] _t0;
  wire _t1;
  wire [23:0] _t2;
  wire [39:0] _t3;
  wire _t4;
  wire [39:0] _t5;
  wire [39:0] _t6;
  wire _t7;
  wire _t8;
  wire [39:0] _t9;
  wire _t10;
  wire [39:0] _t11;
  wire [71:0] _t12;
  wire [15:0] _t13;
  wire [15:0] _t14;
  wire [15:0] _t15;
  wire [5:0] _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire [6:0] _t28;
  wire [6:0] _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire [31:0] _t33;
  wire _t34;
  wire _t35;
  wire [7:0] _t36;
  wire [7:0] _t37;
  wire _t38;
  wire [7:0] _t39;
  wire [7:0] _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire [31:0] _t45;
  wire _t46;
  wire [39:0] _t47;
  wire [39:0] _t48;
  wire _t49;
  wire [39:0] _t50;
  wire [71:0] _t51;
  wire [6:0] _t52;
  wire _t53;
  wire [7:0] _t54;
  wire [31:0] _t55;
  assign _t0 = {1'b0, ph};
  assign _t1 = sr[15];
  assign _t2 = ((|_t1) ? 24'd16777215 : 24'd0);
  assign _t3 = (acc + sx);
  assign _t4 = nph[32];
  assign _t5 = ((|_t4) ? 40'd0 : acc);
  assign _t6 = (acc + sx);
  assign _t7 = (~_t4);
  assign _t8 = sum[39];
  assign _t9 = (40'd0 - sum);
  assign _t10 = sum[39];
  assign _t11 = ((|_t10) ? _t9 : sum);
  assign _t12 = ({32'b0, mag} * {32'b0, 40'd318715});
  assign _t13 = prod[45:30];
  assign _t14 = (16'd0 - q);
  assign _t15 = ((|neg) ? _t14 : q);
  assign _t16 = wi[5:0];
  assign _t17 = (~full);
  assign _t18 = ((|v3) && (|_t17));
  assign _t19 = ((|v3) && (|_t17));
  assign _t20 = ((|v3) && (|_t17));
  assign _t21 = (wi == 7'd63);
  assign _t22 = ((|v3) && (|_t17));
  assign _t23 = ((|_t22) && (|_t21));
  assign _t24 = ((|v3) && (|_t17));
  assign _t25 = ((|_t24) && (|_t21));
  assign _t26 = ((|v3) && (|_t17));
  assign _t27 = ((|_t26) && (|_t21));
  assign _t28 = ((|_t23) ? 7'd0 : wi);
  assign _t29 = (wi + 7'd1);
  assign _t30 = (~_t21);
  assign _t31 = ((|v3) && (|_t17));
  assign _t32 = ((|_t31) && (|_t30));
  assign _t33 = (ndrop + 32'd1);
  assign _t34 = (~_t17);
  assign _t35 = ((|v3) && (|_t34));
  assign _t36 = w[7:0];
  assign _t37 = w[15:8];
  assign _t38 = oi[0];
  assign _t39 = ((|_t27) ? 8'd0 : oi);
  assign _t40 = (oi + 8'd1);
  assign _t41 = ((|full) && (|t_ready));
  assign _t42 = ((|_t25) ? 1'd1 : full);
  assign _t43 = (oi == 8'd127);
  assign _t44 = ((|_t41) && (|_t43));
  assign drops = ndrop;
  assign nph = (_t0 + 33'd1274861);
  assign _t45 = nph[31:0];
  assign sx = {_t2, sr};
  assign _t46 = nph[32];
  assign _t47 = ((|_t4) ? _t3 : sum);
  assign _t48 = ((|_t7) ? _t6 : _t5);
  assign _t49 = ((|v1) ? _t8 : neg);
  assign _t50 = ((|v1) ? _t11 : mag);
  assign _t51 = ((|v2) ? _t12 : prod);
  assign q = ((|v3) ? _t13 : 16'd0);
  assign out = ((|v3) ? _t15 : 16'd0);
  assign buf_wr0_addr = ((|_t18) ? _t16 : 6'd0);
  assign buf_wr0_data = ((|_t19) ? out : 16'd0);
  assign buf_wr0_we = ((|_t20) ? 1'd1 : 1'd0);
  assign _t52 = ((|_t32) ? _t29 : _t28);
  assign _t53 = ((|_t44) ? 1'd0 : _t42);
  assign _t54 = ((|_t41) ? _t40 : _t39);
  assign _t55 = ((|_t35) ? _t33 : ndrop);
  assign t_valid = full;
  assign buf_rd0_addr = oi[6:1];
  assign w = buf_rd0_data;
  assign t_data = ((|_t38) ? _t37 : _t36);
  assign t_last = (oi == 8'd127);
  always @(posedge clk) begin
    if (rst) begin
      ph <= 32'd0;
      acc <= 40'd0;
      wi <= 7'd0;
      full <= 1'd0;
      oi <= 8'd0;
      ndrop <= 32'd0;
      sr <= 16'd0;
      v1 <= 1'd0;
      v2 <= 1'd0;
      v3 <= 1'd0;
      sum <= 40'd0;
      neg <= 1'd0;
      mag <= 40'd0;
      prod <= 72'd0;
    end else begin
      ph <= _t45;
      acc <= _t48;
      wi <= _t52;
      full <= _t53;
      oi <= _t54;
      ndrop <= _t55;
      sr <= sample;
      v1 <= _t46;
      v2 <= v1;
      v3 <= v2;
      sum <= _t47;
      neg <= _t49;
      mag <= _t50;
      prod <= _t51;
    end
  end
  l8_ram_16x64_r1_w1_d _meminst_0_buf (
    .clk(clk),
    .rd0_addr(buf_rd0_addr),
    .rd0_data(buf_rd0_data),
    .wr0_we(buf_wr0_we),
    .wr0_addr(buf_wr0_addr),
    .wr0_data(buf_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module stream_tx_8_1024_256_1_200000 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  input  wire [7:0] rx_data,
  input  wire rx_last,
  input  wire rx_valid,
  output wire rx_ready,
  output wire [7:0] tx_data,
  output wire tx_last,
  output wire tx_valid,
  input  wire tx_ready,
  output reg  err
);
  wire [9:0] ring_rd0_addr;
  wire [8:0] ring_rd0_data;
  wire [9:0] ring_wr0_addr;
  wire [8:0] ring_wr0_data;
  wire ring_wr0_we;
  wire [9:0] hdr_rd0_addr;
  wire [27:0] hdr_rd0_data;
  wire [9:0] hdr_wr0_addr;
  wire [27:0] hdr_wr0_data;
  wire hdr_wr0_we;
  reg  [10:0] wp;
  reg  [10:0] sp;
  reg  [10:0] rp;
  reg  [15:0] fw;
  reg  [15:0] fs;
  reg  [15:0] fr;
  reg  inf;
  reg  drop;
  reg  [15:0] wn;
  reg  [15:0] lost;
  reg  [3:0] ok;
  reg  [7:0] ob;
  reg  [39:0] oh;
  reg  [10:0] fstart;
  reg  [15:0] credit;
  reg  ack;
  reg  [15:0] base;
  reg  [31:0] rtx;
  reg  pnak;
  reg  [15:0] pnseq;
  reg  [10:0] pnsp;
  reg  [5:0] ik;
  reg  [39:0] ic;
  wire [7:0] ptx_data;
  wire ptx_last;
  wire ptx_valid;
  wire ptx_ready;
  wire [7:0] prx_data;
  wire prx_last;
  wire prx_valid;
  wire prx_ready;
  wire [10:0] cnt;
  wire [11:0] free;
  wire [7:0] rb;
  wire [15:0] aseqw;
  wire [15:0] aseq;
  wire [15:0] acred;
  wire [27:0] hv;
  wire [15:0] adist;
  wire [15:0] fdist;
  wire [27:0] hs;
  wire [8:0] wv;
  wire [15:0] seqw;
  wire [7:0] hflg;
  wire [15:0] hlost;
  wire [11:0] _t0;
  wire _t1;
  wire [15:0] _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [9:0] _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire [8:0] _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [10:0] _t26;
  wire _t27;
  wire _t28;
  wire [9:0] _t29;
  wire _t30;
  wire _t31;
  wire [10:0] _t32;
  wire _t33;
  wire [27:0] _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire [15:0] _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire _t45;
  wire [15:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire [15:0] _t62;
  wire [15:0] _t63;
  wire _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [31:0] _t69;
  wire [39:0] _t70;
  wire _t71;
  wire _t72;
  wire [5:0] _t73;
  wire [5:0] _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire [15:0] _t77;
  wire [7:0] _t78;
  wire [7:0] _t79;
  wire [15:0] _t80;
  wire _t81;
  wire _t82;
  wire _t83;
  wire _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire _t90;
  wire _t91;
  wire _t92;
  wire _t93;
  wire _t94;
  wire _t95;
  wire _t96;
  wire _t97;
  wire _t98;
  wire _t99;
  wire _t100;
  wire _t101;
  wire _t102;
  wire [15:0] _t103;
  wire [31:0] _t104;
  wire [10:0] _t105;
  wire _t106;
  wire [10:0] _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire [10:0] _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire [15:0] _t124;
  wire _t125;
  wire _t126;
  wire [10:0] _t127;
  wire [10:0] _t128;
  wire _t129;
  wire _t130;
  wire [15:0] _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire [10:0] _t137;
  wire _t138;
  wire [31:0] _t139;
  wire [31:0] _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire [15:0] _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [10:0] _t154;
  wire [31:0] _t155;
  wire _t156;
  wire [6:0] _t157;
  wire [39:0] _t158;
  wire _t159;
  wire _t160;
  wire [15:0] _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire [10:0] _t171;
  wire [10:0] _t172;
  wire _t173;
  wire _t174;
  wire [31:0] _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [31:0] _t182;
  wire [39:0] _t183;
  wire [39:0] _t184;
  wire _t185;
  wire _t186;
  wire [3:0] _t187;
  wire [3:0] _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire [7:0] _t194;
  wire [7:0] _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire [10:0] _t207;
  wire [10:0] _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire [3:0] _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire [15:0] _t218;
  wire [15:0] _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire [7:0] _t224;
  wire [7:0] _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire [15:0] _t230;
  wire _t231;
  wire [10:0] _t232;
  wire [15:0] _t233;
  wire [15:0] _t234;
  wire _t235;
  wire _t236;
  wire [10:0] _t237;
  wire [39:0] _t238;
  wire [5:0] _t239;
  wire [15:0] _t240;
  wire _t241;
  wire [15:0] _t242;
  wire [31:0] _t243;
  wire _t244;
  wire [15:0] _t245;
  wire [10:0] _t246;
  wire [10:0] _t247;
  wire [15:0] _t248;
  wire [15:0] _t249;
  wire [10:0] _t250;
  wire [39:0] _t251;
  wire [3:0] _t252;
  wire [7:0] _t253;
  wire pr_arx_ready;
  wire [7:0] pr_atx_data;
  wire pr_atx_last;
  wire pr_atx_valid;
  wire [7:0] pr_prx_data;
  wire pr_prx_last;
  wire pr_prx_valid;
  wire pr_ptx_ready;
  assign _t0 = {1'b0, cnt};
  assign _t1 = (free >= 12'd256);
  assign _t2 = (lost + 16'd1);
  assign _t3 = (~_t1);
  assign _t4 = (~drop);
  assign _t5 = (~inf);
  assign _t6 = ((|_t5) && (|_t4));
  assign _t7 = ((|_t6) && (|_t3));
  assign _t8 = ((|t_valid) && (|t_ready));
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = (~t_last);
  assign _t11 = ((|_t8) && (|_t7));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = wp[9:0];
  assign _t14 = (wn < 16'd256);
  assign _t15 = ((|_t6) && (|_t1));
  assign _t16 = ((|inf) || (|_t15));
  assign _t17 = ((|_t8) && (|_t16));
  assign _t18 = ((|_t17) && (|_t14));
  assign _t19 = (wn == 16'd255);
  assign _t20 = ((|t_last) || (|_t19));
  assign _t21 = {_t20, t_data};
  assign _t22 = ((|_t8) && (|_t16));
  assign _t23 = ((|_t22) && (|_t14));
  assign _t24 = ((|_t8) && (|_t16));
  assign _t25 = ((|_t24) && (|_t14));
  assign _t26 = (wp + 11'd1);
  assign _t27 = ((|_t8) && (|_t16));
  assign _t28 = ((|_t27) && (|_t14));
  assign _t29 = fw[9:0];
  assign _t30 = ((|_t8) && (|_t16));
  assign _t31 = ((|_t30) && (|t_last));
  assign _t32 = ((|inf) ? fstart : wp);
  assign _t33 = (wn >= 16'd256);
  assign _t34 = {_t33, lost, _t32};
  assign _t35 = ((|_t8) && (|_t16));
  assign _t36 = ((|_t35) && (|t_last));
  assign _t37 = ((|_t8) && (|_t16));
  assign _t38 = ((|_t37) && (|t_last));
  assign _t39 = (fw + 16'd1);
  assign _t40 = ((|_t8) && (|_t16));
  assign _t41 = ((|_t40) && (|t_last));
  assign _t42 = ((|_t8) && (|_t16));
  assign _t43 = ((|_t42) && (|t_last));
  assign _t44 = ((|_t8) && (|_t16));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ((|_t9) ? _t2 : lost);
  assign _t47 = ((|_t8) && (|_t16));
  assign _t48 = ((|_t47) && (|t_last));
  assign _t49 = (wn >= 16'd256);
  assign _t50 = ((|1'd1) && (|_t49));
  assign _t51 = ((|_t8) && (|_t16));
  assign _t52 = ((|_t51) && (|t_last));
  assign _t53 = ((|_t52) && (|_t50));
  assign _t54 = (~inf);
  assign _t55 = (~t_last);
  assign _t56 = ((|_t8) && (|_t16));
  assign _t57 = ((|_t56) && (|_t55));
  assign _t58 = ((|_t57) && (|_t54));
  assign _t59 = ((|_t45) ? 1'd0 : inf);
  assign _t60 = ((|_t8) && (|_t16));
  assign _t61 = ((|_t60) && (|_t55));
  assign _t62 = ((|_t43) ? 16'd0 : wn);
  assign _t63 = (wn + 16'd1);
  assign _t64 = ((|_t8) && (|_t16));
  assign _t65 = ((|_t64) && (|_t55));
  assign _t66 = ((|_t12) ? 1'd1 : drop);
  assign _t67 = ((|drop) && (|t_last));
  assign _t68 = ((|_t8) && (|_t67));
  assign _t69 = ic[39:8];
  assign _t70 = {rb, _t69};
  assign _t71 = (ik < 6'd5);
  assign _t72 = ((|prx_valid) && (|_t71));
  assign _t73 = (ik + 6'd1);
  assign _t74 = ((|prx_last) ? 6'd0 : _t73);
  assign _t75 = ic[15:8];
  assign _t76 = ic[23:16];
  assign _t77 = (aseqw - base);
  assign _t78 = ic[31:24];
  assign _t79 = ic[39:32];
  assign _t80 = (aseqw - fr);
  assign _t81 = (~ack);
  assign _t82 = rb[7];
  assign _t83 = (ik == 6'd4);
  assign _t84 = ((|prx_valid) && (|prx_last));
  assign _t85 = ((|_t84) && (|_t83));
  assign _t86 = ((|_t85) && (|_t82));
  assign _t87 = ((|1'd1) && (|_t86));
  assign _t88 = ((|_t87) && (|_t81));
  assign _t89 = rb[5];
  assign _t90 = ((|1'd1) && (|_t86));
  assign _t91 = ((|_t90) && (|_t89));
  assign _t92 = (fs != fr);
  assign _t93 = ((|_t91) && (|_t92));
  assign _t94 = ((|_t91) && (|_t92));
  assign _t95 = ((|_t91) && (|_t92));
  assign _t96 = ((|_t91) ? 1'd1 : ack);
  assign _t97 = (adist <= fdist);
  assign _t98 = rb[5];
  assign _t99 = (~_t98);
  assign _t100 = ((|1'd1) && (|_t86));
  assign _t101 = ((|_t100) && (|_t99));
  assign _t102 = ((|_t101) && (|_t97));
  assign _t103 = ((|_t91) ? acred : credit);
  assign _t104 = ((|_t91) ? 32'd0 : rtx);
  assign _t105 = hv[10:0];
  assign _t106 = (aseq == fw);
  assign _t107 = ((|_t106) ? wp : _t105);
  assign _t108 = (adist != 16'd0);
  assign _t109 = ((|_t102) && (|_t108));
  assign _t110 = ((|_t102) && (|_t108));
  assign _t111 = (ok == 4'd0);
  assign _t112 = (fs != aseq);
  assign _t113 = rb[6];
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t102) && (|_t114));
  assign _t116 = ((|_t115) && (|_t111));
  assign _t117 = hv[10:0];
  assign _t118 = ((|_t102) && (|_t114));
  assign _t119 = ((|_t118) && (|_t111));
  assign _t120 = ((|_t93) ? 1'd1 : pnak);
  assign _t121 = (~_t111);
  assign _t122 = ((|_t102) && (|_t114));
  assign _t123 = ((|_t122) && (|_t121));
  assign _t124 = ((|_t94) ? fr : pnseq);
  assign _t125 = ((|_t102) && (|_t114));
  assign _t126 = ((|_t125) && (|_t121));
  assign _t127 = ((|_t95) ? rp : pnsp);
  assign _t128 = hv[10:0];
  assign _t129 = ((|_t102) && (|_t114));
  assign _t130 = ((|_t129) && (|_t121));
  assign _t131 = ((|_t116) ? aseq : fs);
  assign _t132 = (~_t86);
  assign _t133 = (ok == 4'd0);
  assign _t134 = ((|1'd1) && (|pnak));
  assign _t135 = ((|_t134) && (|_t133));
  assign _t136 = ((|_t135) && (|_t132));
  assign _t137 = ((|_t119) ? _t117 : sp);
  assign _t138 = ((|_t123) ? 1'd1 : _t120);
  assign _t139 = ((|_t102) ? 32'd0 : _t104);
  assign _t140 = (rtx + 32'd1);
  assign _t141 = (~_t86);
  assign _t142 = (fs != fr);
  assign _t143 = (ok == 4'd0);
  assign _t144 = ((|1'd1) && (|_t143));
  assign _t145 = ((|_t144) && (|_t142));
  assign _t146 = ((|_t145) && (|_t141));
  assign _t147 = ((|_t136) ? pnseq : _t131);
  assign _t148 = (rtx >= 32'd200000);
  assign _t149 = (fs != fr);
  assign _t150 = (ok == 4'd0);
  assign _t151 = ((|1'd1) && (|_t150));
  assign _t152 = ((|_t151) && (|_t149));
  assign _t153 = ((|_t152) && (|_t148));
  assign _t154 = ((|_t136) ? pnsp : _t137);
  assign _t155 = ((|_t146) ? _t140 : _t139);
  assign _t156 = hs[27];
  assign _t157 = 7'd0;
  assign _t158 = {hflg, hlost, seqw};
  assign _t159 = (~pnak);
  assign _t160 = (~_t153);
  assign _t161 = (fs - fr);
  assign _t162 = (_t161 < credit);
  assign _t163 = ((|ack) && (|_t162));
  assign _t164 = ((|1'd0) || (|_t163));
  assign _t165 = (fs != fw);
  assign _t166 = ((|_t165) && (|_t164));
  assign _t167 = ((|_t166) && (|_t160));
  assign _t168 = ((|_t167) && (|_t159));
  assign _t169 = (ok == 4'd0);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t153) ? rp : _t154);
  assign _t172 = hs[10:0];
  assign _t173 = ((|_t169) && (|_t168));
  assign _t174 = ((|_t169) && (|_t168));
  assign _t175 = ((|_t153) ? 32'd0 : _t155);
  assign _t176 = ((|_t169) && (|_t168));
  assign _t177 = (ok <= 4'd5);
  assign _t178 = (~_t169);
  assign _t179 = ((|_t178) && (|_t177));
  assign _t180 = oh[7:0];
  assign _t181 = ((|_t178) && (|_t177));
  assign _t182 = oh[39:8];
  assign _t183 = ((|_t170) ? _t158 : oh);
  assign _t184 = {8'd0, _t182};
  assign _t185 = ((|_t178) && (|_t177));
  assign _t186 = ((|_t185) && (|ptx_ready));
  assign _t187 = ((|_t174) ? 4'd1 : ok);
  assign _t188 = (ok + 4'd1);
  assign _t189 = ((|_t178) && (|_t177));
  assign _t190 = ((|_t189) && (|ptx_ready));
  assign _t191 = ((|_t179) ? 1'd1 : 1'd0);
  assign _t192 = (~_t177);
  assign _t193 = ((|_t178) && (|_t192));
  assign _t194 = ((|_t181) ? _t180 : 8'd0);
  assign _t195 = wv[7:0];
  assign _t196 = (ob == 8'd0);
  assign _t197 = ((|_t178) && (|_t192));
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = wv[8];
  assign _t200 = (ob == 8'd0);
  assign _t201 = ((|_t200) && (|_t199));
  assign _t202 = ((|_t178) && (|_t192));
  assign _t203 = (ob == 8'd0);
  assign _t204 = ((|_t178) && (|_t192));
  assign _t205 = ((|_t204) && (|ptx_ready));
  assign _t206 = ((|_t205) && (|_t203));
  assign _t207 = ((|_t173) ? _t172 : _t171);
  assign _t208 = (sp + 11'd1);
  assign _t209 = ((|_t178) && (|_t192));
  assign _t210 = ((|_t209) && (|ptx_ready));
  assign _t211 = ((|_t210) && (|_t203));
  assign _t212 = ((|_t190) ? _t188 : _t187);
  assign _t213 = wv[8];
  assign _t214 = ((|_t178) && (|_t192));
  assign _t215 = ((|_t214) && (|ptx_ready));
  assign _t216 = ((|_t215) && (|_t203));
  assign _t217 = ((|_t216) && (|_t213));
  assign _t218 = ((|_t153) ? fr : _t147);
  assign _t219 = (fs + 16'd1);
  assign _t220 = ((|_t178) && (|_t192));
  assign _t221 = ((|_t220) && (|ptx_ready));
  assign _t222 = ((|_t221) && (|_t203));
  assign _t223 = ((|_t222) && (|_t213));
  assign _t224 = ((|_t206) ? 8'd0 : ob);
  assign _t225 = (ob + 8'd1);
  assign _t226 = (~_t203);
  assign _t227 = ((|_t178) && (|_t192));
  assign _t228 = ((|_t227) && (|ptx_ready));
  assign _t229 = ((|_t228) && (|_t226));
  assign rx_ready = pr_arx_ready;
  assign tx_data = pr_atx_data;
  assign tx_last = pr_atx_last;
  assign tx_valid = pr_atx_valid;
  assign prx_data = pr_prx_data;
  assign prx_last = pr_prx_last;
  assign prx_valid = pr_prx_valid;
  assign ptx_ready = pr_ptx_ready;
  assign cnt = (wp - rp);
  assign free = (12'd1024 - _t0);
  assign t_ready = ((|inf) || (|_t1));
  assign _t230 = ((|_t48) ? 16'd0 : _t46);
  assign _t231 = ((|_t68) ? 1'd0 : _t66);
  assign ring_wr0_addr = ((|_t18) ? _t13 : 10'd0);
  assign ring_wr0_data = ((|_t23) ? _t21 : 9'd0);
  assign ring_wr0_we = ((|_t25) ? 1'd1 : 1'd0);
  assign _t232 = ((|_t28) ? _t26 : wp);
  assign hdr_wr0_addr = ((|_t31) ? _t29 : 10'd0);
  assign hdr_wr0_data = ((|_t36) ? _t34 : 28'd0);
  assign hdr_wr0_we = ((|_t38) ? 1'd1 : 1'd0);
  assign _t233 = ((|_t41) ? _t39 : fw);
  assign _t234 = ((|_t65) ? _t63 : _t62);
  assign _t235 = ((|_t61) ? 1'd1 : _t59);
  assign _t236 = ((|_t53) ? 1'd1 : err);
  assign _t237 = ((|_t58) ? wp : fstart);
  assign prx_ready = 1'd1;
  assign rb = prx_data;
  assign _t238 = ((|_t72) ? _t70 : ic);
  assign _t239 = ((|prx_valid) ? _t74 : ik);
  assign aseqw = {_t76, _t75};
  assign aseq = ((|ack) ? _t77 : fr);
  assign acred = {_t79, _t78};
  assign hdr_rd0_addr = fs[9:0];
  assign hv = hdr_rd0_data;
  assign adist = (aseq - fr);
  assign fdist = (fs - fr);
  assign _t240 = ((|_t88) ? _t80 : base);
  assign _t241 = ((|_t102) ? 1'd1 : _t96);
  assign _t242 = ((|_t102) ? acred : _t103);
  assign _t243 = ((|_t176) ? 32'd0 : _t175);
  assign _t244 = ((|_t136) ? 1'd0 : _t138);
  assign _t245 = ((|_t126) ? aseq : _t124);
  assign _t246 = ((|_t130) ? _t128 : _t127);
  assign _t247 = ((|_t109) ? _t107 : rp);
  assign _t248 = ((|_t110) ? aseq : fr);
  assign _t249 = ((|_t223) ? _t219 : _t218);
  assign _t250 = ((|_t211) ? _t208 : _t207);
  assign hs = hdr_rd0_data;
  assign ring_rd0_addr = sp[9:0];
  assign wv = ring_rd0_data;
  assign seqw = (fs + base);
  assign hflg = {_t157, _t156};
  assign hlost = hs[26:11];
  assign ptx_valid = ((|_t193) ? 1'd1 : _t191);
  assign ptx_data = ((|_t198) ? _t195 : _t194);
  assign ptx_last = ((|_t202) ? _t201 : 1'd0);
  assign _t251 = ((|_t186) ? _t184 : _t183);
  assign _t252 = ((|_t217) ? 4'd0 : _t212);
  assign _t253 = ((|_t229) ? _t225 : _t224);
  always @(posedge clk) begin
    if (rst) begin
      wp <= 11'd0;
      sp <= 11'd0;
      rp <= 11'd0;
      fw <= 16'd0;
      fs <= 16'd0;
      fr <= 16'd0;
      inf <= 1'd0;
      drop <= 1'd0;
      wn <= 16'd0;
      lost <= 16'd0;
      err <= 1'd0;
      ok <= 4'd0;
      ob <= 8'd0;
      oh <= 40'd0;
      fstart <= 11'd0;
      credit <= 16'd0;
      ack <= 1'd0;
      base <= 16'd0;
      rtx <= 32'd0;
      pnak <= 1'd0;
      pnseq <= 16'd0;
      pnsp <= 11'd0;
      ik <= 6'd0;
      ic <= 40'd0;
    end else begin
      wp <= _t232;
      sp <= _t250;
      rp <= _t247;
      fw <= _t233;
      fs <= _t249;
      fr <= _t248;
      inf <= _t235;
      drop <= _t231;
      wn <= _t234;
      lost <= _t230;
      err <= _t236;
      ok <= _t252;
      ob <= _t253;
      oh <= _t251;
      fstart <= _t237;
      credit <= _t242;
      ack <= _t241;
      base <= _t240;
      rtx <= _t243;
      pnak <= _t244;
      pnseq <= _t245;
      pnsp <= _t246;
      ik <= _t239;
      ic <= _t238;
    end
  end
  l8_ram_9x1024_r1_w1_d _meminst_0_ring (
    .clk(clk),
    .rd0_addr(ring_rd0_addr),
    .rd0_data(ring_rd0_data),
    .wr0_we(ring_wr0_we),
    .wr0_addr(ring_wr0_addr),
    .wr0_data(ring_wr0_data)
  );
  l8_ram_28x1024_r1_w1_d _meminst_1_hdr (
    .clk(clk),
    .rd0_addr(hdr_rd0_addr),
    .rd0_data(hdr_rd0_data),
    .wr0_we(hdr_wr0_we),
    .wr0_addr(hdr_wr0_addr),
    .wr0_data(hdr_wr0_data)
  );
  dbg_peer pr (
    .clk(clk),
    .rst(rst),
    .arx_data(rx_data),
    .arx_last(rx_last),
    .arx_valid(rx_valid),
    .arx_ready(pr_arx_ready),
    .atx_data(pr_atx_data),
    .atx_last(pr_atx_last),
    .atx_valid(pr_atx_valid),
    .atx_ready(tx_ready),
    .prx_data(pr_prx_data),
    .prx_last(pr_prx_last),
    .prx_valid(pr_prx_valid),
    .prx_ready(prx_ready),
    .ptx_data(ptx_data),
    .ptx_last(ptx_last),
    .ptx_valid(ptx_valid),
    .ptx_ready(pr_ptx_ready)
  );
endmodule
`default_nettype wire

`default_nettype none
module sd_card_blk (
  input  wire clk,
  input  wire rst,
  input  wire sclk,
  input  wire mosi,
  input  wire cs,
  output wire blk_req,
  output wire blk_wr,
  output wire [31:0] blk_lba,
  output wire [7:0] blk_wdata,
  input  wire blk_ack,
  input  wire blk_stb,
  input  wire [7:0] blk_rdata,
  input  wire blk_done,
  input  wire blk_err,
  output wire miso
);
  reg  prev;
  reg  [7:0] rx;
  reg  [7:0] tx;
  reg  [3:0] nbit;
  reg  [7:0] cbuf0;
  reg  [31:0] arg;
  reg  [15:0] idx;
  reg  [31:0] lba;
  reg  [15:0] cnt;
  reg  [15:0] bidx;
  reg  asked;
  reg  acmd;
  reg  [3:0] tries;
  wire [8:0] buf_rd0_addr;
  wire [7:0] buf_rd0_data;
  wire [8:0] buf_wr0_addr;
  wire [7:0] buf_wr0_data;
  wire buf_wr0_we;
  reg  [4:0] c_state;
  wire [5:0] k;
  wire [6:0] _t0;
  wire [7:0] _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire [6:0] _t6;
  wire [7:0] _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire [3:0] _t12;
  wire [3:0] _t13;
  wire [3:0] _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire [7:0] _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire [7:0] _t35;
  wire _t36;
  wire [23:0] _t37;
  wire [31:0] _t38;
  wire _t39;
  wire _t40;
  wire [15:0] _t41;
  wire [15:0] _t42;
  wire _t43;
  wire _t44;
  wire [4:0] _t45;
  wire _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire [7:0] _t50;
  wire _t51;
  wire [4:0] _t52;
  wire _t53;
  wire _t54;
  wire [5:0] _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire [7:0] _t60;
  wire _t61;
  wire _t62;
  wire [4:0] _t63;
  wire _t64;
  wire _t65;
  wire [7:0] _t66;
  wire _t67;
  wire _t68;
  wire _t69;
  wire _t70;
  wire _t71;
  wire [3:0] _t72;
  wire _t73;
  wire _t74;
  wire _t75;
  wire [7:0] _t76;
  wire _t77;
  wire _t78;
  wire _t79;
  wire _t80;
  wire [4:0] _t81;
  wire _t82;
  wire _t83;
  wire [7:0] _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire [4:0] _t88;
  wire _t89;
  wire _t90;
  wire [7:0] _t91;
  wire _t92;
  wire _t93;
  wire _t94;
  wire [4:0] _t95;
  wire _t96;
  wire _t97;
  wire [7:0] _t98;
  wire _t99;
  wire _t100;
  wire _t101;
  wire _t102;
  wire _t103;
  wire [4:0] _t104;
  wire _t105;
  wire _t106;
  wire [7:0] _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire [15:0] _t111;
  wire _t112;
  wire _t113;
  wire [4:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire [7:0] _t120;
  wire _t121;
  wire _t122;
  wire [4:0] _t123;
  wire _t124;
  wire _t125;
  wire [31:0] _t126;
  wire _t127;
  wire _t128;
  wire _t129;
  wire [7:0] _t130;
  wire _t131;
  wire _t132;
  wire [4:0] _t133;
  wire _t134;
  wire _t135;
  wire [7:0] _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [4:0] _t154;
  wire _t155;
  wire _t156;
  wire [7:0] _t157;
  wire _t158;
  wire _t159;
  wire [4:0] _t160;
  wire _t161;
  wire _t162;
  wire _t163;
  wire [7:0] _t164;
  wire _t165;
  wire [7:0] _t166;
  wire [7:0] _t167;
  wire _t168;
  wire _t169;
  wire [15:0] _t170;
  wire [15:0] _t171;
  wire _t172;
  wire _t173;
  wire [7:0] _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire [4:0] _t179;
  wire _t180;
  wire _t181;
  wire _t182;
  wire _t183;
  wire [7:0] _t184;
  wire _t185;
  wire [7:0] _t186;
  wire _t187;
  wire [7:0] _t188;
  wire [7:0] _t189;
  wire _t190;
  wire _t191;
  wire [15:0] _t192;
  wire [15:0] _t193;
  wire _t194;
  wire _t195;
  wire [7:0] _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire [4:0] _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire [7:0] _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire [4:0] _t212;
  wire _t213;
  wire _t214;
  wire [7:0] _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire [8:0] _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire [15:0] _t230;
  wire [15:0] _t231;
  wire _t232;
  wire _t233;
  wire [4:0] _t234;
  wire _t235;
  wire _t236;
  wire [7:0] _t237;
  wire _t238;
  wire _t239;
  wire [15:0] _t240;
  wire _t241;
  wire _t242;
  wire [4:0] _t243;
  wire _t244;
  wire _t245;
  wire [8:0] _t246;
  wire _t247;
  wire _t248;
  wire [7:0] _t249;
  wire _t250;
  wire _t251;
  wire [4:0] _t252;
  wire _t253;
  wire _t254;
  wire [15:0] _t255;
  wire [15:0] _t256;
  wire _t257;
  wire _t258;
  wire [7:0] _t259;
  wire _t260;
  wire _t261;
  wire _t262;
  wire _t263;
  wire [4:0] _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire [8:0] _t268;
  wire [8:0] _t269;
  wire [8:0] _t270;
  wire _t271;
  wire _t272;
  wire _t273;
  wire _t274;
  wire [7:0] _t275;
  wire _t276;
  wire _t277;
  wire _t278;
  wire [15:0] _t279;
  wire [15:0] _t280;
  wire _t281;
  wire _t282;
  wire [7:0] _t283;
  wire _t284;
  wire _t285;
  wire _t286;
  wire _t287;
  wire [4:0] _t288;
  wire _t289;
  wire _t290;
  wire _t291;
  wire [7:0] _t292;
  wire _t293;
  wire _t294;
  wire [4:0] _t295;
  wire _t296;
  wire _t297;
  wire [7:0] _t298;
  wire _t299;
  wire [15:0] _t300;
  wire _t301;
  wire _t302;
  wire _t303;
  wire _t304;
  wire [4:0] _t305;
  wire _t306;
  wire _t307;
  wire _t308;
  wire [7:0] _t309;
  wire _t310;
  wire [8:0] _t311;
  wire [8:0] _t312;
  wire _t313;
  wire _t314;
  wire [7:0] _t315;
  wire _t316;
  wire _t317;
  wire _t318;
  wire _t319;
  wire _t320;
  wire [15:0] _t321;
  wire [15:0] _t322;
  wire _t323;
  wire _t324;
  wire [4:0] _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [7:0] _t330;
  wire _t331;
  wire [15:0] _t332;
  wire [15:0] _t333;
  wire _t334;
  wire _t335;
  wire [7:0] _t336;
  wire _t337;
  wire _t338;
  wire _t339;
  wire _t340;
  wire [15:0] _t341;
  wire _t342;
  wire _t343;
  wire _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire [4:0] _t349;
  wire _t350;
  wire _t351;
  wire _t352;
  wire [7:0] _t353;
  wire _t354;
  wire _t355;
  wire _t356;
  wire _t357;
  wire _t358;
  wire _t359;
  wire _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire [15:0] _t365;
  wire [15:0] _t366;
  wire _t367;
  wire _t368;
  wire [4:0] _t369;
  wire _t370;
  wire _t371;
  wire [7:0] _t372;
  wire _t373;
  wire _t374;
  wire [4:0] _t375;
  wire _t376;
  wire _t377;
  wire [7:0] _t378;
  wire [3:0] _t379;
  wire [7:0] _t380;
  wire [7:0] _t381;
  wire [15:0] _t382;
  wire [4:0] _t383;
  wire [31:0] _t384;
  wire _t385;
  wire [3:0] _t386;
  wire [15:0] _t387;
  wire [31:0] _t388;
  wire [15:0] _t389;
  wire _t390;
  assign _t0 = rx[6:0];
  assign _t1 = {_t0, mosi};
  assign _t2 = (~cs);
  assign _t3 = (~prev);
  assign _t4 = ((|sclk) && (|_t3));
  assign _t5 = ((|_t4) && (|_t2));
  assign _t6 = tx[6:0];
  assign _t7 = {_t6, 1'd1};
  assign _t8 = (~cs);
  assign _t9 = (~sclk);
  assign _t10 = ((|_t9) && (|prev));
  assign _t11 = ((|_t10) && (|_t8));
  assign _t12 = ((|cs) ? 4'd0 : nbit);
  assign _t13 = (nbit + 4'd1);
  assign _t14 = ((|_t11) ? _t13 : _t12);
  assign _t15 = (nbit == 4'd7);
  assign _t16 = (~cs);
  assign _t17 = ((|_t10) && (|_t16));
  assign _t18 = ((|_t17) && (|_t15));
  assign _t19 = tx[7];
  assign _t20 = ((|_t11) ? _t7 : tx);
  assign _t21 = ({27'b0, c_state} == 32'd0);
  assign _t22 = rx[7];
  assign _t23 = (~_t22);
  assign _t24 = rx[6];
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t18) && (|_t25));
  assign _t27 = ({27'b0, c_state} == 32'd0);
  assign _t28 = ((|_t27) && (|_t26));
  assign _t29 = ((|_t18) && (|_t25));
  assign _t30 = ({27'b0, c_state} == 32'd0);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = ((|_t18) && (|_t25));
  assign _t33 = ({27'b0, c_state} == 32'd0);
  assign _t34 = ((|_t33) && (|_t32));
  assign _t35 = ((|_t21) ? 8'd255 : _t20);
  assign _t36 = ({27'b0, c_state} == 32'd1);
  assign _t37 = arg[23:0];
  assign _t38 = {_t37, rx};
  assign _t39 = ({27'b0, c_state} == 32'd1);
  assign _t40 = ((|_t39) && (|_t18));
  assign _t41 = ((|_t31) ? 16'd1 : idx);
  assign _t42 = (idx + 16'd1);
  assign _t43 = ({27'b0, c_state} == 32'd1);
  assign _t44 = ((|_t43) && (|_t18));
  assign _t45 = ((|_t34) ? 32'd1 : c_state);
  assign _t46 = (idx == 16'd4);
  assign _t47 = ((|_t18) && (|_t46));
  assign _t48 = ({27'b0, c_state} == 32'd1);
  assign _t49 = ((|_t48) && (|_t47));
  assign _t50 = ((|_t36) ? 8'd255 : _t35);
  assign _t51 = ({27'b0, c_state} == 32'd2);
  assign _t52 = ((|_t49) ? 32'd2 : _t45);
  assign _t53 = ({27'b0, c_state} == 32'd2);
  assign _t54 = ((|_t53) && (|_t18));
  assign _t55 = cbuf0[5:0];
  assign _t56 = ({27'b0, c_state} == 32'd3);
  assign _t57 = (k == 6'd55);
  assign _t58 = ({27'b0, c_state} == 32'd3);
  assign _t59 = ((|_t58) && (|_t57));
  assign _t60 = ((|_t51) ? 8'd255 : _t50);
  assign _t61 = ({27'b0, c_state} == 32'd3);
  assign _t62 = ((|_t61) && (|_t57));
  assign _t63 = ((|_t54) ? 32'd3 : _t52);
  assign _t64 = ({27'b0, c_state} == 32'd3);
  assign _t65 = ((|_t64) && (|_t57));
  assign _t66 = ((|_t62) ? 8'd1 : _t60);
  assign _t67 = (tries == 4'd0);
  assign _t68 = (k == 6'd41);
  assign _t69 = ((|_t68) && (|_t67));
  assign _t70 = ({27'b0, c_state} == 32'd3);
  assign _t71 = ((|_t70) && (|_t69));
  assign _t72 = (tries + 4'd1);
  assign _t73 = ((|_t68) && (|_t67));
  assign _t74 = ({27'b0, c_state} == 32'd3);
  assign _t75 = ((|_t74) && (|_t73));
  assign _t76 = ((|_t71) ? 8'd1 : _t66);
  assign _t77 = (~_t67);
  assign _t78 = ((|_t68) && (|_t77));
  assign _t79 = ({27'b0, c_state} == 32'd3);
  assign _t80 = ((|_t79) && (|_t78));
  assign _t81 = ((|_t65) ? 32'd4 : _t63);
  assign _t82 = ({27'b0, c_state} == 32'd3);
  assign _t83 = ((|_t82) && (|_t68));
  assign _t84 = ((|_t80) ? 8'd0 : _t76);
  assign _t85 = (k == 6'd0);
  assign _t86 = ({27'b0, c_state} == 32'd3);
  assign _t87 = ((|_t86) && (|_t85));
  assign _t88 = ((|_t83) ? 32'd4 : _t81);
  assign _t89 = ({27'b0, c_state} == 32'd3);
  assign _t90 = ((|_t89) && (|_t85));
  assign _t91 = ((|_t87) ? 8'd1 : _t84);
  assign _t92 = (k == 6'd16);
  assign _t93 = ({27'b0, c_state} == 32'd3);
  assign _t94 = ((|_t93) && (|_t92));
  assign _t95 = ((|_t90) ? 32'd4 : _t88);
  assign _t96 = ({27'b0, c_state} == 32'd3);
  assign _t97 = ((|_t96) && (|_t92));
  assign _t98 = ((|_t94) ? 8'd0 : _t91);
  assign _t99 = (k == 6'd8);
  assign _t100 = ({27'b0, c_state} == 32'd3);
  assign _t101 = ((|_t100) && (|_t99));
  assign _t102 = ({27'b0, c_state} == 32'd3);
  assign _t103 = ((|_t102) && (|_t99));
  assign _t104 = ((|_t97) ? 32'd4 : _t95);
  assign _t105 = ({27'b0, c_state} == 32'd3);
  assign _t106 = ((|_t105) && (|_t99));
  assign _t107 = ((|_t101) ? 8'd1 : _t98);
  assign _t108 = (k == 6'd58);
  assign _t109 = ({27'b0, c_state} == 32'd3);
  assign _t110 = ((|_t109) && (|_t108));
  assign _t111 = ((|_t103) ? 16'd0 : cnt);
  assign _t112 = ({27'b0, c_state} == 32'd3);
  assign _t113 = ((|_t112) && (|_t108));
  assign _t114 = ((|_t106) ? 32'd5 : _t104);
  assign _t115 = ({27'b0, c_state} == 32'd3);
  assign _t116 = ((|_t115) && (|_t108));
  assign _t117 = (k == 6'd17);
  assign _t118 = ({27'b0, c_state} == 32'd3);
  assign _t119 = ((|_t118) && (|_t117));
  assign _t120 = ((|_t110) ? 8'd0 : _t107);
  assign _t121 = ({27'b0, c_state} == 32'd3);
  assign _t122 = ((|_t121) && (|_t117));
  assign _t123 = ((|_t116) ? 32'd6 : _t114);
  assign _t124 = ({27'b0, c_state} == 32'd3);
  assign _t125 = ((|_t124) && (|_t117));
  assign _t126 = ((|_t119) ? arg : lba);
  assign _t127 = (k == 6'd24);
  assign _t128 = ({27'b0, c_state} == 32'd3);
  assign _t129 = ((|_t128) && (|_t127));
  assign _t130 = ((|_t122) ? 8'd0 : _t120);
  assign _t131 = ({27'b0, c_state} == 32'd3);
  assign _t132 = ((|_t131) && (|_t127));
  assign _t133 = ((|_t125) ? 32'd7 : _t123);
  assign _t134 = ({27'b0, c_state} == 32'd3);
  assign _t135 = ((|_t134) && (|_t127));
  assign _t136 = ((|_t132) ? 8'd0 : _t130);
  assign _t137 = (k != 6'd58);
  assign _t138 = (k != 6'd55);
  assign _t139 = (k != 6'd41);
  assign _t140 = (k != 6'd24);
  assign _t141 = (k != 6'd17);
  assign _t142 = (k != 6'd16);
  assign _t143 = (k != 6'd8);
  assign _t144 = (k != 6'd0);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = ((|_t145) && (|_t142));
  assign _t147 = ((|_t146) && (|_t141));
  assign _t148 = ((|_t147) && (|_t140));
  assign _t149 = ((|_t148) && (|_t139));
  assign _t150 = ((|_t149) && (|_t138));
  assign _t151 = ((|_t150) && (|_t137));
  assign _t152 = ({27'b0, c_state} == 32'd3);
  assign _t153 = ((|_t152) && (|_t151));
  assign _t154 = ((|_t135) ? 32'd13 : _t133);
  assign _t155 = ({27'b0, c_state} == 32'd3);
  assign _t156 = ((|_t155) && (|_t151));
  assign _t157 = ((|_t153) ? 8'd4 : _t136);
  assign _t158 = ({27'b0, c_state} == 32'd4);
  assign _t159 = ((|_t158) && (|_t18));
  assign _t160 = ((|_t156) ? 32'd4 : _t154);
  assign _t161 = ({27'b0, c_state} == 32'd4);
  assign _t162 = ((|_t161) && (|_t18));
  assign _t163 = (cnt == 16'd3);
  assign _t164 = ((|_t163) ? 8'd170 : 8'd0);
  assign _t165 = (cnt == 16'd2);
  assign _t166 = ((|_t159) ? 8'd255 : _t157);
  assign _t167 = ((|_t165) ? 8'd1 : _t164);
  assign _t168 = ({27'b0, c_state} == 32'd5);
  assign _t169 = ((|_t168) && (|_t18));
  assign _t170 = ((|_t113) ? 16'd0 : _t111);
  assign _t171 = (cnt + 16'd1);
  assign _t172 = ({27'b0, c_state} == 32'd5);
  assign _t173 = ((|_t172) && (|_t18));
  assign _t174 = ((|_t169) ? _t167 : _t166);
  assign _t175 = (cnt == 16'd4);
  assign _t176 = ((|_t18) && (|_t175));
  assign _t177 = ({27'b0, c_state} == 32'd5);
  assign _t178 = ((|_t177) && (|_t176));
  assign _t179 = ((|_t162) ? 32'd0 : _t160);
  assign _t180 = ((|_t18) && (|_t175));
  assign _t181 = ({27'b0, c_state} == 32'd5);
  assign _t182 = ((|_t181) && (|_t180));
  assign _t183 = (cnt == 16'd2);
  assign _t184 = ((|_t183) ? 8'd128 : 8'd0);
  assign _t185 = (cnt == 16'd1);
  assign _t186 = ((|_t185) ? 8'd255 : _t184);
  assign _t187 = (cnt == 16'd0);
  assign _t188 = ((|_t178) ? 8'd255 : _t174);
  assign _t189 = ((|_t187) ? 8'd192 : _t186);
  assign _t190 = ({27'b0, c_state} == 32'd6);
  assign _t191 = ((|_t190) && (|_t18));
  assign _t192 = ((|_t173) ? _t171 : _t170);
  assign _t193 = (cnt + 16'd1);
  assign _t194 = ({27'b0, c_state} == 32'd6);
  assign _t195 = ((|_t194) && (|_t18));
  assign _t196 = ((|_t191) ? _t189 : _t188);
  assign _t197 = (cnt == 16'd4);
  assign _t198 = ((|_t18) && (|_t197));
  assign _t199 = ({27'b0, c_state} == 32'd6);
  assign _t200 = ((|_t199) && (|_t198));
  assign _t201 = ((|_t182) ? 32'd0 : _t179);
  assign _t202 = ((|_t18) && (|_t197));
  assign _t203 = ({27'b0, c_state} == 32'd6);
  assign _t204 = ((|_t203) && (|_t202));
  assign _t205 = ((|_t200) ? 8'd255 : _t196);
  assign _t206 = ({27'b0, c_state} == 32'd7);
  assign _t207 = ((|_t206) && (|_t18));
  assign _t208 = ({27'b0, c_state} == 32'd7);
  assign _t209 = ((|_t208) && (|_t18));
  assign _t210 = ({27'b0, c_state} == 32'd7);
  assign _t211 = ((|_t210) && (|_t18));
  assign _t212 = ((|_t204) ? 32'd0 : _t201);
  assign _t213 = ({27'b0, c_state} == 32'd7);
  assign _t214 = ((|_t213) && (|_t18));
  assign _t215 = ((|_t207) ? 8'd255 : _t205);
  assign _t216 = ({27'b0, c_state} == 32'd8);
  assign _t217 = (~asked);
  assign _t218 = ({27'b0, c_state} == 32'd8);
  assign _t219 = ((|_t218) && (|_t217));
  assign _t220 = ((|_t211) ? 1'd0 : asked);
  assign _t221 = ({27'b0, c_state} == 32'd8);
  assign _t222 = ((|_t221) && (|blk_ack));
  assign _t223 = bidx[8:0];
  assign _t224 = ({27'b0, c_state} == 32'd8);
  assign _t225 = ((|_t224) && (|blk_stb));
  assign _t226 = ({27'b0, c_state} == 32'd8);
  assign _t227 = ((|_t226) && (|blk_stb));
  assign _t228 = ({27'b0, c_state} == 32'd8);
  assign _t229 = ((|_t228) && (|blk_stb));
  assign _t230 = ((|_t209) ? 16'd0 : bidx);
  assign _t231 = (bidx + 16'd1);
  assign _t232 = ({27'b0, c_state} == 32'd8);
  assign _t233 = ((|_t232) && (|blk_stb));
  assign _t234 = ((|_t214) ? 32'd8 : _t212);
  assign _t235 = ({27'b0, c_state} == 32'd8);
  assign _t236 = ((|_t235) && (|blk_done));
  assign _t237 = ((|_t216) ? 8'd255 : _t215);
  assign _t238 = ({27'b0, c_state} == 32'd9);
  assign _t239 = ((|_t238) && (|_t18));
  assign _t240 = ((|_t195) ? _t193 : _t192);
  assign _t241 = ({27'b0, c_state} == 32'd9);
  assign _t242 = ((|_t241) && (|_t18));
  assign _t243 = ((|_t236) ? 32'd9 : _t234);
  assign _t244 = ({27'b0, c_state} == 32'd9);
  assign _t245 = ((|_t244) && (|_t18));
  assign _t246 = bidx[8:0];
  assign _t247 = ({27'b0, c_state} == 32'd10);
  assign _t248 = ((|_t247) && (|_t18));
  assign _t249 = ((|_t239) ? 8'd254 : _t237);
  assign _t250 = ({27'b0, c_state} == 32'd10);
  assign _t251 = ((|_t250) && (|_t18));
  assign _t252 = ((|_t245) ? 32'd10 : _t243);
  assign _t253 = ({27'b0, c_state} == 32'd10);
  assign _t254 = ((|_t253) && (|_t18));
  assign _t255 = ((|_t242) ? 16'd0 : _t240);
  assign _t256 = (cnt + 16'd1);
  assign _t257 = ({27'b0, c_state} == 32'd11);
  assign _t258 = ((|_t257) && (|_t18));
  assign _t259 = ((|_t251) ? buf_rd0_data : _t249);
  assign _t260 = (cnt == 16'd511);
  assign _t261 = ((|_t18) && (|_t260));
  assign _t262 = ({27'b0, c_state} == 32'd11);
  assign _t263 = ((|_t262) && (|_t261));
  assign _t264 = ((|_t254) ? 32'd11 : _t252);
  assign _t265 = ((|_t18) && (|_t260));
  assign _t266 = ({27'b0, c_state} == 32'd11);
  assign _t267 = ((|_t266) && (|_t265));
  assign _t268 = cnt[8:0];
  assign _t269 = ((|_t248) ? 9'd0 : _t246);
  assign _t270 = (_t268 + 9'd1);
  assign _t271 = (~_t260);
  assign _t272 = ((|_t18) && (|_t271));
  assign _t273 = ({27'b0, c_state} == 32'd11);
  assign _t274 = ((|_t273) && (|_t272));
  assign _t275 = ((|_t263) ? 8'd255 : _t259);
  assign _t276 = ((|_t18) && (|_t271));
  assign _t277 = ({27'b0, c_state} == 32'd11);
  assign _t278 = ((|_t277) && (|_t276));
  assign _t279 = ((|_t258) ? _t256 : _t255);
  assign _t280 = (cnt + 16'd1);
  assign _t281 = ({27'b0, c_state} == 32'd12);
  assign _t282 = ((|_t281) && (|_t18));
  assign _t283 = ((|_t278) ? buf_rd0_data : _t275);
  assign _t284 = (cnt >= 16'd513);
  assign _t285 = ((|_t18) && (|_t284));
  assign _t286 = ({27'b0, c_state} == 32'd12);
  assign _t287 = ((|_t286) && (|_t285));
  assign _t288 = ((|_t267) ? 32'd12 : _t264);
  assign _t289 = ((|_t18) && (|_t284));
  assign _t290 = ({27'b0, c_state} == 32'd12);
  assign _t291 = ((|_t290) && (|_t289));
  assign _t292 = ((|_t287) ? 8'd255 : _t283);
  assign _t293 = ({27'b0, c_state} == 32'd13);
  assign _t294 = ((|_t293) && (|_t18));
  assign _t295 = ((|_t291) ? 32'd0 : _t288);
  assign _t296 = ({27'b0, c_state} == 32'd13);
  assign _t297 = ((|_t296) && (|_t18));
  assign _t298 = ((|_t294) ? 8'd255 : _t292);
  assign _t299 = ({27'b0, c_state} == 32'd14);
  assign _t300 = ((|_t282) ? _t280 : _t279);
  assign _t301 = (rx == 8'd254);
  assign _t302 = ((|_t18) && (|_t301));
  assign _t303 = ({27'b0, c_state} == 32'd14);
  assign _t304 = ((|_t303) && (|_t302));
  assign _t305 = ((|_t297) ? 32'd14 : _t295);
  assign _t306 = ((|_t18) && (|_t301));
  assign _t307 = ({27'b0, c_state} == 32'd14);
  assign _t308 = ((|_t307) && (|_t306));
  assign _t309 = ((|_t299) ? 8'd255 : _t298);
  assign _t310 = ({27'b0, c_state} == 32'd15);
  assign _t311 = ((|_t225) ? _t223 : 9'd0);
  assign _t312 = cnt[8:0];
  assign _t313 = ({27'b0, c_state} == 32'd15);
  assign _t314 = ((|_t313) && (|_t18));
  assign _t315 = ((|_t227) ? blk_rdata : 8'd0);
  assign _t316 = ({27'b0, c_state} == 32'd15);
  assign _t317 = ((|_t316) && (|_t18));
  assign _t318 = ((|_t229) ? 1'd1 : 1'd0);
  assign _t319 = ({27'b0, c_state} == 32'd15);
  assign _t320 = ((|_t319) && (|_t18));
  assign _t321 = ((|_t304) ? 16'd0 : _t300);
  assign _t322 = (cnt + 16'd1);
  assign _t323 = ({27'b0, c_state} == 32'd15);
  assign _t324 = ((|_t323) && (|_t18));
  assign _t325 = ((|_t308) ? 32'd15 : _t305);
  assign _t326 = (cnt == 16'd511);
  assign _t327 = ((|_t18) && (|_t326));
  assign _t328 = ({27'b0, c_state} == 32'd15);
  assign _t329 = ((|_t328) && (|_t327));
  assign _t330 = ((|_t310) ? 8'd255 : _t309);
  assign _t331 = ({27'b0, c_state} == 32'd16);
  assign _t332 = ((|_t324) ? _t322 : _t321);
  assign _t333 = (cnt + 16'd1);
  assign _t334 = ({27'b0, c_state} == 32'd16);
  assign _t335 = ((|_t334) && (|_t18));
  assign _t336 = ((|_t331) ? 8'd255 : _t330);
  assign _t337 = (cnt >= 16'd513);
  assign _t338 = ((|_t18) && (|_t337));
  assign _t339 = ({27'b0, c_state} == 32'd16);
  assign _t340 = ((|_t339) && (|_t338));
  assign _t341 = ((|_t233) ? _t231 : _t230);
  assign _t342 = ((|_t18) && (|_t337));
  assign _t343 = ({27'b0, c_state} == 32'd16);
  assign _t344 = ((|_t343) && (|_t342));
  assign _t345 = ((|_t222) ? 1'd1 : _t220);
  assign _t346 = ((|_t18) && (|_t337));
  assign _t347 = ({27'b0, c_state} == 32'd16);
  assign _t348 = ((|_t347) && (|_t346));
  assign _t349 = ((|_t329) ? 32'd16 : _t325);
  assign _t350 = ((|_t18) && (|_t337));
  assign _t351 = ({27'b0, c_state} == 32'd16);
  assign _t352 = ((|_t351) && (|_t350));
  assign _t353 = ((|_t340) ? 8'd5 : _t336);
  assign _t354 = ({27'b0, c_state} == 32'd17);
  assign _t355 = ((|_t354) && (|_t18));
  assign _t356 = ((|_t219) ? 1'd1 : 1'd0);
  assign _t357 = (~asked);
  assign _t358 = ({27'b0, c_state} == 32'd17);
  assign _t359 = ((|_t358) && (|_t357));
  assign _t360 = ({27'b0, c_state} == 32'd17);
  assign _t361 = ((|_t360) && (|_t357));
  assign _t362 = ((|_t348) ? 1'd0 : _t345);
  assign _t363 = ({27'b0, c_state} == 32'd17);
  assign _t364 = ((|_t363) && (|blk_ack));
  assign _t365 = ((|_t344) ? 16'd0 : _t341);
  assign _t366 = (bidx + 16'd1);
  assign _t367 = ({27'b0, c_state} == 32'd17);
  assign _t368 = ((|_t367) && (|blk_stb));
  assign _t369 = ((|_t352) ? 32'd17 : _t349);
  assign _t370 = ({27'b0, c_state} == 32'd17);
  assign _t371 = ((|_t370) && (|blk_done));
  assign _t372 = ((|_t355) ? 8'd0 : _t353);
  assign _t373 = ({27'b0, c_state} == 32'd18);
  assign _t374 = ((|_t373) && (|_t18));
  assign _t375 = ((|_t371) ? 32'd18 : _t369);
  assign _t376 = ({27'b0, c_state} == 32'd18);
  assign _t377 = ((|_t376) && (|_t18));
  assign _t378 = ((|_t5) ? _t1 : rx);
  assign _t379 = ((|_t18) ? 4'd0 : _t14);
  assign _t380 = ((|_t374) ? 8'd255 : _t372);
  assign miso = ((|cs) ? 1'd1 : _t19);
  assign blk_req = ((|_t359) ? 1'd1 : _t356);
  assign blk_wr = ((|_t361) ? 1'd1 : 1'd0);
  assign blk_lba = lba;
  assign buf_rd0_addr = ((|_t274) ? _t270 : _t269);
  assign blk_wdata = buf_rd0_data;
  assign _t381 = ((|_t28) ? rx : cbuf0);
  assign _t382 = ((|_t44) ? _t42 : _t41);
  assign _t383 = ((|_t377) ? 32'd0 : _t375);
  assign _t384 = ((|_t40) ? _t38 : arg);
  assign k = ((|_t56) ? _t55 : 6'd0);
  assign _t385 = ((|_t59) ? 1'd1 : acmd);
  assign _t386 = ((|_t75) ? _t72 : tries);
  assign _t387 = ((|_t335) ? _t333 : _t332);
  assign _t388 = ((|_t129) ? arg : _t126);
  assign _t389 = ((|_t368) ? _t366 : _t365);
  assign _t390 = ((|_t364) ? 1'd1 : _t362);
  assign buf_wr0_addr = ((|_t314) ? _t312 : _t311);
  assign buf_wr0_data = ((|_t317) ? rx : _t315);
  assign buf_wr0_we = ((|_t320) ? 1'd1 : _t318);
  always @(posedge clk) begin
    if (rst) begin
      prev <= 1'd0;
      rx <= 8'd0;
      tx <= 8'd255;
      nbit <= 4'd0;
      cbuf0 <= 8'd0;
      arg <= 32'd0;
      idx <= 16'd0;
      lba <= 32'd0;
      cnt <= 16'd0;
      bidx <= 16'd0;
      asked <= 1'd0;
      acmd <= 1'd0;
      tries <= 4'd0;
      c_state <= 5'd0;
    end else begin
      prev <= sclk;
      rx <= _t378;
      tx <= _t380;
      nbit <= _t379;
      cbuf0 <= _t381;
      arg <= _t384;
      idx <= _t382;
      lba <= _t388;
      cnt <= _t387;
      bidx <= _t389;
      asked <= _t390;
      acmd <= _t385;
      tries <= _t386;
      c_state <= _t383;
    end
  end
  l8_ram_8x512_r1_w1_d _meminst_0_buf (
    .clk(clk),
    .rd0_addr(buf_rd0_addr),
    .rd0_data(buf_rd0_data),
    .wr0_we(buf_wr0_we),
    .wr0_addr(buf_wr0_addr),
    .wr0_data(buf_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module blk_pipe_1 (
  input  wire clk,
  input  wire rst,
  input  wire blk_req,
  input  wire blk_wr,
  input  wire [31:0] blk_lba,
  input  wire [7:0] blk_wdata,
  output wire blk_ack,
  output wire blk_stb,
  output wire [7:0] blk_rdata,
  output wire blk_done,
  output wire blk_err,
  output wire [7:0] req_data,
  output wire req_last,
  output wire req_valid,
  input  wire req_ready,
  input  wire [7:0] ans_data,
  input  wire ans_last,
  input  wire ans_valid,
  output wire ans_ready,
  output wire [31:0] ops
);
  reg  [31:0] lba;
  reg  iswr;
  reg  [15:0] idx;
  reg  [7:0] gap;
  reg  [31:0] nops;
  wire [8:0] buf_rd0_addr;
  wire [7:0] buf_rd0_data;
  wire [8:0] buf_wr0_addr;
  wire [7:0] buf_wr0_data;
  wire buf_wr0_we;
  reg  [2:0] m_state;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire [2:0] _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire [8:0] _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire [15:0] _t21;
  wire [15:0] _t22;
  wire _t23;
  wire [15:0] _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire [2:0] _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire [7:0] _t32;
  wire [7:0] _t33;
  wire _t34;
  wire [7:0] _t35;
  wire [7:0] _t36;
  wire _t37;
  wire [7:0] _t38;
  wire [7:0] _t39;
  wire _t40;
  wire [7:0] _t41;
  wire [7:0] _t42;
  wire _t43;
  wire [7:0] _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire [15:0] _t50;
  wire [15:0] _t51;
  wire _t52;
  wire _t53;
  wire [15:0] _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire [2:0] _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire [2:0] _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire _t69;
  wire _t70;
  wire _t71;
  wire [8:0] _t72;
  wire [8:0] _t73;
  wire _t74;
  wire [7:0] _t75;
  wire _t76;
  wire _t77;
  wire _t78;
  wire _t79;
  wire [15:0] _t80;
  wire [15:0] _t81;
  wire _t82;
  wire _t83;
  wire [2:0] _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire [2:0] _t90;
  wire _t91;
  wire _t92;
  wire _t93;
  wire _t94;
  wire _t95;
  wire [8:0] _t96;
  wire [8:0] _t97;
  wire _t98;
  wire _t99;
  wire [7:0] _t100;
  wire _t101;
  wire _t102;
  wire _t103;
  wire _t104;
  wire _t105;
  wire [15:0] _t106;
  wire [15:0] _t107;
  wire _t108;
  wire _t109;
  wire [15:0] _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire [2:0] _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire [15:0] _t125;
  wire [15:0] _t126;
  wire _t127;
  wire _t128;
  wire [2:0] _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire [7:0] _t134;
  wire _t135;
  wire [7:0] _t136;
  wire [7:0] _t137;
  wire _t138;
  wire _t139;
  wire [31:0] _t140;
  wire _t141;
  wire [2:0] _t142;
  wire _t143;
  wire [31:0] _t144;
  wire _t145;
  wire [15:0] _t146;
  wire [2:0] _t147;
  wire [7:0] _t148;
  wire [31:0] _t149;
  assign _t0 = ({29'b0, m_state} == 32'd0);
  assign _t1 = ((|_t0) && (|blk_req));
  assign _t2 = ({29'b0, m_state} == 32'd0);
  assign _t3 = ((|_t2) && (|blk_req));
  assign _t4 = ({29'b0, m_state} == 32'd0);
  assign _t5 = ((|_t4) && (|blk_req));
  assign _t6 = ({29'b0, m_state} == 32'd0);
  assign _t7 = ((|_t6) && (|blk_req));
  assign _t8 = ((|blk_req) && (|blk_wr));
  assign _t9 = ({29'b0, m_state} == 32'd0);
  assign _t10 = ((|_t9) && (|_t8));
  assign _t11 = ((|_t10) ? 32'd1 : m_state);
  assign _t12 = (~blk_wr);
  assign _t13 = ((|blk_req) && (|_t12));
  assign _t14 = ({29'b0, m_state} == 32'd0);
  assign _t15 = ((|_t14) && (|_t13));
  assign _t16 = ({29'b0, m_state} == 32'd1);
  assign _t17 = idx[8:0];
  assign _t18 = ({29'b0, m_state} == 32'd1);
  assign _t19 = ({29'b0, m_state} == 32'd1);
  assign _t20 = ({29'b0, m_state} == 32'd1);
  assign _t21 = ((|_t7) ? 16'd0 : idx);
  assign _t22 = (idx + 16'd1);
  assign _t23 = ({29'b0, m_state} == 32'd1);
  assign _t24 = ((|_t23) ? _t22 : _t21);
  assign _t25 = (idx == 16'd511);
  assign _t26 = ({29'b0, m_state} == 32'd1);
  assign _t27 = ((|_t26) && (|_t25));
  assign _t28 = ((|_t15) ? 32'd2 : _t11);
  assign _t29 = ({29'b0, m_state} == 32'd1);
  assign _t30 = ((|_t29) && (|_t25));
  assign _t31 = ({29'b0, m_state} == 32'd2);
  assign _t32 = lba[31:24];
  assign _t33 = lba[23:16];
  assign _t34 = (idx == 16'd3);
  assign _t35 = ((|_t34) ? _t33 : _t32);
  assign _t36 = lba[15:8];
  assign _t37 = (idx == 16'd2);
  assign _t38 = ((|_t37) ? _t36 : _t35);
  assign _t39 = lba[7:0];
  assign _t40 = (idx == 16'd1);
  assign _t41 = ((|_t40) ? _t39 : _t38);
  assign _t42 = ((|iswr) ? 8'd2 : 8'd1);
  assign _t43 = (idx == 16'd0);
  assign _t44 = ((|_t43) ? _t42 : _t41);
  assign _t45 = ({29'b0, m_state} == 32'd2);
  assign _t46 = (~iswr);
  assign _t47 = (idx == 16'd4);
  assign _t48 = ((|_t47) && (|_t46));
  assign _t49 = ({29'b0, m_state} == 32'd2);
  assign _t50 = ((|_t27) ? 16'd0 : _t24);
  assign _t51 = (idx + 16'd1);
  assign _t52 = ({29'b0, m_state} == 32'd2);
  assign _t53 = ((|_t52) && (|req_ready));
  assign _t54 = ((|_t53) ? _t51 : _t50);
  assign _t55 = (idx == 16'd4);
  assign _t56 = ((|req_ready) && (|_t55));
  assign _t57 = ({29'b0, m_state} == 32'd2);
  assign _t58 = ((|_t57) && (|_t56));
  assign _t59 = ((|_t30) ? 32'd2 : _t28);
  assign _t60 = ((|req_ready) && (|_t55));
  assign _t61 = ((|_t60) && (|iswr));
  assign _t62 = ({29'b0, m_state} == 32'd2);
  assign _t63 = ((|_t62) && (|_t61));
  assign _t64 = ((|_t63) ? 32'd3 : _t59);
  assign _t65 = (~iswr);
  assign _t66 = ((|req_ready) && (|_t55));
  assign _t67 = ((|_t66) && (|_t65));
  assign _t68 = ({29'b0, m_state} == 32'd2);
  assign _t69 = ((|_t68) && (|_t67));
  assign _t70 = ((|_t31) ? 1'd1 : 1'd0);
  assign _t71 = ({29'b0, m_state} == 32'd3);
  assign _t72 = idx[8:0];
  assign _t73 = idx[8:0];
  assign _t74 = ({29'b0, m_state} == 32'd3);
  assign _t75 = ((|_t45) ? _t44 : 8'd0);
  assign _t76 = ({29'b0, m_state} == 32'd3);
  assign _t77 = ((|_t49) ? _t48 : 1'd0);
  assign _t78 = (idx == 16'd511);
  assign _t79 = ({29'b0, m_state} == 32'd3);
  assign _t80 = ((|_t58) ? 16'd0 : _t54);
  assign _t81 = (idx + 16'd1);
  assign _t82 = ({29'b0, m_state} == 32'd3);
  assign _t83 = ((|_t82) && (|req_ready));
  assign _t84 = ((|_t69) ? 32'd5 : _t64);
  assign _t85 = (idx == 16'd511);
  assign _t86 = ((|req_ready) && (|_t85));
  assign _t87 = ({29'b0, m_state} == 32'd3);
  assign _t88 = ((|_t87) && (|_t86));
  assign _t89 = ({29'b0, m_state} == 32'd4);
  assign _t90 = ((|_t88) ? 32'd4 : _t84);
  assign _t91 = ((|ans_valid) && (|ans_last));
  assign _t92 = ({29'b0, m_state} == 32'd4);
  assign _t93 = ((|_t92) && (|_t91));
  assign _t94 = ((|_t89) ? 1'd1 : 1'd0);
  assign _t95 = ({29'b0, m_state} == 32'd5);
  assign _t96 = ((|_t18) ? _t17 : 9'd0);
  assign _t97 = idx[8:0];
  assign _t98 = ({29'b0, m_state} == 32'd5);
  assign _t99 = ((|_t98) && (|ans_valid));
  assign _t100 = ((|_t19) ? blk_wdata : 8'd0);
  assign _t101 = ({29'b0, m_state} == 32'd5);
  assign _t102 = ((|_t101) && (|ans_valid));
  assign _t103 = ((|_t20) ? 1'd1 : 1'd0);
  assign _t104 = ({29'b0, m_state} == 32'd5);
  assign _t105 = ((|_t104) && (|ans_valid));
  assign _t106 = ((|_t83) ? _t81 : _t80);
  assign _t107 = (idx + 16'd1);
  assign _t108 = ({29'b0, m_state} == 32'd5);
  assign _t109 = ((|_t108) && (|ans_valid));
  assign _t110 = ((|_t109) ? _t107 : _t106);
  assign _t111 = ((|ans_valid) && (|ans_last));
  assign _t112 = ({29'b0, m_state} == 32'd5);
  assign _t113 = ((|_t112) && (|_t111));
  assign _t114 = ((|ans_valid) && (|ans_last));
  assign _t115 = ({29'b0, m_state} == 32'd5);
  assign _t116 = ((|_t115) && (|_t114));
  assign _t117 = ((|_t93) ? 32'd7 : _t90);
  assign _t118 = ((|ans_valid) && (|ans_last));
  assign _t119 = ({29'b0, m_state} == 32'd5);
  assign _t120 = ((|_t119) && (|_t118));
  assign _t121 = ((|_t16) ? 1'd1 : 1'd0);
  assign _t122 = (gap == 8'd0);
  assign _t123 = ({29'b0, m_state} == 32'd6);
  assign _t124 = ((|_t123) && (|_t122));
  assign _t125 = ((|_t113) ? 16'd0 : _t110);
  assign _t126 = (idx + 16'd1);
  assign _t127 = ({29'b0, m_state} == 32'd6);
  assign _t128 = ((|_t127) && (|_t122));
  assign _t129 = ((|_t120) ? 32'd6 : _t117);
  assign _t130 = (idx == 16'd511);
  assign _t131 = ((|_t122) && (|_t130));
  assign _t132 = ({29'b0, m_state} == 32'd6);
  assign _t133 = ((|_t132) && (|_t131));
  assign _t134 = (gap + 8'd1);
  assign _t135 = (gap == 8'd0);
  assign _t136 = ((|_t116) ? 8'd0 : gap);
  assign _t137 = ((|_t135) ? 8'd0 : _t134);
  assign _t138 = ({29'b0, m_state} == 32'd6);
  assign _t139 = ({29'b0, m_state} == 32'd7);
  assign _t140 = (nops + 32'd1);
  assign _t141 = ({29'b0, m_state} == 32'd7);
  assign _t142 = ((|_t133) ? 32'd7 : _t129);
  assign _t143 = ({29'b0, m_state} == 32'd7);
  assign blk_ack = ((|_t1) ? 1'd1 : 1'd0);
  assign blk_stb = ((|_t124) ? 1'd1 : _t121);
  assign blk_done = ((|_t139) ? 1'd1 : 1'd0);
  assign blk_err = 1'd0;
  assign buf_rd0_addr = ((|_t74) ? _t73 : _t72);
  assign blk_rdata = buf_rd0_data;
  assign req_valid = ((|_t71) ? 1'd1 : _t70);
  assign req_data = ((|_t76) ? buf_rd0_data : _t75);
  assign req_last = ((|_t79) ? _t78 : _t77);
  assign ans_ready = ((|_t95) ? 1'd1 : _t94);
  assign ops = nops;
  assign _t144 = ((|_t3) ? blk_lba : lba);
  assign _t145 = ((|_t5) ? blk_wr : iswr);
  assign _t146 = ((|_t128) ? _t126 : _t125);
  assign _t147 = ((|_t143) ? 32'd0 : _t142);
  assign buf_wr0_addr = ((|_t99) ? _t97 : _t96);
  assign buf_wr0_data = ((|_t102) ? ans_data : _t100);
  assign buf_wr0_we = ((|_t105) ? 1'd1 : _t103);
  assign _t148 = ((|_t138) ? _t137 : _t136);
  assign _t149 = ((|_t141) ? _t140 : nops);
  always @(posedge clk) begin
    if (rst) begin
      lba <= 32'd0;
      iswr <= 1'd0;
      idx <= 16'd0;
      gap <= 8'd0;
      nops <= 32'd0;
      m_state <= 3'd0;
    end else begin
      lba <= _t144;
      iswr <= _t145;
      idx <= _t146;
      gap <= _t148;
      nops <= _t149;
      m_state <= _t147;
    end
  end
  l8_ram_8x512_r1_w1_d _meminst_0_buf (
    .clk(clk),
    .rd0_addr(buf_rd0_addr),
    .rd0_data(buf_rd0_data),
    .wr0_we(buf_wr0_we),
    .wr0_addr(buf_wr0_addr),
    .wr0_data(buf_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module stream_tx_8_2048_1024_1_200000 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] t_data,
  input  wire t_last,
  input  wire t_valid,
  output wire t_ready,
  input  wire [7:0] rx_data,
  input  wire rx_last,
  input  wire rx_valid,
  output wire rx_ready,
  output wire [7:0] tx_data,
  output wire tx_last,
  output wire tx_valid,
  input  wire tx_ready,
  output reg  err
);
  wire [10:0] ring_rd0_addr;
  wire [8:0] ring_rd0_data;
  wire [10:0] ring_wr0_addr;
  wire [8:0] ring_wr0_data;
  wire ring_wr0_we;
  wire [10:0] hdr_rd0_addr;
  wire [28:0] hdr_rd0_data;
  wire [10:0] hdr_wr0_addr;
  wire [28:0] hdr_wr0_data;
  wire hdr_wr0_we;
  reg  [11:0] wp;
  reg  [11:0] sp;
  reg  [11:0] rp;
  reg  [15:0] fw;
  reg  [15:0] fs;
  reg  [15:0] fr;
  reg  inf;
  reg  drop;
  reg  [15:0] wn;
  reg  [15:0] lost;
  reg  [3:0] ok;
  reg  [7:0] ob;
  reg  [39:0] oh;
  reg  [11:0] fstart;
  reg  [15:0] credit;
  reg  ack;
  reg  [15:0] base;
  reg  [31:0] rtx;
  reg  pnak;
  reg  [15:0] pnseq;
  reg  [11:0] pnsp;
  reg  [5:0] ik;
  reg  [39:0] ic;
  wire [7:0] ptx_data;
  wire ptx_last;
  wire ptx_valid;
  wire ptx_ready;
  wire [7:0] prx_data;
  wire prx_last;
  wire prx_valid;
  wire prx_ready;
  wire [11:0] cnt;
  wire [12:0] free;
  wire [7:0] rb;
  wire [15:0] aseqw;
  wire [15:0] aseq;
  wire [15:0] acred;
  wire [28:0] hv;
  wire [15:0] adist;
  wire [15:0] fdist;
  wire [28:0] hs;
  wire [8:0] wv;
  wire [15:0] seqw;
  wire [7:0] hflg;
  wire [15:0] hlost;
  wire [12:0] _t0;
  wire _t1;
  wire [15:0] _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [10:0] _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire [8:0] _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire [11:0] _t26;
  wire _t27;
  wire _t28;
  wire [10:0] _t29;
  wire _t30;
  wire _t31;
  wire [11:0] _t32;
  wire _t33;
  wire [28:0] _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire [15:0] _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire _t45;
  wire [15:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire [15:0] _t62;
  wire [15:0] _t63;
  wire _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [31:0] _t69;
  wire [39:0] _t70;
  wire _t71;
  wire _t72;
  wire [5:0] _t73;
  wire [5:0] _t74;
  wire [7:0] _t75;
  wire [7:0] _t76;
  wire [15:0] _t77;
  wire [7:0] _t78;
  wire [7:0] _t79;
  wire [15:0] _t80;
  wire _t81;
  wire _t82;
  wire _t83;
  wire _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire _t90;
  wire _t91;
  wire _t92;
  wire _t93;
  wire _t94;
  wire _t95;
  wire _t96;
  wire _t97;
  wire _t98;
  wire _t99;
  wire _t100;
  wire _t101;
  wire _t102;
  wire [15:0] _t103;
  wire [31:0] _t104;
  wire [11:0] _t105;
  wire _t106;
  wire [11:0] _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire [11:0] _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire [15:0] _t124;
  wire _t125;
  wire _t126;
  wire [11:0] _t127;
  wire [11:0] _t128;
  wire _t129;
  wire _t130;
  wire [15:0] _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire [11:0] _t137;
  wire _t138;
  wire [31:0] _t139;
  wire [31:0] _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire [15:0] _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [11:0] _t154;
  wire [31:0] _t155;
  wire _t156;
  wire [6:0] _t157;
  wire [39:0] _t158;
  wire _t159;
  wire _t160;
  wire [15:0] _t161;
  wire _t162;
  wire _t163;
  wire _t164;
  wire _t165;
  wire _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire [11:0] _t171;
  wire [11:0] _t172;
  wire _t173;
  wire _t174;
  wire [31:0] _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire [7:0] _t180;
  wire _t181;
  wire [31:0] _t182;
  wire [39:0] _t183;
  wire [39:0] _t184;
  wire _t185;
  wire _t186;
  wire [3:0] _t187;
  wire [3:0] _t188;
  wire _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire _t193;
  wire [7:0] _t194;
  wire [7:0] _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire _t204;
  wire _t205;
  wire _t206;
  wire [11:0] _t207;
  wire [11:0] _t208;
  wire _t209;
  wire _t210;
  wire _t211;
  wire [3:0] _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire [15:0] _t218;
  wire [15:0] _t219;
  wire _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire [7:0] _t224;
  wire [7:0] _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire [15:0] _t230;
  wire _t231;
  wire [11:0] _t232;
  wire [15:0] _t233;
  wire [15:0] _t234;
  wire _t235;
  wire _t236;
  wire [11:0] _t237;
  wire [39:0] _t238;
  wire [5:0] _t239;
  wire [15:0] _t240;
  wire _t241;
  wire [15:0] _t242;
  wire [31:0] _t243;
  wire _t244;
  wire [15:0] _t245;
  wire [11:0] _t246;
  wire [11:0] _t247;
  wire [15:0] _t248;
  wire [15:0] _t249;
  wire [11:0] _t250;
  wire [39:0] _t251;
  wire [3:0] _t252;
  wire [7:0] _t253;
  wire pr_arx_ready;
  wire [7:0] pr_atx_data;
  wire pr_atx_last;
  wire pr_atx_valid;
  wire [7:0] pr_prx_data;
  wire pr_prx_last;
  wire pr_prx_valid;
  wire pr_ptx_ready;
  assign _t0 = {1'b0, cnt};
  assign _t1 = (free >= 13'd1024);
  assign _t2 = (lost + 16'd1);
  assign _t3 = (~_t1);
  assign _t4 = (~drop);
  assign _t5 = (~inf);
  assign _t6 = ((|_t5) && (|_t4));
  assign _t7 = ((|_t6) && (|_t3));
  assign _t8 = ((|t_valid) && (|t_ready));
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = (~t_last);
  assign _t11 = ((|_t8) && (|_t7));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = wp[10:0];
  assign _t14 = (wn < 16'd1024);
  assign _t15 = ((|_t6) && (|_t1));
  assign _t16 = ((|inf) || (|_t15));
  assign _t17 = ((|_t8) && (|_t16));
  assign _t18 = ((|_t17) && (|_t14));
  assign _t19 = (wn == 16'd1023);
  assign _t20 = ((|t_last) || (|_t19));
  assign _t21 = {_t20, t_data};
  assign _t22 = ((|_t8) && (|_t16));
  assign _t23 = ((|_t22) && (|_t14));
  assign _t24 = ((|_t8) && (|_t16));
  assign _t25 = ((|_t24) && (|_t14));
  assign _t26 = (wp + 12'd1);
  assign _t27 = ((|_t8) && (|_t16));
  assign _t28 = ((|_t27) && (|_t14));
  assign _t29 = fw[10:0];
  assign _t30 = ((|_t8) && (|_t16));
  assign _t31 = ((|_t30) && (|t_last));
  assign _t32 = ((|inf) ? fstart : wp);
  assign _t33 = (wn >= 16'd1024);
  assign _t34 = {_t33, lost, _t32};
  assign _t35 = ((|_t8) && (|_t16));
  assign _t36 = ((|_t35) && (|t_last));
  assign _t37 = ((|_t8) && (|_t16));
  assign _t38 = ((|_t37) && (|t_last));
  assign _t39 = (fw + 16'd1);
  assign _t40 = ((|_t8) && (|_t16));
  assign _t41 = ((|_t40) && (|t_last));
  assign _t42 = ((|_t8) && (|_t16));
  assign _t43 = ((|_t42) && (|t_last));
  assign _t44 = ((|_t8) && (|_t16));
  assign _t45 = ((|_t44) && (|t_last));
  assign _t46 = ((|_t9) ? _t2 : lost);
  assign _t47 = ((|_t8) && (|_t16));
  assign _t48 = ((|_t47) && (|t_last));
  assign _t49 = (wn >= 16'd1024);
  assign _t50 = ((|1'd1) && (|_t49));
  assign _t51 = ((|_t8) && (|_t16));
  assign _t52 = ((|_t51) && (|t_last));
  assign _t53 = ((|_t52) && (|_t50));
  assign _t54 = (~inf);
  assign _t55 = (~t_last);
  assign _t56 = ((|_t8) && (|_t16));
  assign _t57 = ((|_t56) && (|_t55));
  assign _t58 = ((|_t57) && (|_t54));
  assign _t59 = ((|_t45) ? 1'd0 : inf);
  assign _t60 = ((|_t8) && (|_t16));
  assign _t61 = ((|_t60) && (|_t55));
  assign _t62 = ((|_t43) ? 16'd0 : wn);
  assign _t63 = (wn + 16'd1);
  assign _t64 = ((|_t8) && (|_t16));
  assign _t65 = ((|_t64) && (|_t55));
  assign _t66 = ((|_t12) ? 1'd1 : drop);
  assign _t67 = ((|drop) && (|t_last));
  assign _t68 = ((|_t8) && (|_t67));
  assign _t69 = ic[39:8];
  assign _t70 = {rb, _t69};
  assign _t71 = (ik < 6'd5);
  assign _t72 = ((|prx_valid) && (|_t71));
  assign _t73 = (ik + 6'd1);
  assign _t74 = ((|prx_last) ? 6'd0 : _t73);
  assign _t75 = ic[15:8];
  assign _t76 = ic[23:16];
  assign _t77 = (aseqw - base);
  assign _t78 = ic[31:24];
  assign _t79 = ic[39:32];
  assign _t80 = (aseqw - fr);
  assign _t81 = (~ack);
  assign _t82 = rb[7];
  assign _t83 = (ik == 6'd4);
  assign _t84 = ((|prx_valid) && (|prx_last));
  assign _t85 = ((|_t84) && (|_t83));
  assign _t86 = ((|_t85) && (|_t82));
  assign _t87 = ((|1'd1) && (|_t86));
  assign _t88 = ((|_t87) && (|_t81));
  assign _t89 = rb[5];
  assign _t90 = ((|1'd1) && (|_t86));
  assign _t91 = ((|_t90) && (|_t89));
  assign _t92 = (fs != fr);
  assign _t93 = ((|_t91) && (|_t92));
  assign _t94 = ((|_t91) && (|_t92));
  assign _t95 = ((|_t91) && (|_t92));
  assign _t96 = ((|_t91) ? 1'd1 : ack);
  assign _t97 = (adist <= fdist);
  assign _t98 = rb[5];
  assign _t99 = (~_t98);
  assign _t100 = ((|1'd1) && (|_t86));
  assign _t101 = ((|_t100) && (|_t99));
  assign _t102 = ((|_t101) && (|_t97));
  assign _t103 = ((|_t91) ? acred : credit);
  assign _t104 = ((|_t91) ? 32'd0 : rtx);
  assign _t105 = hv[11:0];
  assign _t106 = (aseq == fw);
  assign _t107 = ((|_t106) ? wp : _t105);
  assign _t108 = (adist != 16'd0);
  assign _t109 = ((|_t102) && (|_t108));
  assign _t110 = ((|_t102) && (|_t108));
  assign _t111 = (ok == 4'd0);
  assign _t112 = (fs != aseq);
  assign _t113 = rb[6];
  assign _t114 = ((|_t113) && (|_t112));
  assign _t115 = ((|_t102) && (|_t114));
  assign _t116 = ((|_t115) && (|_t111));
  assign _t117 = hv[11:0];
  assign _t118 = ((|_t102) && (|_t114));
  assign _t119 = ((|_t118) && (|_t111));
  assign _t120 = ((|_t93) ? 1'd1 : pnak);
  assign _t121 = (~_t111);
  assign _t122 = ((|_t102) && (|_t114));
  assign _t123 = ((|_t122) && (|_t121));
  assign _t124 = ((|_t94) ? fr : pnseq);
  assign _t125 = ((|_t102) && (|_t114));
  assign _t126 = ((|_t125) && (|_t121));
  assign _t127 = ((|_t95) ? rp : pnsp);
  assign _t128 = hv[11:0];
  assign _t129 = ((|_t102) && (|_t114));
  assign _t130 = ((|_t129) && (|_t121));
  assign _t131 = ((|_t116) ? aseq : fs);
  assign _t132 = (~_t86);
  assign _t133 = (ok == 4'd0);
  assign _t134 = ((|1'd1) && (|pnak));
  assign _t135 = ((|_t134) && (|_t133));
  assign _t136 = ((|_t135) && (|_t132));
  assign _t137 = ((|_t119) ? _t117 : sp);
  assign _t138 = ((|_t123) ? 1'd1 : _t120);
  assign _t139 = ((|_t102) ? 32'd0 : _t104);
  assign _t140 = (rtx + 32'd1);
  assign _t141 = (~_t86);
  assign _t142 = (fs != fr);
  assign _t143 = (ok == 4'd0);
  assign _t144 = ((|1'd1) && (|_t143));
  assign _t145 = ((|_t144) && (|_t142));
  assign _t146 = ((|_t145) && (|_t141));
  assign _t147 = ((|_t136) ? pnseq : _t131);
  assign _t148 = (rtx >= 32'd200000);
  assign _t149 = (fs != fr);
  assign _t150 = (ok == 4'd0);
  assign _t151 = ((|1'd1) && (|_t150));
  assign _t152 = ((|_t151) && (|_t149));
  assign _t153 = ((|_t152) && (|_t148));
  assign _t154 = ((|_t136) ? pnsp : _t137);
  assign _t155 = ((|_t146) ? _t140 : _t139);
  assign _t156 = hs[28];
  assign _t157 = 7'd0;
  assign _t158 = {hflg, hlost, seqw};
  assign _t159 = (~pnak);
  assign _t160 = (~_t153);
  assign _t161 = (fs - fr);
  assign _t162 = (_t161 < credit);
  assign _t163 = ((|ack) && (|_t162));
  assign _t164 = ((|1'd0) || (|_t163));
  assign _t165 = (fs != fw);
  assign _t166 = ((|_t165) && (|_t164));
  assign _t167 = ((|_t166) && (|_t160));
  assign _t168 = ((|_t167) && (|_t159));
  assign _t169 = (ok == 4'd0);
  assign _t170 = ((|_t169) && (|_t168));
  assign _t171 = ((|_t153) ? rp : _t154);
  assign _t172 = hs[11:0];
  assign _t173 = ((|_t169) && (|_t168));
  assign _t174 = ((|_t169) && (|_t168));
  assign _t175 = ((|_t153) ? 32'd0 : _t155);
  assign _t176 = ((|_t169) && (|_t168));
  assign _t177 = (ok <= 4'd5);
  assign _t178 = (~_t169);
  assign _t179 = ((|_t178) && (|_t177));
  assign _t180 = oh[7:0];
  assign _t181 = ((|_t178) && (|_t177));
  assign _t182 = oh[39:8];
  assign _t183 = ((|_t170) ? _t158 : oh);
  assign _t184 = {8'd0, _t182};
  assign _t185 = ((|_t178) && (|_t177));
  assign _t186 = ((|_t185) && (|ptx_ready));
  assign _t187 = ((|_t174) ? 4'd1 : ok);
  assign _t188 = (ok + 4'd1);
  assign _t189 = ((|_t178) && (|_t177));
  assign _t190 = ((|_t189) && (|ptx_ready));
  assign _t191 = ((|_t179) ? 1'd1 : 1'd0);
  assign _t192 = (~_t177);
  assign _t193 = ((|_t178) && (|_t192));
  assign _t194 = ((|_t181) ? _t180 : 8'd0);
  assign _t195 = wv[7:0];
  assign _t196 = (ob == 8'd0);
  assign _t197 = ((|_t178) && (|_t192));
  assign _t198 = ((|_t197) && (|_t196));
  assign _t199 = wv[8];
  assign _t200 = (ob == 8'd0);
  assign _t201 = ((|_t200) && (|_t199));
  assign _t202 = ((|_t178) && (|_t192));
  assign _t203 = (ob == 8'd0);
  assign _t204 = ((|_t178) && (|_t192));
  assign _t205 = ((|_t204) && (|ptx_ready));
  assign _t206 = ((|_t205) && (|_t203));
  assign _t207 = ((|_t173) ? _t172 : _t171);
  assign _t208 = (sp + 12'd1);
  assign _t209 = ((|_t178) && (|_t192));
  assign _t210 = ((|_t209) && (|ptx_ready));
  assign _t211 = ((|_t210) && (|_t203));
  assign _t212 = ((|_t190) ? _t188 : _t187);
  assign _t213 = wv[8];
  assign _t214 = ((|_t178) && (|_t192));
  assign _t215 = ((|_t214) && (|ptx_ready));
  assign _t216 = ((|_t215) && (|_t203));
  assign _t217 = ((|_t216) && (|_t213));
  assign _t218 = ((|_t153) ? fr : _t147);
  assign _t219 = (fs + 16'd1);
  assign _t220 = ((|_t178) && (|_t192));
  assign _t221 = ((|_t220) && (|ptx_ready));
  assign _t222 = ((|_t221) && (|_t203));
  assign _t223 = ((|_t222) && (|_t213));
  assign _t224 = ((|_t206) ? 8'd0 : ob);
  assign _t225 = (ob + 8'd1);
  assign _t226 = (~_t203);
  assign _t227 = ((|_t178) && (|_t192));
  assign _t228 = ((|_t227) && (|ptx_ready));
  assign _t229 = ((|_t228) && (|_t226));
  assign rx_ready = pr_arx_ready;
  assign tx_data = pr_atx_data;
  assign tx_last = pr_atx_last;
  assign tx_valid = pr_atx_valid;
  assign prx_data = pr_prx_data;
  assign prx_last = pr_prx_last;
  assign prx_valid = pr_prx_valid;
  assign ptx_ready = pr_ptx_ready;
  assign cnt = (wp - rp);
  assign free = (13'd2048 - _t0);
  assign t_ready = ((|inf) || (|_t1));
  assign _t230 = ((|_t48) ? 16'd0 : _t46);
  assign _t231 = ((|_t68) ? 1'd0 : _t66);
  assign ring_wr0_addr = ((|_t18) ? _t13 : 11'd0);
  assign ring_wr0_data = ((|_t23) ? _t21 : 9'd0);
  assign ring_wr0_we = ((|_t25) ? 1'd1 : 1'd0);
  assign _t232 = ((|_t28) ? _t26 : wp);
  assign hdr_wr0_addr = ((|_t31) ? _t29 : 11'd0);
  assign hdr_wr0_data = ((|_t36) ? _t34 : 29'd0);
  assign hdr_wr0_we = ((|_t38) ? 1'd1 : 1'd0);
  assign _t233 = ((|_t41) ? _t39 : fw);
  assign _t234 = ((|_t65) ? _t63 : _t62);
  assign _t235 = ((|_t61) ? 1'd1 : _t59);
  assign _t236 = ((|_t53) ? 1'd1 : err);
  assign _t237 = ((|_t58) ? wp : fstart);
  assign prx_ready = 1'd1;
  assign rb = prx_data;
  assign _t238 = ((|_t72) ? _t70 : ic);
  assign _t239 = ((|prx_valid) ? _t74 : ik);
  assign aseqw = {_t76, _t75};
  assign aseq = ((|ack) ? _t77 : fr);
  assign acred = {_t79, _t78};
  assign hdr_rd0_addr = fs[10:0];
  assign hv = hdr_rd0_data;
  assign adist = (aseq - fr);
  assign fdist = (fs - fr);
  assign _t240 = ((|_t88) ? _t80 : base);
  assign _t241 = ((|_t102) ? 1'd1 : _t96);
  assign _t242 = ((|_t102) ? acred : _t103);
  assign _t243 = ((|_t176) ? 32'd0 : _t175);
  assign _t244 = ((|_t136) ? 1'd0 : _t138);
  assign _t245 = ((|_t126) ? aseq : _t124);
  assign _t246 = ((|_t130) ? _t128 : _t127);
  assign _t247 = ((|_t109) ? _t107 : rp);
  assign _t248 = ((|_t110) ? aseq : fr);
  assign _t249 = ((|_t223) ? _t219 : _t218);
  assign _t250 = ((|_t211) ? _t208 : _t207);
  assign hs = hdr_rd0_data;
  assign ring_rd0_addr = sp[10:0];
  assign wv = ring_rd0_data;
  assign seqw = (fs + base);
  assign hflg = {_t157, _t156};
  assign hlost = hs[27:12];
  assign ptx_valid = ((|_t193) ? 1'd1 : _t191);
  assign ptx_data = ((|_t198) ? _t195 : _t194);
  assign ptx_last = ((|_t202) ? _t201 : 1'd0);
  assign _t251 = ((|_t186) ? _t184 : _t183);
  assign _t252 = ((|_t217) ? 4'd0 : _t212);
  assign _t253 = ((|_t229) ? _t225 : _t224);
  always @(posedge clk) begin
    if (rst) begin
      wp <= 12'd0;
      sp <= 12'd0;
      rp <= 12'd0;
      fw <= 16'd0;
      fs <= 16'd0;
      fr <= 16'd0;
      inf <= 1'd0;
      drop <= 1'd0;
      wn <= 16'd0;
      lost <= 16'd0;
      err <= 1'd0;
      ok <= 4'd0;
      ob <= 8'd0;
      oh <= 40'd0;
      fstart <= 12'd0;
      credit <= 16'd0;
      ack <= 1'd0;
      base <= 16'd0;
      rtx <= 32'd0;
      pnak <= 1'd0;
      pnseq <= 16'd0;
      pnsp <= 12'd0;
      ik <= 6'd0;
      ic <= 40'd0;
    end else begin
      wp <= _t232;
      sp <= _t250;
      rp <= _t247;
      fw <= _t233;
      fs <= _t249;
      fr <= _t248;
      inf <= _t235;
      drop <= _t231;
      wn <= _t234;
      lost <= _t230;
      err <= _t236;
      ok <= _t252;
      ob <= _t253;
      oh <= _t251;
      fstart <= _t237;
      credit <= _t242;
      ack <= _t241;
      base <= _t240;
      rtx <= _t243;
      pnak <= _t244;
      pnseq <= _t245;
      pnsp <= _t246;
      ik <= _t239;
      ic <= _t238;
    end
  end
  l8_ram_9x2048_r1_w1_d _meminst_0_ring (
    .clk(clk),
    .rd0_addr(ring_rd0_addr),
    .rd0_data(ring_rd0_data),
    .wr0_we(ring_wr0_we),
    .wr0_addr(ring_wr0_addr),
    .wr0_data(ring_wr0_data)
  );
  l8_ram_29x2048_r1_w1_d _meminst_1_hdr (
    .clk(clk),
    .rd0_addr(hdr_rd0_addr),
    .rd0_data(hdr_rd0_data),
    .wr0_we(hdr_wr0_we),
    .wr0_addr(hdr_wr0_addr),
    .wr0_data(hdr_wr0_data)
  );
  dbg_peer pr (
    .clk(clk),
    .rst(rst),
    .arx_data(rx_data),
    .arx_last(rx_last),
    .arx_valid(rx_valid),
    .arx_ready(pr_arx_ready),
    .atx_data(pr_atx_data),
    .atx_last(pr_atx_last),
    .atx_valid(pr_atx_valid),
    .atx_ready(tx_ready),
    .prx_data(pr_prx_data),
    .prx_last(pr_prx_last),
    .prx_valid(pr_prx_valid),
    .prx_ready(prx_ready),
    .ptx_data(ptx_data),
    .ptx_last(ptx_last),
    .ptx_valid(ptx_valid),
    .ptx_ready(pr_ptx_ready)
  );
endmodule
`default_nettype wire

`default_nettype none
module stream_rx_8_2048_1024_1_50000 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] rx_data,
  input  wire rx_last,
  input  wire rx_valid,
  output wire rx_ready,
  output wire [7:0] tx_data,
  output wire tx_last,
  output wire tx_valid,
  input  wire tx_ready,
  output wire [7:0] s_data,
  output wire s_last,
  output wire s_valid,
  input  wire s_ready,
  input  wire [95:0] peer,
  output reg  [15:0] lost,
  output reg  [15:0] cut,
  output reg  [15:0] gaps
);
  wire [10:0] ring_rd0_addr;
  wire [8:0] ring_rd0_data;
  wire [10:0] ring_wr0_addr;
  wire [8:0] ring_wr0_data;
  wire ring_wr0_we;
  reg  [11:0] wp;
  reg  [11:0] rp;
  reg  [11:0] fw;
  reg  [11:0] fr;
  reg  [15:0] l8_expect;
  reg  [7:0] ik;
  reg  [39:0] ih;
  reg  [7:0] iw;
  reg  [7:0] iword;
  reg  [11:0] wstart;
  reg  ovf;
  reg  bad;
  wire [7:0] ob;
  reg  [4:0] ok;
  reg  [39:0] oh;
  reg  ctlw;
  reg  [31:0] idle;
  reg  [31:0] lim;
  reg  want;
  reg  nak;
  reg  ingap;
  reg  seen;
  reg  synced;
  reg  [95:0] isnd;
  reg  [95:0] lpeer;
  reg  learned;
  wire [11:0] cnt;
  wire [12:0] free;
  wire [15:0] credits;
  wire [7:0] rb;
  wire [7:0] wfull;
  wire [15:0] sq;
  wire [15:0] ls;
  wire [15:0] dsq;
  wire [8:0] wv;
  wire [7:0] cfl2;
  wire [95:0] pw;
  wire [12:0] _t0;
  wire [31:0] _t1;
  wire [39:0] _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire [87:0] _t7;
  wire [95:0] _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire [87:0] _t12;
  wire [95:0] _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire [7:0] _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire [10:0] _t34;
  wire _t35;
  wire _t36;
  wire _t37;
  wire _t38;
  wire [8:0] _t39;
  wire _t40;
  wire _t41;
  wire _t42;
  wire _t43;
  wire _t44;
  wire _t45;
  wire [11:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire [7:0] _t52;
  wire [7:0] _t53;
  wire _t54;
  wire _t55;
  wire _t56;
  wire [7:0] _t57;
  wire _t58;
  wire [7:0] _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire _t66;
  wire [11:0] _t67;
  wire _t68;
  wire _t69;
  wire _t70;
  wire _t71;
  wire _t72;
  wire _t73;
  wire _t74;
  wire _t75;
  wire [15:0] _t76;
  wire _t77;
  wire _t78;
  wire _t79;
  wire [11:0] _t80;
  wire _t81;
  wire _t82;
  wire _t83;
  wire _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire [7:0] _t88;
  wire [7:0] _t89;
  wire [15:0] _t90;
  wire _t91;
  wire _t92;
  wire [7:0] _t93;
  wire [7:0] _t94;
  wire [15:0] _t95;
  wire _t96;
  wire _t97;
  wire _t98;
  wire [15:0] _t99;
  wire [15:0] _t100;
  wire _t101;
  wire _t102;
  wire [15:0] _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire [15:0] _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire _t126;
  wire _t127;
  wire _t128;
  wire [15:0] _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire [15:0] _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire [11:0] _t155;
  wire _t156;
  wire [11:0] _t157;
  wire _t158;
  wire _t159;
  wire [4:0] _t160;
  wire _t161;
  wire [1:0] _t162;
  wire [7:0] _t163;
  wire [5:0] _t164;
  wire _t165;
  wire _t166;
  wire [7:0] _t167;
  wire [6:0] _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire _t177;
  wire _t178;
  wire _t179;
  wire _t180;
  wire [39:0] _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire _t185;
  wire _t186;
  wire _t187;
  wire [31:0] _t188;
  wire _t189;
  wire [31:0] _t190;
  wire [31:0] _t191;
  wire _t192;
  wire _t193;
  wire _t194;
  wire _t195;
  wire _t196;
  wire _t197;
  wire _t198;
  wire [7:0] _t199;
  wire _t200;
  wire _t201;
  wire _t202;
  wire _t203;
  wire [7:0] _t204;
  wire [7:0] _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire [7:0] _t209;
  wire [7:0] _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire [7:0] _t214;
  wire [7:0] _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire [7:0] _t219;
  wire [7:0] _t220;
  wire _t221;
  wire _t222;
  wire _t223;
  wire [7:0] _t224;
  wire [7:0] _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire [7:0] _t229;
  wire [7:0] _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire [7:0] _t234;
  wire [7:0] _t235;
  wire _t236;
  wire _t237;
  wire _t238;
  wire [7:0] _t239;
  wire [7:0] _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire [7:0] _t244;
  wire [7:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire [7:0] _t249;
  wire [7:0] _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire [7:0] _t254;
  wire [7:0] _t255;
  wire _t256;
  wire _t257;
  wire _t258;
  wire [4:0] _t259;
  wire [4:0] _t260;
  wire _t261;
  wire _t262;
  wire [7:0] _t263;
  wire [7:0] _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire [31:0] _t271;
  wire [39:0] _t272;
  wire [39:0] _t273;
  wire _t274;
  wire _t275;
  wire _t276;
  wire [4:0] _t277;
  wire _t278;
  wire [4:0] _t279;
  wire [4:0] _t280;
  wire _t281;
  wire _t282;
  wire _t283;
  wire [7:0] _t284;
  wire _t285;
  wire _t286;
  wire _t287;
  wire _t288;
  wire _t289;
  wire _t290;
  wire [4:0] _t291;
  wire _t292;
  wire _t293;
  wire _t294;
  wire [39:0] _t295;
  wire [95:0] _t296;
  wire [95:0] _t297;
  wire _t298;
  wire [7:0] _t299;
  wire [7:0] _t300;
  wire _t301;
  wire [11:0] _t302;
  wire [7:0] _t303;
  wire _t304;
  wire _t305;
  wire [31:0] _t306;
  wire [31:0] _t307;
  wire [15:0] _t308;
  wire [11:0] _t309;
  wire _t310;
  wire [11:0] _t311;
  wire [15:0] _t312;
  wire _t313;
  wire [15:0] _t314;
  wire _t315;
  wire _t316;
  wire [15:0] _t317;
  wire [11:0] _t318;
  wire [11:0] _t319;
  wire _t320;
  wire [39:0] _t321;
  wire [4:0] _t322;
  assign _t0 = {1'b0, cnt};
  assign _t1 = ih[39:8];
  assign _t2 = {rb, _t1};
  assign _t3 = (ik >= 8'd12);
  assign _t4 = (ik < 8'd17);
  assign _t5 = ((|rx_valid) && (|_t4));
  assign _t6 = ((|_t5) && (|_t3));
  assign _t7 = isnd[95:8];
  assign _t8 = {rb, _t7};
  assign _t9 = (~_t3);
  assign _t10 = ((|rx_valid) && (|_t4));
  assign _t11 = ((|_t10) && (|_t9));
  assign _t12 = isnd[95:8];
  assign _t13 = {rb, _t12};
  assign _t14 = (ik == 8'd11);
  assign _t15 = ((|rx_valid) && (|_t4));
  assign _t16 = ((|_t15) && (|_t9));
  assign _t17 = ((|_t16) && (|_t14));
  assign _t18 = ((|rx_valid) && (|_t4));
  assign _t19 = ((|_t18) && (|_t9));
  assign _t20 = ((|_t19) && (|_t14));
  assign _t21 = (ik + 8'd1);
  assign _t22 = ((|rx_valid) && (|_t4));
  assign _t23 = (iw == 8'd0);
  assign _t24 = (~_t4);
  assign _t25 = ((|rx_valid) && (|_t24));
  assign _t26 = ((|_t25) && (|_t23));
  assign _t27 = (free == 13'd0);
  assign _t28 = ((|_t27) || (|ovf));
  assign _t29 = ((|_t28) || (|bad));
  assign _t30 = (iw == 8'd0);
  assign _t31 = ((|rx_valid) && (|_t24));
  assign _t32 = ((|_t31) && (|_t30));
  assign _t33 = ((|_t32) && (|_t29));
  assign _t34 = wp[10:0];
  assign _t35 = (~_t29);
  assign _t36 = ((|rx_valid) && (|_t24));
  assign _t37 = ((|_t36) && (|_t30));
  assign _t38 = ((|_t37) && (|_t35));
  assign _t39 = {rx_last, wfull};
  assign _t40 = ((|rx_valid) && (|_t24));
  assign _t41 = ((|_t40) && (|_t30));
  assign _t42 = ((|_t41) && (|_t35));
  assign _t43 = ((|rx_valid) && (|_t24));
  assign _t44 = ((|_t43) && (|_t30));
  assign _t45 = ((|_t44) && (|_t35));
  assign _t46 = (wp + 12'd1);
  assign _t47 = ((|rx_valid) && (|_t24));
  assign _t48 = ((|_t47) && (|_t30));
  assign _t49 = ((|_t48) && (|_t35));
  assign _t50 = ((|rx_valid) && (|_t24));
  assign _t51 = ((|_t50) && (|_t30));
  assign _t52 = ((|_t51) ? 8'd0 : iw);
  assign _t53 = (iw + 8'd1);
  assign _t54 = (~_t30);
  assign _t55 = ((|rx_valid) && (|_t24));
  assign _t56 = ((|_t55) && (|_t54));
  assign _t57 = ((|_t22) ? _t21 : ik);
  assign _t58 = ((|rx_valid) && (|rx_last));
  assign _t59 = ((|_t56) ? _t53 : _t52);
  assign _t60 = ((|rx_valid) && (|rx_last));
  assign _t61 = ((|_t33) ? 1'd1 : ovf);
  assign _t62 = ((|rx_valid) && (|rx_last));
  assign _t63 = ((|rx_valid) && (|rx_last));
  assign _t64 = ((|rx_valid) && (|rx_last));
  assign _t65 = ((|rx_valid) && (|rx_last));
  assign _t66 = ((|rx_valid) && (|rx_last));
  assign _t67 = ((|_t49) ? _t46 : wp);
  assign _t68 = (ik == 8'd16);
  assign _t69 = ((|ovf) || (|_t68));
  assign _t70 = (~bad);
  assign _t71 = (ik >= 8'd16);
  assign _t72 = ((|_t71) && (|_t70));
  assign _t73 = ((|rx_valid) && (|rx_last));
  assign _t74 = ((|_t73) && (|_t72));
  assign _t75 = ((|_t74) && (|_t69));
  assign _t76 = (lost + 16'd1);
  assign _t77 = ((|rx_valid) && (|rx_last));
  assign _t78 = ((|_t77) && (|_t72));
  assign _t79 = ((|_t78) && (|_t69));
  assign _t80 = (fw + 12'd1);
  assign _t81 = (~_t69);
  assign _t82 = ((|rx_valid) && (|rx_last));
  assign _t83 = ((|_t82) && (|_t72));
  assign _t84 = ((|_t83) && (|_t81));
  assign _t85 = ((|rx_valid) && (|rx_last));
  assign _t86 = ((|_t85) && (|_t72));
  assign _t87 = ((|_t86) && (|_t81));
  assign _t88 = ih[15:8];
  assign _t89 = ih[23:16];
  assign _t90 = {_t89, _t88};
  assign _t91 = (ik == 8'd16);
  assign _t92 = ((|rx_valid) && (|_t91));
  assign _t93 = ih[31:24];
  assign _t94 = ih[39:32];
  assign _t95 = {_t94, _t93};
  assign _t96 = ((|_t63) ? 1'd0 : bad);
  assign _t97 = rb[7];
  assign _t98 = ((|_t92) && (|_t97));
  assign _t99 = ((|_t79) ? _t76 : lost);
  assign _t100 = (lost + ls);
  assign _t101 = (~_t97);
  assign _t102 = ((|_t92) && (|_t101));
  assign _t103 = (cut + 16'd1);
  assign _t104 = rb[0];
  assign _t105 = ((|_t92) && (|_t101));
  assign _t106 = ((|_t105) && (|_t104));
  assign _t107 = (sq - l8_expect);
  assign _t108 = ((|_t92) && (|_t101));
  assign _t109 = ((|_t92) && (|_t101));
  assign _t110 = ((|_t98) ? 1'd1 : _t96);
  assign _t111 = dsq[15];
  assign _t112 = (sq != l8_expect);
  assign _t113 = ((|_t112) && (|synced));
  assign _t114 = ((|_t92) && (|_t101));
  assign _t115 = ((|_t114) && (|_t113));
  assign _t116 = ((|_t115) && (|_t111));
  assign _t117 = ((|_t87) ? 1'd1 : want);
  assign _t118 = (~ingap);
  assign _t119 = ((|1'd1) && (|_t118));
  assign _t120 = ((|_t92) && (|_t101));
  assign _t121 = ((|_t120) && (|_t113));
  assign _t122 = ((|_t121) && (|_t111));
  assign _t123 = ((|_t122) && (|_t119));
  assign _t124 = ((|_t116) ? 1'd1 : _t110);
  assign _t125 = (~_t111);
  assign _t126 = ((|_t92) && (|_t101));
  assign _t127 = ((|_t126) && (|_t113));
  assign _t128 = ((|_t127) && (|_t125));
  assign _t129 = (gaps + 16'd1);
  assign _t130 = (~ingap);
  assign _t131 = ((|_t92) && (|_t101));
  assign _t132 = ((|_t131) && (|_t113));
  assign _t133 = ((|_t132) && (|_t125));
  assign _t134 = ((|_t133) && (|_t130));
  assign _t135 = ((|_t123) ? 1'd1 : _t117);
  assign _t136 = ((|_t92) && (|_t101));
  assign _t137 = ((|_t136) && (|_t113));
  assign _t138 = ((|_t137) && (|_t125));
  assign _t139 = ((|_t138) && (|_t130));
  assign _t140 = ((|_t92) && (|_t101));
  assign _t141 = ((|_t140) && (|_t113));
  assign _t142 = ((|_t141) && (|_t125));
  assign _t143 = ((|_t142) && (|_t130));
  assign _t144 = ((|_t92) && (|_t101));
  assign _t145 = ((|_t144) && (|_t113));
  assign _t146 = ((|_t145) && (|_t125));
  assign _t147 = ((|_t146) && (|_t130));
  assign _t148 = (sq + 16'd1);
  assign _t149 = (~_t113);
  assign _t150 = ((|_t92) && (|_t101));
  assign _t151 = ((|_t150) && (|_t149));
  assign _t152 = ((|_t147) ? 1'd1 : ingap);
  assign _t153 = ((|_t92) && (|_t101));
  assign _t154 = ((|_t153) && (|_t149));
  assign _t155 = (rp + 12'd1);
  assign _t156 = ((|s_valid) && (|s_ready));
  assign _t157 = (fr + 12'd1);
  assign _t158 = wv[8];
  assign _t159 = ((|_t156) && (|_t158));
  assign _t160 = 5'd0;
  assign _t161 = (~seen);
  assign _t162 = 2'd0;
  assign _t163 = {_t162, _t161, _t160};
  assign _t164 = _t163[5:0];
  assign _t165 = ((|nak) || (|ingap));
  assign _t166 = _t163[7:7];
  assign _t167 = {_t166, _t165, _t164};
  assign _t168 = _t167[6:0];
  assign _t169 = (idle >= lim);
  assign _t170 = ((|ingap) && (|_t169));
  assign _t171 = ((|want) || (|_t170));
  assign _t172 = ((|1'd1) && (|_t171));
  assign _t173 = (~seen);
  assign _t174 = ((|_t173) && (|_t169));
  assign _t175 = ((|_t174) || (|_t172));
  assign _t176 = (peer != 96'd0);
  assign _t177 = ((|learned) || (|_t176));
  assign _t178 = ((|_t177) && (|_t175));
  assign _t179 = (ok == 5'd0);
  assign _t180 = ((|_t179) && (|_t178));
  assign _t181 = {cfl2, credits, l8_expect};
  assign _t182 = ((|_t179) && (|_t178));
  assign _t183 = ((|_t179) && (|_t178));
  assign _t184 = ((|_t139) ? 1'd1 : _t135);
  assign _t185 = ((|_t179) && (|_t178));
  assign _t186 = ((|_t143) ? 1'd1 : nak);
  assign _t187 = ((|_t179) && (|_t178));
  assign _t188 = (idle + 32'd1);
  assign _t189 = ((|_t179) && (|_t178));
  assign _t190 = ((|_t66) ? 32'd50000 : lim);
  assign _t191 = (lim + lim);
  assign _t192 = (lim < 32'd6400000);
  assign _t193 = (~want);
  assign _t194 = ((|_t169) && (|_t193));
  assign _t195 = ((|_t194) && (|_t192));
  assign _t196 = ((|_t179) && (|_t178));
  assign _t197 = ((|_t196) && (|_t195));
  assign _t198 = (~_t179);
  assign _t199 = pw[7:0];
  assign _t200 = (ok == 5'd1);
  assign _t201 = (ok <= 5'd12);
  assign _t202 = ((|_t198) && (|_t201));
  assign _t203 = ((|_t202) && (|_t200));
  assign _t204 = ((|_t203) ? _t199 : 8'd0);
  assign _t205 = pw[15:8];
  assign _t206 = (ok == 5'd2);
  assign _t207 = ((|_t198) && (|_t201));
  assign _t208 = ((|_t207) && (|_t206));
  assign _t209 = ((|_t208) ? _t205 : _t204);
  assign _t210 = pw[23:16];
  assign _t211 = (ok == 5'd3);
  assign _t212 = ((|_t198) && (|_t201));
  assign _t213 = ((|_t212) && (|_t211));
  assign _t214 = ((|_t213) ? _t210 : _t209);
  assign _t215 = pw[31:24];
  assign _t216 = (ok == 5'd4);
  assign _t217 = ((|_t198) && (|_t201));
  assign _t218 = ((|_t217) && (|_t216));
  assign _t219 = ((|_t218) ? _t215 : _t214);
  assign _t220 = pw[39:32];
  assign _t221 = (ok == 5'd5);
  assign _t222 = ((|_t198) && (|_t201));
  assign _t223 = ((|_t222) && (|_t221));
  assign _t224 = ((|_t223) ? _t220 : _t219);
  assign _t225 = pw[47:40];
  assign _t226 = (ok == 5'd6);
  assign _t227 = ((|_t198) && (|_t201));
  assign _t228 = ((|_t227) && (|_t226));
  assign _t229 = ((|_t228) ? _t225 : _t224);
  assign _t230 = pw[55:48];
  assign _t231 = (ok == 5'd7);
  assign _t232 = ((|_t198) && (|_t201));
  assign _t233 = ((|_t232) && (|_t231));
  assign _t234 = ((|_t233) ? _t230 : _t229);
  assign _t235 = pw[63:56];
  assign _t236 = (ok == 5'd8);
  assign _t237 = ((|_t198) && (|_t201));
  assign _t238 = ((|_t237) && (|_t236));
  assign _t239 = ((|_t238) ? _t235 : _t234);
  assign _t240 = pw[71:64];
  assign _t241 = (ok == 5'd9);
  assign _t242 = ((|_t198) && (|_t201));
  assign _t243 = ((|_t242) && (|_t241));
  assign _t244 = ((|_t243) ? _t240 : _t239);
  assign _t245 = pw[79:72];
  assign _t246 = (ok == 5'd10);
  assign _t247 = ((|_t198) && (|_t201));
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ((|_t248) ? _t245 : _t244);
  assign _t250 = pw[87:80];
  assign _t251 = (ok == 5'd11);
  assign _t252 = ((|_t198) && (|_t201));
  assign _t253 = ((|_t252) && (|_t251));
  assign _t254 = ((|_t253) ? _t250 : _t249);
  assign _t255 = pw[95:88];
  assign _t256 = (ok == 5'd12);
  assign _t257 = ((|_t198) && (|_t201));
  assign _t258 = ((|_t257) && (|_t256));
  assign _t259 = ((|_t183) ? 5'd1 : ok);
  assign _t260 = (ok + 5'd1);
  assign _t261 = ((|_t198) && (|_t201));
  assign _t262 = ((|_t261) && (|tx_ready));
  assign _t263 = ((|_t258) ? _t255 : _t254);
  assign _t264 = oh[7:0];
  assign _t265 = (~_t201);
  assign _t266 = ((|_t198) && (|_t265));
  assign _t267 = ((|_t266) && (|ctlw));
  assign _t268 = (ok == 5'd17);
  assign _t269 = ((|_t198) && (|_t265));
  assign _t270 = ((|_t269) && (|ctlw));
  assign _t271 = oh[39:8];
  assign _t272 = ((|_t182) ? _t181 : oh);
  assign _t273 = {8'd0, _t271};
  assign _t274 = ((|_t198) && (|_t265));
  assign _t275 = ((|_t274) && (|ctlw));
  assign _t276 = ((|_t275) && (|tx_ready));
  assign _t277 = (ok + 5'd1);
  assign _t278 = (ok == 5'd17);
  assign _t279 = ((|_t262) ? _t260 : _t259);
  assign _t280 = ((|_t278) ? 5'd0 : _t277);
  assign _t281 = ((|_t198) && (|_t265));
  assign _t282 = ((|_t281) && (|ctlw));
  assign _t283 = ((|_t282) && (|tx_ready));
  assign _t284 = ((|_t267) ? _t264 : _t263);
  assign _t285 = (~ctlw);
  assign _t286 = ((|_t198) && (|_t265));
  assign _t287 = ((|_t286) && (|_t285));
  assign _t288 = ((|_t270) ? _t268 : 1'd0);
  assign _t289 = ((|_t198) && (|_t265));
  assign _t290 = ((|_t289) && (|_t285));
  assign _t291 = ((|_t283) ? _t280 : _t279);
  assign _t292 = ((|_t198) && (|_t265));
  assign _t293 = ((|_t292) && (|_t285));
  assign _t294 = ((|_t293) && (|tx_ready));
  assign cnt = (wp - rp);
  assign free = (13'd2048 - _t0);
  assign credits = {{3{1'b0}}, (free >> 32'd10)};
  assign rb = rx_data;
  assign wfull = rb;
  assign rx_ready = 1'd1;
  assign _t295 = ((|_t6) ? _t2 : ih);
  assign _t296 = ((|_t11) ? _t8 : isnd);
  assign _t297 = ((|_t17) ? _t13 : lpeer);
  assign _t298 = ((|_t20) ? 1'd1 : learned);
  assign _t299 = ((|_t58) ? 8'd0 : _t57);
  assign _t300 = ((|_t26) ? rb : iword);
  assign _t301 = ((|_t62) ? 1'd0 : _t61);
  assign ring_wr0_addr = ((|_t38) ? _t34 : 11'd0);
  assign ring_wr0_data = ((|_t42) ? _t39 : 9'd0);
  assign ring_wr0_we = ((|_t45) ? 1'd1 : 1'd0);
  assign _t302 = ((|_t75) ? wstart : _t67);
  assign _t303 = ((|_t60) ? 8'd0 : _t59);
  assign _t304 = ((|_t128) ? 1'd1 : _t124);
  assign _t305 = ((|_t64) ? 1'd1 : seen);
  assign _t306 = ((|_t189) ? 32'd0 : _t188);
  assign _t307 = ((|_t197) ? _t191 : _t190);
  assign _t308 = ((|_t102) ? _t100 : _t99);
  assign _t309 = ((|_t84) ? _t80 : fw);
  assign _t310 = ((|_t185) ? 1'd0 : _t184);
  assign sq = ((|_t92) ? _t90 : 16'd0);
  assign ls = ((|_t92) ? _t95 : 16'd0);
  assign _t311 = ((|_t92) ? wp : wstart);
  assign _t312 = ((|_t106) ? _t103 : cut);
  assign dsq = ((|_t108) ? _t107 : 16'd0);
  assign _t313 = ((|_t109) ? 1'd1 : synced);
  assign _t314 = ((|_t134) ? _t129 : gaps);
  assign _t315 = ((|_t187) ? 1'd0 : _t186);
  assign _t316 = ((|_t154) ? 1'd0 : _t152);
  assign _t317 = ((|_t151) ? _t148 : l8_expect);
  assign ring_rd0_addr = rp[10:0];
  assign wv = ring_rd0_data;
  assign s_valid = (fr != fw);
  assign s_data = wv[7:0];
  assign s_last = wv[8];
  assign _t318 = ((|_t156) ? _t155 : rp);
  assign _t319 = ((|_t159) ? _t157 : fr);
  assign cfl2 = {1'd1, _t168};
  assign tx_valid = ((|_t198) ? 1'd1 : 1'd0);
  assign tx_data = ((|_t287) ? 8'd0 : _t284);
  assign tx_last = ((|_t290) ? 1'd1 : _t288);
  assign pw = ((|learned) ? lpeer : peer);
  assign _t320 = ((|_t180) ? 1'd1 : ctlw);
  assign _t321 = ((|_t276) ? _t273 : _t272);
  assign _t322 = ((|_t294) ? 5'd0 : _t291);
  assign ob = 8'd0;
  always @(posedge clk) begin
    if (rst) begin
      wp <= 12'd0;
      rp <= 12'd0;
      fw <= 12'd0;
      fr <= 12'd0;
      lost <= 16'd0;
      cut <= 16'd0;
      gaps <= 16'd0;
      l8_expect <= 16'd0;
      ik <= 8'd0;
      ih <= 40'd0;
      iw <= 8'd0;
      iword <= 8'd0;
      wstart <= 12'd0;
      ovf <= 1'd0;
      bad <= 1'd0;
      ok <= 5'd0;
      oh <= 40'd0;
      ctlw <= 1'd0;
      idle <= 32'd0;
      lim <= 32'd50000;
      want <= 1'd0;
      nak <= 1'd0;
      ingap <= 1'd0;
      seen <= 1'd0;
      synced <= 1'd0;
      isnd <= 96'd0;
      lpeer <= 96'd0;
      learned <= 1'd0;
    end else begin
      wp <= _t302;
      rp <= _t318;
      fw <= _t309;
      fr <= _t319;
      lost <= _t308;
      cut <= _t312;
      gaps <= _t314;
      l8_expect <= _t317;
      ik <= _t299;
      ih <= _t295;
      iw <= _t303;
      iword <= _t300;
      wstart <= _t311;
      ovf <= _t301;
      bad <= _t304;
      ok <= _t322;
      oh <= _t321;
      ctlw <= _t320;
      idle <= _t306;
      lim <= _t307;
      want <= _t310;
      nak <= _t315;
      ingap <= _t316;
      seen <= _t305;
      synced <= _t313;
      isnd <= _t296;
      lpeer <= _t297;
      learned <= _t298;
    end
  end
  l8_ram_9x2048_r1_w1_d _meminst_0_ring (
    .clk(clk),
    .rd0_addr(ring_rd0_addr),
    .rd0_data(ring_rd0_data),
    .wr0_we(ring_wr0_we),
    .wr0_addr(ring_wr0_addr),
    .wr0_data(ring_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module host_in_64_64 (
  input  wire clk,
  input  wire rst,
  input  wire [7:0] s_data,
  input  wire s_last,
  input  wire s_valid,
  output wire s_ready,
  output wire [7:0] ans_data,
  output wire ans_last,
  output wire ans_valid,
  input  wire ans_ready,
  output wire [7:0] key,
  output wire key_valid,
  output wire refresh,
  output wire boot,
  output wire [31:0] lost
);
  reg  head;
  reg  [7:0] tag;
  reg  [6:0] kw;
  reg  [6:0] kr;
  reg  [15:0] kgap;
  reg  kv;
  reg  [7:0] kb;
  reg  rf;
  reg  bt;
  reg  [31:0] nlost;
  wire [5:0] kq_rd0_addr;
  wire [7:0] kq_rd0_data;
  wire [5:0] kq_wr0_addr;
  wire [7:0] kq_wr0_data;
  wire kq_wr0_we;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire [5:0] _t13;
  wire [6:0] _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire _t20;
  wire _t21;
  wire _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire [6:0] _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire [31:0] _t31;
  wire _t32;
  wire _t33;
  wire _t34;
  wire _t35;
  wire [15:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire [5:0] _t41;
  wire _t42;
  wire _t43;
  wire [6:0] _t44;
  wire _t45;
  wire [15:0] _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire [7:0] _t51;
  wire [6:0] _t52;
  wire [31:0] _t53;
  wire _t54;
  wire [15:0] _t55;
  wire [7:0] _t56;
  wire [6:0] _t57;
  assign _t0 = (tag == 8'd1);
  assign _t1 = (~head);
  assign _t2 = ((|_t1) && (|_t0));
  assign _t3 = (~_t2);
  assign _t4 = ((|_t3) || (|ans_ready));
  assign _t5 = ((|s_valid) && (|_t4));
  assign _t6 = ((|_t5) && (|head));
  assign _t7 = (s_data == 8'd2);
  assign _t8 = ((|_t5) && (|head));
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = (s_data == 8'd3);
  assign _t11 = ((|_t5) && (|head));
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = kw[5:0];
  assign _t14 = (kw - kr);
  assign _t15 = (_t14 != 7'd64);
  assign _t16 = (tag == 8'd0);
  assign _t17 = (~head);
  assign _t18 = ((|_t5) && (|_t17));
  assign _t19 = ((|_t18) && (|_t16));
  assign _t20 = ((|_t19) && (|_t15));
  assign _t21 = ((|_t5) && (|_t17));
  assign _t22 = ((|_t21) && (|_t16));
  assign _t23 = ((|_t22) && (|_t15));
  assign _t24 = ((|_t5) && (|_t17));
  assign _t25 = ((|_t24) && (|_t16));
  assign _t26 = ((|_t25) && (|_t15));
  assign _t27 = (kw + 7'd1);
  assign _t28 = ((|_t5) && (|_t17));
  assign _t29 = ((|_t28) && (|_t16));
  assign _t30 = ((|_t29) && (|_t15));
  assign _t31 = (nlost + 32'd1);
  assign _t32 = (~_t15);
  assign _t33 = ((|_t5) && (|_t17));
  assign _t34 = ((|_t33) && (|_t16));
  assign _t35 = ((|_t34) && (|_t32));
  assign _t36 = (kgap - 16'd1);
  assign _t37 = (kgap != 16'd0);
  assign _t38 = (kw != kr);
  assign _t39 = (~_t37);
  assign _t40 = ((|_t39) && (|_t38));
  assign _t41 = kr[5:0];
  assign _t42 = ((|_t39) && (|_t38));
  assign _t43 = ((|_t39) && (|_t38));
  assign _t44 = (kr + 7'd1);
  assign _t45 = ((|_t39) && (|_t38));
  assign _t46 = ((|_t37) ? _t36 : kgap);
  assign _t47 = ((|_t39) && (|_t38));
  assign lost = nlost;
  assign key_valid = kv;
  assign key = kb;
  assign refresh = rf;
  assign boot = bt;
  assign _t48 = ((|_t9) ? 1'd1 : 1'd0);
  assign _t49 = ((|_t12) ? 1'd1 : 1'd0);
  assign _t50 = ((|_t40) ? 1'd1 : 1'd0);
  assign ans_valid = ((|s_valid) && (|_t2));
  assign ans_data = s_data;
  assign ans_last = s_last;
  assign s_ready = ((|_t2) ? ans_ready : 1'd1);
  assign _t51 = ((|_t6) ? s_data : tag);
  assign kq_wr0_addr = ((|_t20) ? _t13 : 6'd0);
  assign kq_wr0_data = ((|_t23) ? s_data : 8'd0);
  assign kq_wr0_we = ((|_t26) ? 1'd1 : 1'd0);
  assign _t52 = ((|_t30) ? _t27 : kw);
  assign _t53 = ((|_t35) ? _t31 : nlost);
  assign _t54 = ((|_t5) ? s_last : head);
  assign _t55 = ((|_t47) ? 16'd63 : _t46);
  assign kq_rd0_addr = ((|_t42) ? _t41 : 6'd0);
  assign _t56 = ((|_t43) ? kq_rd0_data : kb);
  assign _t57 = ((|_t45) ? _t44 : kr);
  always @(posedge clk) begin
    if (rst) begin
      head <= 1'd1;
      tag <= 8'd0;
      kw <= 7'd0;
      kr <= 7'd0;
      kgap <= 16'd0;
      kv <= 1'd0;
      kb <= 8'd0;
      rf <= 1'd0;
      bt <= 1'd0;
      nlost <= 32'd0;
    end else begin
      head <= _t54;
      tag <= _t51;
      kw <= _t52;
      kr <= _t57;
      kgap <= _t55;
      kv <= _t50;
      kb <= _t56;
      rf <= _t48;
      bt <= _t49;
      nlost <= _t53;
    end
  end
  l8_ram_8x64_r1_w1_d _meminst_0_kq (
    .clk(clk),
    .rd0_addr(kq_rd0_addr),
    .rd0_data(kq_rd0_data),
    .wr0_we(kq_wr0_we),
    .wr0_addr(kq_wr0_addr),
    .wr0_data(kq_wr0_data)
  );
endmodule
`default_nettype wire

`default_nettype none
module z1013_arty (
  input  wire clk,
  input  wire rst,
  input  wire clk100,
  output wire [3:0] leds,
  output wire [11:0] rgb,

  output wire hurx_ready,
  output wire [7:0] hutx_data,
  output wire hutx_valid,
  input  wire [7:0] hurx_data_v_in,
  input  wire hurx_data_v_in_en,
  input  wire hurx_data_err_in,
  input  wire hurx_data_err_in_en,
  input  wire hurx_valid_in,
  input  wire hurx_valid_in_en,
  input  wire hutx_ready_in,
  input  wire hutx_ready_in_en,
  output wire erx_ready,
  output wire [7:0] etx_data,
  output wire etx_last,
  output wire etx_valid,
  input  wire [7:0] erx_data_in,
  input  wire erx_data_in_en,
  input  wire erx_last_in,
  input  wire erx_last_in_en,
  input  wire erx_valid_in,
  input  wire erx_valid_in_en,
  input  wire etx_ready_in,
  input  wire etx_ready_in_en,
  input  wire eth_rx_clk,
  input  wire eth_rx_rst,
  input  wire eth_tx_clk,
  input  wire eth_tx_rst,
  input  wire nolock
);
  wire c74;
  wire c148;
  wire lk;
  wire nlk;
  wire hbs;
  wire acts;
  wire kss;
  wire [7:0] hurx_data_v;
  wire hurx_data_err;
  wire hurx_valid;
  wire hutx_ready;
  wire [7:0] erx_data;
  wire erx_last;
  wire erx_valid;
  wire etx_ready;
  wire [7:0] crx_data;
  wire crx_last;
  wire crx_valid;
  wire crx_ready;
  wire [7:0] ctx_data;
  wire ctx_last;
  wire ctx_valid;
  wire ctx_ready;
  wire [7:0] p0rx_data;
  wire p0rx_last;
  wire p0rx_valid;
  wire p0rx_ready;
  wire [7:0] p0tx_data;
  wire p0tx_last;
  wire p0tx_valid;
  wire p0tx_ready;
  wire [7:0] p1rx_data;
  wire p1rx_last;
  wire p1rx_valid;
  wire p1rx_ready;
  wire [7:0] p1tx_data;
  wire p1tx_last;
  wire p1tx_valid;
  wire p1tx_ready;
  wire [7:0] p2rx_data;
  wire p2rx_last;
  wire p2rx_valid;
  wire p2rx_ready;
  wire [7:0] p2tx_data;
  wire p2tx_last;
  wire p2tx_valid;
  wire p2tx_ready;
  wire [7:0] p3rx_data;
  wire p3rx_last;
  wire p3rx_valid;
  wire p3rx_ready;
  wire [7:0] p3tx_data;
  wire p3tx_last;
  wire p3tx_valid;
  wire p3tx_ready;
  wire [7:0] dl_c_0__data;
  wire dl_c_0__last;
  wire dl_c_0__valid;
  wire dl_c_0__ready;
  wire [7:0] dl_c_1__data;
  wire dl_c_1__last;
  wire dl_c_1__valid;
  wire dl_c_1__ready;
  wire [7:0] dl_c_2__data;
  wire dl_c_2__last;
  wire dl_c_2__valid;
  wire dl_c_2__ready;
  wire [7:0] dl_c_3__data;
  wire dl_c_3__last;
  wire dl_c_3__valid;
  wire dl_c_3__ready;
  wire [7:0] dl_c_4__data;
  wire dl_c_4__last;
  wire dl_c_4__valid;
  wire dl_c_4__ready;
  wire [7:0] dl_c_5__data;
  wire dl_c_5__last;
  wire dl_c_5__valid;
  wire dl_c_5__ready;
  wire [7:0] dl_c_6__data;
  wire dl_c_6__last;
  wire dl_c_6__valid;
  wire dl_c_6__ready;
  wire [7:0] dl_c_7__data;
  wire dl_c_7__last;
  wire dl_c_7__valid;
  wire dl_c_7__ready;
  wire [7:0] dl_c_8__data;
  wire dl_c_8__last;
  wire dl_c_8__valid;
  wire dl_c_8__ready;
  wire [7:0] dl_c_9__data;
  wire dl_c_9__last;
  wire dl_c_9__valid;
  wire dl_c_9__ready;
  wire [7:0] dl_c_10__data;
  wire dl_c_10__last;
  wire dl_c_10__valid;
  wire dl_c_10__ready;
  wire [7:0] dl_c_11__data;
  wire dl_c_11__last;
  wire dl_c_11__valid;
  wire dl_c_11__ready;
  wire [7:0] dl_c_12__data;
  wire dl_c_12__last;
  wire dl_c_12__valid;
  wire dl_c_12__ready;
  wire [7:0] dl_c_13__data;
  wire dl_c_13__last;
  wire dl_c_13__valid;
  wire dl_c_13__ready;
  wire [7:0] dl_c_14__data;
  wire dl_c_14__last;
  wire dl_c_14__valid;
  wire dl_c_14__ready;
  wire [7:0] dl_c_15__data;
  wire dl_c_15__last;
  wire dl_c_15__valid;
  wire dl_c_15__ready;
  wire [7:0] dl_r_0__data;
  wire dl_r_0__last;
  wire dl_r_0__valid;
  wire dl_r_0__ready;
  wire [7:0] dl_r_1__data;
  wire dl_r_1__last;
  wire dl_r_1__valid;
  wire dl_r_1__ready;
  wire [7:0] dl_r_2__data;
  wire dl_r_2__last;
  wire dl_r_2__valid;
  wire dl_r_2__ready;
  wire [7:0] dl_r_3__data;
  wire dl_r_3__last;
  wire dl_r_3__valid;
  wire dl_r_3__ready;
  wire [7:0] dl_r_4__data;
  wire dl_r_4__last;
  wire dl_r_4__valid;
  wire dl_r_4__ready;
  wire [7:0] dl_r_5__data;
  wire dl_r_5__last;
  wire dl_r_5__valid;
  wire dl_r_5__ready;
  wire [7:0] dl_r_6__data;
  wire dl_r_6__last;
  wire dl_r_6__valid;
  wire dl_r_6__ready;
  wire [7:0] dl_r_7__data;
  wire dl_r_7__last;
  wire dl_r_7__valid;
  wire dl_r_7__ready;
  wire [7:0] dl_r_8__data;
  wire dl_r_8__last;
  wire dl_r_8__valid;
  wire dl_r_8__ready;
  wire [7:0] dl_r_9__data;
  wire dl_r_9__last;
  wire dl_r_9__valid;
  wire dl_r_9__ready;
  wire [7:0] dl_r_10__data;
  wire dl_r_10__last;
  wire dl_r_10__valid;
  wire dl_r_10__ready;
  wire [7:0] dl_r_11__data;
  wire dl_r_11__last;
  wire dl_r_11__valid;
  wire dl_r_11__ready;
  wire [7:0] dl_r_12__data;
  wire dl_r_12__last;
  wire dl_r_12__valid;
  wire dl_r_12__ready;
  wire [7:0] dl_r_13__data;
  wire dl_r_13__last;
  wire dl_r_13__valid;
  wire dl_r_13__ready;
  wire [7:0] dl_r_14__data;
  wire dl_r_14__last;
  wire dl_r_14__valid;
  wire dl_r_14__ready;
  wire [7:0] dl_r_15__data;
  wire dl_r_15__last;
  wire dl_r_15__valid;
  wire dl_r_15__ready;
  wire [7:0] dl_cr_0__data;
  wire dl_cr_0__last;
  wire dl_cr_0__valid;
  wire dl_cr_0__ready;
  wire [7:0] dl_cr_1__data;
  wire dl_cr_1__last;
  wire dl_cr_1__valid;
  wire dl_cr_1__ready;
  wire [7:0] dl_cr_2__data;
  wire dl_cr_2__last;
  wire dl_cr_2__valid;
  wire dl_cr_2__ready;
  wire [7:0] dl_cr_3__data;
  wire dl_cr_3__last;
  wire dl_cr_3__valid;
  wire dl_cr_3__ready;
  wire [7:0] dl_ct_0__data;
  wire dl_ct_0__last;
  wire dl_ct_0__valid;
  wire dl_ct_0__ready;
  wire [7:0] dl_ct_1__data;
  wire dl_ct_1__last;
  wire dl_ct_1__valid;
  wire dl_ct_1__ready;
  wire [7:0] dl_ct_2__data;
  wire dl_ct_2__last;
  wire dl_ct_2__valid;
  wire dl_ct_2__ready;
  wire [7:0] dl_ct_3__data;
  wire dl_ct_3__last;
  wire dl_ct_3__valid;
  wire dl_ct_3__ready;
  reg  [1:0] dl_last;
  wire [7:0] u4_f_0__data;
  wire u4_f_0__last;
  wire u4_f_0__valid;
  wire u4_f_0__ready;
  wire [7:0] u4_f_1__data;
  wire u4_f_1__last;
  wire u4_f_1__valid;
  wire u4_f_1__ready;
  wire [7:0] u4_f_2__data;
  wire u4_f_2__last;
  wire u4_f_2__valid;
  wire u4_f_2__ready;
  wire [7:0] u4_f_3__data;
  wire u4_f_3__last;
  wire u4_f_3__valid;
  wire u4_f_3__ready;
  wire [7:0] u4_f_4__data;
  wire u4_f_4__last;
  wire u4_f_4__valid;
  wire u4_f_4__ready;
  wire [7:0] u4_t_0__data;
  wire u4_t_0__last;
  wire u4_t_0__valid;
  wire u4_t_0__ready;
  wire [7:0] u4_t_1__data;
  wire u4_t_1__last;
  wire u4_t_1__valid;
  wire u4_t_1__ready;
  wire [7:0] u4_t_2__data;
  wire u4_t_2__last;
  wire u4_t_2__valid;
  wire u4_t_2__ready;
  wire [7:0] u4_t_3__data;
  wire u4_t_3__last;
  wire u4_t_3__valid;
  wire u4_t_3__ready;
  wire [7:0] u4_t_4__data;
  wire u4_t_4__last;
  wire u4_t_4__valid;
  wire u4_t_4__ready;
  wire [7:0] u4_p_0__data;
  wire u4_p_0__last;
  wire u4_p_0__valid;
  wire u4_p_0__ready;
  wire [7:0] u4_p_1__data;
  wire u4_p_1__last;
  wire u4_p_1__valid;
  wire u4_p_1__ready;
  wire [7:0] u4_p_2__data;
  wire u4_p_2__last;
  wire u4_p_2__valid;
  wire u4_p_2__ready;
  wire [7:0] u4_p_3__data;
  wire u4_p_3__last;
  wire u4_p_3__valid;
  wire u4_p_3__ready;
  wire [7:0] u4_p_4__data;
  wire u4_p_4__last;
  wire u4_p_4__valid;
  wire u4_p_4__ready;
  wire [7:0] u4_m_data;
  wire u4_m_last;
  wire u4_m_valid;
  wire u4_m_ready;
  reg  [4:0] u4_took;
  wire [7:0] u4_rx_data;
  wire u4_rx_last;
  wire u4_rx_valid;
  wire u4_rx_ready;
  wire [7:0] _xs_data;
  wire _xs_last;
  wire _xs_valid;
  wire _xs_ready;
  wire _merge_valid;
  wire _merge_ready;
  wire [2:0] _merge_sel;
  reg  [2:0] _merge_rr;
  reg  _merge_lock;
  reg  [2:0] _merge_lsel;
  wire [7:0] _merge_data;
  wire _merge_last;
  wire [2:0] _merge_tag;
  wire _merge2_valid;
  wire _merge2_ready;
  wire [2:0] _merge2_sel;
  reg  [2:0] _merge2_rr;
  reg  _merge2_lock;
  reg  [2:0] _merge2_lsel;
  wire [7:0] _merge2_data;
  wire _merge2_last;
  wire [2:0] _merge2_tag;
  wire [7:0] _xs2_data;
  wire _xs2_last;
  wire _xs2_valid;
  wire _xs2_ready;
  wire [7:0] ud_f_0__data;
  wire ud_f_0__last;
  wire ud_f_0__valid;
  wire ud_f_0__ready;
  wire [7:0] ud_f_1__data;
  wire ud_f_1__last;
  wire ud_f_1__valid;
  wire ud_f_1__ready;
  wire [7:0] ud_f_2__data;
  wire ud_f_2__last;
  wire ud_f_2__valid;
  wire ud_f_2__ready;
  wire [7:0] ud_f_3__data;
  wire ud_f_3__last;
  wire ud_f_3__valid;
  wire ud_f_3__ready;
  wire [7:0] ud_f_4__data;
  wire ud_f_4__last;
  wire ud_f_4__valid;
  wire ud_f_4__ready;
  wire [7:0] ud_t_0__data;
  wire ud_t_0__last;
  wire ud_t_0__valid;
  wire ud_t_0__ready;
  wire [7:0] ud_t_1__data;
  wire ud_t_1__last;
  wire ud_t_1__valid;
  wire ud_t_1__ready;
  wire [7:0] ud_t_2__data;
  wire ud_t_2__last;
  wire ud_t_2__valid;
  wire ud_t_2__ready;
  wire [7:0] ud_t_3__data;
  wire ud_t_3__last;
  wire ud_t_3__valid;
  wire ud_t_3__ready;
  wire [7:0] ud_t_4__data;
  wire ud_t_4__last;
  wire ud_t_4__valid;
  wire ud_t_4__ready;
  wire [7:0] ud_p_0__data;
  wire ud_p_0__last;
  wire ud_p_0__valid;
  wire ud_p_0__ready;
  wire [7:0] ud_p_1__data;
  wire ud_p_1__last;
  wire ud_p_1__valid;
  wire ud_p_1__ready;
  wire [7:0] ud_p_2__data;
  wire ud_p_2__last;
  wire ud_p_2__valid;
  wire ud_p_2__ready;
  wire [7:0] ud_p_3__data;
  wire ud_p_3__last;
  wire ud_p_3__valid;
  wire ud_p_3__ready;
  wire [7:0] ud_p_4__data;
  wire ud_p_4__last;
  wire ud_p_4__valid;
  wire ud_p_4__ready;
  wire [7:0] ud_m_data;
  wire ud_m_last;
  wire ud_m_valid;
  wire ud_m_ready;
  reg  [4:0] ud_took;
  wire [7:0] ud_in_data;
  wire ud_in_last;
  wire ud_in_valid;
  wire ud_in_ready;
  wire [7:0] ud_cin_data;
  wire ud_cin_valid;
  wire ud_cin_ready;
  wire [7:0] ud_cout_data;
  wire ud_cout_valid;
  wire ud_cout_ready;
  wire [7:0] _xs3_data_v;
  wire _xs3_data_err;
  wire _xs3_valid;
  wire _xs3_ready;
  wire [8:0] _xp_data;
  wire _xp_valid;
  wire _xp_ready;
  wire [8:0] _xq_data;
  wire _xq_valid;
  wire _xq_ready;
  wire [7:0] cfr_data;
  wire cfr_last;
  wire cfr_valid;
  wire cfr_ready;
  wire [7:0] cri_data;
  wire cri_last;
  wire cri_valid;
  wire cri_ready;
  wire _merge3_valid;
  wire _merge3_ready;
  wire _merge3_sel;
  reg  _merge3_rr;
  reg  _merge3_lock;
  reg  _merge3_lsel;
  wire [7:0] _merge3_data;
  wire _merge3_last;
  wire _merge3_tag;
  wire _merge4_valid;
  wire _merge4_ready;
  wire [2:0] _merge4_sel;
  reg  [2:0] _merge4_rr;
  reg  _merge4_lock;
  reg  [2:0] _merge4_lsel;
  wire [7:0] _merge4_data;
  wire _merge4_last;
  wire [2:0] _merge4_tag;
  wire _merge5_valid;
  wire _merge5_ready;
  wire [2:0] _merge5_sel;
  reg  [2:0] _merge5_rr;
  reg  _merge5_lock;
  reg  [2:0] _merge5_lsel;
  wire [7:0] _merge5_data;
  wire _merge5_last;
  wire [2:0] _merge5_tag;
  wire [7:0] _xs4_data;
  wire _xs4_valid;
  wire _xs4_ready;
  wire _merge6_valid;
  wire _merge6_ready;
  wire [1:0] _merge6_sel;
  reg  [1:0] _merge6_rr;
  reg  _merge6_lock;
  reg  [1:0] _merge6_lsel;
  wire [7:0] _merge6_data;
  wire _merge6_last;
  wire [1:0] _merge6_tag;
  wire _merge7_valid;
  wire _merge7_ready;
  wire [1:0] _merge7_sel;
  reg  [1:0] _merge7_rr;
  reg  _merge7_lock;
  reg  [1:0] _merge7_lsel;
  wire [7:0] _merge7_data;
  wire _merge7_last;
  wire [1:0] _merge7_tag;
  wire _merge8_valid;
  wire _merge8_ready;
  wire [1:0] _merge8_sel;
  reg  [1:0] _merge8_rr;
  reg  _merge8_lock;
  reg  [1:0] _merge8_lsel;
  wire [7:0] _merge8_data;
  wire _merge8_last;
  wire [1:0] _merge8_tag;
  wire _merge9_valid;
  wire _merge9_ready;
  wire [1:0] _merge9_sel;
  reg  [1:0] _merge9_rr;
  reg  _merge9_lock;
  reg  [1:0] _merge9_lsel;
  wire [7:0] _merge9_data;
  wire _merge9_last;
  wire [1:0] _merge9_tag;
  wire _merge10_valid;
  wire _merge10_ready;
  wire [1:0] _merge10_sel;
  reg  [1:0] _merge10_rr;
  reg  _merge10_lock;
  reg  [1:0] _merge10_lsel;
  wire [7:0] _merge10_data;
  wire _merge10_last;
  wire [1:0] _merge10_tag;
  wire [1:0] spk;
  wire [7:0] key;
  wire kv;
  wire refresh;
  wire boot;
  reg  run;
  reg  [4:0] hold;
  wire miso;
  wire sclk;
  wire scs;
  wire smosi;
  wire sact;
  wire de;
  wire hs;
  wire vs;
  wire [7:0] r;
  wire [7:0] g;
  wire [7:0] b;
  wire [15:0] sample;
  wire [7:0] cs_data;
  wire cs_last;
  wire cs_valid;
  wire cs_ready;
  wire [7:0] ps_data;
  wire ps_last;
  wire ps_valid;
  wire ps_ready;
  wire cb_req;
  wire cb_wr;
  wire [31:0] cb_lba;
  wire [7:0] cb_wdata;
  wire cb_ack;
  wire cb_stb;
  wire [7:0] cb_rdata;
  wire cb_done;
  wire cb_err;
  wire [7:0] rq_data;
  wire rq_last;
  wire rq_valid;
  wire rq_ready;
  wire [7:0] an_data;
  wire an_last;
  wire an_valid;
  wire an_ready;
  wire [7:0] hsin_data;
  wire hsin_last;
  wire hsin_valid;
  wire hsin_ready;
  wire [95:0] nopeer;
  wire hb;
  wire act;
  wire kseen;
  reg  [26:0] n;
  reg  [22:0] ks;
  reg  hbs_sync0;
  reg  hbs_sync1;
  reg  acts_sync0;
  reg  acts_sync1;
  reg  kss_sync0;
  reg  kss_sync1;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire _t14;
  wire _t15;
  wire [3:0] _t16;
  wire [4:0] _t17;
  wire _t18;
  wire _t19;
  wire [4:0] _t20;
  wire [3:0] _t21;
  wire [4:0] _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire [4:0] _t28;
  wire _t29;
  wire [2:0] _t30;
  wire [4:0] _t31;
  wire _t32;
  wire [4:0] _t33;
  wire _t34;
  wire [2:0] _t35;
  wire [4:0] _t36;
  wire _t37;
  wire _t38;
  wire _t39;
  wire _t40;
  wire _t41;
  wire [4:0] _t42;
  wire [1:0] _t43;
  wire [1:0] _t44;
  wire [4:0] _t45;
  wire _t46;
  wire [4:0] _t47;
  wire [1:0] _t48;
  wire [1:0] _t49;
  wire [4:0] _t50;
  wire _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire [4:0] _t56;
  wire [2:0] _t57;
  wire _t58;
  wire [4:0] _t59;
  wire _t60;
  wire [4:0] _t61;
  wire [2:0] _t62;
  wire _t63;
  wire [4:0] _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire _t69;
  wire [4:0] _t70;
  wire [3:0] _t71;
  wire [4:0] _t72;
  wire _t73;
  wire [4:0] _t74;
  wire [3:0] _t75;
  wire [4:0] _t76;
  wire _t77;
  wire _t78;
  wire _t79;
  wire [2:0] _t80;
  wire [2:0] _t81;
  wire [2:0] _t82;
  wire [2:0] _t83;
  wire [2:0] _t84;
  wire _t85;
  wire [2:0] _t86;
  wire [2:0] _t87;
  wire [2:0] _t88;
  wire [2:0] _t89;
  wire [2:0] _t90;
  wire [2:0] _t91;
  wire _t92;
  wire [2:0] _t93;
  wire [2:0] _t94;
  wire [2:0] _t95;
  wire [2:0] _t96;
  wire [2:0] _t97;
  wire [2:0] _t98;
  wire _t99;
  wire [2:0] _t100;
  wire [2:0] _t101;
  wire [2:0] _t102;
  wire [2:0] _t103;
  wire [2:0] _t104;
  wire [2:0] _t105;
  wire _t106;
  wire [2:0] _t107;
  wire [2:0] _t108;
  wire [2:0] _t109;
  wire [2:0] _t110;
  wire [2:0] _t111;
  wire [2:0] _t112;
  wire _t113;
  wire [2:0] _t114;
  wire _t115;
  wire _t116;
  wire _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire [2:0] _t125;
  wire _t126;
  wire [2:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire [2:0] _t143;
  wire [2:0] _t144;
  wire _t145;
  wire _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire _t154;
  wire _t155;
  wire _t156;
  wire _t157;
  wire _t158;
  wire _t159;
  wire _t160;
  wire _t161;
  wire [7:0] _t162;
  wire _t163;
  wire [7:0] _t164;
  wire _t165;
  wire [7:0] _t166;
  wire _t167;
  wire _t168;
  wire _t169;
  wire _t170;
  wire _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire [2:0] _t175;
  wire [2:0] _t176;
  wire [2:0] _t177;
  wire [2:0] _t178;
  wire [2:0] _t179;
  wire _t180;
  wire [2:0] _t181;
  wire [2:0] _t182;
  wire [2:0] _t183;
  wire [2:0] _t184;
  wire [2:0] _t185;
  wire [2:0] _t186;
  wire _t187;
  wire [2:0] _t188;
  wire [2:0] _t189;
  wire [2:0] _t190;
  wire [2:0] _t191;
  wire [2:0] _t192;
  wire [2:0] _t193;
  wire _t194;
  wire [2:0] _t195;
  wire [2:0] _t196;
  wire [2:0] _t197;
  wire [2:0] _t198;
  wire [2:0] _t199;
  wire [2:0] _t200;
  wire _t201;
  wire [2:0] _t202;
  wire [2:0] _t203;
  wire [2:0] _t204;
  wire [2:0] _t205;
  wire [2:0] _t206;
  wire [2:0] _t207;
  wire _t208;
  wire [2:0] _t209;
  wire _t210;
  wire _t211;
  wire _t212;
  wire _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire _t217;
  wire _t218;
  wire _t219;
  wire [2:0] _t220;
  wire _t221;
  wire [2:0] _t222;
  wire _t223;
  wire _t224;
  wire _t225;
  wire _t226;
  wire _t227;
  wire _t228;
  wire _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire [2:0] _t238;
  wire [2:0] _t239;
  wire _t240;
  wire _t241;
  wire _t242;
  wire _t243;
  wire _t244;
  wire _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire _t249;
  wire _t250;
  wire _t251;
  wire _t252;
  wire _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [7:0] _t257;
  wire _t258;
  wire [7:0] _t259;
  wire _t260;
  wire [7:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire _t265;
  wire _t266;
  wire _t267;
  wire _t268;
  wire _t269;
  wire _t270;
  wire _t271;
  wire [8:0] _t272;
  wire [7:0] _t273;
  wire _t274;
  wire _t275;
  wire _t276;
  wire _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire _t281;
  wire _t282;
  wire _t283;
  wire _t284;
  wire _t285;
  wire _t286;
  wire _t287;
  wire _t288;
  wire _t289;
  wire [3:0] _t290;
  wire [4:0] _t291;
  wire _t292;
  wire _t293;
  wire [4:0] _t294;
  wire [3:0] _t295;
  wire [4:0] _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire [4:0] _t302;
  wire _t303;
  wire [2:0] _t304;
  wire [4:0] _t305;
  wire _t306;
  wire [4:0] _t307;
  wire _t308;
  wire [2:0] _t309;
  wire [4:0] _t310;
  wire _t311;
  wire _t312;
  wire _t313;
  wire _t314;
  wire _t315;
  wire _t316;
  wire _t317;
  wire _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire _t323;
  wire _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire _t334;
  wire _t335;
  wire _t336;
  wire _t337;
  wire _t338;
  wire _t339;
  wire _t340;
  wire _t341;
  wire _t342;
  wire _t343;
  wire _t344;
  wire _t345;
  wire _t346;
  wire _t347;
  wire _t348;
  wire _t349;
  wire _t350;
  wire _t351;
  wire _t352;
  wire _t353;
  wire [4:0] _t354;
  wire [1:0] _t355;
  wire [1:0] _t356;
  wire [4:0] _t357;
  wire _t358;
  wire [4:0] _t359;
  wire [1:0] _t360;
  wire [1:0] _t361;
  wire [4:0] _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire _t366;
  wire _t367;
  wire [4:0] _t368;
  wire [2:0] _t369;
  wire _t370;
  wire [4:0] _t371;
  wire _t372;
  wire [4:0] _t373;
  wire [2:0] _t374;
  wire _t375;
  wire [4:0] _t376;
  wire _t377;
  wire _t378;
  wire _t379;
  wire _t380;
  wire _t381;
  wire [4:0] _t382;
  wire [3:0] _t383;
  wire [4:0] _t384;
  wire _t385;
  wire [4:0] _t386;
  wire [3:0] _t387;
  wire [4:0] _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire [2:0] _t392;
  wire [2:0] _t393;
  wire [2:0] _t394;
  wire [2:0] _t395;
  wire [2:0] _t396;
  wire _t397;
  wire [2:0] _t398;
  wire [2:0] _t399;
  wire [2:0] _t400;
  wire [2:0] _t401;
  wire [2:0] _t402;
  wire [2:0] _t403;
  wire _t404;
  wire [2:0] _t405;
  wire [2:0] _t406;
  wire [2:0] _t407;
  wire [2:0] _t408;
  wire [2:0] _t409;
  wire [2:0] _t410;
  wire _t411;
  wire [2:0] _t412;
  wire [2:0] _t413;
  wire [2:0] _t414;
  wire [2:0] _t415;
  wire [2:0] _t416;
  wire [2:0] _t417;
  wire _t418;
  wire [2:0] _t419;
  wire [2:0] _t420;
  wire [2:0] _t421;
  wire [2:0] _t422;
  wire [2:0] _t423;
  wire [2:0] _t424;
  wire _t425;
  wire [2:0] _t426;
  wire _t427;
  wire _t428;
  wire _t429;
  wire _t430;
  wire _t431;
  wire _t432;
  wire _t433;
  wire _t434;
  wire _t435;
  wire _t436;
  wire [2:0] _t437;
  wire _t438;
  wire [2:0] _t439;
  wire _t440;
  wire _t441;
  wire _t442;
  wire _t443;
  wire _t444;
  wire _t445;
  wire _t446;
  wire _t447;
  wire _t448;
  wire _t449;
  wire _t450;
  wire _t451;
  wire _t452;
  wire _t453;
  wire _t454;
  wire [2:0] _t455;
  wire [2:0] _t456;
  wire _t457;
  wire _t458;
  wire _t459;
  wire _t460;
  wire _t461;
  wire _t462;
  wire _t463;
  wire _t464;
  wire _t465;
  wire _t466;
  wire _t467;
  wire _t468;
  wire _t469;
  wire _t470;
  wire _t471;
  wire _t472;
  wire _t473;
  wire [7:0] _t474;
  wire _t475;
  wire [7:0] _t476;
  wire _t477;
  wire [7:0] _t478;
  wire _t479;
  wire _t480;
  wire _t481;
  wire _t482;
  wire _t483;
  wire _t484;
  wire _t485;
  wire _t486;
  wire [2:0] _t487;
  wire [2:0] _t488;
  wire [2:0] _t489;
  wire [2:0] _t490;
  wire [2:0] _t491;
  wire _t492;
  wire [2:0] _t493;
  wire [2:0] _t494;
  wire [2:0] _t495;
  wire [2:0] _t496;
  wire [2:0] _t497;
  wire [2:0] _t498;
  wire _t499;
  wire [2:0] _t500;
  wire [2:0] _t501;
  wire [2:0] _t502;
  wire [2:0] _t503;
  wire [2:0] _t504;
  wire [2:0] _t505;
  wire _t506;
  wire [2:0] _t507;
  wire [2:0] _t508;
  wire [2:0] _t509;
  wire [2:0] _t510;
  wire [2:0] _t511;
  wire [2:0] _t512;
  wire _t513;
  wire [2:0] _t514;
  wire [2:0] _t515;
  wire [2:0] _t516;
  wire [2:0] _t517;
  wire [2:0] _t518;
  wire [2:0] _t519;
  wire _t520;
  wire [2:0] _t521;
  wire _t522;
  wire _t523;
  wire _t524;
  wire _t525;
  wire _t526;
  wire _t527;
  wire _t528;
  wire _t529;
  wire _t530;
  wire _t531;
  wire [2:0] _t532;
  wire _t533;
  wire [2:0] _t534;
  wire _t535;
  wire _t536;
  wire _t537;
  wire _t538;
  wire _t539;
  wire _t540;
  wire _t541;
  wire _t542;
  wire _t543;
  wire _t544;
  wire _t545;
  wire _t546;
  wire _t547;
  wire _t548;
  wire _t549;
  wire [2:0] _t550;
  wire [2:0] _t551;
  wire _t552;
  wire _t553;
  wire _t554;
  wire _t555;
  wire _t556;
  wire _t557;
  wire _t558;
  wire _t559;
  wire _t560;
  wire _t561;
  wire _t562;
  wire _t563;
  wire _t564;
  wire _t565;
  wire _t566;
  wire _t567;
  wire _t568;
  wire [7:0] _t569;
  wire _t570;
  wire [7:0] _t571;
  wire _t572;
  wire [7:0] _t573;
  wire _t574;
  wire _t575;
  wire _t576;
  wire _t577;
  wire _t578;
  wire _t579;
  wire _t580;
  wire _t581;
  wire [1:0] _t582;
  wire _t583;
  wire [1:0] _t584;
  wire [1:0] _t585;
  wire [1:0] _t586;
  wire [1:0] _t587;
  wire _t588;
  wire [1:0] _t589;
  wire [1:0] _t590;
  wire [1:0] _t591;
  wire [1:0] _t592;
  wire [1:0] _t593;
  wire _t594;
  wire [1:0] _t595;
  wire [1:0] _t596;
  wire [1:0] _t597;
  wire [1:0] _t598;
  wire [1:0] _t599;
  wire _t600;
  wire [1:0] _t601;
  wire [1:0] _t602;
  wire [1:0] _t603;
  wire [1:0] _t604;
  wire [1:0] _t605;
  wire _t606;
  wire [1:0] _t607;
  wire _t608;
  wire _t609;
  wire _t610;
  wire _t611;
  wire _t612;
  wire _t613;
  wire _t614;
  wire _t615;
  wire [1:0] _t616;
  wire _t617;
  wire [1:0] _t618;
  wire _t619;
  wire _t620;
  wire _t621;
  wire _t622;
  wire _t623;
  wire _t624;
  wire _t625;
  wire _t626;
  wire _t627;
  wire _t628;
  wire _t629;
  wire _t630;
  wire _t631;
  wire _t632;
  wire [1:0] _t633;
  wire [1:0] _t634;
  wire _t635;
  wire _t636;
  wire _t637;
  wire _t638;
  wire _t639;
  wire _t640;
  wire _t641;
  wire _t642;
  wire _t643;
  wire _t644;
  wire _t645;
  wire _t646;
  wire _t647;
  wire _t648;
  wire [7:0] _t649;
  wire _t650;
  wire [7:0] _t651;
  wire _t652;
  wire _t653;
  wire _t654;
  wire _t655;
  wire _t656;
  wire _t657;
  wire [1:0] _t658;
  wire [1:0] _t659;
  wire [1:0] _t660;
  wire [1:0] _t661;
  wire _t662;
  wire [1:0] _t663;
  wire [1:0] _t664;
  wire [1:0] _t665;
  wire [1:0] _t666;
  wire [1:0] _t667;
  wire _t668;
  wire [1:0] _t669;
  wire [1:0] _t670;
  wire [1:0] _t671;
  wire [1:0] _t672;
  wire [1:0] _t673;
  wire _t674;
  wire [1:0] _t675;
  wire [1:0] _t676;
  wire [1:0] _t677;
  wire [1:0] _t678;
  wire [1:0] _t679;
  wire _t680;
  wire [1:0] _t681;
  wire _t682;
  wire _t683;
  wire _t684;
  wire _t685;
  wire _t686;
  wire _t687;
  wire _t688;
  wire _t689;
  wire [1:0] _t690;
  wire _t691;
  wire [1:0] _t692;
  wire _t693;
  wire _t694;
  wire _t695;
  wire _t696;
  wire _t697;
  wire _t698;
  wire _t699;
  wire _t700;
  wire _t701;
  wire _t702;
  wire _t703;
  wire _t704;
  wire _t705;
  wire _t706;
  wire [1:0] _t707;
  wire [1:0] _t708;
  wire _t709;
  wire _t710;
  wire _t711;
  wire _t712;
  wire _t713;
  wire _t714;
  wire _t715;
  wire _t716;
  wire _t717;
  wire _t718;
  wire _t719;
  wire _t720;
  wire _t721;
  wire _t722;
  wire [7:0] _t723;
  wire _t724;
  wire [7:0] _t725;
  wire _t726;
  wire _t727;
  wire _t728;
  wire _t729;
  wire _t730;
  wire _t731;
  wire [1:0] _t732;
  wire [1:0] _t733;
  wire [1:0] _t734;
  wire [1:0] _t735;
  wire _t736;
  wire [1:0] _t737;
  wire [1:0] _t738;
  wire [1:0] _t739;
  wire [1:0] _t740;
  wire [1:0] _t741;
  wire _t742;
  wire [1:0] _t743;
  wire [1:0] _t744;
  wire [1:0] _t745;
  wire [1:0] _t746;
  wire [1:0] _t747;
  wire _t748;
  wire [1:0] _t749;
  wire [1:0] _t750;
  wire [1:0] _t751;
  wire [1:0] _t752;
  wire [1:0] _t753;
  wire _t754;
  wire [1:0] _t755;
  wire _t756;
  wire _t757;
  wire _t758;
  wire _t759;
  wire _t760;
  wire _t761;
  wire _t762;
  wire _t763;
  wire [1:0] _t764;
  wire _t765;
  wire [1:0] _t766;
  wire _t767;
  wire _t768;
  wire _t769;
  wire _t770;
  wire _t771;
  wire _t772;
  wire _t773;
  wire _t774;
  wire _t775;
  wire _t776;
  wire _t777;
  wire _t778;
  wire _t779;
  wire _t780;
  wire [1:0] _t781;
  wire [1:0] _t782;
  wire _t783;
  wire _t784;
  wire _t785;
  wire _t786;
  wire _t787;
  wire _t788;
  wire _t789;
  wire _t790;
  wire _t791;
  wire _t792;
  wire _t793;
  wire _t794;
  wire _t795;
  wire _t796;
  wire [7:0] _t797;
  wire _t798;
  wire [7:0] _t799;
  wire _t800;
  wire _t801;
  wire _t802;
  wire _t803;
  wire _t804;
  wire _t805;
  wire [1:0] _t806;
  wire [1:0] _t807;
  wire [1:0] _t808;
  wire [1:0] _t809;
  wire _t810;
  wire [1:0] _t811;
  wire [1:0] _t812;
  wire [1:0] _t813;
  wire [1:0] _t814;
  wire [1:0] _t815;
  wire _t816;
  wire [1:0] _t817;
  wire [1:0] _t818;
  wire [1:0] _t819;
  wire [1:0] _t820;
  wire [1:0] _t821;
  wire _t822;
  wire [1:0] _t823;
  wire [1:0] _t824;
  wire [1:0] _t825;
  wire [1:0] _t826;
  wire [1:0] _t827;
  wire _t828;
  wire [1:0] _t829;
  wire _t830;
  wire _t831;
  wire _t832;
  wire _t833;
  wire _t834;
  wire _t835;
  wire _t836;
  wire _t837;
  wire [1:0] _t838;
  wire _t839;
  wire [1:0] _t840;
  wire _t841;
  wire _t842;
  wire _t843;
  wire _t844;
  wire _t845;
  wire _t846;
  wire _t847;
  wire _t848;
  wire _t849;
  wire _t850;
  wire _t851;
  wire _t852;
  wire _t853;
  wire _t854;
  wire [1:0] _t855;
  wire [1:0] _t856;
  wire _t857;
  wire _t858;
  wire _t859;
  wire _t860;
  wire _t861;
  wire _t862;
  wire _t863;
  wire _t864;
  wire _t865;
  wire _t866;
  wire _t867;
  wire _t868;
  wire _t869;
  wire _t870;
  wire [7:0] _t871;
  wire _t872;
  wire [7:0] _t873;
  wire _t874;
  wire _t875;
  wire _t876;
  wire _t877;
  wire _t878;
  wire _t879;
  wire [1:0] _t880;
  wire [1:0] _t881;
  wire [1:0] _t882;
  wire [1:0] _t883;
  wire _t884;
  wire [1:0] _t885;
  wire [1:0] _t886;
  wire [1:0] _t887;
  wire [1:0] _t888;
  wire [1:0] _t889;
  wire _t890;
  wire [1:0] _t891;
  wire [1:0] _t892;
  wire [1:0] _t893;
  wire [1:0] _t894;
  wire [1:0] _t895;
  wire _t896;
  wire [1:0] _t897;
  wire [1:0] _t898;
  wire [1:0] _t899;
  wire [1:0] _t900;
  wire [1:0] _t901;
  wire _t902;
  wire [1:0] _t903;
  wire _t904;
  wire _t905;
  wire _t906;
  wire _t907;
  wire _t908;
  wire _t909;
  wire _t910;
  wire _t911;
  wire [1:0] _t912;
  wire _t913;
  wire [1:0] _t914;
  wire _t915;
  wire _t916;
  wire _t917;
  wire _t918;
  wire _t919;
  wire _t920;
  wire _t921;
  wire _t922;
  wire _t923;
  wire _t924;
  wire _t925;
  wire _t926;
  wire _t927;
  wire _t928;
  wire [1:0] _t929;
  wire [1:0] _t930;
  wire _t931;
  wire _t932;
  wire _t933;
  wire _t934;
  wire _t935;
  wire _t936;
  wire _t937;
  wire _t938;
  wire _t939;
  wire _t940;
  wire _t941;
  wire _t942;
  wire _t943;
  wire _t944;
  wire [7:0] _t945;
  wire _t946;
  wire [7:0] _t947;
  wire _t948;
  wire _t949;
  wire _t950;
  wire _t951;
  wire _t952;
  wire _t953;
  wire [1:0] _t954;
  wire [4:0] _t955;
  wire [4:0] _t956;
  wire _t957;
  wire _t958;
  wire _t959;
  wire _t960;
  wire _t961;
  wire _t962;
  wire _t963;
  wire [22:0] _t964;
  wire [22:0] _t965;
  wire _t966;
  wire _t967;
  wire _t968;
  wire [2:0] _t969;
  wire [3:0] _t970;
  wire _t971;
  wire [1:0] _t972;
  wire [3:0] _t973;
  wire [1:0] _t974;
  wire _t975;
  wire [3:0] _t976;
  wire [2:0] _t977;
  wire [10:0] _t978;
  wire [11:0] _t979;
  wire _t980;
  wire [9:0] _t981;
  wire [11:0] _t982;
  wire [1:0] _t983;
  wire [8:0] _t984;
  wire [11:0] _t985;
  wire [2:0] _t986;
  wire [7:0] _t987;
  wire [11:0] _t988;
  wire [3:0] _t989;
  wire [6:0] _t990;
  wire [11:0] _t991;
  wire [4:0] _t992;
  wire [5:0] _t993;
  wire [11:0] _t994;
  wire [5:0] _t995;
  wire [4:0] _t996;
  wire [11:0] _t997;
  wire [6:0] _t998;
  wire [3:0] _t999;
  wire [11:0] _t1000;
  wire [7:0] _t1001;
  wire [2:0] _t1002;
  wire [11:0] _t1003;
  wire [8:0] _t1004;
  wire [1:0] _t1005;
  wire [11:0] _t1006;
  wire [9:0] _t1007;
  wire _t1008;
  wire [11:0] _t1009;
  wire [10:0] _t1010;
  wire [4:0] _t1011;
  wire _t1012;
  wire [2:0] _t1013;
  wire [2:0] _t1014;
  wire _t1015;
  wire [2:0] _t1016;
  wire [2:0] _t1017;
  wire [1:0] _t1018;
  wire [4:0] _t1019;
  wire _t1020;
  wire _t1021;
  wire _t1022;
  wire _t1023;
  wire [2:0] _t1024;
  wire [2:0] _t1025;
  wire _t1026;
  wire [2:0] _t1027;
  wire [2:0] _t1028;
  wire _t1029;
  wire [1:0] _t1030;
  wire [1:0] _t1031;
  wire _t1032;
  wire [1:0] _t1033;
  wire [1:0] _t1034;
  wire _t1035;
  wire [1:0] _t1036;
  wire [1:0] _t1037;
  wire _t1038;
  wire [1:0] _t1039;
  wire [1:0] _t1040;
  wire _t1041;
  wire [1:0] _t1042;
  wire [1:0] _t1043;
  wire [4:0] _t1044;
  wire _t1045;
  wire [26:0] _t1046;
  wire [22:0] _t1047;
  wire pll_clkout0;
  wire pll_clkout1;
  wire pll_lock;
  wire _xfifo_frame_src_ready;
  wire [7:0] _xfifo_frame_dst_data;
  wire _xfifo_frame_dst_last;
  wire _xfifo_frame_dst_valid;
  wire fi_i_ready;
  wire [7:0] fi_o_data;
  wire fi_o_last;
  wire fi_o_valid;
  wire ep_erx_ready;
  wire [7:0] ep_etx_data;
  wire ep_etx_last;
  wire ep_etx_valid;
  wire [7:0] ep_rx_data;
  wire ep_rx_last;
  wire ep_rx_valid;
  wire ep_tx_ready;
  wire [15:0] ep_nr;
  wire [15:0] ep_nt;
  wire [15:0] ep_na;
  wire ep_pr_valid;
  wire ep2_erx_ready;
  wire [7:0] ep2_etx_data;
  wire ep2_etx_last;
  wire ep2_etx_valid;
  wire [7:0] ep2_rx_data;
  wire ep2_rx_last;
  wire ep2_rx_valid;
  wire ep2_tx_ready;
  wire [15:0] ep2_nr;
  wire [15:0] ep2_nt;
  wire [15:0] ep2_na;
  wire ep2_pr_valid;
  wire ep3_erx_ready;
  wire [7:0] ep3_etx_data;
  wire ep3_etx_last;
  wire ep3_etx_valid;
  wire [7:0] ep3_rx_data;
  wire ep3_rx_last;
  wire ep3_rx_valid;
  wire ep3_tx_ready;
  wire [15:0] ep3_nr;
  wire [15:0] ep3_nt;
  wire [15:0] ep3_na;
  wire ep3_pr_valid;
  wire ep4_erx_ready;
  wire [7:0] ep4_etx_data;
  wire ep4_etx_last;
  wire ep4_etx_valid;
  wire [7:0] ep4_rx_data;
  wire ep4_rx_last;
  wire ep4_rx_valid;
  wire ep4_tx_ready;
  wire [15:0] ep4_nr;
  wire [15:0] ep4_nt;
  wire [15:0] ep4_na;
  wire ep4_pr_valid;
  wire ep5_erx_ready;
  wire [7:0] ep5_etx_data;
  wire ep5_etx_last;
  wire ep5_etx_valid;
  wire [7:0] ep5_rx_data;
  wire ep5_rx_last;
  wire ep5_rx_valid;
  wire ep5_tx_ready;
  wire [15:0] ep5_nr;
  wire [15:0] ep5_nt;
  wire [15:0] ep5_na;
  wire ep5_pr_valid;
  wire pm_hi_ready;
  wire pm_lo_ready;
  wire [7:0] pm_o_data;
  wire pm_o_last;
  wire pm_o_valid;
  wire _xfifo_frame2_src_ready;
  wire [7:0] _xfifo_frame2_dst_data;
  wire _xfifo_frame2_dst_last;
  wire _xfifo_frame2_dst_valid;
  wire fo_i_ready;
  wire [7:0] fo_o_data;
  wire fo_o_last;
  wire fo_o_valid;
  wire _xfifo_src_ready;
  wire [8:0] _xfifo_dst_data;
  wire _xfifo_dst_valid;
  wire sr_i_ready;
  wire [7:0] sr_f_data;
  wire sr_f_last;
  wire sr_f_valid;
  wire [7:0] sr_con_data;
  wire sr_con_valid;
  wire [15:0] sr_drops;
  wire udr_i_ready;
  wire [7:0] udr_o_data;
  wire udr_o_last;
  wire udr_o_valid;
  wire udt_t_ready;
  wire [7:0] udt_o_data;
  wire udt_o_last;
  wire udt_o_valid;
  wire udr2_i_ready;
  wire [7:0] udr2_o_data;
  wire udr2_o_last;
  wire udr2_o_valid;
  wire uri_i_ready;
  wire [7:0] uri_o_data;
  wire uri_o_last;
  wire uri_o_valid;
  wire cp_i_ready;
  wire [7:0] cp_o_data;
  wire cp_o_last;
  wire cp_o_valid;
  wire uro_i_ready;
  wire [7:0] uro_o_data;
  wire uro_o_valid;
  wire udr3_i_ready;
  wire [7:0] udr3_o_data;
  wire udr3_o_last;
  wire udr3_o_valid;
  wire udt2_t_ready;
  wire [7:0] udt2_o_data;
  wire udt2_o_last;
  wire udt2_o_valid;
  wire udr4_i_ready;
  wire [7:0] udr4_o_data;
  wire udr4_o_last;
  wire udr4_o_valid;
  wire udt3_t_ready;
  wire [7:0] udt3_o_data;
  wire udt3_o_last;
  wire udt3_o_valid;
  wire udr5_i_ready;
  wire [7:0] udr5_o_data;
  wire udr5_o_last;
  wire udr5_o_valid;
  wire udt4_t_ready;
  wire [7:0] udt4_o_data;
  wire udt4_o_last;
  wire udt4_o_valid;
  wire pm2_hi_ready;
  wire pm2_lo_ready;
  wire [7:0] pm2_o_data;
  wire pm2_o_last;
  wire pm2_o_valid;
  wire _xfifo2_src_ready;
  wire [7:0] _xfifo2_dst_data;
  wire _xfifo2_dst_valid;
  wire st_f_ready;
  wire st_con_ready;
  wire [7:0] st_o_data;
  wire st_o_valid;
  wire cp2_i_ready;
  wire [7:0] cp2_o_data;
  wire cp2_o_last;
  wire cp2_o_valid;
  wire rt_i_ready;
  wire [7:0] rt_oa_data;
  wire rt_oa_last;
  wire rt_oa_valid;
  wire [7:0] rt_ob_data;
  wire rt_ob_last;
  wire rt_ob_valid;
  wire [7:0] rt_oc_data;
  wire rt_oc_last;
  wire rt_oc_valid;
  wire [7:0] rt_od_data;
  wire rt_od_last;
  wire rt_od_valid;
  wire cp3_i_ready;
  wire [7:0] cp3_o_data;
  wire cp3_o_last;
  wire cp3_o_valid;
  wire rt2_i_ready;
  wire [7:0] rt2_oa_data;
  wire rt2_oa_last;
  wire rt2_oa_valid;
  wire [7:0] rt2_ob_data;
  wire rt2_ob_last;
  wire rt2_ob_valid;
  wire [7:0] rt2_oc_data;
  wire rt2_oc_last;
  wire rt2_oc_valid;
  wire [7:0] rt2_od_data;
  wire rt2_od_last;
  wire rt2_od_valid;
  wire cp4_i_ready;
  wire [7:0] cp4_o_data;
  wire cp4_o_last;
  wire cp4_o_valid;
  wire rt3_i_ready;
  wire [7:0] rt3_oa_data;
  wire rt3_oa_last;
  wire rt3_oa_valid;
  wire [7:0] rt3_ob_data;
  wire rt3_ob_last;
  wire rt3_ob_valid;
  wire [7:0] rt3_oc_data;
  wire rt3_oc_last;
  wire rt3_oc_valid;
  wire [7:0] rt3_od_data;
  wire rt3_od_last;
  wire rt3_od_valid;
  wire cp5_i_ready;
  wire [7:0] cp5_o_data;
  wire cp5_o_last;
  wire cp5_o_valid;
  wire rt4_i_ready;
  wire [7:0] rt4_oa_data;
  wire rt4_oa_last;
  wire rt4_oa_valid;
  wire [7:0] rt4_ob_data;
  wire rt4_ob_last;
  wire rt4_ob_valid;
  wire [7:0] rt4_oc_data;
  wire rt4_oc_last;
  wire rt4_oc_valid;
  wire [7:0] rt4_od_data;
  wire rt4_od_last;
  wire rt4_od_valid;
  wire cip_i_ready;
  wire [7:0] cip_o_data;
  wire cip_o_last;
  wire cip_o_valid;
  wire cs_i_ready;
  wire [7:0] cs_oa_data;
  wire cs_oa_last;
  wire cs_oa_valid;
  wire [7:0] cs_ob_data;
  wire cs_ob_last;
  wire cs_ob_valid;
  wire [7:0] cs_oc_data;
  wire cs_oc_last;
  wire cs_oc_valid;
  wire [7:0] cs_od_data;
  wire cs_od_last;
  wire cs_od_valid;
  wire m_sd_clk;
  wire m_sd_cs_n;
  wire m_sd_mosi;
  wire m_sd_activity;
  wire m_de;
  wire m_hs;
  wire m_vs;
  wire [7:0] m_r;
  wire [7:0] m_g;
  wire [7:0] m_b;
  wire [15:0] m_sample;
  wire [7:0] cap_t_data;
  wire cap_t_last;
  wire cap_t_valid;
  wire [31:0] cap_sent;
  wire st0_t_ready;
  wire st0_rx_ready;
  wire [7:0] st0_tx_data;
  wire st0_tx_last;
  wire st0_tx_valid;
  wire st0_err;
  wire [7:0] snd_t_data;
  wire snd_t_last;
  wire snd_t_valid;
  wire [31:0] snd_drops;
  wire st1_t_ready;
  wire st1_rx_ready;
  wire [7:0] st1_tx_data;
  wire st1_tx_last;
  wire st1_tx_valid;
  wire st1_err;
  wire card_blk_req;
  wire card_blk_wr;
  wire [31:0] card_blk_lba;
  wire [7:0] card_blk_wdata;
  wire card_miso;
  wire bp_blk_ack;
  wire bp_blk_stb;
  wire [7:0] bp_blk_rdata;
  wire bp_blk_done;
  wire bp_blk_err;
  wire [7:0] bp_req_data;
  wire bp_req_last;
  wire bp_req_valid;
  wire bp_ans_ready;
  wire [31:0] bp_ops;
  wire st2_t_ready;
  wire st2_rx_ready;
  wire [7:0] st2_tx_data;
  wire st2_tx_last;
  wire st2_tx_valid;
  wire st2_err;
  wire sr3_rx_ready;
  wire [7:0] sr3_tx_data;
  wire sr3_tx_last;
  wire sr3_tx_valid;
  wire [7:0] sr3_s_data;
  wire sr3_s_last;
  wire sr3_s_valid;
  wire [15:0] sr3_lost;
  wire [15:0] sr3_cut;
  wire [15:0] sr3_gaps;
  wire hi_s_ready;
  wire [7:0] hi_ans_data;
  wire hi_ans_last;
  wire hi_ans_valid;
  wire [7:0] hi_key;
  wire hi_key_valid;
  wire hi_refresh;
  wire hi_boot;
  wire [31:0] hi_lost;
  assign _t0 = u4_took[4];
  assign _t1 = ((|_t0) || (|u4_f_4__ready));
  assign _t2 = u4_took[3];
  assign _t3 = ((|_t2) || (|u4_f_3__ready));
  assign _t4 = u4_took[2];
  assign _t5 = ((|_t4) || (|u4_f_2__ready));
  assign _t6 = u4_took[1];
  assign _t7 = ((|_t6) || (|u4_f_1__ready));
  assign _t8 = u4_took[0];
  assign _t9 = ((|_t8) || (|u4_f_0__ready));
  assign _t10 = ((|1'd1) && (|_t9));
  assign _t11 = ((|_t10) && (|_t7));
  assign _t12 = ((|_t11) && (|_t5));
  assign _t13 = ((|_t12) && (|_t3));
  assign _t14 = u4_took[0];
  assign _t15 = (~_t14);
  assign _t16 = u4_took[4:1];
  assign _t17 = {_t16, 1'd0};
  assign _t18 = ((|_t13) && (|_t1));
  assign _t19 = ((|u4_rx_valid) && (|_t18));
  assign _t20 = ((|_t19) ? _t17 : u4_took);
  assign _t21 = _t20[4:1];
  assign _t22 = {_t21, 1'd1};
  assign _t23 = ((|u4_f_0__valid) && (|u4_f_0__ready));
  assign _t24 = (~_t19);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = u4_took[1];
  assign _t27 = (~_t26);
  assign _t28 = ((|_t25) ? _t22 : _t20);
  assign _t29 = _t28[0:0];
  assign _t30 = _t28[4:2];
  assign _t31 = {_t30, 1'd0, _t29};
  assign _t32 = ((|u4_rx_valid) && (|_t18));
  assign _t33 = ((|_t32) ? _t31 : _t28);
  assign _t34 = _t33[0:0];
  assign _t35 = _t33[4:2];
  assign _t36 = {_t35, 1'd1, _t34};
  assign _t37 = ((|u4_f_1__valid) && (|u4_f_1__ready));
  assign _t38 = (~_t32);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = u4_took[2];
  assign _t41 = (~_t40);
  assign _t42 = ((|_t39) ? _t36 : _t33);
  assign _t43 = _t42[1:0];
  assign _t44 = _t42[4:3];
  assign _t45 = {_t44, 1'd0, _t43};
  assign _t46 = ((|u4_rx_valid) && (|_t18));
  assign _t47 = ((|_t46) ? _t45 : _t42);
  assign _t48 = _t47[1:0];
  assign _t49 = _t47[4:3];
  assign _t50 = {_t49, 1'd1, _t48};
  assign _t51 = ((|u4_f_2__valid) && (|u4_f_2__ready));
  assign _t52 = (~_t46);
  assign _t53 = ((|_t52) && (|_t51));
  assign _t54 = u4_took[3];
  assign _t55 = (~_t54);
  assign _t56 = ((|_t53) ? _t50 : _t47);
  assign _t57 = _t56[2:0];
  assign _t58 = _t56[4:4];
  assign _t59 = {_t58, 1'd0, _t57};
  assign _t60 = ((|u4_rx_valid) && (|_t18));
  assign _t61 = ((|_t60) ? _t59 : _t56);
  assign _t62 = _t61[2:0];
  assign _t63 = _t61[4:4];
  assign _t64 = {_t63, 1'd1, _t62};
  assign _t65 = ((|u4_f_3__valid) && (|u4_f_3__ready));
  assign _t66 = (~_t60);
  assign _t67 = ((|_t66) && (|_t65));
  assign _t68 = u4_took[4];
  assign _t69 = (~_t68);
  assign _t70 = ((|_t67) ? _t64 : _t61);
  assign _t71 = _t70[3:0];
  assign _t72 = {1'd0, _t71};
  assign _t73 = ((|u4_rx_valid) && (|_t18));
  assign _t74 = ((|_t73) ? _t72 : _t70);
  assign _t75 = _t74[3:0];
  assign _t76 = {1'd1, _t75};
  assign _t77 = ((|u4_f_4__valid) && (|u4_f_4__ready));
  assign _t78 = (~_t73);
  assign _t79 = ((|_t78) && (|_t77));
  assign _t80 = ((|u4_p_4__valid) ? 3'd4 : 3'd0);
  assign _t81 = ((|u4_p_3__valid) ? 3'd3 : _t80);
  assign _t82 = ((|u4_p_2__valid) ? 3'd2 : _t81);
  assign _t83 = ((|u4_p_1__valid) ? 3'd1 : _t82);
  assign _t84 = ((|u4_p_0__valid) ? 3'd0 : _t83);
  assign _t85 = (_merge_rr == 3'd0);
  assign _t86 = ((|_t85) ? _t84 : _merge_rr);
  assign _t87 = ((|u4_p_0__valid) ? 3'd0 : 3'd1);
  assign _t88 = ((|u4_p_4__valid) ? 3'd4 : _t87);
  assign _t89 = ((|u4_p_3__valid) ? 3'd3 : _t88);
  assign _t90 = ((|u4_p_2__valid) ? 3'd2 : _t89);
  assign _t91 = ((|u4_p_1__valid) ? 3'd1 : _t90);
  assign _t92 = (_merge_rr == 3'd1);
  assign _t93 = ((|_t92) ? _t91 : _t86);
  assign _t94 = ((|u4_p_1__valid) ? 3'd1 : 3'd2);
  assign _t95 = ((|u4_p_0__valid) ? 3'd0 : _t94);
  assign _t96 = ((|u4_p_4__valid) ? 3'd4 : _t95);
  assign _t97 = ((|u4_p_3__valid) ? 3'd3 : _t96);
  assign _t98 = ((|u4_p_2__valid) ? 3'd2 : _t97);
  assign _t99 = (_merge_rr == 3'd2);
  assign _t100 = ((|_t99) ? _t98 : _t93);
  assign _t101 = ((|u4_p_2__valid) ? 3'd2 : 3'd3);
  assign _t102 = ((|u4_p_1__valid) ? 3'd1 : _t101);
  assign _t103 = ((|u4_p_0__valid) ? 3'd0 : _t102);
  assign _t104 = ((|u4_p_4__valid) ? 3'd4 : _t103);
  assign _t105 = ((|u4_p_3__valid) ? 3'd3 : _t104);
  assign _t106 = (_merge_rr == 3'd3);
  assign _t107 = ((|_t106) ? _t105 : _t100);
  assign _t108 = ((|u4_p_3__valid) ? 3'd3 : 3'd4);
  assign _t109 = ((|u4_p_2__valid) ? 3'd2 : _t108);
  assign _t110 = ((|u4_p_1__valid) ? 3'd1 : _t109);
  assign _t111 = ((|u4_p_0__valid) ? 3'd0 : _t110);
  assign _t112 = ((|u4_p_4__valid) ? 3'd4 : _t111);
  assign _t113 = (_merge_rr == 3'd4);
  assign _t114 = ((|_t113) ? _t112 : _t107);
  assign _t115 = (_merge_sel == 3'd3);
  assign _t116 = ((|_t115) ? u4_p_3__last : u4_p_4__last);
  assign _t117 = (_merge_sel == 3'd2);
  assign _t118 = ((|_t117) ? u4_p_2__last : _t116);
  assign _t119 = (_merge_sel == 3'd1);
  assign _t120 = ((|_t119) ? u4_p_1__last : _t118);
  assign _t121 = (_merge_sel == 3'd0);
  assign _t122 = ((|_t121) ? u4_p_0__last : _t120);
  assign _t123 = ((|_merge_valid) && (|_merge_ready));
  assign _t124 = ((|_t123) && (|_t122));
  assign _t125 = (_merge_sel + 3'd1);
  assign _t126 = (_merge_sel == 3'd4);
  assign _t127 = ((|_t126) ? 3'd0 : _t125);
  assign _t128 = ((|_t124) ? 1'd0 : _merge_lock);
  assign _t129 = (~_t124);
  assign _t130 = ((|_t129) && (|_t123));
  assign _t131 = ((|_t129) && (|_t123));
  assign _t132 = ((|_t130) ? 1'd1 : _t128);
  assign _t133 = (~_merge_lock);
  assign _t134 = ((|1'd0) || (|u4_p_0__valid));
  assign _t135 = ((|_t134) || (|u4_p_1__valid));
  assign _t136 = ((|_t135) || (|u4_p_2__valid));
  assign _t137 = ((|_t136) || (|u4_p_3__valid));
  assign _t138 = ((|_t137) || (|u4_p_4__valid));
  assign _t139 = ((|_t138) && (|_t133));
  assign _t140 = (~_t123);
  assign _t141 = ((|_t129) && (|_t140));
  assign _t142 = ((|_t141) && (|_t139));
  assign _t143 = ((|_t131) ? _merge_sel : _merge_lsel);
  assign _t144 = ((|_t113) ? _t112 : _t107);
  assign _t145 = ((|_t129) && (|_t140));
  assign _t146 = ((|_t145) && (|_t139));
  assign _t147 = ((|1'd0) || (|u4_p_0__valid));
  assign _t148 = ((|_t147) || (|u4_p_1__valid));
  assign _t149 = ((|_t148) || (|u4_p_2__valid));
  assign _t150 = ((|_t149) || (|u4_p_3__valid));
  assign _t151 = (_merge_sel == 3'd0);
  assign _t152 = ((|_merge_valid) && (|_merge_ready));
  assign _t153 = (_merge_sel == 3'd1);
  assign _t154 = ((|_merge_valid) && (|_merge_ready));
  assign _t155 = (_merge_sel == 3'd2);
  assign _t156 = ((|_merge_valid) && (|_merge_ready));
  assign _t157 = (_merge_sel == 3'd3);
  assign _t158 = ((|_merge_valid) && (|_merge_ready));
  assign _t159 = (_merge_sel == 3'd4);
  assign _t160 = ((|_merge_valid) && (|_merge_ready));
  assign _t161 = (_merge_sel == 3'd3);
  assign _t162 = ((|_t161) ? u4_p_3__data : u4_p_4__data);
  assign _t163 = (_merge_sel == 3'd2);
  assign _t164 = ((|_t163) ? u4_p_2__data : _t162);
  assign _t165 = (_merge_sel == 3'd1);
  assign _t166 = ((|_t165) ? u4_p_1__data : _t164);
  assign _t167 = (_merge_sel == 3'd0);
  assign _t168 = (_merge_sel == 3'd3);
  assign _t169 = ((|_t168) ? u4_p_3__last : u4_p_4__last);
  assign _t170 = (_merge_sel == 3'd2);
  assign _t171 = ((|_t170) ? u4_p_2__last : _t169);
  assign _t172 = (_merge_sel == 3'd1);
  assign _t173 = ((|_t172) ? u4_p_1__last : _t171);
  assign _t174 = (_merge_sel == 3'd0);
  assign _t175 = ((|u4_t_4__valid) ? 3'd4 : 3'd0);
  assign _t176 = ((|u4_t_3__valid) ? 3'd3 : _t175);
  assign _t177 = ((|u4_t_2__valid) ? 3'd2 : _t176);
  assign _t178 = ((|u4_t_1__valid) ? 3'd1 : _t177);
  assign _t179 = ((|u4_t_0__valid) ? 3'd0 : _t178);
  assign _t180 = (_merge2_rr == 3'd0);
  assign _t181 = ((|_t180) ? _t179 : _merge2_rr);
  assign _t182 = ((|u4_t_0__valid) ? 3'd0 : 3'd1);
  assign _t183 = ((|u4_t_4__valid) ? 3'd4 : _t182);
  assign _t184 = ((|u4_t_3__valid) ? 3'd3 : _t183);
  assign _t185 = ((|u4_t_2__valid) ? 3'd2 : _t184);
  assign _t186 = ((|u4_t_1__valid) ? 3'd1 : _t185);
  assign _t187 = (_merge2_rr == 3'd1);
  assign _t188 = ((|_t187) ? _t186 : _t181);
  assign _t189 = ((|u4_t_1__valid) ? 3'd1 : 3'd2);
  assign _t190 = ((|u4_t_0__valid) ? 3'd0 : _t189);
  assign _t191 = ((|u4_t_4__valid) ? 3'd4 : _t190);
  assign _t192 = ((|u4_t_3__valid) ? 3'd3 : _t191);
  assign _t193 = ((|u4_t_2__valid) ? 3'd2 : _t192);
  assign _t194 = (_merge2_rr == 3'd2);
  assign _t195 = ((|_t194) ? _t193 : _t188);
  assign _t196 = ((|u4_t_2__valid) ? 3'd2 : 3'd3);
  assign _t197 = ((|u4_t_1__valid) ? 3'd1 : _t196);
  assign _t198 = ((|u4_t_0__valid) ? 3'd0 : _t197);
  assign _t199 = ((|u4_t_4__valid) ? 3'd4 : _t198);
  assign _t200 = ((|u4_t_3__valid) ? 3'd3 : _t199);
  assign _t201 = (_merge2_rr == 3'd3);
  assign _t202 = ((|_t201) ? _t200 : _t195);
  assign _t203 = ((|u4_t_3__valid) ? 3'd3 : 3'd4);
  assign _t204 = ((|u4_t_2__valid) ? 3'd2 : _t203);
  assign _t205 = ((|u4_t_1__valid) ? 3'd1 : _t204);
  assign _t206 = ((|u4_t_0__valid) ? 3'd0 : _t205);
  assign _t207 = ((|u4_t_4__valid) ? 3'd4 : _t206);
  assign _t208 = (_merge2_rr == 3'd4);
  assign _t209 = ((|_t208) ? _t207 : _t202);
  assign _t210 = (_merge2_sel == 3'd3);
  assign _t211 = ((|_t210) ? u4_t_3__last : u4_t_4__last);
  assign _t212 = (_merge2_sel == 3'd2);
  assign _t213 = ((|_t212) ? u4_t_2__last : _t211);
  assign _t214 = (_merge2_sel == 3'd1);
  assign _t215 = ((|_t214) ? u4_t_1__last : _t213);
  assign _t216 = (_merge2_sel == 3'd0);
  assign _t217 = ((|_t216) ? u4_t_0__last : _t215);
  assign _t218 = ((|_merge2_valid) && (|_merge2_ready));
  assign _t219 = ((|_t218) && (|_t217));
  assign _t220 = (_merge2_sel + 3'd1);
  assign _t221 = (_merge2_sel == 3'd4);
  assign _t222 = ((|_t221) ? 3'd0 : _t220);
  assign _t223 = ((|_t219) ? 1'd0 : _merge2_lock);
  assign _t224 = (~_t219);
  assign _t225 = ((|_t224) && (|_t218));
  assign _t226 = ((|_t224) && (|_t218));
  assign _t227 = ((|_t225) ? 1'd1 : _t223);
  assign _t228 = (~_merge2_lock);
  assign _t229 = ((|1'd0) || (|u4_t_0__valid));
  assign _t230 = ((|_t229) || (|u4_t_1__valid));
  assign _t231 = ((|_t230) || (|u4_t_2__valid));
  assign _t232 = ((|_t231) || (|u4_t_3__valid));
  assign _t233 = ((|_t232) || (|u4_t_4__valid));
  assign _t234 = ((|_t233) && (|_t228));
  assign _t235 = (~_t218);
  assign _t236 = ((|_t224) && (|_t235));
  assign _t237 = ((|_t236) && (|_t234));
  assign _t238 = ((|_t226) ? _merge2_sel : _merge2_lsel);
  assign _t239 = ((|_t208) ? _t207 : _t202);
  assign _t240 = ((|_t224) && (|_t235));
  assign _t241 = ((|_t240) && (|_t234));
  assign _t242 = ((|1'd0) || (|u4_t_0__valid));
  assign _t243 = ((|_t242) || (|u4_t_1__valid));
  assign _t244 = ((|_t243) || (|u4_t_2__valid));
  assign _t245 = ((|_t244) || (|u4_t_3__valid));
  assign _t246 = (_merge2_sel == 3'd0);
  assign _t247 = ((|_merge2_valid) && (|_merge2_ready));
  assign _t248 = (_merge2_sel == 3'd1);
  assign _t249 = ((|_merge2_valid) && (|_merge2_ready));
  assign _t250 = (_merge2_sel == 3'd2);
  assign _t251 = ((|_merge2_valid) && (|_merge2_ready));
  assign _t252 = (_merge2_sel == 3'd3);
  assign _t253 = ((|_merge2_valid) && (|_merge2_ready));
  assign _t254 = (_merge2_sel == 3'd4);
  assign _t255 = ((|_merge2_valid) && (|_merge2_ready));
  assign _t256 = (_merge2_sel == 3'd3);
  assign _t257 = ((|_t256) ? u4_t_3__data : u4_t_4__data);
  assign _t258 = (_merge2_sel == 3'd2);
  assign _t259 = ((|_t258) ? u4_t_2__data : _t257);
  assign _t260 = (_merge2_sel == 3'd1);
  assign _t261 = ((|_t260) ? u4_t_1__data : _t259);
  assign _t262 = (_merge2_sel == 3'd0);
  assign _t263 = (_merge2_sel == 3'd3);
  assign _t264 = ((|_t263) ? u4_t_3__last : u4_t_4__last);
  assign _t265 = (_merge2_sel == 3'd2);
  assign _t266 = ((|_t265) ? u4_t_2__last : _t264);
  assign _t267 = (_merge2_sel == 3'd1);
  assign _t268 = ((|_t267) ? u4_t_1__last : _t266);
  assign _t269 = (_merge2_sel == 3'd0);
  assign _t270 = ((|dl_cr_0__valid) && (|dl_cr_0__ready));
  assign _t271 = 1'd0;
  assign _t272 = {_t271, hurx_data_v};
  assign _t273 = _t272[7:0];
  assign _t274 = ud_took[4];
  assign _t275 = ((|_t274) || (|ud_f_4__ready));
  assign _t276 = ud_took[3];
  assign _t277 = ((|_t276) || (|ud_f_3__ready));
  assign _t278 = ud_took[2];
  assign _t279 = ((|_t278) || (|ud_f_2__ready));
  assign _t280 = ud_took[1];
  assign _t281 = ((|_t280) || (|ud_f_1__ready));
  assign _t282 = ud_took[0];
  assign _t283 = ((|_t282) || (|ud_f_0__ready));
  assign _t284 = ((|1'd1) && (|_t283));
  assign _t285 = ((|_t284) && (|_t281));
  assign _t286 = ((|_t285) && (|_t279));
  assign _t287 = ((|_t286) && (|_t277));
  assign _t288 = ud_took[0];
  assign _t289 = (~_t288);
  assign _t290 = ud_took[4:1];
  assign _t291 = {_t290, 1'd0};
  assign _t292 = ((|_t287) && (|_t275));
  assign _t293 = ((|ud_in_valid) && (|_t292));
  assign _t294 = ((|_t293) ? _t291 : ud_took);
  assign _t295 = _t294[4:1];
  assign _t296 = {_t295, 1'd1};
  assign _t297 = ((|ud_f_0__valid) && (|ud_f_0__ready));
  assign _t298 = (~_t293);
  assign _t299 = ((|_t298) && (|_t297));
  assign _t300 = ud_took[1];
  assign _t301 = (~_t300);
  assign _t302 = ((|_t299) ? _t296 : _t294);
  assign _t303 = _t302[0:0];
  assign _t304 = _t302[4:2];
  assign _t305 = {_t304, 1'd0, _t303};
  assign _t306 = ((|ud_in_valid) && (|_t292));
  assign _t307 = ((|_t306) ? _t305 : _t302);
  assign _t308 = _t307[0:0];
  assign _t309 = _t307[4:2];
  assign _t310 = {_t309, 1'd1, _t308};
  assign _t311 = ((|ud_f_1__valid) && (|ud_f_1__ready));
  assign _t312 = (~_t306);
  assign _t313 = ((|_t312) && (|_t311));
  assign _t314 = ((|cri_valid) ? 1'd1 : 1'd0);
  assign _t315 = ((|cfr_valid) ? 1'd0 : _t314);
  assign _t316 = (_merge3_rr == 1'd0);
  assign _t317 = ((|_t316) ? _t315 : _merge3_rr);
  assign _t318 = ((|cfr_valid) ? 1'd0 : 1'd1);
  assign _t319 = ((|cri_valid) ? 1'd1 : _t318);
  assign _t320 = (_merge3_rr == 1'd1);
  assign _t321 = ((|_t320) ? _t319 : _t317);
  assign _t322 = (_merge3_sel == 1'd0);
  assign _t323 = ((|_t322) ? cfr_last : cri_last);
  assign _t324 = ((|_merge3_valid) && (|_merge3_ready));
  assign _t325 = ((|_t324) && (|_t323));
  assign _t326 = (_merge3_sel + 1'd1);
  assign _t327 = (_merge3_sel == 1'd1);
  assign _t328 = ((|_t327) ? 1'd0 : _t326);
  assign _t329 = ((|_t325) ? 1'd0 : _merge3_lock);
  assign _t330 = (~_t325);
  assign _t331 = ((|_t330) && (|_t324));
  assign _t332 = ((|_t330) && (|_t324));
  assign _t333 = ((|_t331) ? 1'd1 : _t329);
  assign _t334 = (~_merge3_lock);
  assign _t335 = ((|1'd0) || (|cfr_valid));
  assign _t336 = ((|_t335) || (|cri_valid));
  assign _t337 = ((|_t336) && (|_t334));
  assign _t338 = (~_t324);
  assign _t339 = ((|_t330) && (|_t338));
  assign _t340 = ((|_t339) && (|_t337));
  assign _t341 = ((|_t332) ? _merge3_sel : _merge3_lsel);
  assign _t342 = ((|_t320) ? _t319 : _t317);
  assign _t343 = ((|_t330) && (|_t338));
  assign _t344 = ((|_t343) && (|_t337));
  assign _t345 = ((|1'd0) || (|cfr_valid));
  assign _t346 = (_merge3_sel == 1'd0);
  assign _t347 = ((|_merge3_valid) && (|_merge3_ready));
  assign _t348 = (_merge3_sel == 1'd1);
  assign _t349 = ((|_merge3_valid) && (|_merge3_ready));
  assign _t350 = (_merge3_sel == 1'd0);
  assign _t351 = (_merge3_sel == 1'd0);
  assign _t352 = ud_took[2];
  assign _t353 = (~_t352);
  assign _t354 = ((|_t313) ? _t310 : _t307);
  assign _t355 = _t354[1:0];
  assign _t356 = _t354[4:3];
  assign _t357 = {_t356, 1'd0, _t355};
  assign _t358 = ((|ud_in_valid) && (|_t292));
  assign _t359 = ((|_t358) ? _t357 : _t354);
  assign _t360 = _t359[1:0];
  assign _t361 = _t359[4:3];
  assign _t362 = {_t361, 1'd1, _t360};
  assign _t363 = ((|ud_f_2__valid) && (|ud_f_2__ready));
  assign _t364 = (~_t358);
  assign _t365 = ((|_t364) && (|_t363));
  assign _t366 = ud_took[3];
  assign _t367 = (~_t366);
  assign _t368 = ((|_t365) ? _t362 : _t359);
  assign _t369 = _t368[2:0];
  assign _t370 = _t368[4:4];
  assign _t371 = {_t370, 1'd0, _t369};
  assign _t372 = ((|ud_in_valid) && (|_t292));
  assign _t373 = ((|_t372) ? _t371 : _t368);
  assign _t374 = _t373[2:0];
  assign _t375 = _t373[4:4];
  assign _t376 = {_t375, 1'd1, _t374};
  assign _t377 = ((|ud_f_3__valid) && (|ud_f_3__ready));
  assign _t378 = (~_t372);
  assign _t379 = ((|_t378) && (|_t377));
  assign _t380 = ud_took[4];
  assign _t381 = (~_t380);
  assign _t382 = ((|_t379) ? _t376 : _t373);
  assign _t383 = _t382[3:0];
  assign _t384 = {1'd0, _t383};
  assign _t385 = ((|ud_in_valid) && (|_t292));
  assign _t386 = ((|_t385) ? _t384 : _t382);
  assign _t387 = _t386[3:0];
  assign _t388 = {1'd1, _t387};
  assign _t389 = ((|ud_f_4__valid) && (|ud_f_4__ready));
  assign _t390 = (~_t385);
  assign _t391 = ((|_t390) && (|_t389));
  assign _t392 = ((|ud_p_4__valid) ? 3'd4 : 3'd0);
  assign _t393 = ((|ud_p_3__valid) ? 3'd3 : _t392);
  assign _t394 = ((|ud_p_2__valid) ? 3'd2 : _t393);
  assign _t395 = ((|ud_p_1__valid) ? 3'd1 : _t394);
  assign _t396 = ((|ud_p_0__valid) ? 3'd0 : _t395);
  assign _t397 = (_merge4_rr == 3'd0);
  assign _t398 = ((|_t397) ? _t396 : _merge4_rr);
  assign _t399 = ((|ud_p_0__valid) ? 3'd0 : 3'd1);
  assign _t400 = ((|ud_p_4__valid) ? 3'd4 : _t399);
  assign _t401 = ((|ud_p_3__valid) ? 3'd3 : _t400);
  assign _t402 = ((|ud_p_2__valid) ? 3'd2 : _t401);
  assign _t403 = ((|ud_p_1__valid) ? 3'd1 : _t402);
  assign _t404 = (_merge4_rr == 3'd1);
  assign _t405 = ((|_t404) ? _t403 : _t398);
  assign _t406 = ((|ud_p_1__valid) ? 3'd1 : 3'd2);
  assign _t407 = ((|ud_p_0__valid) ? 3'd0 : _t406);
  assign _t408 = ((|ud_p_4__valid) ? 3'd4 : _t407);
  assign _t409 = ((|ud_p_3__valid) ? 3'd3 : _t408);
  assign _t410 = ((|ud_p_2__valid) ? 3'd2 : _t409);
  assign _t411 = (_merge4_rr == 3'd2);
  assign _t412 = ((|_t411) ? _t410 : _t405);
  assign _t413 = ((|ud_p_2__valid) ? 3'd2 : 3'd3);
  assign _t414 = ((|ud_p_1__valid) ? 3'd1 : _t413);
  assign _t415 = ((|ud_p_0__valid) ? 3'd0 : _t414);
  assign _t416 = ((|ud_p_4__valid) ? 3'd4 : _t415);
  assign _t417 = ((|ud_p_3__valid) ? 3'd3 : _t416);
  assign _t418 = (_merge4_rr == 3'd3);
  assign _t419 = ((|_t418) ? _t417 : _t412);
  assign _t420 = ((|ud_p_3__valid) ? 3'd3 : 3'd4);
  assign _t421 = ((|ud_p_2__valid) ? 3'd2 : _t420);
  assign _t422 = ((|ud_p_1__valid) ? 3'd1 : _t421);
  assign _t423 = ((|ud_p_0__valid) ? 3'd0 : _t422);
  assign _t424 = ((|ud_p_4__valid) ? 3'd4 : _t423);
  assign _t425 = (_merge4_rr == 3'd4);
  assign _t426 = ((|_t425) ? _t424 : _t419);
  assign _t427 = (_merge4_sel == 3'd3);
  assign _t428 = ((|_t427) ? ud_p_3__last : ud_p_4__last);
  assign _t429 = (_merge4_sel == 3'd2);
  assign _t430 = ((|_t429) ? ud_p_2__last : _t428);
  assign _t431 = (_merge4_sel == 3'd1);
  assign _t432 = ((|_t431) ? ud_p_1__last : _t430);
  assign _t433 = (_merge4_sel == 3'd0);
  assign _t434 = ((|_t433) ? ud_p_0__last : _t432);
  assign _t435 = ((|_merge4_valid) && (|_merge4_ready));
  assign _t436 = ((|_t435) && (|_t434));
  assign _t437 = (_merge4_sel + 3'd1);
  assign _t438 = (_merge4_sel == 3'd4);
  assign _t439 = ((|_t438) ? 3'd0 : _t437);
  assign _t440 = ((|_t436) ? 1'd0 : _merge4_lock);
  assign _t441 = (~_t436);
  assign _t442 = ((|_t441) && (|_t435));
  assign _t443 = ((|_t441) && (|_t435));
  assign _t444 = ((|_t442) ? 1'd1 : _t440);
  assign _t445 = (~_merge4_lock);
  assign _t446 = ((|1'd0) || (|ud_p_0__valid));
  assign _t447 = ((|_t446) || (|ud_p_1__valid));
  assign _t448 = ((|_t447) || (|ud_p_2__valid));
  assign _t449 = ((|_t448) || (|ud_p_3__valid));
  assign _t450 = ((|_t449) || (|ud_p_4__valid));
  assign _t451 = ((|_t450) && (|_t445));
  assign _t452 = (~_t435);
  assign _t453 = ((|_t441) && (|_t452));
  assign _t454 = ((|_t453) && (|_t451));
  assign _t455 = ((|_t443) ? _merge4_sel : _merge4_lsel);
  assign _t456 = ((|_t425) ? _t424 : _t419);
  assign _t457 = ((|_t441) && (|_t452));
  assign _t458 = ((|_t457) && (|_t451));
  assign _t459 = ((|1'd0) || (|ud_p_0__valid));
  assign _t460 = ((|_t459) || (|ud_p_1__valid));
  assign _t461 = ((|_t460) || (|ud_p_2__valid));
  assign _t462 = ((|_t461) || (|ud_p_3__valid));
  assign _t463 = (_merge4_sel == 3'd0);
  assign _t464 = ((|_merge4_valid) && (|_merge4_ready));
  assign _t465 = (_merge4_sel == 3'd1);
  assign _t466 = ((|_merge4_valid) && (|_merge4_ready));
  assign _t467 = (_merge4_sel == 3'd2);
  assign _t468 = ((|_merge4_valid) && (|_merge4_ready));
  assign _t469 = (_merge4_sel == 3'd3);
  assign _t470 = ((|_merge4_valid) && (|_merge4_ready));
  assign _t471 = (_merge4_sel == 3'd4);
  assign _t472 = ((|_merge4_valid) && (|_merge4_ready));
  assign _t473 = (_merge4_sel == 3'd3);
  assign _t474 = ((|_t473) ? ud_p_3__data : ud_p_4__data);
  assign _t475 = (_merge4_sel == 3'd2);
  assign _t476 = ((|_t475) ? ud_p_2__data : _t474);
  assign _t477 = (_merge4_sel == 3'd1);
  assign _t478 = ((|_t477) ? ud_p_1__data : _t476);
  assign _t479 = (_merge4_sel == 3'd0);
  assign _t480 = (_merge4_sel == 3'd3);
  assign _t481 = ((|_t480) ? ud_p_3__last : ud_p_4__last);
  assign _t482 = (_merge4_sel == 3'd2);
  assign _t483 = ((|_t482) ? ud_p_2__last : _t481);
  assign _t484 = (_merge4_sel == 3'd1);
  assign _t485 = ((|_t484) ? ud_p_1__last : _t483);
  assign _t486 = (_merge4_sel == 3'd0);
  assign _t487 = ((|ud_t_4__valid) ? 3'd4 : 3'd0);
  assign _t488 = ((|ud_t_3__valid) ? 3'd3 : _t487);
  assign _t489 = ((|ud_t_2__valid) ? 3'd2 : _t488);
  assign _t490 = ((|ud_t_1__valid) ? 3'd1 : _t489);
  assign _t491 = ((|ud_t_0__valid) ? 3'd0 : _t490);
  assign _t492 = (_merge5_rr == 3'd0);
  assign _t493 = ((|_t492) ? _t491 : _merge5_rr);
  assign _t494 = ((|ud_t_0__valid) ? 3'd0 : 3'd1);
  assign _t495 = ((|ud_t_4__valid) ? 3'd4 : _t494);
  assign _t496 = ((|ud_t_3__valid) ? 3'd3 : _t495);
  assign _t497 = ((|ud_t_2__valid) ? 3'd2 : _t496);
  assign _t498 = ((|ud_t_1__valid) ? 3'd1 : _t497);
  assign _t499 = (_merge5_rr == 3'd1);
  assign _t500 = ((|_t499) ? _t498 : _t493);
  assign _t501 = ((|ud_t_1__valid) ? 3'd1 : 3'd2);
  assign _t502 = ((|ud_t_0__valid) ? 3'd0 : _t501);
  assign _t503 = ((|ud_t_4__valid) ? 3'd4 : _t502);
  assign _t504 = ((|ud_t_3__valid) ? 3'd3 : _t503);
  assign _t505 = ((|ud_t_2__valid) ? 3'd2 : _t504);
  assign _t506 = (_merge5_rr == 3'd2);
  assign _t507 = ((|_t506) ? _t505 : _t500);
  assign _t508 = ((|ud_t_2__valid) ? 3'd2 : 3'd3);
  assign _t509 = ((|ud_t_1__valid) ? 3'd1 : _t508);
  assign _t510 = ((|ud_t_0__valid) ? 3'd0 : _t509);
  assign _t511 = ((|ud_t_4__valid) ? 3'd4 : _t510);
  assign _t512 = ((|ud_t_3__valid) ? 3'd3 : _t511);
  assign _t513 = (_merge5_rr == 3'd3);
  assign _t514 = ((|_t513) ? _t512 : _t507);
  assign _t515 = ((|ud_t_3__valid) ? 3'd3 : 3'd4);
  assign _t516 = ((|ud_t_2__valid) ? 3'd2 : _t515);
  assign _t517 = ((|ud_t_1__valid) ? 3'd1 : _t516);
  assign _t518 = ((|ud_t_0__valid) ? 3'd0 : _t517);
  assign _t519 = ((|ud_t_4__valid) ? 3'd4 : _t518);
  assign _t520 = (_merge5_rr == 3'd4);
  assign _t521 = ((|_t520) ? _t519 : _t514);
  assign _t522 = (_merge5_sel == 3'd3);
  assign _t523 = ((|_t522) ? ud_t_3__last : ud_t_4__last);
  assign _t524 = (_merge5_sel == 3'd2);
  assign _t525 = ((|_t524) ? ud_t_2__last : _t523);
  assign _t526 = (_merge5_sel == 3'd1);
  assign _t527 = ((|_t526) ? ud_t_1__last : _t525);
  assign _t528 = (_merge5_sel == 3'd0);
  assign _t529 = ((|_t528) ? ud_t_0__last : _t527);
  assign _t530 = ((|_merge5_valid) && (|_merge5_ready));
  assign _t531 = ((|_t530) && (|_t529));
  assign _t532 = (_merge5_sel + 3'd1);
  assign _t533 = (_merge5_sel == 3'd4);
  assign _t534 = ((|_t533) ? 3'd0 : _t532);
  assign _t535 = ((|_t531) ? 1'd0 : _merge5_lock);
  assign _t536 = (~_t531);
  assign _t537 = ((|_t536) && (|_t530));
  assign _t538 = ((|_t536) && (|_t530));
  assign _t539 = ((|_t537) ? 1'd1 : _t535);
  assign _t540 = (~_merge5_lock);
  assign _t541 = ((|1'd0) || (|ud_t_0__valid));
  assign _t542 = ((|_t541) || (|ud_t_1__valid));
  assign _t543 = ((|_t542) || (|ud_t_2__valid));
  assign _t544 = ((|_t543) || (|ud_t_3__valid));
  assign _t545 = ((|_t544) || (|ud_t_4__valid));
  assign _t546 = ((|_t545) && (|_t540));
  assign _t547 = (~_t530);
  assign _t548 = ((|_t536) && (|_t547));
  assign _t549 = ((|_t548) && (|_t546));
  assign _t550 = ((|_t538) ? _merge5_sel : _merge5_lsel);
  assign _t551 = ((|_t520) ? _t519 : _t514);
  assign _t552 = ((|_t536) && (|_t547));
  assign _t553 = ((|_t552) && (|_t546));
  assign _t554 = ((|1'd0) || (|ud_t_0__valid));
  assign _t555 = ((|_t554) || (|ud_t_1__valid));
  assign _t556 = ((|_t555) || (|ud_t_2__valid));
  assign _t557 = ((|_t556) || (|ud_t_3__valid));
  assign _t558 = (_merge5_sel == 3'd0);
  assign _t559 = ((|_merge5_valid) && (|_merge5_ready));
  assign _t560 = (_merge5_sel == 3'd1);
  assign _t561 = ((|_merge5_valid) && (|_merge5_ready));
  assign _t562 = (_merge5_sel == 3'd2);
  assign _t563 = ((|_merge5_valid) && (|_merge5_ready));
  assign _t564 = (_merge5_sel == 3'd3);
  assign _t565 = ((|_merge5_valid) && (|_merge5_ready));
  assign _t566 = (_merge5_sel == 3'd4);
  assign _t567 = ((|_merge5_valid) && (|_merge5_ready));
  assign _t568 = (_merge5_sel == 3'd3);
  assign _t569 = ((|_t568) ? ud_t_3__data : ud_t_4__data);
  assign _t570 = (_merge5_sel == 3'd2);
  assign _t571 = ((|_t570) ? ud_t_2__data : _t569);
  assign _t572 = (_merge5_sel == 3'd1);
  assign _t573 = ((|_t572) ? ud_t_1__data : _t571);
  assign _t574 = (_merge5_sel == 3'd0);
  assign _t575 = (_merge5_sel == 3'd3);
  assign _t576 = ((|_t575) ? ud_t_3__last : ud_t_4__last);
  assign _t577 = (_merge5_sel == 3'd2);
  assign _t578 = ((|_t577) ? ud_t_2__last : _t576);
  assign _t579 = (_merge5_sel == 3'd1);
  assign _t580 = ((|_t579) ? ud_t_1__last : _t578);
  assign _t581 = (_merge5_sel == 3'd0);
  assign _t582 = ((|_t270) ? 2'd0 : dl_last);
  assign _t583 = ((|dl_cr_1__valid) && (|dl_cr_1__ready));
  assign _t584 = ((|dl_c_12__valid) ? 2'd3 : 2'd0);
  assign _t585 = ((|dl_c_8__valid) ? 2'd2 : _t584);
  assign _t586 = ((|dl_c_4__valid) ? 2'd1 : _t585);
  assign _t587 = ((|dl_c_0__valid) ? 2'd0 : _t586);
  assign _t588 = (_merge6_rr == 2'd0);
  assign _t589 = ((|_t588) ? _t587 : _merge6_rr);
  assign _t590 = ((|dl_c_0__valid) ? 2'd0 : 2'd1);
  assign _t591 = ((|dl_c_12__valid) ? 2'd3 : _t590);
  assign _t592 = ((|dl_c_8__valid) ? 2'd2 : _t591);
  assign _t593 = ((|dl_c_4__valid) ? 2'd1 : _t592);
  assign _t594 = (_merge6_rr == 2'd1);
  assign _t595 = ((|_t594) ? _t593 : _t589);
  assign _t596 = ((|dl_c_4__valid) ? 2'd1 : 2'd2);
  assign _t597 = ((|dl_c_0__valid) ? 2'd0 : _t596);
  assign _t598 = ((|dl_c_12__valid) ? 2'd3 : _t597);
  assign _t599 = ((|dl_c_8__valid) ? 2'd2 : _t598);
  assign _t600 = (_merge6_rr == 2'd2);
  assign _t601 = ((|_t600) ? _t599 : _t595);
  assign _t602 = ((|dl_c_8__valid) ? 2'd2 : 2'd3);
  assign _t603 = ((|dl_c_4__valid) ? 2'd1 : _t602);
  assign _t604 = ((|dl_c_0__valid) ? 2'd0 : _t603);
  assign _t605 = ((|dl_c_12__valid) ? 2'd3 : _t604);
  assign _t606 = (_merge6_rr == 2'd3);
  assign _t607 = ((|_t606) ? _t605 : _t601);
  assign _t608 = (_merge6_sel == 2'd2);
  assign _t609 = ((|_t608) ? dl_c_8__last : dl_c_12__last);
  assign _t610 = (_merge6_sel == 2'd1);
  assign _t611 = ((|_t610) ? dl_c_4__last : _t609);
  assign _t612 = (_merge6_sel == 2'd0);
  assign _t613 = ((|_t612) ? dl_c_0__last : _t611);
  assign _t614 = ((|_merge6_valid) && (|_merge6_ready));
  assign _t615 = ((|_t614) && (|_t613));
  assign _t616 = (_merge6_sel + 2'd1);
  assign _t617 = (_merge6_sel == 2'd3);
  assign _t618 = ((|_t617) ? 2'd0 : _t616);
  assign _t619 = ((|_t615) ? 1'd0 : _merge6_lock);
  assign _t620 = (~_t615);
  assign _t621 = ((|_t620) && (|_t614));
  assign _t622 = ((|_t620) && (|_t614));
  assign _t623 = ((|_t621) ? 1'd1 : _t619);
  assign _t624 = (~_merge6_lock);
  assign _t625 = ((|1'd0) || (|dl_c_0__valid));
  assign _t626 = ((|_t625) || (|dl_c_4__valid));
  assign _t627 = ((|_t626) || (|dl_c_8__valid));
  assign _t628 = ((|_t627) || (|dl_c_12__valid));
  assign _t629 = ((|_t628) && (|_t624));
  assign _t630 = (~_t614);
  assign _t631 = ((|_t620) && (|_t630));
  assign _t632 = ((|_t631) && (|_t629));
  assign _t633 = ((|_t622) ? _merge6_sel : _merge6_lsel);
  assign _t634 = ((|_t606) ? _t605 : _t601);
  assign _t635 = ((|_t620) && (|_t630));
  assign _t636 = ((|_t635) && (|_t629));
  assign _t637 = ((|1'd0) || (|dl_c_0__valid));
  assign _t638 = ((|_t637) || (|dl_c_4__valid));
  assign _t639 = ((|_t638) || (|dl_c_8__valid));
  assign _t640 = (_merge6_sel == 2'd0);
  assign _t641 = ((|_merge6_valid) && (|_merge6_ready));
  assign _t642 = (_merge6_sel == 2'd1);
  assign _t643 = ((|_merge6_valid) && (|_merge6_ready));
  assign _t644 = (_merge6_sel == 2'd2);
  assign _t645 = ((|_merge6_valid) && (|_merge6_ready));
  assign _t646 = (_merge6_sel == 2'd3);
  assign _t647 = ((|_merge6_valid) && (|_merge6_ready));
  assign _t648 = (_merge6_sel == 2'd2);
  assign _t649 = ((|_t648) ? dl_c_8__data : dl_c_12__data);
  assign _t650 = (_merge6_sel == 2'd1);
  assign _t651 = ((|_t650) ? dl_c_4__data : _t649);
  assign _t652 = (_merge6_sel == 2'd0);
  assign _t653 = (_merge6_sel == 2'd2);
  assign _t654 = ((|_t653) ? dl_c_8__last : dl_c_12__last);
  assign _t655 = (_merge6_sel == 2'd1);
  assign _t656 = ((|_t655) ? dl_c_4__last : _t654);
  assign _t657 = (_merge6_sel == 2'd0);
  assign _t658 = ((|dl_c_13__valid) ? 2'd3 : 2'd0);
  assign _t659 = ((|dl_c_9__valid) ? 2'd2 : _t658);
  assign _t660 = ((|dl_c_5__valid) ? 2'd1 : _t659);
  assign _t661 = ((|dl_c_1__valid) ? 2'd0 : _t660);
  assign _t662 = (_merge7_rr == 2'd0);
  assign _t663 = ((|_t662) ? _t661 : _merge7_rr);
  assign _t664 = ((|dl_c_1__valid) ? 2'd0 : 2'd1);
  assign _t665 = ((|dl_c_13__valid) ? 2'd3 : _t664);
  assign _t666 = ((|dl_c_9__valid) ? 2'd2 : _t665);
  assign _t667 = ((|dl_c_5__valid) ? 2'd1 : _t666);
  assign _t668 = (_merge7_rr == 2'd1);
  assign _t669 = ((|_t668) ? _t667 : _t663);
  assign _t670 = ((|dl_c_5__valid) ? 2'd1 : 2'd2);
  assign _t671 = ((|dl_c_1__valid) ? 2'd0 : _t670);
  assign _t672 = ((|dl_c_13__valid) ? 2'd3 : _t671);
  assign _t673 = ((|dl_c_9__valid) ? 2'd2 : _t672);
  assign _t674 = (_merge7_rr == 2'd2);
  assign _t675 = ((|_t674) ? _t673 : _t669);
  assign _t676 = ((|dl_c_9__valid) ? 2'd2 : 2'd3);
  assign _t677 = ((|dl_c_5__valid) ? 2'd1 : _t676);
  assign _t678 = ((|dl_c_1__valid) ? 2'd0 : _t677);
  assign _t679 = ((|dl_c_13__valid) ? 2'd3 : _t678);
  assign _t680 = (_merge7_rr == 2'd3);
  assign _t681 = ((|_t680) ? _t679 : _t675);
  assign _t682 = (_merge7_sel == 2'd2);
  assign _t683 = ((|_t682) ? dl_c_9__last : dl_c_13__last);
  assign _t684 = (_merge7_sel == 2'd1);
  assign _t685 = ((|_t684) ? dl_c_5__last : _t683);
  assign _t686 = (_merge7_sel == 2'd0);
  assign _t687 = ((|_t686) ? dl_c_1__last : _t685);
  assign _t688 = ((|_merge7_valid) && (|_merge7_ready));
  assign _t689 = ((|_t688) && (|_t687));
  assign _t690 = (_merge7_sel + 2'd1);
  assign _t691 = (_merge7_sel == 2'd3);
  assign _t692 = ((|_t691) ? 2'd0 : _t690);
  assign _t693 = ((|_t689) ? 1'd0 : _merge7_lock);
  assign _t694 = (~_t689);
  assign _t695 = ((|_t694) && (|_t688));
  assign _t696 = ((|_t694) && (|_t688));
  assign _t697 = ((|_t695) ? 1'd1 : _t693);
  assign _t698 = (~_merge7_lock);
  assign _t699 = ((|1'd0) || (|dl_c_1__valid));
  assign _t700 = ((|_t699) || (|dl_c_5__valid));
  assign _t701 = ((|_t700) || (|dl_c_9__valid));
  assign _t702 = ((|_t701) || (|dl_c_13__valid));
  assign _t703 = ((|_t702) && (|_t698));
  assign _t704 = (~_t688);
  assign _t705 = ((|_t694) && (|_t704));
  assign _t706 = ((|_t705) && (|_t703));
  assign _t707 = ((|_t696) ? _merge7_sel : _merge7_lsel);
  assign _t708 = ((|_t680) ? _t679 : _t675);
  assign _t709 = ((|_t694) && (|_t704));
  assign _t710 = ((|_t709) && (|_t703));
  assign _t711 = ((|1'd0) || (|dl_c_1__valid));
  assign _t712 = ((|_t711) || (|dl_c_5__valid));
  assign _t713 = ((|_t712) || (|dl_c_9__valid));
  assign _t714 = (_merge7_sel == 2'd0);
  assign _t715 = ((|_merge7_valid) && (|_merge7_ready));
  assign _t716 = (_merge7_sel == 2'd1);
  assign _t717 = ((|_merge7_valid) && (|_merge7_ready));
  assign _t718 = (_merge7_sel == 2'd2);
  assign _t719 = ((|_merge7_valid) && (|_merge7_ready));
  assign _t720 = (_merge7_sel == 2'd3);
  assign _t721 = ((|_merge7_valid) && (|_merge7_ready));
  assign _t722 = (_merge7_sel == 2'd2);
  assign _t723 = ((|_t722) ? dl_c_9__data : dl_c_13__data);
  assign _t724 = (_merge7_sel == 2'd1);
  assign _t725 = ((|_t724) ? dl_c_5__data : _t723);
  assign _t726 = (_merge7_sel == 2'd0);
  assign _t727 = (_merge7_sel == 2'd2);
  assign _t728 = ((|_t727) ? dl_c_9__last : dl_c_13__last);
  assign _t729 = (_merge7_sel == 2'd1);
  assign _t730 = ((|_t729) ? dl_c_5__last : _t728);
  assign _t731 = (_merge7_sel == 2'd0);
  assign _t732 = ((|dl_c_14__valid) ? 2'd3 : 2'd0);
  assign _t733 = ((|dl_c_10__valid) ? 2'd2 : _t732);
  assign _t734 = ((|dl_c_6__valid) ? 2'd1 : _t733);
  assign _t735 = ((|dl_c_2__valid) ? 2'd0 : _t734);
  assign _t736 = (_merge8_rr == 2'd0);
  assign _t737 = ((|_t736) ? _t735 : _merge8_rr);
  assign _t738 = ((|dl_c_2__valid) ? 2'd0 : 2'd1);
  assign _t739 = ((|dl_c_14__valid) ? 2'd3 : _t738);
  assign _t740 = ((|dl_c_10__valid) ? 2'd2 : _t739);
  assign _t741 = ((|dl_c_6__valid) ? 2'd1 : _t740);
  assign _t742 = (_merge8_rr == 2'd1);
  assign _t743 = ((|_t742) ? _t741 : _t737);
  assign _t744 = ((|dl_c_6__valid) ? 2'd1 : 2'd2);
  assign _t745 = ((|dl_c_2__valid) ? 2'd0 : _t744);
  assign _t746 = ((|dl_c_14__valid) ? 2'd3 : _t745);
  assign _t747 = ((|dl_c_10__valid) ? 2'd2 : _t746);
  assign _t748 = (_merge8_rr == 2'd2);
  assign _t749 = ((|_t748) ? _t747 : _t743);
  assign _t750 = ((|dl_c_10__valid) ? 2'd2 : 2'd3);
  assign _t751 = ((|dl_c_6__valid) ? 2'd1 : _t750);
  assign _t752 = ((|dl_c_2__valid) ? 2'd0 : _t751);
  assign _t753 = ((|dl_c_14__valid) ? 2'd3 : _t752);
  assign _t754 = (_merge8_rr == 2'd3);
  assign _t755 = ((|_t754) ? _t753 : _t749);
  assign _t756 = (_merge8_sel == 2'd2);
  assign _t757 = ((|_t756) ? dl_c_10__last : dl_c_14__last);
  assign _t758 = (_merge8_sel == 2'd1);
  assign _t759 = ((|_t758) ? dl_c_6__last : _t757);
  assign _t760 = (_merge8_sel == 2'd0);
  assign _t761 = ((|_t760) ? dl_c_2__last : _t759);
  assign _t762 = ((|_merge8_valid) && (|_merge8_ready));
  assign _t763 = ((|_t762) && (|_t761));
  assign _t764 = (_merge8_sel + 2'd1);
  assign _t765 = (_merge8_sel == 2'd3);
  assign _t766 = ((|_t765) ? 2'd0 : _t764);
  assign _t767 = ((|_t763) ? 1'd0 : _merge8_lock);
  assign _t768 = (~_t763);
  assign _t769 = ((|_t768) && (|_t762));
  assign _t770 = ((|_t768) && (|_t762));
  assign _t771 = ((|_t769) ? 1'd1 : _t767);
  assign _t772 = (~_merge8_lock);
  assign _t773 = ((|1'd0) || (|dl_c_2__valid));
  assign _t774 = ((|_t773) || (|dl_c_6__valid));
  assign _t775 = ((|_t774) || (|dl_c_10__valid));
  assign _t776 = ((|_t775) || (|dl_c_14__valid));
  assign _t777 = ((|_t776) && (|_t772));
  assign _t778 = (~_t762);
  assign _t779 = ((|_t768) && (|_t778));
  assign _t780 = ((|_t779) && (|_t777));
  assign _t781 = ((|_t770) ? _merge8_sel : _merge8_lsel);
  assign _t782 = ((|_t754) ? _t753 : _t749);
  assign _t783 = ((|_t768) && (|_t778));
  assign _t784 = ((|_t783) && (|_t777));
  assign _t785 = ((|1'd0) || (|dl_c_2__valid));
  assign _t786 = ((|_t785) || (|dl_c_6__valid));
  assign _t787 = ((|_t786) || (|dl_c_10__valid));
  assign _t788 = (_merge8_sel == 2'd0);
  assign _t789 = ((|_merge8_valid) && (|_merge8_ready));
  assign _t790 = (_merge8_sel == 2'd1);
  assign _t791 = ((|_merge8_valid) && (|_merge8_ready));
  assign _t792 = (_merge8_sel == 2'd2);
  assign _t793 = ((|_merge8_valid) && (|_merge8_ready));
  assign _t794 = (_merge8_sel == 2'd3);
  assign _t795 = ((|_merge8_valid) && (|_merge8_ready));
  assign _t796 = (_merge8_sel == 2'd2);
  assign _t797 = ((|_t796) ? dl_c_10__data : dl_c_14__data);
  assign _t798 = (_merge8_sel == 2'd1);
  assign _t799 = ((|_t798) ? dl_c_6__data : _t797);
  assign _t800 = (_merge8_sel == 2'd0);
  assign _t801 = (_merge8_sel == 2'd2);
  assign _t802 = ((|_t801) ? dl_c_10__last : dl_c_14__last);
  assign _t803 = (_merge8_sel == 2'd1);
  assign _t804 = ((|_t803) ? dl_c_6__last : _t802);
  assign _t805 = (_merge8_sel == 2'd0);
  assign _t806 = ((|dl_c_15__valid) ? 2'd3 : 2'd0);
  assign _t807 = ((|dl_c_11__valid) ? 2'd2 : _t806);
  assign _t808 = ((|dl_c_7__valid) ? 2'd1 : _t807);
  assign _t809 = ((|dl_c_3__valid) ? 2'd0 : _t808);
  assign _t810 = (_merge9_rr == 2'd0);
  assign _t811 = ((|_t810) ? _t809 : _merge9_rr);
  assign _t812 = ((|dl_c_3__valid) ? 2'd0 : 2'd1);
  assign _t813 = ((|dl_c_15__valid) ? 2'd3 : _t812);
  assign _t814 = ((|dl_c_11__valid) ? 2'd2 : _t813);
  assign _t815 = ((|dl_c_7__valid) ? 2'd1 : _t814);
  assign _t816 = (_merge9_rr == 2'd1);
  assign _t817 = ((|_t816) ? _t815 : _t811);
  assign _t818 = ((|dl_c_7__valid) ? 2'd1 : 2'd2);
  assign _t819 = ((|dl_c_3__valid) ? 2'd0 : _t818);
  assign _t820 = ((|dl_c_15__valid) ? 2'd3 : _t819);
  assign _t821 = ((|dl_c_11__valid) ? 2'd2 : _t820);
  assign _t822 = (_merge9_rr == 2'd2);
  assign _t823 = ((|_t822) ? _t821 : _t817);
  assign _t824 = ((|dl_c_11__valid) ? 2'd2 : 2'd3);
  assign _t825 = ((|dl_c_7__valid) ? 2'd1 : _t824);
  assign _t826 = ((|dl_c_3__valid) ? 2'd0 : _t825);
  assign _t827 = ((|dl_c_15__valid) ? 2'd3 : _t826);
  assign _t828 = (_merge9_rr == 2'd3);
  assign _t829 = ((|_t828) ? _t827 : _t823);
  assign _t830 = (_merge9_sel == 2'd2);
  assign _t831 = ((|_t830) ? dl_c_11__last : dl_c_15__last);
  assign _t832 = (_merge9_sel == 2'd1);
  assign _t833 = ((|_t832) ? dl_c_7__last : _t831);
  assign _t834 = (_merge9_sel == 2'd0);
  assign _t835 = ((|_t834) ? dl_c_3__last : _t833);
  assign _t836 = ((|_merge9_valid) && (|_merge9_ready));
  assign _t837 = ((|_t836) && (|_t835));
  assign _t838 = (_merge9_sel + 2'd1);
  assign _t839 = (_merge9_sel == 2'd3);
  assign _t840 = ((|_t839) ? 2'd0 : _t838);
  assign _t841 = ((|_t837) ? 1'd0 : _merge9_lock);
  assign _t842 = (~_t837);
  assign _t843 = ((|_t842) && (|_t836));
  assign _t844 = ((|_t842) && (|_t836));
  assign _t845 = ((|_t843) ? 1'd1 : _t841);
  assign _t846 = (~_merge9_lock);
  assign _t847 = ((|1'd0) || (|dl_c_3__valid));
  assign _t848 = ((|_t847) || (|dl_c_7__valid));
  assign _t849 = ((|_t848) || (|dl_c_11__valid));
  assign _t850 = ((|_t849) || (|dl_c_15__valid));
  assign _t851 = ((|_t850) && (|_t846));
  assign _t852 = (~_t836);
  assign _t853 = ((|_t842) && (|_t852));
  assign _t854 = ((|_t853) && (|_t851));
  assign _t855 = ((|_t844) ? _merge9_sel : _merge9_lsel);
  assign _t856 = ((|_t828) ? _t827 : _t823);
  assign _t857 = ((|_t842) && (|_t852));
  assign _t858 = ((|_t857) && (|_t851));
  assign _t859 = ((|1'd0) || (|dl_c_3__valid));
  assign _t860 = ((|_t859) || (|dl_c_7__valid));
  assign _t861 = ((|_t860) || (|dl_c_11__valid));
  assign _t862 = (_merge9_sel == 2'd0);
  assign _t863 = ((|_merge9_valid) && (|_merge9_ready));
  assign _t864 = (_merge9_sel == 2'd1);
  assign _t865 = ((|_merge9_valid) && (|_merge9_ready));
  assign _t866 = (_merge9_sel == 2'd2);
  assign _t867 = ((|_merge9_valid) && (|_merge9_ready));
  assign _t868 = (_merge9_sel == 2'd3);
  assign _t869 = ((|_merge9_valid) && (|_merge9_ready));
  assign _t870 = (_merge9_sel == 2'd2);
  assign _t871 = ((|_t870) ? dl_c_11__data : dl_c_15__data);
  assign _t872 = (_merge9_sel == 2'd1);
  assign _t873 = ((|_t872) ? dl_c_7__data : _t871);
  assign _t874 = (_merge9_sel == 2'd0);
  assign _t875 = (_merge9_sel == 2'd2);
  assign _t876 = ((|_t875) ? dl_c_11__last : dl_c_15__last);
  assign _t877 = (_merge9_sel == 2'd1);
  assign _t878 = ((|_t877) ? dl_c_7__last : _t876);
  assign _t879 = (_merge9_sel == 2'd0);
  assign _t880 = ((|dl_cr_3__valid) ? 2'd3 : 2'd0);
  assign _t881 = ((|dl_cr_2__valid) ? 2'd2 : _t880);
  assign _t882 = ((|dl_cr_1__valid) ? 2'd1 : _t881);
  assign _t883 = ((|dl_cr_0__valid) ? 2'd0 : _t882);
  assign _t884 = (_merge10_rr == 2'd0);
  assign _t885 = ((|_t884) ? _t883 : _merge10_rr);
  assign _t886 = ((|dl_cr_0__valid) ? 2'd0 : 2'd1);
  assign _t887 = ((|dl_cr_3__valid) ? 2'd3 : _t886);
  assign _t888 = ((|dl_cr_2__valid) ? 2'd2 : _t887);
  assign _t889 = ((|dl_cr_1__valid) ? 2'd1 : _t888);
  assign _t890 = (_merge10_rr == 2'd1);
  assign _t891 = ((|_t890) ? _t889 : _t885);
  assign _t892 = ((|dl_cr_1__valid) ? 2'd1 : 2'd2);
  assign _t893 = ((|dl_cr_0__valid) ? 2'd0 : _t892);
  assign _t894 = ((|dl_cr_3__valid) ? 2'd3 : _t893);
  assign _t895 = ((|dl_cr_2__valid) ? 2'd2 : _t894);
  assign _t896 = (_merge10_rr == 2'd2);
  assign _t897 = ((|_t896) ? _t895 : _t891);
  assign _t898 = ((|dl_cr_2__valid) ? 2'd2 : 2'd3);
  assign _t899 = ((|dl_cr_1__valid) ? 2'd1 : _t898);
  assign _t900 = ((|dl_cr_0__valid) ? 2'd0 : _t899);
  assign _t901 = ((|dl_cr_3__valid) ? 2'd3 : _t900);
  assign _t902 = (_merge10_rr == 2'd3);
  assign _t903 = ((|_t902) ? _t901 : _t897);
  assign _t904 = (_merge10_sel == 2'd2);
  assign _t905 = ((|_t904) ? dl_cr_2__last : dl_cr_3__last);
  assign _t906 = (_merge10_sel == 2'd1);
  assign _t907 = ((|_t906) ? dl_cr_1__last : _t905);
  assign _t908 = (_merge10_sel == 2'd0);
  assign _t909 = ((|_t908) ? dl_cr_0__last : _t907);
  assign _t910 = ((|_merge10_valid) && (|_merge10_ready));
  assign _t911 = ((|_t910) && (|_t909));
  assign _t912 = (_merge10_sel + 2'd1);
  assign _t913 = (_merge10_sel == 2'd3);
  assign _t914 = ((|_t913) ? 2'd0 : _t912);
  assign _t915 = ((|_t911) ? 1'd0 : _merge10_lock);
  assign _t916 = (~_t911);
  assign _t917 = ((|_t916) && (|_t910));
  assign _t918 = ((|_t916) && (|_t910));
  assign _t919 = ((|_t917) ? 1'd1 : _t915);
  assign _t920 = (~_merge10_lock);
  assign _t921 = ((|1'd0) || (|dl_cr_0__valid));
  assign _t922 = ((|_t921) || (|dl_cr_1__valid));
  assign _t923 = ((|_t922) || (|dl_cr_2__valid));
  assign _t924 = ((|_t923) || (|dl_cr_3__valid));
  assign _t925 = ((|_t924) && (|_t920));
  assign _t926 = (~_t910);
  assign _t927 = ((|_t916) && (|_t926));
  assign _t928 = ((|_t927) && (|_t925));
  assign _t929 = ((|_t918) ? _merge10_sel : _merge10_lsel);
  assign _t930 = ((|_t902) ? _t901 : _t897);
  assign _t931 = ((|_t916) && (|_t926));
  assign _t932 = ((|_t931) && (|_t925));
  assign _t933 = ((|1'd0) || (|dl_cr_0__valid));
  assign _t934 = ((|_t933) || (|dl_cr_1__valid));
  assign _t935 = ((|_t934) || (|dl_cr_2__valid));
  assign _t936 = (_merge10_sel == 2'd0);
  assign _t937 = ((|_merge10_valid) && (|_merge10_ready));
  assign _t938 = (_merge10_sel == 2'd1);
  assign _t939 = ((|_merge10_valid) && (|_merge10_ready));
  assign _t940 = (_merge10_sel == 2'd2);
  assign _t941 = ((|_merge10_valid) && (|_merge10_ready));
  assign _t942 = (_merge10_sel == 2'd3);
  assign _t943 = ((|_merge10_valid) && (|_merge10_ready));
  assign _t944 = (_merge10_sel == 2'd2);
  assign _t945 = ((|_t944) ? dl_cr_2__data : dl_cr_3__data);
  assign _t946 = (_merge10_sel == 2'd1);
  assign _t947 = ((|_t946) ? dl_cr_1__data : _t945);
  assign _t948 = (_merge10_sel == 2'd0);
  assign _t949 = (_merge10_sel == 2'd2);
  assign _t950 = ((|_t949) ? dl_cr_2__last : dl_cr_3__last);
  assign _t951 = (_merge10_sel == 2'd1);
  assign _t952 = ((|_t951) ? dl_cr_1__last : _t950);
  assign _t953 = (_merge10_sel == 2'd0);
  assign _t954 = ((|dl_cr_0__valid) ? 2'd0 : dl_last);
  assign _t955 = ((|boot) ? 5'd16 : hold);
  assign _t956 = (hold - 5'd1);
  assign _t957 = (hold != 5'd0);
  assign _t958 = (~boot);
  assign _t959 = ((|_t958) && (|_t957));
  assign _t960 = ((|boot) ? 1'd0 : run);
  assign _t961 = (hold == 5'd1);
  assign _t962 = ((|_t958) && (|_t957));
  assign _t963 = ((|_t962) && (|_t961));
  assign _t964 = ((|kv) ? 23'd8388607 : ks);
  assign _t965 = (ks - 23'd1);
  assign _t966 = (ks != 23'd0);
  assign _t967 = (~kv);
  assign _t968 = ((|_t967) && (|_t966));
  assign _t969 = 3'd0;
  assign _t970 = {_t969, hbs};
  assign _t971 = _t970[0:0];
  assign _t972 = _t970[3:2];
  assign _t973 = {_t972, acts, _t971};
  assign _t974 = _t973[1:0];
  assign _t975 = _t973[3:3];
  assign _t976 = {_t975, lk, _t974};
  assign _t977 = _t976[2:0];
  assign _t978 = 11'd0;
  assign _t979 = {_t978, 1'd0};
  assign _t980 = _t979[0:0];
  assign _t981 = _t979[11:2];
  assign _t982 = {_t981, 1'd0, _t980};
  assign _t983 = _t982[1:0];
  assign _t984 = _t982[11:3];
  assign _t985 = {_t984, 1'd0, _t983};
  assign _t986 = _t985[2:0];
  assign _t987 = _t985[11:4];
  assign _t988 = {_t987, 1'd0, _t986};
  assign _t989 = _t988[3:0];
  assign _t990 = _t988[11:5];
  assign _t991 = {_t990, 1'd0, _t989};
  assign _t992 = _t991[4:0];
  assign _t993 = _t991[11:6];
  assign _t994 = {_t993, 1'd0, _t992};
  assign _t995 = _t994[5:0];
  assign _t996 = _t994[11:7];
  assign _t997 = {_t996, 1'd0, _t995};
  assign _t998 = _t997[6:0];
  assign _t999 = _t997[11:8];
  assign _t1000 = {_t999, 1'd0, _t998};
  assign _t1001 = _t1000[7:0];
  assign _t1002 = _t1000[11:9];
  assign _t1003 = {_t1002, 1'd0, _t1001};
  assign _t1004 = _t1003[8:0];
  assign _t1005 = _t1003[11:10];
  assign _t1006 = {_t1005, 1'd0, _t1004};
  assign _t1007 = _t1006[9:0];
  assign _t1008 = _t1006[11:11];
  assign _t1009 = {_t1008, 1'd0, _t1007};
  assign _t1010 = _t1009[10:0];
  assign c74 = pll_clkout0;
  assign c148 = pll_clkout1;
  assign lk = pll_lock;
  assign nlk = (~lk);
  assign hurx_data_v = ((|hurx_data_v_in_en) ? hurx_data_v_in : 8'd0);
  assign hurx_data_err = ((|hurx_data_err_in_en) ? hurx_data_err_in : 1'd0);
  assign hurx_valid = ((|hurx_valid_in_en) ? hurx_valid_in : 1'd0);
  assign hutx_ready = ((|hutx_ready_in_en) ? hutx_ready_in : 1'd0);
  assign erx_data = ((|erx_data_in_en) ? erx_data_in : 8'd0);
  assign erx_last = ((|erx_last_in_en) ? erx_last_in : 1'd0);
  assign erx_valid = ((|erx_valid_in_en) ? erx_valid_in : 1'd0);
  assign etx_ready = ((|etx_ready_in_en) ? etx_ready_in : 1'd0);
  assign crx_ready = 1'd1;
  assign ctx_valid = 1'd0;
  assign ctx_data = 8'd0;
  assign ctx_last = 1'd0;
  assign erx_ready = _xfifo_frame_src_ready;
  assign _xs_data = _xfifo_frame_dst_data;
  assign _xs_last = _xfifo_frame_dst_last;
  assign _xs_valid = _xfifo_frame_dst_valid;
  assign _xs_ready = fi_i_ready;
  assign u4_rx_data = fi_o_data;
  assign u4_rx_last = fi_o_last;
  assign u4_rx_valid = fi_o_valid;
  assign u4_rx_ready = ((|_t13) && (|_t1));
  assign u4_f_0__valid = ((|u4_rx_valid) && (|_t15));
  assign u4_f_0__data = u4_rx_data;
  assign u4_f_0__last = u4_rx_last;
  assign _t1011 = ((|_t79) ? _t76 : _t74);
  assign u4_f_0__ready = ep_erx_ready;
  assign u4_p_0__data = ep_etx_data;
  assign u4_p_0__last = ep_etx_last;
  assign u4_p_0__valid = ep_etx_valid;
  assign dl_c_0__data = ep_rx_data;
  assign dl_c_0__last = ep_rx_last;
  assign dl_c_0__valid = ep_rx_valid;
  assign dl_r_0__ready = ep_tx_ready;
  assign u4_t_0__valid = 1'd0;
  assign u4_t_0__data = 8'd0;
  assign u4_t_0__last = 1'd0;
  assign u4_f_1__valid = ((|u4_rx_valid) && (|_t27));
  assign u4_f_1__data = u4_rx_data;
  assign u4_f_1__last = u4_rx_last;
  assign u4_f_1__ready = ep2_erx_ready;
  assign u4_p_1__data = ep2_etx_data;
  assign u4_p_1__last = ep2_etx_last;
  assign u4_p_1__valid = ep2_etx_valid;
  assign dl_cr_0__data = ep2_rx_data;
  assign dl_cr_0__last = ep2_rx_last;
  assign dl_cr_0__valid = ep2_rx_valid;
  assign dl_ct_0__ready = ep2_tx_ready;
  assign u4_t_1__valid = 1'd0;
  assign u4_t_1__data = 8'd0;
  assign u4_t_1__last = 1'd0;
  assign u4_f_2__valid = ((|u4_rx_valid) && (|_t41));
  assign u4_f_2__data = u4_rx_data;
  assign u4_f_2__last = u4_rx_last;
  assign u4_f_2__ready = ep3_erx_ready;
  assign u4_p_2__data = ep3_etx_data;
  assign u4_p_2__last = ep3_etx_last;
  assign u4_p_2__valid = ep3_etx_valid;
  assign dl_c_1__data = ep3_rx_data;
  assign dl_c_1__last = ep3_rx_last;
  assign dl_c_1__valid = ep3_rx_valid;
  assign dl_r_1__ready = ep3_tx_ready;
  assign u4_t_2__valid = 1'd0;
  assign u4_t_2__data = 8'd0;
  assign u4_t_2__last = 1'd0;
  assign u4_f_3__valid = ((|u4_rx_valid) && (|_t55));
  assign u4_f_3__data = u4_rx_data;
  assign u4_f_3__last = u4_rx_last;
  assign u4_f_3__ready = ep4_erx_ready;
  assign u4_p_3__data = ep4_etx_data;
  assign u4_p_3__last = ep4_etx_last;
  assign u4_p_3__valid = ep4_etx_valid;
  assign dl_c_2__data = ep4_rx_data;
  assign dl_c_2__last = ep4_rx_last;
  assign dl_c_2__valid = ep4_rx_valid;
  assign dl_r_2__ready = ep4_tx_ready;
  assign u4_t_3__valid = 1'd0;
  assign u4_t_3__data = 8'd0;
  assign u4_t_3__last = 1'd0;
  assign u4_f_4__valid = ((|u4_rx_valid) && (|_t69));
  assign u4_f_4__data = u4_rx_data;
  assign u4_f_4__last = u4_rx_last;
  assign u4_f_4__ready = ep5_erx_ready;
  assign u4_p_4__data = ep5_etx_data;
  assign u4_p_4__last = ep5_etx_last;
  assign u4_p_4__valid = ep5_etx_valid;
  assign dl_c_3__data = ep5_rx_data;
  assign dl_c_3__last = ep5_rx_last;
  assign dl_c_3__valid = ep5_rx_valid;
  assign dl_r_3__ready = ep5_tx_ready;
  assign u4_t_4__valid = 1'd0;
  assign u4_t_4__data = 8'd0;
  assign u4_t_4__last = 1'd0;
  assign _merge_sel = ((|_merge_lock) ? _merge_lsel : _t114);
  assign _t1012 = ((|_t142) ? 1'd1 : _t132);
  assign _t1013 = ((|_t124) ? _t127 : _merge_rr);
  assign _t1014 = ((|_t146) ? _t144 : _t143);
  assign _merge_valid = ((|_t150) || (|u4_p_4__valid));
  assign u4_p_0__ready = ((|_t152) && (|_t151));
  assign u4_p_1__ready = ((|_t154) && (|_t153));
  assign u4_p_2__ready = ((|_t156) && (|_t155));
  assign u4_p_3__ready = ((|_t158) && (|_t157));
  assign u4_p_4__ready = ((|_t160) && (|_t159));
  assign _merge_data = ((|_t167) ? u4_p_0__data : _t166);
  assign _merge_last = ((|_t174) ? u4_p_0__last : _t173);
  assign _merge_tag = _merge_sel;
  assign _merge2_sel = ((|_merge2_lock) ? _merge2_lsel : _t209);
  assign _t1015 = ((|_t237) ? 1'd1 : _t227);
  assign _t1016 = ((|_t219) ? _t222 : _merge2_rr);
  assign _t1017 = ((|_t241) ? _t239 : _t238);
  assign _merge2_valid = ((|_t245) || (|u4_t_4__valid));
  assign u4_t_0__ready = ((|_t247) && (|_t246));
  assign u4_t_1__ready = ((|_t249) && (|_t248));
  assign u4_t_2__ready = ((|_t251) && (|_t250));
  assign u4_t_3__ready = ((|_t253) && (|_t252));
  assign u4_t_4__ready = ((|_t255) && (|_t254));
  assign _merge2_data = ((|_t262) ? u4_t_0__data : _t261);
  assign _merge2_last = ((|_t269) ? u4_t_0__last : _t268);
  assign _merge2_tag = _merge2_sel;
  assign _merge_ready = pm_hi_ready;
  assign _merge2_ready = pm_lo_ready;
  assign u4_m_data = pm_o_data;
  assign u4_m_last = pm_o_last;
  assign u4_m_valid = pm_o_valid;
  assign _xs2_ready = _xfifo_frame2_src_ready;
  assign etx_data = _xfifo_frame2_dst_data;
  assign etx_last = _xfifo_frame2_dst_last;
  assign etx_valid = _xfifo_frame2_dst_valid;
  assign u4_m_ready = fo_i_ready;
  assign _xs2_data = fo_o_data;
  assign _xs2_last = fo_o_last;
  assign _xs2_valid = fo_o_valid;
  assign _t1018 = ((|_t583) ? 2'd1 : _t582);
  assign _xp_data = {hurx_data_err, _t273};
  assign _xs3_data_v = _xq_data[7:0];
  assign _xs3_data_err = _xq_data[8];
  assign _xp_valid = hurx_valid;
  assign hurx_ready = _xp_ready;
  assign _xs3_valid = _xq_valid;
  assign _xq_ready = _xs3_ready;
  assign _xp_ready = _xfifo_src_ready;
  assign _xq_data = _xfifo_dst_data;
  assign _xq_valid = _xfifo_dst_valid;
  assign _xs3_ready = sr_i_ready;
  assign ud_in_data = sr_f_data;
  assign ud_in_last = sr_f_last;
  assign ud_in_valid = sr_f_valid;
  assign ud_cin_data = sr_con_data;
  assign ud_cin_valid = sr_con_valid;
  assign ud_in_ready = ((|_t287) && (|_t275));
  assign ud_f_0__valid = ((|ud_in_valid) && (|_t289));
  assign ud_f_0__data = ud_in_data;
  assign ud_f_0__last = ud_in_last;
  assign _t1019 = ((|_t391) ? _t388 : _t386);
  assign ud_f_0__ready = udr_i_ready;
  assign dl_c_4__data = udr_o_data;
  assign dl_c_4__last = udr_o_last;
  assign dl_c_4__valid = udr_o_valid;
  assign dl_r_4__ready = udt_t_ready;
  assign ud_p_0__data = udt_o_data;
  assign ud_p_0__last = udt_o_last;
  assign ud_p_0__valid = udt_o_valid;
  assign ud_t_0__valid = 1'd0;
  assign ud_t_0__data = 8'd0;
  assign ud_t_0__last = 1'd0;
  assign ud_f_1__valid = ((|ud_in_valid) && (|_t301));
  assign ud_f_1__data = ud_in_data;
  assign ud_f_1__last = ud_in_last;
  assign ud_f_1__ready = udr2_i_ready;
  assign cfr_data = udr2_o_data;
  assign cfr_last = udr2_o_last;
  assign cfr_valid = udr2_o_valid;
  assign ud_cin_ready = uri_i_ready;
  assign cri_data = uri_o_data;
  assign cri_last = uri_o_last;
  assign cri_valid = uri_o_valid;
  assign _merge3_sel = ((|_merge3_lock) ? _merge3_lsel : _t321);
  assign _t1020 = ((|_t340) ? 1'd1 : _t333);
  assign _t1021 = ((|_t325) ? _t328 : _merge3_rr);
  assign _t1022 = ((|_t344) ? _t342 : _t341);
  assign _merge3_valid = ((|_t345) || (|cri_valid));
  assign cfr_ready = ((|_t347) && (|_t346));
  assign cri_ready = ((|_t349) && (|_t348));
  assign _merge3_data = ((|_t350) ? cfr_data : cri_data);
  assign _merge3_last = ((|_t351) ? cfr_last : cri_last);
  assign _merge3_tag = _merge3_sel;
  assign _merge3_ready = cp_i_ready;
  assign dl_cr_1__data = cp_o_data;
  assign dl_cr_1__last = cp_o_last;
  assign dl_cr_1__valid = cp_o_valid;
  assign dl_ct_1__ready = uro_i_ready;
  assign ud_cout_data = uro_o_data;
  assign ud_cout_valid = uro_o_valid;
  assign ud_t_1__valid = 1'd0;
  assign ud_t_1__data = 8'd0;
  assign ud_t_1__last = 1'd0;
  assign ud_p_1__valid = 1'd0;
  assign ud_p_1__data = 8'd0;
  assign ud_p_1__last = 1'd0;
  assign ud_f_2__valid = ((|ud_in_valid) && (|_t353));
  assign ud_f_2__data = ud_in_data;
  assign ud_f_2__last = ud_in_last;
  assign ud_f_2__ready = udr3_i_ready;
  assign dl_c_5__data = udr3_o_data;
  assign dl_c_5__last = udr3_o_last;
  assign dl_c_5__valid = udr3_o_valid;
  assign dl_r_5__ready = udt2_t_ready;
  assign ud_p_2__data = udt2_o_data;
  assign ud_p_2__last = udt2_o_last;
  assign ud_p_2__valid = udt2_o_valid;
  assign ud_t_2__valid = 1'd0;
  assign ud_t_2__data = 8'd0;
  assign ud_t_2__last = 1'd0;
  assign ud_f_3__valid = ((|ud_in_valid) && (|_t367));
  assign ud_f_3__data = ud_in_data;
  assign ud_f_3__last = ud_in_last;
  assign ud_f_3__ready = udr4_i_ready;
  assign dl_c_6__data = udr4_o_data;
  assign dl_c_6__last = udr4_o_last;
  assign dl_c_6__valid = udr4_o_valid;
  assign dl_r_6__ready = udt3_t_ready;
  assign ud_p_3__data = udt3_o_data;
  assign ud_p_3__last = udt3_o_last;
  assign ud_p_3__valid = udt3_o_valid;
  assign ud_t_3__valid = 1'd0;
  assign ud_t_3__data = 8'd0;
  assign ud_t_3__last = 1'd0;
  assign ud_f_4__valid = ((|ud_in_valid) && (|_t381));
  assign ud_f_4__data = ud_in_data;
  assign ud_f_4__last = ud_in_last;
  assign ud_f_4__ready = udr5_i_ready;
  assign dl_c_7__data = udr5_o_data;
  assign dl_c_7__last = udr5_o_last;
  assign dl_c_7__valid = udr5_o_valid;
  assign dl_r_7__ready = udt4_t_ready;
  assign ud_p_4__data = udt4_o_data;
  assign ud_p_4__last = udt4_o_last;
  assign ud_p_4__valid = udt4_o_valid;
  assign ud_t_4__valid = 1'd0;
  assign ud_t_4__data = 8'd0;
  assign ud_t_4__last = 1'd0;
  assign _merge4_sel = ((|_merge4_lock) ? _merge4_lsel : _t426);
  assign _t1023 = ((|_t454) ? 1'd1 : _t444);
  assign _t1024 = ((|_t436) ? _t439 : _merge4_rr);
  assign _t1025 = ((|_t458) ? _t456 : _t455);
  assign _merge4_valid = ((|_t462) || (|ud_p_4__valid));
  assign ud_p_0__ready = ((|_t464) && (|_t463));
  assign ud_p_1__ready = ((|_t466) && (|_t465));
  assign ud_p_2__ready = ((|_t468) && (|_t467));
  assign ud_p_3__ready = ((|_t470) && (|_t469));
  assign ud_p_4__ready = ((|_t472) && (|_t471));
  assign _merge4_data = ((|_t479) ? ud_p_0__data : _t478);
  assign _merge4_last = ((|_t486) ? ud_p_0__last : _t485);
  assign _merge4_tag = _merge4_sel;
  assign _merge5_sel = ((|_merge5_lock) ? _merge5_lsel : _t521);
  assign _t1026 = ((|_t549) ? 1'd1 : _t539);
  assign _t1027 = ((|_t531) ? _t534 : _merge5_rr);
  assign _t1028 = ((|_t553) ? _t551 : _t550);
  assign _merge5_valid = ((|_t557) || (|ud_t_4__valid));
  assign ud_t_0__ready = ((|_t559) && (|_t558));
  assign ud_t_1__ready = ((|_t561) && (|_t560));
  assign ud_t_2__ready = ((|_t563) && (|_t562));
  assign ud_t_3__ready = ((|_t565) && (|_t564));
  assign ud_t_4__ready = ((|_t567) && (|_t566));
  assign _merge5_data = ((|_t574) ? ud_t_0__data : _t573);
  assign _merge5_last = ((|_t581) ? ud_t_0__last : _t580);
  assign _merge5_tag = _merge5_sel;
  assign _merge4_ready = pm2_hi_ready;
  assign _merge5_ready = pm2_lo_ready;
  assign ud_m_data = pm2_o_data;
  assign ud_m_last = pm2_o_last;
  assign ud_m_valid = pm2_o_valid;
  assign _xs4_ready = _xfifo2_src_ready;
  assign hutx_data = _xfifo2_dst_data;
  assign hutx_valid = _xfifo2_dst_valid;
  assign ud_m_ready = st_f_ready;
  assign ud_cout_ready = st_con_ready;
  assign _xs4_data = st_o_data;
  assign _xs4_valid = st_o_valid;
  assign dl_c_8__valid = 1'd0;
  assign dl_c_8__data = 8'd0;
  assign dl_c_8__last = 1'd0;
  assign dl_r_8__ready = 1'd1;
  assign dl_c_9__valid = 1'd0;
  assign dl_c_9__data = 8'd0;
  assign dl_c_9__last = 1'd0;
  assign dl_r_9__ready = 1'd1;
  assign dl_c_10__valid = 1'd0;
  assign dl_c_10__data = 8'd0;
  assign dl_c_10__last = 1'd0;
  assign dl_r_10__ready = 1'd1;
  assign dl_c_11__valid = 1'd0;
  assign dl_c_11__data = 8'd0;
  assign dl_c_11__last = 1'd0;
  assign dl_r_11__ready = 1'd1;
  assign dl_cr_2__valid = 1'd0;
  assign dl_cr_2__data = 8'd0;
  assign dl_cr_2__last = 1'd0;
  assign dl_ct_2__ready = 1'd1;
  assign dl_c_12__valid = 1'd0;
  assign dl_c_12__data = 8'd0;
  assign dl_c_12__last = 1'd0;
  assign dl_r_12__ready = 1'd1;
  assign dl_c_13__valid = 1'd0;
  assign dl_c_13__data = 8'd0;
  assign dl_c_13__last = 1'd0;
  assign dl_r_13__ready = 1'd1;
  assign dl_c_14__valid = 1'd0;
  assign dl_c_14__data = 8'd0;
  assign dl_c_14__last = 1'd0;
  assign dl_r_14__ready = 1'd1;
  assign dl_c_15__valid = 1'd0;
  assign dl_c_15__data = 8'd0;
  assign dl_c_15__last = 1'd0;
  assign dl_r_15__ready = 1'd1;
  assign dl_cr_3__valid = 1'd0;
  assign dl_cr_3__data = 8'd0;
  assign dl_cr_3__last = 1'd0;
  assign dl_ct_3__ready = 1'd1;
  assign _merge6_sel = ((|_merge6_lock) ? _merge6_lsel : _t607);
  assign _t1029 = ((|_t632) ? 1'd1 : _t623);
  assign _t1030 = ((|_t615) ? _t618 : _merge6_rr);
  assign _t1031 = ((|_t636) ? _t634 : _t633);
  assign _merge6_valid = ((|_t639) || (|dl_c_12__valid));
  assign dl_c_0__ready = ((|_t641) && (|_t640));
  assign dl_c_4__ready = ((|_t643) && (|_t642));
  assign dl_c_8__ready = ((|_t645) && (|_t644));
  assign dl_c_12__ready = ((|_t647) && (|_t646));
  assign _merge6_data = ((|_t652) ? dl_c_0__data : _t651);
  assign _merge6_last = ((|_t657) ? dl_c_0__last : _t656);
  assign _merge6_tag = _merge6_sel;
  assign _merge6_ready = cp2_i_ready;
  assign p0rx_data = cp2_o_data;
  assign p0rx_last = cp2_o_last;
  assign p0rx_valid = cp2_o_valid;
  assign p0tx_ready = rt_i_ready;
  assign dl_r_0__data = rt_oa_data;
  assign dl_r_0__last = rt_oa_last;
  assign dl_r_0__valid = rt_oa_valid;
  assign dl_r_4__data = rt_ob_data;
  assign dl_r_4__last = rt_ob_last;
  assign dl_r_4__valid = rt_ob_valid;
  assign dl_r_8__data = rt_oc_data;
  assign dl_r_8__last = rt_oc_last;
  assign dl_r_8__valid = rt_oc_valid;
  assign dl_r_12__data = rt_od_data;
  assign dl_r_12__last = rt_od_last;
  assign dl_r_12__valid = rt_od_valid;
  assign _merge7_sel = ((|_merge7_lock) ? _merge7_lsel : _t681);
  assign _t1032 = ((|_t706) ? 1'd1 : _t697);
  assign _t1033 = ((|_t689) ? _t692 : _merge7_rr);
  assign _t1034 = ((|_t710) ? _t708 : _t707);
  assign _merge7_valid = ((|_t713) || (|dl_c_13__valid));
  assign dl_c_1__ready = ((|_t715) && (|_t714));
  assign dl_c_5__ready = ((|_t717) && (|_t716));
  assign dl_c_9__ready = ((|_t719) && (|_t718));
  assign dl_c_13__ready = ((|_t721) && (|_t720));
  assign _merge7_data = ((|_t726) ? dl_c_1__data : _t725);
  assign _merge7_last = ((|_t731) ? dl_c_1__last : _t730);
  assign _merge7_tag = _merge7_sel;
  assign _merge7_ready = cp3_i_ready;
  assign p1rx_data = cp3_o_data;
  assign p1rx_last = cp3_o_last;
  assign p1rx_valid = cp3_o_valid;
  assign p1tx_ready = rt2_i_ready;
  assign dl_r_1__data = rt2_oa_data;
  assign dl_r_1__last = rt2_oa_last;
  assign dl_r_1__valid = rt2_oa_valid;
  assign dl_r_5__data = rt2_ob_data;
  assign dl_r_5__last = rt2_ob_last;
  assign dl_r_5__valid = rt2_ob_valid;
  assign dl_r_9__data = rt2_oc_data;
  assign dl_r_9__last = rt2_oc_last;
  assign dl_r_9__valid = rt2_oc_valid;
  assign dl_r_13__data = rt2_od_data;
  assign dl_r_13__last = rt2_od_last;
  assign dl_r_13__valid = rt2_od_valid;
  assign _merge8_sel = ((|_merge8_lock) ? _merge8_lsel : _t755);
  assign _t1035 = ((|_t780) ? 1'd1 : _t771);
  assign _t1036 = ((|_t763) ? _t766 : _merge8_rr);
  assign _t1037 = ((|_t784) ? _t782 : _t781);
  assign _merge8_valid = ((|_t787) || (|dl_c_14__valid));
  assign dl_c_2__ready = ((|_t789) && (|_t788));
  assign dl_c_6__ready = ((|_t791) && (|_t790));
  assign dl_c_10__ready = ((|_t793) && (|_t792));
  assign dl_c_14__ready = ((|_t795) && (|_t794));
  assign _merge8_data = ((|_t800) ? dl_c_2__data : _t799);
  assign _merge8_last = ((|_t805) ? dl_c_2__last : _t804);
  assign _merge8_tag = _merge8_sel;
  assign _merge8_ready = cp4_i_ready;
  assign p2rx_data = cp4_o_data;
  assign p2rx_last = cp4_o_last;
  assign p2rx_valid = cp4_o_valid;
  assign p2tx_ready = rt3_i_ready;
  assign dl_r_2__data = rt3_oa_data;
  assign dl_r_2__last = rt3_oa_last;
  assign dl_r_2__valid = rt3_oa_valid;
  assign dl_r_6__data = rt3_ob_data;
  assign dl_r_6__last = rt3_ob_last;
  assign dl_r_6__valid = rt3_ob_valid;
  assign dl_r_10__data = rt3_oc_data;
  assign dl_r_10__last = rt3_oc_last;
  assign dl_r_10__valid = rt3_oc_valid;
  assign dl_r_14__data = rt3_od_data;
  assign dl_r_14__last = rt3_od_last;
  assign dl_r_14__valid = rt3_od_valid;
  assign _merge9_sel = ((|_merge9_lock) ? _merge9_lsel : _t829);
  assign _t1038 = ((|_t854) ? 1'd1 : _t845);
  assign _t1039 = ((|_t837) ? _t840 : _merge9_rr);
  assign _t1040 = ((|_t858) ? _t856 : _t855);
  assign _merge9_valid = ((|_t861) || (|dl_c_15__valid));
  assign dl_c_3__ready = ((|_t863) && (|_t862));
  assign dl_c_7__ready = ((|_t865) && (|_t864));
  assign dl_c_11__ready = ((|_t867) && (|_t866));
  assign dl_c_15__ready = ((|_t869) && (|_t868));
  assign _merge9_data = ((|_t874) ? dl_c_3__data : _t873);
  assign _merge9_last = ((|_t879) ? dl_c_3__last : _t878);
  assign _merge9_tag = _merge9_sel;
  assign _merge9_ready = cp5_i_ready;
  assign p3rx_data = cp5_o_data;
  assign p3rx_last = cp5_o_last;
  assign p3rx_valid = cp5_o_valid;
  assign p3tx_ready = rt4_i_ready;
  assign dl_r_3__data = rt4_oa_data;
  assign dl_r_3__last = rt4_oa_last;
  assign dl_r_3__valid = rt4_oa_valid;
  assign dl_r_7__data = rt4_ob_data;
  assign dl_r_7__last = rt4_ob_last;
  assign dl_r_7__valid = rt4_ob_valid;
  assign dl_r_11__data = rt4_oc_data;
  assign dl_r_11__last = rt4_oc_last;
  assign dl_r_11__valid = rt4_oc_valid;
  assign dl_r_15__data = rt4_od_data;
  assign dl_r_15__last = rt4_od_last;
  assign dl_r_15__valid = rt4_od_valid;
  assign _merge10_sel = ((|_merge10_lock) ? _merge10_lsel : _t903);
  assign _t1041 = ((|_t928) ? 1'd1 : _t919);
  assign _t1042 = ((|_t911) ? _t914 : _merge10_rr);
  assign _t1043 = ((|_t932) ? _t930 : _t929);
  assign _merge10_valid = ((|_t935) || (|dl_cr_3__valid));
  assign dl_cr_0__ready = ((|_t937) && (|_t936));
  assign dl_cr_1__ready = ((|_t939) && (|_t938));
  assign dl_cr_2__ready = ((|_t941) && (|_t940));
  assign dl_cr_3__ready = ((|_t943) && (|_t942));
  assign _merge10_data = ((|_t948) ? dl_cr_0__data : _t947);
  assign _merge10_last = ((|_t953) ? dl_cr_0__last : _t952);
  assign _merge10_tag = _merge10_sel;
  assign _merge10_ready = cip_i_ready;
  assign crx_data = cip_o_data;
  assign crx_last = cip_o_last;
  assign crx_valid = cip_o_valid;
  assign spk = ((|dl_cr_1__valid) ? 2'd1 : _t954);
  assign ctx_ready = cs_i_ready;
  assign dl_ct_0__data = cs_oa_data;
  assign dl_ct_0__last = cs_oa_last;
  assign dl_ct_0__valid = cs_oa_valid;
  assign dl_ct_1__data = cs_ob_data;
  assign dl_ct_1__last = cs_ob_last;
  assign dl_ct_1__valid = cs_ob_valid;
  assign dl_ct_2__data = cs_oc_data;
  assign dl_ct_2__last = cs_oc_last;
  assign dl_ct_2__valid = cs_oc_valid;
  assign dl_ct_3__data = cs_od_data;
  assign dl_ct_3__last = cs_od_last;
  assign dl_ct_3__valid = cs_od_valid;
  assign _t1044 = ((|_t959) ? _t956 : _t955);
  assign _t1045 = ((|_t963) ? 1'd1 : _t960);
  assign sclk = m_sd_clk;
  assign scs = m_sd_cs_n;
  assign smosi = m_sd_mosi;
  assign sact = m_sd_activity;
  assign de = m_de;
  assign hs = m_hs;
  assign vs = m_vs;
  assign r = m_r;
  assign g = m_g;
  assign b = m_b;
  assign sample = m_sample;
  assign cs_data = cap_t_data;
  assign cs_last = cap_t_last;
  assign cs_valid = cap_t_valid;
  assign cs_ready = st0_t_ready;
  assign p0rx_ready = st0_rx_ready;
  assign p0tx_data = st0_tx_data;
  assign p0tx_last = st0_tx_last;
  assign p0tx_valid = st0_tx_valid;
  assign ps_data = snd_t_data;
  assign ps_last = snd_t_last;
  assign ps_valid = snd_t_valid;
  assign ps_ready = st1_t_ready;
  assign p1rx_ready = st1_rx_ready;
  assign p1tx_data = st1_tx_data;
  assign p1tx_last = st1_tx_last;
  assign p1tx_valid = st1_tx_valid;
  assign cb_req = card_blk_req;
  assign cb_wr = card_blk_wr;
  assign cb_lba = card_blk_lba;
  assign cb_wdata = card_blk_wdata;
  assign miso = card_miso;
  assign cb_ack = bp_blk_ack;
  assign cb_stb = bp_blk_stb;
  assign cb_rdata = bp_blk_rdata;
  assign cb_done = bp_blk_done;
  assign cb_err = bp_blk_err;
  assign rq_data = bp_req_data;
  assign rq_last = bp_req_last;
  assign rq_valid = bp_req_valid;
  assign an_ready = bp_ans_ready;
  assign rq_ready = st2_t_ready;
  assign p2rx_ready = st2_rx_ready;
  assign p2tx_data = st2_tx_data;
  assign p2tx_last = st2_tx_last;
  assign p2tx_valid = st2_tx_valid;
  assign nopeer = 96'd0;
  assign p3rx_ready = sr3_rx_ready;
  assign p3tx_data = sr3_tx_data;
  assign p3tx_last = sr3_tx_last;
  assign p3tx_valid = sr3_tx_valid;
  assign hsin_data = sr3_s_data;
  assign hsin_last = sr3_s_last;
  assign hsin_valid = sr3_s_valid;
  assign key = hi_key;
  assign kv = hi_key_valid;
  assign refresh = hi_refresh;
  assign boot = hi_boot;
  assign hsin_ready = hi_s_ready;
  assign an_data = hi_ans_data;
  assign an_last = hi_ans_last;
  assign an_valid = hi_ans_valid;
  assign _t1046 = (n + 27'd1);
  assign hb = n[26];
  assign act = sact;
  assign _t1047 = ((|_t968) ? _t965 : _t964);
  assign kseen = (ks != 23'd0);
  assign hbs = hbs_sync1;
  assign acts = acts_sync1;
  assign kss = kss_sync1;
  assign leds = {kss, _t977};
  assign rgb = {1'd0, _t1010};
  always @(posedge c74) begin
    if (rst) begin
      dl_last <= 2'd0;
      u4_took <= 5'd0;
      _merge_rr <= 3'd0;
      _merge_lock <= 1'd0;
      _merge_lsel <= 3'd0;
      _merge2_rr <= 3'd0;
      _merge2_lock <= 1'd0;
      _merge2_lsel <= 3'd0;
      ud_took <= 5'd0;
      _merge3_rr <= 1'd0;
      _merge3_lock <= 1'd0;
      _merge3_lsel <= 1'd0;
      _merge4_rr <= 3'd0;
      _merge4_lock <= 1'd0;
      _merge4_lsel <= 3'd0;
      _merge5_rr <= 3'd0;
      _merge5_lock <= 1'd0;
      _merge5_lsel <= 3'd0;
      _merge6_rr <= 2'd0;
      _merge6_lock <= 1'd0;
      _merge6_lsel <= 2'd0;
      _merge7_rr <= 2'd0;
      _merge7_lock <= 1'd0;
      _merge7_lsel <= 2'd0;
      _merge8_rr <= 2'd0;
      _merge8_lock <= 1'd0;
      _merge8_lsel <= 2'd0;
      _merge9_rr <= 2'd0;
      _merge9_lock <= 1'd0;
      _merge9_lsel <= 2'd0;
      _merge10_rr <= 2'd0;
      _merge10_lock <= 1'd0;
      _merge10_lsel <= 2'd0;
      run <= 1'd0;
      hold <= 5'd0;
      n <= 27'd0;
      ks <= 23'd0;
    end else begin
      dl_last <= _t1018;
      u4_took <= _t1011;
      _merge_rr <= _t1013;
      _merge_lock <= _t1012;
      _merge_lsel <= _t1014;
      _merge2_rr <= _t1016;
      _merge2_lock <= _t1015;
      _merge2_lsel <= _t1017;
      ud_took <= _t1019;
      _merge3_rr <= _t1021;
      _merge3_lock <= _t1020;
      _merge3_lsel <= _t1022;
      _merge4_rr <= _t1024;
      _merge4_lock <= _t1023;
      _merge4_lsel <= _t1025;
      _merge5_rr <= _t1027;
      _merge5_lock <= _t1026;
      _merge5_lsel <= _t1028;
      _merge6_rr <= _t1030;
      _merge6_lock <= _t1029;
      _merge6_lsel <= _t1031;
      _merge7_rr <= _t1033;
      _merge7_lock <= _t1032;
      _merge7_lsel <= _t1034;
      _merge8_rr <= _t1036;
      _merge8_lock <= _t1035;
      _merge8_lsel <= _t1037;
      _merge9_rr <= _t1039;
      _merge9_lock <= _t1038;
      _merge9_lsel <= _t1040;
      _merge10_rr <= _t1042;
      _merge10_lock <= _t1041;
      _merge10_lsel <= _t1043;
      run <= _t1045;
      hold <= _t1044;
      n <= _t1046;
      ks <= _t1047;
    end
  end
  always @(posedge clk) begin
    if (rst) begin
      hbs_sync0 <= 1'd0;
      hbs_sync1 <= 1'd0;
      acts_sync0 <= 1'd0;
      acts_sync1 <= 1'd0;
      kss_sync0 <= 1'd0;
      kss_sync1 <= 1'd0;
    end else begin
      hbs_sync0 <= hb;
      hbs_sync1 <= hbs_sync0;
      acts_sync0 <= act;
      acts_sync1 <= acts_sync0;
      kss_sync0 <= kseen;
      kss_sync1 <= kss_sync0;
    end
  end

  wire pll_clkin, pll_fb;
  BUFG pll_clkin_bufg (.I(clk100), .O(pll_clkin));
  wire pll_clkout0_raw;
  wire pll_clkout1_raw;
  PLLE2_BASE #(
    .BANDWIDTH("LOW"),
    .CLKFBOUT_MULT(52),
    .DIVCLK_DIVIDE(5),
    .STARTUP_WAIT("TRUE"),

    .CLKOUT0_DIVIDE(14),

    .CLKOUT1_DIVIDE(7)
  ) pll (
    .CLKIN1(pll_clkin),
    .CLKFBOUT(pll_fb),
    .CLKFBIN(pll_fb),
    .PWRDWN(1'b0),
    .RST(1'b0),
    .LOCKED(pll_lock),
    .CLKOUT0(pll_clkout0_raw),
    .CLKOUT1(pll_clkout1_raw)
  );
  BUFG pll_clkout0_bufg (.I(pll_clkout0_raw), .O(pll_clkout0));
  BUFG pll_clkout1_bufg (.I(pll_clkout1_raw), .O(pll_clkout1));
  xfifo_frame_8_4_16 _xfifo_frame (
    .clk(c74),
    .rst(nlk),
    .wclk(eth_rx_clk),
    .wrst(eth_rx_rst),
    .rclk(c74),
    .rrst(nlk),
    .src_data(erx_data),
    .src_last(erx_last),
    .src_valid(erx_valid),
    .src_ready(_xfifo_frame_src_ready),
    .dst_data(_xfifo_frame_dst_data),
    .dst_last(_xfifo_frame_dst_last),
    .dst_valid(_xfifo_frame_dst_valid),
    .dst_ready(_xs_ready)
  );
  frame_in fi (
    .clk(c74),
    .rst(nlk),
    .i_data(_xs_data),
    .i_last(_xs_last),
    .i_valid(_xs_valid),
    .i_ready(fi_i_ready),
    .o_data(fi_o_data),
    .o_last(fi_o_last),
    .o_valid(fi_o_valid),
    .o_ready(u4_rx_ready)
  );
  udp4_port_36492_2200301993985_3232255234_2048_1_0_1 ep (
    .clk(c74),
    .rst(nlk),
    .erx_data(u4_f_0__data),
    .erx_last(u4_f_0__last),
    .erx_valid(u4_f_0__valid),
    .erx_ready(ep_erx_ready),
    .etx_data(ep_etx_data),
    .etx_last(ep_etx_last),
    .etx_valid(ep_etx_valid),
    .etx_ready(u4_p_0__ready),
    .rx_data(ep_rx_data),
    .rx_last(ep_rx_last),
    .rx_valid(ep_rx_valid),
    .rx_ready(dl_c_0__ready),
    .tx_data(dl_r_0__data),
    .tx_last(dl_r_0__last),
    .tx_valid(dl_r_0__valid),
    .tx_ready(ep_tx_ready),
    .nr(ep_nr),
    .nt(ep_nt),
    .na(ep_na),
    .pr_valid(ep_pr_valid)
  );
  udp4_port_36500_2200301993985_3232255234_2048_0_1_0 ep2 (
    .clk(c74),
    .rst(nlk),
    .erx_data(u4_f_1__data),
    .erx_last(u4_f_1__last),
    .erx_valid(u4_f_1__valid),
    .erx_ready(ep2_erx_ready),
    .etx_data(ep2_etx_data),
    .etx_last(ep2_etx_last),
    .etx_valid(ep2_etx_valid),
    .etx_ready(u4_p_1__ready),
    .rx_data(ep2_rx_data),
    .rx_last(ep2_rx_last),
    .rx_valid(ep2_rx_valid),
    .rx_ready(dl_cr_0__ready),
    .tx_data(dl_ct_0__data),
    .tx_last(dl_ct_0__last),
    .tx_valid(dl_ct_0__valid),
    .tx_ready(ep2_tx_ready),
    .nr(ep2_nr),
    .nt(ep2_nt),
    .na(ep2_na),
    .pr_valid(ep2_pr_valid)
  );
  udp4_port_36490_2200301993985_3232255234_2048_0_0_1 ep3 (
    .clk(c74),
    .rst(nlk),
    .erx_data(u4_f_2__data),
    .erx_last(u4_f_2__last),
    .erx_valid(u4_f_2__valid),
    .erx_ready(ep3_erx_ready),
    .etx_data(ep3_etx_data),
    .etx_last(ep3_etx_last),
    .etx_valid(ep3_etx_valid),
    .etx_ready(u4_p_2__ready),
    .rx_data(ep3_rx_data),
    .rx_last(ep3_rx_last),
    .rx_valid(ep3_rx_valid),
    .rx_ready(dl_c_1__ready),
    .tx_data(dl_r_1__data),
    .tx_last(dl_r_1__last),
    .tx_valid(dl_r_1__valid),
    .tx_ready(ep3_tx_ready),
    .nr(ep3_nr),
    .nt(ep3_nt),
    .na(ep3_na),
    .pr_valid(ep3_pr_valid)
  );
  udp4_port_36488_2200301993985_3232255234_2048_0_0_1 ep4 (
    .clk(c74),
    .rst(nlk),
    .erx_data(u4_f_3__data),
    .erx_last(u4_f_3__last),
    .erx_valid(u4_f_3__valid),
    .erx_ready(ep4_erx_ready),
    .etx_data(ep4_etx_data),
    .etx_last(ep4_etx_last),
    .etx_valid(ep4_etx_valid),
    .etx_ready(u4_p_3__ready),
    .rx_data(ep4_rx_data),
    .rx_last(ep4_rx_last),
    .rx_valid(ep4_rx_valid),
    .rx_ready(dl_c_2__ready),
    .tx_data(dl_r_2__data),
    .tx_last(dl_r_2__last),
    .tx_valid(dl_r_2__valid),
    .tx_ready(ep4_tx_ready),
    .nr(ep4_nr),
    .nt(ep4_nt),
    .na(ep4_na),
    .pr_valid(ep4_pr_valid)
  );
  udp4_port_36486_2200301993985_3232255234_2048_0_0_1 ep5 (
    .clk(c74),
    .rst(nlk),
    .erx_data(u4_f_4__data),
    .erx_last(u4_f_4__last),
    .erx_valid(u4_f_4__valid),
    .erx_ready(ep5_erx_ready),
    .etx_data(ep5_etx_data),
    .etx_last(ep5_etx_last),
    .etx_valid(ep5_etx_valid),
    .etx_ready(u4_p_4__ready),
    .rx_data(ep5_rx_data),
    .rx_last(ep5_rx_last),
    .rx_valid(ep5_rx_valid),
    .rx_ready(dl_c_3__ready),
    .tx_data(dl_r_3__data),
    .tx_last(dl_r_3__last),
    .tx_valid(dl_r_3__valid),
    .tx_ready(ep5_tx_ready),
    .nr(ep5_nr),
    .nt(ep5_nt),
    .na(ep5_na),
    .pr_valid(ep5_pr_valid)
  );
  frame_prefer_8 pm (
    .clk(c74),
    .rst(nlk),
    .hi_data(_merge_data),
    .hi_last(_merge_last),
    .hi_valid(_merge_valid),
    .hi_ready(pm_hi_ready),
    .lo_data(_merge2_data),
    .lo_last(_merge2_last),
    .lo_valid(_merge2_valid),
    .lo_ready(pm_lo_ready),
    .o_data(pm_o_data),
    .o_last(pm_o_last),
    .o_valid(pm_o_valid),
    .o_ready(u4_m_ready)
  );
  xfifo_frame_8_4_16 _xfifo_frame2 (
    .clk(c74),
    .rst(nlk),
    .wclk(c74),
    .wrst(nlk),
    .rclk(eth_tx_clk),
    .rrst(eth_tx_rst),
    .src_data(_xs2_data),
    .src_last(_xs2_last),
    .src_valid(_xs2_valid),
    .src_ready(_xfifo_frame2_src_ready),
    .dst_data(_xfifo_frame2_dst_data),
    .dst_last(_xfifo_frame2_dst_last),
    .dst_valid(_xfifo_frame2_dst_valid),
    .dst_ready(etx_ready)
  );
  frame_out fo (
    .clk(c74),
    .rst(nlk),
    .i_data(u4_m_data),
    .i_last(u4_m_last),
    .i_valid(u4_m_valid),
    .i_ready(fo_i_ready),
    .o_data(fo_o_data),
    .o_last(fo_o_last),
    .o_valid(fo_o_valid),
    .o_ready(_xs2_ready)
  );
  xfifo_9_4_16_1 _xfifo (
    .clk(c74),
    .rst(nlk),
    .wclk(clk100),
    .wrst(nolock),
    .rclk(c74),
    .rrst(nlk),
    .src_data(_xp_data),
    .src_valid(_xp_valid),
    .src_ready(_xfifo_src_ready),
    .dst_data(_xfifo_dst_data),
    .dst_valid(_xfifo_dst_valid),
    .dst_ready(_xq_ready)
  );
  slip_rx_2048 sr (
    .clk(c74),
    .rst(nlk),
    .i_data_v(_xs3_data_v),
    .i_data_err(_xs3_data_err),
    .i_valid(_xs3_valid),
    .i_ready(sr_i_ready),
    .f_data(sr_f_data),
    .f_last(sr_f_last),
    .f_valid(sr_f_valid),
    .f_ready(ud_in_ready),
    .con_data(sr_con_data),
    .con_valid(sr_con_valid),
    .con_ready(ud_cin_ready),
    .drops(sr_drops)
  );
  ud_rx_36492_1_2 udr (
    .clk(c74),
    .rst(nlk),
    .i_data(ud_f_0__data),
    .i_last(ud_f_0__last),
    .i_valid(ud_f_0__valid),
    .i_ready(udr_i_ready),
    .o_data(udr_o_data),
    .o_last(udr_o_last),
    .o_valid(udr_o_valid),
    .o_ready(dl_c_4__ready)
  );
  ud_tx_36492_1 udt (
    .clk(c74),
    .rst(nlk),
    .t_data(dl_r_4__data),
    .t_last(dl_r_4__last),
    .t_valid(dl_r_4__valid),
    .t_ready(udt_t_ready),
    .o_data(udt_o_data),
    .o_last(udt_o_last),
    .o_valid(udt_o_valid),
    .o_ready(ud_p_0__ready)
  );
  ud_rx_36500_0_2 udr2 (
    .clk(c74),
    .rst(nlk),
    .i_data(ud_f_1__data),
    .i_last(ud_f_1__last),
    .i_valid(ud_f_1__valid),
    .i_ready(udr2_i_ready),
    .o_data(udr2_o_data),
    .o_last(udr2_o_last),
    .o_valid(udr2_o_valid),
    .o_ready(cfr_ready)
  );
  ud_raw_in uri (
    .clk(c74),
    .rst(nlk),
    .i_data(ud_cin_data),
    .i_valid(ud_cin_valid),
    .i_ready(uri_i_ready),
    .o_data(uri_o_data),
    .o_last(uri_o_last),
    .o_valid(uri_o_valid),
    .o_ready(cri_ready)
  );
  frame_pass_u cp (
    .clk(c74),
    .rst(nlk),
    .i_data(_merge3_data),
    .i_last(_merge3_last),
    .i_valid(_merge3_valid),
    .i_ready(cp_i_ready),
    .o_data(cp_o_data),
    .o_last(cp_o_last),
    .o_valid(cp_o_valid),
    .o_ready(dl_cr_1__ready)
  );
  ud_raw_out uro (
    .clk(c74),
    .rst(nlk),
    .i_data(dl_ct_1__data),
    .i_last(dl_ct_1__last),
    .i_valid(dl_ct_1__valid),
    .i_ready(uro_i_ready),
    .o_data(uro_o_data),
    .o_valid(uro_o_valid),
    .o_ready(ud_cout_ready)
  );
  ud_rx_36490_1_2 udr3 (
    .clk(c74),
    .rst(nlk),
    .i_data(ud_f_2__data),
    .i_last(ud_f_2__last),
    .i_valid(ud_f_2__valid),
    .i_ready(udr3_i_ready),
    .o_data(udr3_o_data),
    .o_last(udr3_o_last),
    .o_valid(udr3_o_valid),
    .o_ready(dl_c_5__ready)
  );
  ud_tx_36490_1 udt2 (
    .clk(c74),
    .rst(nlk),
    .t_data(dl_r_5__data),
    .t_last(dl_r_5__last),
    .t_valid(dl_r_5__valid),
    .t_ready(udt2_t_ready),
    .o_data(udt2_o_data),
    .o_last(udt2_o_last),
    .o_valid(udt2_o_valid),
    .o_ready(ud_p_2__ready)
  );
  ud_rx_36488_1_2 udr4 (
    .clk(c74),
    .rst(nlk),
    .i_data(ud_f_3__data),
    .i_last(ud_f_3__last),
    .i_valid(ud_f_3__valid),
    .i_ready(udr4_i_ready),
    .o_data(udr4_o_data),
    .o_last(udr4_o_last),
    .o_valid(udr4_o_valid),
    .o_ready(dl_c_6__ready)
  );
  ud_tx_36488_1 udt3 (
    .clk(c74),
    .rst(nlk),
    .t_data(dl_r_6__data),
    .t_last(dl_r_6__last),
    .t_valid(dl_r_6__valid),
    .t_ready(udt3_t_ready),
    .o_data(udt3_o_data),
    .o_last(udt3_o_last),
    .o_valid(udt3_o_valid),
    .o_ready(ud_p_3__ready)
  );
  ud_rx_36486_1_2 udr5 (
    .clk(c74),
    .rst(nlk),
    .i_data(ud_f_4__data),
    .i_last(ud_f_4__last),
    .i_valid(ud_f_4__valid),
    .i_ready(udr5_i_ready),
    .o_data(udr5_o_data),
    .o_last(udr5_o_last),
    .o_valid(udr5_o_valid),
    .o_ready(dl_c_7__ready)
  );
  ud_tx_36486_1 udt4 (
    .clk(c74),
    .rst(nlk),
    .t_data(dl_r_7__data),
    .t_last(dl_r_7__last),
    .t_valid(dl_r_7__valid),
    .t_ready(udt4_t_ready),
    .o_data(udt4_o_data),
    .o_last(udt4_o_last),
    .o_valid(udt4_o_valid),
    .o_ready(ud_p_4__ready)
  );
  frame_prefer_8 pm2 (
    .clk(c74),
    .rst(nlk),
    .hi_data(_merge4_data),
    .hi_last(_merge4_last),
    .hi_valid(_merge4_valid),
    .hi_ready(pm2_hi_ready),
    .lo_data(_merge5_data),
    .lo_last(_merge5_last),
    .lo_valid(_merge5_valid),
    .lo_ready(pm2_lo_ready),
    .o_data(pm2_o_data),
    .o_last(pm2_o_last),
    .o_valid(pm2_o_valid),
    .o_ready(ud_m_ready)
  );
  xfifo_8_4_16 _xfifo2 (
    .clk(c74),
    .rst(nlk),
    .wclk(c74),
    .wrst(nlk),
    .rclk(clk100),
    .rrst(nolock),
    .src_data(_xs4_data),
    .src_valid(_xs4_valid),
    .src_ready(_xfifo2_src_ready),
    .dst_data(_xfifo2_dst_data),
    .dst_valid(_xfifo2_dst_valid),
    .dst_ready(hutx_ready)
  );
  slip_tx st (
    .clk(c74),
    .rst(nlk),
    .f_data(ud_m_data),
    .f_last(ud_m_last),
    .f_valid(ud_m_valid),
    .f_ready(st_f_ready),
    .con_data(ud_cout_data),
    .con_valid(ud_cout_valid),
    .con_ready(st_con_ready),
    .o_data(st_o_data),
    .o_valid(st_o_valid),
    .o_ready(_xs4_ready)
  );
  frame_pass_u cp2 (
    .clk(c74),
    .rst(nlk),
    .i_data(_merge6_data),
    .i_last(_merge6_last),
    .i_valid(_merge6_valid),
    .i_ready(cp2_i_ready),
    .o_data(cp2_o_data),
    .o_last(cp2_o_last),
    .o_valid(cp2_o_valid),
    .o_ready(p0rx_ready)
  );
  dl_route_0_2_99_99 rt (
    .clk(c74),
    .rst(nlk),
    .i_data(p0tx_data),
    .i_last(p0tx_last),
    .i_valid(p0tx_valid),
    .i_ready(rt_i_ready),
    .oa_data(rt_oa_data),
    .oa_last(rt_oa_last),
    .oa_valid(rt_oa_valid),
    .oa_ready(dl_r_0__ready),
    .ob_data(rt_ob_data),
    .ob_last(rt_ob_last),
    .ob_valid(rt_ob_valid),
    .ob_ready(dl_r_4__ready),
    .oc_data(rt_oc_data),
    .oc_last(rt_oc_last),
    .oc_valid(rt_oc_valid),
    .oc_ready(dl_r_8__ready),
    .od_data(rt_od_data),
    .od_last(rt_od_last),
    .od_valid(rt_od_valid),
    .od_ready(dl_r_12__ready)
  );
  frame_pass_u cp3 (
    .clk(c74),
    .rst(nlk),
    .i_data(_merge7_data),
    .i_last(_merge7_last),
    .i_valid(_merge7_valid),
    .i_ready(cp3_i_ready),
    .o_data(cp3_o_data),
    .o_last(cp3_o_last),
    .o_valid(cp3_o_valid),
    .o_ready(p1rx_ready)
  );
  dl_route_0_2_99_99 rt2 (
    .clk(c74),
    .rst(nlk),
    .i_data(p1tx_data),
    .i_last(p1tx_last),
    .i_valid(p1tx_valid),
    .i_ready(rt2_i_ready),
    .oa_data(rt2_oa_data),
    .oa_last(rt2_oa_last),
    .oa_valid(rt2_oa_valid),
    .oa_ready(dl_r_1__ready),
    .ob_data(rt2_ob_data),
    .ob_last(rt2_ob_last),
    .ob_valid(rt2_ob_valid),
    .ob_ready(dl_r_5__ready),
    .oc_data(rt2_oc_data),
    .oc_last(rt2_oc_last),
    .oc_valid(rt2_oc_valid),
    .oc_ready(dl_r_9__ready),
    .od_data(rt2_od_data),
    .od_last(rt2_od_last),
    .od_valid(rt2_od_valid),
    .od_ready(dl_r_13__ready)
  );
  frame_pass_u cp4 (
    .clk(c74),
    .rst(nlk),
    .i_data(_merge8_data),
    .i_last(_merge8_last),
    .i_valid(_merge8_valid),
    .i_ready(cp4_i_ready),
    .o_data(cp4_o_data),
    .o_last(cp4_o_last),
    .o_valid(cp4_o_valid),
    .o_ready(p2rx_ready)
  );
  dl_route_0_2_99_99 rt3 (
    .clk(c74),
    .rst(nlk),
    .i_data(p2tx_data),
    .i_last(p2tx_last),
    .i_valid(p2tx_valid),
    .i_ready(rt3_i_ready),
    .oa_data(rt3_oa_data),
    .oa_last(rt3_oa_last),
    .oa_valid(rt3_oa_valid),
    .oa_ready(dl_r_2__ready),
    .ob_data(rt3_ob_data),
    .ob_last(rt3_ob_last),
    .ob_valid(rt3_ob_valid),
    .ob_ready(dl_r_6__ready),
    .oc_data(rt3_oc_data),
    .oc_last(rt3_oc_last),
    .oc_valid(rt3_oc_valid),
    .oc_ready(dl_r_10__ready),
    .od_data(rt3_od_data),
    .od_last(rt3_od_last),
    .od_valid(rt3_od_valid),
    .od_ready(dl_r_14__ready)
  );
  frame_pass_u cp5 (
    .clk(c74),
    .rst(nlk),
    .i_data(_merge9_data),
    .i_last(_merge9_last),
    .i_valid(_merge9_valid),
    .i_ready(cp5_i_ready),
    .o_data(cp5_o_data),
    .o_last(cp5_o_last),
    .o_valid(cp5_o_valid),
    .o_ready(p3rx_ready)
  );
  dl_route_0_2_99_99 rt4 (
    .clk(c74),
    .rst(nlk),
    .i_data(p3tx_data),
    .i_last(p3tx_last),
    .i_valid(p3tx_valid),
    .i_ready(rt4_i_ready),
    .oa_data(rt4_oa_data),
    .oa_last(rt4_oa_last),
    .oa_valid(rt4_oa_valid),
    .oa_ready(dl_r_3__ready),
    .ob_data(rt4_ob_data),
    .ob_last(rt4_ob_last),
    .ob_valid(rt4_ob_valid),
    .ob_ready(dl_r_7__ready),
    .oc_data(rt4_oc_data),
    .oc_last(rt4_oc_last),
    .oc_valid(rt4_oc_valid),
    .oc_ready(dl_r_11__ready),
    .od_data(rt4_od_data),
    .od_last(rt4_od_last),
    .od_valid(rt4_od_valid),
    .od_ready(dl_r_15__ready)
  );
  frame_pass_u cip (
    .clk(c74),
    .rst(nlk),
    .i_data(_merge10_data),
    .i_last(_merge10_last),
    .i_valid(_merge10_valid),
    .i_ready(cip_i_ready),
    .o_data(cip_o_data),
    .o_last(cip_o_last),
    .o_valid(cip_o_valid),
    .o_ready(crx_ready)
  );
  dl_steer cs (
    .clk(c74),
    .rst(nlk),
    .i_data(ctx_data),
    .i_last(ctx_last),
    .i_valid(ctx_valid),
    .i_ready(cs_i_ready),
    .oa_data(cs_oa_data),
    .oa_last(cs_oa_last),
    .oa_valid(cs_oa_valid),
    .oa_ready(dl_ct_0__ready),
    .ob_data(cs_ob_data),
    .ob_last(cs_ob_last),
    .ob_valid(cs_ob_valid),
    .ob_ready(dl_ct_1__ready),
    .oc_data(cs_oc_data),
    .oc_last(cs_oc_last),
    .oc_valid(cs_oc_valid),
    .oc_ready(dl_ct_2__ready),
    .od_data(cs_od_data),
    .od_last(cs_od_last),
    .od_valid(cs_od_valid),
    .od_ready(dl_ct_3__ready),
    .sel(spk)
  );
  z1013_machine m (
    .clk(c74),
    .rst(nlk),
    .rst_n(run),
    .key(key),
    .key_valid(kv),
    .ps2_clk(1'd1),
    .ps2_data(1'd1),
    .sd_miso(miso),
    .sd_clk(m_sd_clk),
    .sd_cs_n(m_sd_cs_n),
    .sd_mosi(m_sd_mosi),
    .sd_activity(m_sd_activity),
    .de(m_de),
    .hs(m_hs),
    .vs(m_vs),
    .r(m_r),
    .g(m_g),
    .b(m_b),
    .sample(m_sample)
  );
  capture_384_104_256 cap (
    .clk(c74),
    .rst(nlk),
    .de(de),
    .vs(vs),
    .r(r),
    .g(g),
    .b(b),
    .refresh(refresh),
    .t_data(cap_t_data),
    .t_last(cap_t_last),
    .t_valid(cap_t_valid),
    .t_ready(cs_ready),
    .sent(cap_sent)
  );
  stream_tx_8_2048_256_1_200000 st0 (
    .clk(c74),
    .rst(nlk),
    .t_data(cs_data),
    .t_last(cs_last),
    .t_valid(cs_valid),
    .t_ready(st0_t_ready),
    .rx_data(p0rx_data),
    .rx_last(p0rx_last),
    .rx_valid(p0rx_valid),
    .rx_ready(st0_rx_ready),
    .tx_data(st0_tx_data),
    .tx_last(st0_tx_last),
    .tx_valid(st0_tx_valid),
    .tx_ready(p0tx_ready),
    .err(st0_err)
  );
  pcm_74285714_22050_64 snd (
    .clk(c74),
    .rst(nlk),
    .sample(sample),
    .t_data(snd_t_data),
    .t_last(snd_t_last),
    .t_valid(snd_t_valid),
    .t_ready(ps_ready),
    .drops(snd_drops)
  );
  stream_tx_8_1024_256_1_200000 st1 (
    .clk(c74),
    .rst(nlk),
    .t_data(ps_data),
    .t_last(ps_last),
    .t_valid(ps_valid),
    .t_ready(st1_t_ready),
    .rx_data(p1rx_data),
    .rx_last(p1rx_last),
    .rx_valid(p1rx_valid),
    .rx_ready(st1_rx_ready),
    .tx_data(st1_tx_data),
    .tx_last(st1_tx_last),
    .tx_valid(st1_tx_valid),
    .tx_ready(p1tx_ready),
    .err(st1_err)
  );
  sd_card_blk card (
    .clk(c74),
    .rst(nlk),
    .sclk(sclk),
    .mosi(smosi),
    .cs(scs),
    .blk_req(card_blk_req),
    .blk_wr(card_blk_wr),
    .blk_lba(card_blk_lba),
    .blk_wdata(card_blk_wdata),
    .blk_ack(cb_ack),
    .blk_stb(cb_stb),
    .blk_rdata(cb_rdata),
    .blk_done(cb_done),
    .blk_err(cb_err),
    .miso(card_miso)
  );
  blk_pipe_1 bp (
    .clk(c74),
    .rst(nlk),
    .blk_req(cb_req),
    .blk_wr(cb_wr),
    .blk_lba(cb_lba),
    .blk_wdata(cb_wdata),
    .blk_ack(bp_blk_ack),
    .blk_stb(bp_blk_stb),
    .blk_rdata(bp_blk_rdata),
    .blk_done(bp_blk_done),
    .blk_err(bp_blk_err),
    .req_data(bp_req_data),
    .req_last(bp_req_last),
    .req_valid(bp_req_valid),
    .req_ready(rq_ready),
    .ans_data(an_data),
    .ans_last(an_last),
    .ans_valid(an_valid),
    .ans_ready(bp_ans_ready),
    .ops(bp_ops)
  );
  stream_tx_8_2048_1024_1_200000 st2 (
    .clk(c74),
    .rst(nlk),
    .t_data(rq_data),
    .t_last(rq_last),
    .t_valid(rq_valid),
    .t_ready(st2_t_ready),
    .rx_data(p2rx_data),
    .rx_last(p2rx_last),
    .rx_valid(p2rx_valid),
    .rx_ready(st2_rx_ready),
    .tx_data(st2_tx_data),
    .tx_last(st2_tx_last),
    .tx_valid(st2_tx_valid),
    .tx_ready(p2tx_ready),
    .err(st2_err)
  );
  stream_rx_8_2048_1024_1_50000 sr3 (
    .clk(c74),
    .rst(nlk),
    .rx_data(p3rx_data),
    .rx_last(p3rx_last),
    .rx_valid(p3rx_valid),
    .rx_ready(sr3_rx_ready),
    .tx_data(sr3_tx_data),
    .tx_last(sr3_tx_last),
    .tx_valid(sr3_tx_valid),
    .tx_ready(p3tx_ready),
    .s_data(sr3_s_data),
    .s_last(sr3_s_last),
    .s_valid(sr3_s_valid),
    .s_ready(hsin_ready),
    .peer(nopeer),
    .lost(sr3_lost),
    .cut(sr3_cut),
    .gaps(sr3_gaps)
  );
  host_in_64_64 hi (
    .clk(c74),
    .rst(nlk),
    .s_data(hsin_data),
    .s_last(hsin_last),
    .s_valid(hsin_valid),
    .s_ready(hi_s_ready),
    .ans_data(hi_ans_data),
    .ans_last(hi_ans_last),
    .ans_valid(hi_ans_valid),
    .ans_ready(an_ready),
    .key(hi_key),
    .key_valid(hi_key_valid),
    .refresh(hi_refresh),
    .boot(hi_boot),
    .lost(hi_lost)
  );
endmodule
`default_nettype wire

