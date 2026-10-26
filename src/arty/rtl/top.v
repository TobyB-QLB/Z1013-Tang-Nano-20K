`default_nettype none
module uart_link_100 (
  input  wire clk,
  input  wire rst,
  input  wire rxd,
  output wire txd,

  input  wire txd_in,
  input  wire txd_in_en
);
  assign txd = ((|txd_in_en) ? txd_in : 1'd1);
endmodule
`default_nettype wire

`default_nettype none
module mii_mgmt_64_1_20_25_0 (
  input  wire clk,
  input  wire rst,
  output wire mdc,
  output wire mdio_o,
  output wire mdio_en,
  input  wire mdio_i,
  output wire rstn,
  output reg  [15:0] bmsr,
  output reg  [15:0] sts,
  output reg  [15:0] idr,
  output reg  upr
);
  reg  [6:0] dc;
  reg  [6:0] n;
  reg  mdcr;
  reg  outr;
  reg  enr;
  reg  mi0;
  reg  mi1;
  reg  [15:0] rdata;
  reg  [4:0] regad;
  reg  [15:0] wdata;
  reg  isrd;
  wire l8_bit;
  wire oe;
  wire go;
  wire done;
  reg  [25:0] l8_wait;
  reg  rstr;
  reg  bm_state;
  reg  [3:0] seq_state;
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
  wire _t54;
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
  wire _t73;
  wire _t74;
  wire _t75;
  wire _t76;
  wire _t77;
  wire _t78;
  wire _t79;
  wire _t80;
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
  wire _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire _t107;
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
  wire [13:0] _t170;
  wire [15:0] _t171;
  wire _t172;
  wire _t173;
  wire _t174;
  wire _t175;
  wire _t176;
  wire [15:0] _t177;
  wire [1:0] _t178;
  wire _t179;
  wire [12:0] _t180;
  wire [15:0] _t181;
  wire _t182;
  wire _t183;
  wire _t184;
  wire [15:0] _t185;
  wire [2:0] _t186;
  wire _t187;
  wire [11:0] _t188;
  wire [15:0] _t189;
  wire _t190;
  wire _t191;
  wire _t192;
  wire [15:0] _t193;
  wire [3:0] _t194;
  wire _t195;
  wire [10:0] _t196;
  wire [15:0] _t197;
  wire _t198;
  wire _t199;
  wire _t200;
  wire [15:0] _t201;
  wire [4:0] _t202;
  wire _t203;
  wire [9:0] _t204;
  wire [15:0] _t205;
  wire _t206;
  wire _t207;
  wire _t208;
  wire [15:0] _t209;
  wire [5:0] _t210;
  wire _t211;
  wire [8:0] _t212;
  wire [15:0] _t213;
  wire _t214;
  wire _t215;
  wire _t216;
  wire [15:0] _t217;
  wire [6:0] _t218;
  wire _t219;
  wire [7:0] _t220;
  wire [15:0] _t221;
  wire _t222;
  wire _t223;
  wire _t224;
  wire [15:0] _t225;
  wire [7:0] _t226;
  wire _t227;
  wire [6:0] _t228;
  wire [15:0] _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire [15:0] _t233;
  wire [8:0] _t234;
  wire _t235;
  wire [5:0] _t236;
  wire [15:0] _t237;
  wire _t238;
  wire _t239;
  wire _t240;
  wire [15:0] _t241;
  wire [9:0] _t242;
  wire _t243;
  wire [4:0] _t244;
  wire [15:0] _t245;
  wire _t246;
  wire _t247;
  wire _t248;
  wire [15:0] _t249;
  wire [10:0] _t250;
  wire _t251;
  wire [3:0] _t252;
  wire [15:0] _t253;
  wire _t254;
  wire _t255;
  wire _t256;
  wire [15:0] _t257;
  wire [11:0] _t258;
  wire _t259;
  wire [2:0] _t260;
  wire [15:0] _t261;
  wire _t262;
  wire _t263;
  wire _t264;
  wire [15:0] _t265;
  wire [12:0] _t266;
  wire _t267;
  wire [1:0] _t268;
  wire [15:0] _t269;
  wire _t270;
  wire _t271;
  wire _t272;
  wire [15:0] _t273;
  wire [13:0] _t274;
  wire _t275;
  wire _t276;
  wire [15:0] _t277;
  wire _t278;
  wire _t279;
  wire _t280;
  wire [15:0] _t281;
  wire [14:0] _t282;
  wire _t283;
  wire [15:0] _t284;
  wire _t285;
  wire _t286;
  wire _t287;
  wire [15:0] _t288;
  wire [14:0] _t289;
  wire [15:0] _t290;
  wire _t291;
  wire _t292;
  wire _t293;
  wire [6:0] _t294;
  wire _t295;
  wire _t296;
  wire _t297;
  wire _t298;
  wire _t299;
  wire _t300;
  wire _t301;
  wire _t302;
  wire _t303;
  wire _t304;
  wire _t305;
  wire [6:0] _t306;
  wire [6:0] _t307;
  wire _t308;
  wire _t309;
  wire _t310;
  wire _t311;
  wire [6:0] _t312;
  wire [6:0] _t313;
  wire _t314;
  wire _t315;
  wire _t316;
  wire _t317;
  wire _t318;
  wire _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire [25:0] _t323;
  wire [25:0] _t324;
  wire _t325;
  wire _t326;
  wire _t327;
  wire _t328;
  wire _t329;
  wire [25:0] _t330;
  wire _t331;
  wire _t332;
  wire _t333;
  wire [3:0] _t334;
  wire _t335;
  wire _t336;
  wire [25:0] _t337;
  wire [25:0] _t338;
  wire _t339;
  wire _t340;
  wire _t341;
  wire _t342;
  wire _t343;
  wire _t344;
  wire _t345;
  wire [3:0] _t346;
  wire _t347;
  wire _t348;
  wire [4:0] _t349;
  wire _t350;
  wire [15:0] _t351;
  wire _t352;
  wire _t353;
  wire _t354;
  wire _t355;
  wire _t356;
  wire [3:0] _t357;
  wire _t358;
  wire _t359;
  wire [4:0] _t360;
  wire _t361;
  wire _t362;
  wire _t363;
  wire _t364;
  wire _t365;
  wire [3:0] _t366;
  wire _t367;
  wire _t368;
  wire _t369;
  wire [3:0] _t370;
  wire _t371;
  wire [4:0] _t372;
  wire _t373;
  wire _t374;
  wire _t375;
  wire _t376;
  wire _t377;
  wire [3:0] _t378;
  wire _t379;
  wire _t380;
  wire _t381;
  wire _t382;
  wire _t383;
  wire _t384;
  wire _t385;
  wire [3:0] _t386;
  wire _t387;
  wire [4:0] _t388;
  wire _t389;
  wire _t390;
  wire _t391;
  wire _t392;
  wire _t393;
  wire [3:0] _t394;
  wire _t395;
  wire _t396;
  wire _t397;
  wire [3:0] _t398;
  wire _t399;
  wire [25:0] _t400;
  wire _t401;
  wire _t402;
  wire _t403;
  wire [3:0] _t404;
  wire _t405;
  wire _t406;
  wire [25:0] _t407;
  wire [25:0] _t408;
  wire _t409;
  wire _t410;
  wire _t411;
  wire _t412;
  wire _t413;
  wire [6:0] _t414;
  wire [6:0] _t415;
  wire _t416;
  wire _t417;
  wire [15:0] _t418;
  wire _t419;
  wire [25:0] _t420;
  wire [3:0] _t421;
  wire [4:0] _t422;
  wire [15:0] _t423;
  wire _t424;
  wire [15:0] _t425;
  wire [15:0] _t426;
  wire _t427;
  wire [15:0] _t428;
  assign _t0 = ({31'b0, bm_state} == 32'd0);
  assign _t1 = ({31'b0, bm_state} == 32'd0);
  assign _t2 = ({31'b0, bm_state} == 32'd0);
  assign _t3 = ({31'b0, bm_state} == 32'd0);
  assign _t4 = ({31'b0, bm_state} == 32'd0);
  assign _t5 = ((|_t4) && (|go));
  assign _t6 = (n < 7'd32);
  assign _t7 = ({31'b0, bm_state} == 32'd1);
  assign _t8 = ((|_t7) && (|_t6));
  assign _t9 = ((|_t8) ? 1'd1 : 1'd0);
  assign _t10 = (n == 7'd33);
  assign _t11 = ({31'b0, bm_state} == 32'd1);
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t12) ? 1'd1 : _t9);
  assign _t14 = (n == 7'd34);
  assign _t15 = ({31'b0, bm_state} == 32'd1);
  assign _t16 = ((|_t15) && (|_t14));
  assign _t17 = ((|_t16) ? isrd : _t13);
  assign _t18 = (~isrd);
  assign _t19 = (n == 7'd35);
  assign _t20 = ({31'b0, bm_state} == 32'd1);
  assign _t21 = ((|_t20) && (|_t19));
  assign _t22 = ((|_t21) ? _t18 : _t17);
  assign _t23 = (n == 7'd36);
  assign _t24 = ({31'b0, bm_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|_t25) ? 1'd0 : _t22);
  assign _t27 = regad[4];
  assign _t28 = (n == 7'd41);
  assign _t29 = ({31'b0, bm_state} == 32'd1);
  assign _t30 = ((|_t29) && (|_t28));
  assign _t31 = ((|_t30) ? _t27 : _t26);
  assign _t32 = (n == 7'd37);
  assign _t33 = ({31'b0, bm_state} == 32'd1);
  assign _t34 = ((|_t33) && (|_t32));
  assign _t35 = ((|_t34) ? 1'd0 : _t31);
  assign _t36 = regad[3];
  assign _t37 = (n == 7'd42);
  assign _t38 = ({31'b0, bm_state} == 32'd1);
  assign _t39 = ((|_t38) && (|_t37));
  assign _t40 = ((|_t39) ? _t36 : _t35);
  assign _t41 = (n == 7'd38);
  assign _t42 = ({31'b0, bm_state} == 32'd1);
  assign _t43 = ((|_t42) && (|_t41));
  assign _t44 = ((|_t43) ? 1'd0 : _t40);
  assign _t45 = regad[2];
  assign _t46 = (n == 7'd43);
  assign _t47 = ({31'b0, bm_state} == 32'd1);
  assign _t48 = ((|_t47) && (|_t46));
  assign _t49 = ((|_t48) ? _t45 : _t44);
  assign _t50 = (n == 7'd39);
  assign _t51 = ({31'b0, bm_state} == 32'd1);
  assign _t52 = ((|_t51) && (|_t50));
  assign _t53 = ((|_t52) ? 1'd0 : _t49);
  assign _t54 = regad[1];
  assign _t55 = (n == 7'd44);
  assign _t56 = ({31'b0, bm_state} == 32'd1);
  assign _t57 = ((|_t56) && (|_t55));
  assign _t58 = ((|_t57) ? _t54 : _t53);
  assign _t59 = (n == 7'd40);
  assign _t60 = ({31'b0, bm_state} == 32'd1);
  assign _t61 = ((|_t60) && (|_t59));
  assign _t62 = ((|_t61) ? 1'd1 : _t58);
  assign _t63 = regad[0];
  assign _t64 = (n == 7'd45);
  assign _t65 = ({31'b0, bm_state} == 32'd1);
  assign _t66 = ((|_t65) && (|_t64));
  assign _t67 = ((|_t66) ? _t63 : _t62);
  assign _t68 = (n == 7'd46);
  assign _t69 = ({31'b0, bm_state} == 32'd1);
  assign _t70 = ((|_t69) && (|_t68));
  assign _t71 = ((|_t70) ? 1'd1 : _t67);
  assign _t72 = wdata[15];
  assign _t73 = (n == 7'd48);
  assign _t74 = ({31'b0, bm_state} == 32'd1);
  assign _t75 = ((|_t74) && (|_t73));
  assign _t76 = ((|_t75) ? _t72 : _t71);
  assign _t77 = wdata[14];
  assign _t78 = (n == 7'd49);
  assign _t79 = ({31'b0, bm_state} == 32'd1);
  assign _t80 = ((|_t79) && (|_t78));
  assign _t81 = ((|_t80) ? _t77 : _t76);
  assign _t82 = wdata[13];
  assign _t83 = (n == 7'd50);
  assign _t84 = ({31'b0, bm_state} == 32'd1);
  assign _t85 = ((|_t84) && (|_t83));
  assign _t86 = ((|_t85) ? _t82 : _t81);
  assign _t87 = wdata[12];
  assign _t88 = (n == 7'd51);
  assign _t89 = ({31'b0, bm_state} == 32'd1);
  assign _t90 = ((|_t89) && (|_t88));
  assign _t91 = ((|_t90) ? _t87 : _t86);
  assign _t92 = wdata[11];
  assign _t93 = (n == 7'd52);
  assign _t94 = ({31'b0, bm_state} == 32'd1);
  assign _t95 = ((|_t94) && (|_t93));
  assign _t96 = ((|_t95) ? _t92 : _t91);
  assign _t97 = wdata[10];
  assign _t98 = (n == 7'd53);
  assign _t99 = ({31'b0, bm_state} == 32'd1);
  assign _t100 = ((|_t99) && (|_t98));
  assign _t101 = ((|_t100) ? _t97 : _t96);
  assign _t102 = wdata[9];
  assign _t103 = (n == 7'd54);
  assign _t104 = ({31'b0, bm_state} == 32'd1);
  assign _t105 = ((|_t104) && (|_t103));
  assign _t106 = ((|_t105) ? _t102 : _t101);
  assign _t107 = wdata[8];
  assign _t108 = (n == 7'd55);
  assign _t109 = ({31'b0, bm_state} == 32'd1);
  assign _t110 = ((|_t109) && (|_t108));
  assign _t111 = ((|_t110) ? _t107 : _t106);
  assign _t112 = wdata[7];
  assign _t113 = (n == 7'd56);
  assign _t114 = ({31'b0, bm_state} == 32'd1);
  assign _t115 = ((|_t114) && (|_t113));
  assign _t116 = ((|_t115) ? _t112 : _t111);
  assign _t117 = wdata[6];
  assign _t118 = (n == 7'd57);
  assign _t119 = ({31'b0, bm_state} == 32'd1);
  assign _t120 = ((|_t119) && (|_t118));
  assign _t121 = ((|_t120) ? _t117 : _t116);
  assign _t122 = wdata[5];
  assign _t123 = (n == 7'd58);
  assign _t124 = ({31'b0, bm_state} == 32'd1);
  assign _t125 = ((|_t124) && (|_t123));
  assign _t126 = ((|_t125) ? _t122 : _t121);
  assign _t127 = wdata[4];
  assign _t128 = (n == 7'd59);
  assign _t129 = ({31'b0, bm_state} == 32'd1);
  assign _t130 = ((|_t129) && (|_t128));
  assign _t131 = ((|_t130) ? _t127 : _t126);
  assign _t132 = wdata[3];
  assign _t133 = (n == 7'd60);
  assign _t134 = ({31'b0, bm_state} == 32'd1);
  assign _t135 = ((|_t134) && (|_t133));
  assign _t136 = ((|_t135) ? _t132 : _t131);
  assign _t137 = wdata[2];
  assign _t138 = (n == 7'd61);
  assign _t139 = ({31'b0, bm_state} == 32'd1);
  assign _t140 = ((|_t139) && (|_t138));
  assign _t141 = ((|_t140) ? _t137 : _t136);
  assign _t142 = wdata[1];
  assign _t143 = (n == 7'd62);
  assign _t144 = ({31'b0, bm_state} == 32'd1);
  assign _t145 = ((|_t144) && (|_t143));
  assign _t146 = ((|_t145) ? _t142 : _t141);
  assign _t147 = wdata[0];
  assign _t148 = (n == 7'd63);
  assign _t149 = ({31'b0, bm_state} == 32'd1);
  assign _t150 = ((|_t149) && (|_t148));
  assign _t151 = (n < 7'd46);
  assign _t152 = (~isrd);
  assign _t153 = ((|_t152) || (|_t151));
  assign _t154 = ({31'b0, bm_state} == 32'd1);
  assign _t155 = (dc == 7'd0);
  assign _t156 = ({31'b0, bm_state} == 32'd1);
  assign _t157 = ((|_t156) && (|_t155));
  assign _t158 = ((|_t1) ? 1'd0 : enr);
  assign _t159 = ({31'b0, bm_state} == 32'd1);
  assign _t160 = ((|_t159) && (|_t155));
  assign _t161 = ((|_t0) ? 1'd0 : mdcr);
  assign _t162 = ({31'b0, bm_state} == 32'd1);
  assign _t163 = ((|_t162) && (|_t155));
  assign _t164 = ((|_t163) ? 1'd0 : _t161);
  assign _t165 = (dc == 7'd32);
  assign _t166 = ({31'b0, bm_state} == 32'd1);
  assign _t167 = ((|_t166) && (|_t165));
  assign _t168 = rdata[0:0];
  assign _t169 = rdata[0];
  assign _t170 = rdata[15:2];
  assign _t171 = {_t170, _t169, _t168};
  assign _t172 = (n >= 7'd48);
  assign _t173 = ((|isrd) && (|_t172));
  assign _t174 = ((|_t165) && (|_t173));
  assign _t175 = ({31'b0, bm_state} == 32'd1);
  assign _t176 = ((|_t175) && (|_t174));
  assign _t177 = ((|_t176) ? _t171 : rdata);
  assign _t178 = _t177[1:0];
  assign _t179 = rdata[1];
  assign _t180 = _t177[15:3];
  assign _t181 = {_t180, _t179, _t178};
  assign _t182 = ((|_t165) && (|_t173));
  assign _t183 = ({31'b0, bm_state} == 32'd1);
  assign _t184 = ((|_t183) && (|_t182));
  assign _t185 = ((|_t184) ? _t181 : _t177);
  assign _t186 = _t185[2:0];
  assign _t187 = rdata[2];
  assign _t188 = _t185[15:4];
  assign _t189 = {_t188, _t187, _t186};
  assign _t190 = ((|_t165) && (|_t173));
  assign _t191 = ({31'b0, bm_state} == 32'd1);
  assign _t192 = ((|_t191) && (|_t190));
  assign _t193 = ((|_t192) ? _t189 : _t185);
  assign _t194 = _t193[3:0];
  assign _t195 = rdata[3];
  assign _t196 = _t193[15:5];
  assign _t197 = {_t196, _t195, _t194};
  assign _t198 = ((|_t165) && (|_t173));
  assign _t199 = ({31'b0, bm_state} == 32'd1);
  assign _t200 = ((|_t199) && (|_t198));
  assign _t201 = ((|_t200) ? _t197 : _t193);
  assign _t202 = _t201[4:0];
  assign _t203 = rdata[4];
  assign _t204 = _t201[15:6];
  assign _t205 = {_t204, _t203, _t202};
  assign _t206 = ((|_t165) && (|_t173));
  assign _t207 = ({31'b0, bm_state} == 32'd1);
  assign _t208 = ((|_t207) && (|_t206));
  assign _t209 = ((|_t208) ? _t205 : _t201);
  assign _t210 = _t209[5:0];
  assign _t211 = rdata[5];
  assign _t212 = _t209[15:7];
  assign _t213 = {_t212, _t211, _t210};
  assign _t214 = ((|_t165) && (|_t173));
  assign _t215 = ({31'b0, bm_state} == 32'd1);
  assign _t216 = ((|_t215) && (|_t214));
  assign _t217 = ((|_t216) ? _t213 : _t209);
  assign _t218 = _t217[6:0];
  assign _t219 = rdata[6];
  assign _t220 = _t217[15:8];
  assign _t221 = {_t220, _t219, _t218};
  assign _t222 = ((|_t165) && (|_t173));
  assign _t223 = ({31'b0, bm_state} == 32'd1);
  assign _t224 = ((|_t223) && (|_t222));
  assign _t225 = ((|_t224) ? _t221 : _t217);
  assign _t226 = _t225[7:0];
  assign _t227 = rdata[7];
  assign _t228 = _t225[15:9];
  assign _t229 = {_t228, _t227, _t226};
  assign _t230 = ((|_t165) && (|_t173));
  assign _t231 = ({31'b0, bm_state} == 32'd1);
  assign _t232 = ((|_t231) && (|_t230));
  assign _t233 = ((|_t232) ? _t229 : _t225);
  assign _t234 = _t233[8:0];
  assign _t235 = rdata[8];
  assign _t236 = _t233[15:10];
  assign _t237 = {_t236, _t235, _t234};
  assign _t238 = ((|_t165) && (|_t173));
  assign _t239 = ({31'b0, bm_state} == 32'd1);
  assign _t240 = ((|_t239) && (|_t238));
  assign _t241 = ((|_t240) ? _t237 : _t233);
  assign _t242 = _t241[9:0];
  assign _t243 = rdata[9];
  assign _t244 = _t241[15:11];
  assign _t245 = {_t244, _t243, _t242};
  assign _t246 = ((|_t165) && (|_t173));
  assign _t247 = ({31'b0, bm_state} == 32'd1);
  assign _t248 = ((|_t247) && (|_t246));
  assign _t249 = ((|_t248) ? _t245 : _t241);
  assign _t250 = _t249[10:0];
  assign _t251 = rdata[10];
  assign _t252 = _t249[15:12];
  assign _t253 = {_t252, _t251, _t250};
  assign _t254 = ((|_t165) && (|_t173));
  assign _t255 = ({31'b0, bm_state} == 32'd1);
  assign _t256 = ((|_t255) && (|_t254));
  assign _t257 = ((|_t256) ? _t253 : _t249);
  assign _t258 = _t257[11:0];
  assign _t259 = rdata[11];
  assign _t260 = _t257[15:13];
  assign _t261 = {_t260, _t259, _t258};
  assign _t262 = ((|_t165) && (|_t173));
  assign _t263 = ({31'b0, bm_state} == 32'd1);
  assign _t264 = ((|_t263) && (|_t262));
  assign _t265 = ((|_t264) ? _t261 : _t257);
  assign _t266 = _t265[12:0];
  assign _t267 = rdata[12];
  assign _t268 = _t265[15:14];
  assign _t269 = {_t268, _t267, _t266};
  assign _t270 = ((|_t165) && (|_t173));
  assign _t271 = ({31'b0, bm_state} == 32'd1);
  assign _t272 = ((|_t271) && (|_t270));
  assign _t273 = ((|_t272) ? _t269 : _t265);
  assign _t274 = _t273[13:0];
  assign _t275 = rdata[13];
  assign _t276 = _t273[15:15];
  assign _t277 = {_t276, _t275, _t274};
  assign _t278 = ((|_t165) && (|_t173));
  assign _t279 = ({31'b0, bm_state} == 32'd1);
  assign _t280 = ((|_t279) && (|_t278));
  assign _t281 = ((|_t280) ? _t277 : _t273);
  assign _t282 = _t281[14:0];
  assign _t283 = rdata[14];
  assign _t284 = {_t283, _t282};
  assign _t285 = ((|_t165) && (|_t173));
  assign _t286 = ({31'b0, bm_state} == 32'd1);
  assign _t287 = ((|_t286) && (|_t285));
  assign _t288 = ((|_t287) ? _t284 : _t281);
  assign _t289 = _t288[15:1];
  assign _t290 = {_t289, mi1};
  assign _t291 = ((|_t165) && (|_t173));
  assign _t292 = ({31'b0, bm_state} == 32'd1);
  assign _t293 = ((|_t292) && (|_t291));
  assign _t294 = ((|_t2) ? 7'd0 : dc);
  assign _t295 = (dc == 7'd63);
  assign _t296 = ({31'b0, bm_state} == 32'd1);
  assign _t297 = ((|_t296) && (|_t295));
  assign _t298 = (n == 7'd63);
  assign _t299 = ((|_t295) && (|_t298));
  assign _t300 = ({31'b0, bm_state} == 32'd1);
  assign _t301 = ((|_t300) && (|_t299));
  assign _t302 = ((|_t5) ? 32'd1 : bm_state);
  assign _t303 = ((|_t295) && (|_t298));
  assign _t304 = ({31'b0, bm_state} == 32'd1);
  assign _t305 = ((|_t304) && (|_t303));
  assign _t306 = ((|_t3) ? 7'd0 : n);
  assign _t307 = (n + 7'd1);
  assign _t308 = (~_t298);
  assign _t309 = ((|_t295) && (|_t308));
  assign _t310 = ({31'b0, bm_state} == 32'd1);
  assign _t311 = ((|_t310) && (|_t309));
  assign _t312 = ((|_t297) ? 7'd0 : _t294);
  assign _t313 = (dc + 7'd1);
  assign _t314 = (~_t295);
  assign _t315 = ({31'b0, bm_state} == 32'd1);
  assign _t316 = ((|_t315) && (|_t314));
  assign _t317 = ({28'b0, seq_state} == 32'd0);
  assign _t318 = l8_wait[20];
  assign _t319 = ({28'b0, seq_state} == 32'd0);
  assign _t320 = ((|_t319) && (|_t318));
  assign _t321 = ({28'b0, seq_state} == 32'd0);
  assign _t322 = ((|_t321) && (|_t318));
  assign _t323 = ((|_t320) ? 26'd0 : l8_wait);
  assign _t324 = (l8_wait + 26'd1);
  assign _t325 = (~_t318);
  assign _t326 = ({28'b0, seq_state} == 32'd0);
  assign _t327 = ((|_t326) && (|_t325));
  assign _t328 = ((|_t317) ? 1'd0 : rstr);
  assign _t329 = ({28'b0, seq_state} == 32'd1);
  assign _t330 = ((|_t327) ? _t324 : _t323);
  assign _t331 = l8_wait[25];
  assign _t332 = ({28'b0, seq_state} == 32'd1);
  assign _t333 = ((|_t332) && (|_t331));
  assign _t334 = ((|_t322) ? 32'd1 : seq_state);
  assign _t335 = ({28'b0, seq_state} == 32'd1);
  assign _t336 = ((|_t335) && (|_t331));
  assign _t337 = ((|_t333) ? 26'd0 : _t330);
  assign _t338 = (l8_wait + 26'd1);
  assign _t339 = (~_t331);
  assign _t340 = ({28'b0, seq_state} == 32'd1);
  assign _t341 = ((|_t340) && (|_t339));
  assign _t342 = ({28'b0, seq_state} == 32'd2);
  assign _t343 = ({28'b0, seq_state} == 32'd2);
  assign _t344 = ({28'b0, seq_state} == 32'd2);
  assign _t345 = ({28'b0, seq_state} == 32'd2);
  assign _t346 = ((|_t336) ? 32'd3 : _t334);
  assign _t347 = ({28'b0, seq_state} == 32'd2);
  assign _t348 = ((|_t347) && (|done));
  assign _t349 = ((|_t342) ? 5'd9 : regad);
  assign _t350 = ({28'b0, seq_state} == 32'd3);
  assign _t351 = ((|_t343) ? 16'd0 : wdata);
  assign _t352 = ({28'b0, seq_state} == 32'd3);
  assign _t353 = ((|_t344) ? 1'd0 : isrd);
  assign _t354 = ({28'b0, seq_state} == 32'd3);
  assign _t355 = ((|_t345) ? 1'd1 : 1'd0);
  assign _t356 = ({28'b0, seq_state} == 32'd3);
  assign _t357 = ((|_t348) ? 32'd3 : _t346);
  assign _t358 = ({28'b0, seq_state} == 32'd3);
  assign _t359 = ((|_t358) && (|done));
  assign _t360 = ((|_t350) ? 5'd0 : _t349);
  assign _t361 = ({28'b0, seq_state} == 32'd4);
  assign _t362 = ((|_t354) ? 1'd0 : _t353);
  assign _t363 = ({28'b0, seq_state} == 32'd4);
  assign _t364 = ((|_t356) ? 1'd1 : _t355);
  assign _t365 = ({28'b0, seq_state} == 32'd4);
  assign _t366 = ((|_t359) ? 32'd4 : _t357);
  assign _t367 = ({28'b0, seq_state} == 32'd4);
  assign _t368 = ((|_t367) && (|done));
  assign _t369 = ({28'b0, seq_state} == 32'd5);
  assign _t370 = ((|_t368) ? 32'd5 : _t366);
  assign _t371 = ({28'b0, seq_state} == 32'd5);
  assign _t372 = ((|_t361) ? 5'd2 : _t360);
  assign _t373 = ({28'b0, seq_state} == 32'd6);
  assign _t374 = ((|_t363) ? 1'd1 : _t362);
  assign _t375 = ({28'b0, seq_state} == 32'd6);
  assign _t376 = ((|_t365) ? 1'd1 : _t364);
  assign _t377 = ({28'b0, seq_state} == 32'd6);
  assign _t378 = ((|_t371) ? 32'd6 : _t370);
  assign _t379 = ({28'b0, seq_state} == 32'd6);
  assign _t380 = ((|_t379) && (|done));
  assign _t381 = ({28'b0, seq_state} == 32'd7);
  assign _t382 = rdata[5];
  assign _t383 = rdata[2];
  assign _t384 = ((|_t383) && (|_t382));
  assign _t385 = ({28'b0, seq_state} == 32'd7);
  assign _t386 = ((|_t380) ? 32'd7 : _t378);
  assign _t387 = ({28'b0, seq_state} == 32'd7);
  assign _t388 = ((|_t373) ? 5'd1 : _t372);
  assign _t389 = ({28'b0, seq_state} == 32'd8);
  assign _t390 = ((|_t375) ? 1'd1 : _t374);
  assign _t391 = ({28'b0, seq_state} == 32'd8);
  assign _t392 = ((|_t377) ? 1'd1 : _t376);
  assign _t393 = ({28'b0, seq_state} == 32'd8);
  assign _t394 = ((|_t387) ? 32'd8 : _t386);
  assign _t395 = ({28'b0, seq_state} == 32'd8);
  assign _t396 = ((|_t395) && (|done));
  assign _t397 = ({28'b0, seq_state} == 32'd9);
  assign _t398 = ((|_t396) ? 32'd9 : _t394);
  assign _t399 = ({28'b0, seq_state} == 32'd9);
  assign _t400 = ((|_t341) ? _t338 : _t337);
  assign _t401 = l8_wait[20];
  assign _t402 = ({28'b0, seq_state} == 32'd10);
  assign _t403 = ((|_t402) && (|_t401));
  assign _t404 = ((|_t399) ? 32'd10 : _t398);
  assign _t405 = ({28'b0, seq_state} == 32'd10);
  assign _t406 = ((|_t405) && (|_t401));
  assign _t407 = ((|_t403) ? 26'd0 : _t400);
  assign _t408 = (l8_wait + 26'd1);
  assign _t409 = (~_t401);
  assign _t410 = ({28'b0, seq_state} == 32'd10);
  assign _t411 = ((|_t410) && (|_t409));
  assign _t412 = ((|_t167) ? 1'd1 : _t164);
  assign _t413 = ((|_t160) ? oe : _t158);
  assign _t414 = ((|_t316) ? _t313 : _t312);
  assign _t415 = ((|_t311) ? _t307 : _t306);
  assign _t416 = ((|_t305) ? 32'd0 : _t302);
  assign l8_bit = ((|_t150) ? _t147 : _t146);
  assign oe = ((|_t154) ? _t153 : 1'd0);
  assign _t417 = ((|_t157) ? l8_bit : outr);
  assign _t418 = ((|_t293) ? _t290 : _t288);
  assign done = ((|_t301) ? 1'd1 : 1'd0);
  assign _t419 = ((|_t329) ? 1'd1 : _t328);
  assign _t420 = ((|_t411) ? _t408 : _t407);
  assign _t421 = ((|_t406) ? 32'd6 : _t404);
  assign _t422 = ((|_t389) ? 5'd16 : _t388);
  assign _t423 = ((|_t352) ? 16'd4608 : _t351);
  assign _t424 = ((|_t391) ? 1'd1 : _t390);
  assign go = ((|_t393) ? 1'd1 : _t392);
  assign _t425 = ((|_t369) ? rdata : idr);
  assign _t426 = ((|_t381) ? rdata : bmsr);
  assign _t427 = ((|_t385) ? _t384 : upr);
  assign _t428 = ((|_t397) ? rdata : sts);
  assign mdc = mdcr;
  assign mdio_o = outr;
  assign mdio_en = enr;
  assign rstn = rstr;
  (* mark_debug = "true" *) reg probe_phy_trig;
  (* mark_debug = "true" *) reg probe_phy_up;
  (* mark_debug = "true" *) reg [15:0] probe_phy_bmsr;
  (* mark_debug = "true" *) reg [15:0] probe_phy_sts;
  (* mark_debug = "true" *) reg [15:0] probe_phy_id;
  (* mark_debug = "true" *) wire probe_phy_clk;
  assign probe_phy_clk = clk;
  always @(posedge clk) begin
    probe_phy_trig <= upr;
    probe_phy_up <= upr;
    probe_phy_bmsr <= bmsr;
    probe_phy_sts <= sts;
    probe_phy_id <= idr;
  end
  always @(posedge clk) begin
    if (rst) begin
      dc <= 7'd0;
      n <= 7'd0;
      mdcr <= 1'd0;
      outr <= 1'd1;
      enr <= 1'd0;
      mi0 <= 1'd1;
      mi1 <= 1'd1;
      rdata <= 16'd0;
      regad <= 5'd0;
      wdata <= 16'd0;
      isrd <= 1'd0;
      l8_wait <= 26'd0;
      rstr <= 1'd0;
      bmsr <= 16'd0;
      sts <= 16'd0;
      idr <= 16'd0;
      upr <= 1'd0;
      bm_state <= 1'd0;
      seq_state <= 4'd0;
    end else begin
      dc <= _t414;
      n <= _t415;
      mdcr <= _t412;
      outr <= _t417;
      enr <= _t413;
      mi0 <= mdio_i;
      mi1 <= mi0;
      rdata <= _t418;
      regad <= _t422;
      wdata <= _t423;
      isrd <= _t424;
      l8_wait <= _t420;
      rstr <= _t419;
      bmsr <= _t426;
      sts <= _t428;
      idr <= _t425;
      upr <= _t427;
      bm_state <= _t416;
      seq_state <= _t421;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module eth_mii_link_64_1_0 (
  input  wire clk,
  input  wire rst,
  output wire mdc,
  output wire mdio_o,
  output wire mdio_en,
  input  wire mdio_i,
  output wire rstn,
  input  wire rx_clk,
  input  wire rx_rst,
  input  wire rx_dv,
  input  wire [3:0] rxd,
  input  wire rx_er,
  input  wire tx_clk,
  input  wire tx_rst,
  output wire tx_en,
  output wire [3:0] txd,
  output wire up,

  input  wire tx_en_in,
  input  wire tx_en_in_en,
  input  wire [3:0] txd_in,
  input  wire txd_in_en
);
  wire [15:0] bmsr;
  wire [15:0] sts;
  wire [15:0] idr;
  wire mmdc;
  wire mmo;
  wire mmen;
  wire mq;
  wire m_mdc;
  wire m_mdio_o;
  wire m_mdio_en;
  wire m_rstn;
  wire [15:0] m_bmsr;
  wire [15:0] m_sts;
  wire [15:0] m_idr;
  wire m_upr;
  assign mq = mdio_i;
  assign mmdc = m_mdc;
  assign mmo = m_mdio_o;
  assign mmen = m_mdio_en;
  assign rstn = m_rstn;
  assign bmsr = m_bmsr;
  assign sts = m_sts;
  assign idr = m_idr;
  assign up = m_upr;
  assign mdc = mmdc;
  assign mdio_o = mmo;
  assign mdio_en = mmen;
  assign tx_en = ((|tx_en_in_en) ? tx_en_in : 1'd0);
  assign txd = ((|txd_in_en) ? txd_in : 4'd0);
  mii_mgmt_64_1_20_25_0 m (
    .clk(clk),
    .rst(rst),
    .mdc(m_mdc),
    .mdio_o(m_mdio_o),
    .mdio_en(m_mdio_en),
    .mdio_i(mdio_i),
    .rstn(m_rstn),
    .bmsr(m_bmsr),
    .sts(m_sts),
    .idr(m_idr),
    .upr(m_upr)
  );
endmodule
`default_nettype wire

`default_nettype none
module hostlink_eth_2200301993985_3232255234 (
  input  wire clk,
  input  wire rst
);
endmodule
`default_nettype wire

`default_nettype none
module xc7_jtag_link_16 (
  input  wire clk,
  input  wire rst,
  input  wire tdi,
  input  wire sel,
  input  wire shift,
  input  wire capture,
  output wire tdo
);
  assign tdo = 1'd0;
endmodule
`default_nettype wire

`default_nettype none
module ddr3_if (
  input  wire clk,
  input  wire rst,
  output wire [13:0] addr,
  output wire [2:0] ba,
  output wire ras_n,
  output wire cas_n,
  output wire we_n,
  output wire reset_n,
  output wire cke,
  output wire odt,
  output wire ck_p,
  output wire ck_n,
  output wire [1:0] dm,
  inout  wire [15:0] dq,
  inout  wire [1:0] dqs_p,
  inout  wire [1:0] dqs_n,
  input  wire sys_clk,
  input  wire ref_clk,
  input  wire sys_rst,
  output wire ui_clk,
  output wire ui_rst,
  input  wire idle_clk,
  input  wire idle_rst
);
  assign ui_clk = idle_clk;
  assign ui_rst = (~idle_rst);
  assign addr = 14'd0;
  assign ba = 3'd0;
  assign ras_n = 1'd0;
  assign cas_n = 1'd0;
  assign we_n = 1'd0;
  assign reset_n = 1'd0;
  assign cke = 1'd0;
  assign odt = 1'd0;
  assign ck_p = 1'd0;
  assign ck_n = 1'd0;
  assign dm = 2'd0;
endmodule
`default_nettype wire

`default_nettype none
module uart_rxtx_100 (
  input  wire clk,
  input  wire rst,
  input  wire rxd,
  output wire txd,
  output wire [7:0] rx_data_v,
  output wire rx_data_err,
  output wire rx_valid,
  input  wire rx_ready,
  input  wire [7:0] tx_data,
  input  wire tx_valid,
  output wire tx_ready,
  output reg  [15:0] nerr
);
  reg  s0;
  reg  s1;
  reg  [6:0] ph;
  reg  [3:0] idx;
  reg  m0;
  reg  m1;
  reg  [7:0] rsh;
  reg  [7:0] hv;
  reg  herr;
  wire vote;
  wire deliver;
  wire bad;
  reg  [9:0] tsh;
  reg  [6:0] tcnt;
  reg  [3:0] tn;
  reg  [1:0] rxm_state;
  reg  hm_state;
  reg  txm_state;
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
  wire [6:0] _t13;
  wire _t14;
  wire _t15;
  wire _t16;
  wire [3:0] _t17;
  wire [3:0] _t18;
  wire _t19;
  wire _t20;
  wire [6:0] _t21;
  wire [6:0] _t22;
  wire _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire _t27;
  wire _t28;
  wire _t29;
  wire _t30;
  wire _t31;
  wire [1:0] _t32;
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
  wire [1:0] _t50;
  wire _t51;
  wire _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire [1:0] _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire _t62;
  wire _t63;
  wire [6:0] _t64;
  wire [7:0] _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire _t69;
  wire _t70;
  wire [7:0] _t71;
  wire _t72;
  wire _t73;
  wire [5:0] _t74;
  wire [7:0] _t75;
  wire _t76;
  wire _t77;
  wire _t78;
  wire _t79;
  wire [7:0] _t80;
  wire [1:0] _t81;
  wire _t82;
  wire [4:0] _t83;
  wire [7:0] _t84;
  wire _t85;
  wire _t86;
  wire _t87;
  wire _t88;
  wire [7:0] _t89;
  wire [2:0] _t90;
  wire _t91;
  wire [3:0] _t92;
  wire [7:0] _t93;
  wire _t94;
  wire _t95;
  wire _t96;
  wire _t97;
  wire [7:0] _t98;
  wire [3:0] _t99;
  wire _t100;
  wire [2:0] _t101;
  wire [7:0] _t102;
  wire _t103;
  wire _t104;
  wire _t105;
  wire _t106;
  wire [7:0] _t107;
  wire [4:0] _t108;
  wire _t109;
  wire [1:0] _t110;
  wire [7:0] _t111;
  wire _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire [7:0] _t116;
  wire [5:0] _t117;
  wire _t118;
  wire _t119;
  wire [7:0] _t120;
  wire _t121;
  wire _t122;
  wire _t123;
  wire _t124;
  wire [7:0] _t125;
  wire [6:0] _t126;
  wire [7:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire _t131;
  wire [1:0] _t132;
  wire _t133;
  wire _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire _t138;
  wire [15:0] _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire _t143;
  wire _t144;
  wire _t145;
  wire [7:0] _t146;
  wire _t147;
  wire _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [15:0] _t154;
  wire [15:0] _t155;
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
  wire [8:0] _t167;
  wire [9:0] _t168;
  wire _t169;
  wire _t170;
  wire [9:0] _t171;
  wire _t172;
  wire _t173;
  wire [7:0] _t174;
  wire [9:0] _t175;
  wire _t176;
  wire _t177;
  wire [9:0] _t178;
  wire [1:0] _t179;
  wire _t180;
  wire [6:0] _t181;
  wire [9:0] _t182;
  wire _t183;
  wire _t184;
  wire [9:0] _t185;
  wire [2:0] _t186;
  wire _t187;
  wire [5:0] _t188;
  wire [9:0] _t189;
  wire _t190;
  wire _t191;
  wire [9:0] _t192;
  wire [3:0] _t193;
  wire _t194;
  wire [4:0] _t195;
  wire [9:0] _t196;
  wire _t197;
  wire _t198;
  wire [9:0] _t199;
  wire [4:0] _t200;
  wire _t201;
  wire [3:0] _t202;
  wire [9:0] _t203;
  wire _t204;
  wire _t205;
  wire [9:0] _t206;
  wire [5:0] _t207;
  wire _t208;
  wire [2:0] _t209;
  wire [9:0] _t210;
  wire _t211;
  wire _t212;
  wire [9:0] _t213;
  wire [6:0] _t214;
  wire _t215;
  wire [1:0] _t216;
  wire [9:0] _t217;
  wire _t218;
  wire _t219;
  wire [9:0] _t220;
  wire [7:0] _t221;
  wire _t222;
  wire _t223;
  wire [9:0] _t224;
  wire _t225;
  wire _t226;
  wire [9:0] _t227;
  wire [8:0] _t228;
  wire [9:0] _t229;
  wire _t230;
  wire _t231;
  wire _t232;
  wire _t233;
  wire _t234;
  wire _t235;
  wire _t236;
  wire _t237;
  wire [6:0] _t238;
  wire _t239;
  wire _t240;
  wire _t241;
  wire [9:0] _t242;
  wire _t243;
  wire [8:0] _t244;
  wire [9:0] _t245;
  wire _t246;
  wire _t247;
  wire [9:0] _t248;
  wire _t249;
  wire _t250;
  wire [7:0] _t251;
  wire [9:0] _t252;
  wire _t253;
  wire _t254;
  wire [9:0] _t255;
  wire [1:0] _t256;
  wire _t257;
  wire [6:0] _t258;
  wire [9:0] _t259;
  wire _t260;
  wire _t261;
  wire [9:0] _t262;
  wire [2:0] _t263;
  wire _t264;
  wire [5:0] _t265;
  wire [9:0] _t266;
  wire _t267;
  wire _t268;
  wire [9:0] _t269;
  wire [3:0] _t270;
  wire _t271;
  wire [4:0] _t272;
  wire [9:0] _t273;
  wire _t274;
  wire _t275;
  wire [9:0] _t276;
  wire [4:0] _t277;
  wire _t278;
  wire [3:0] _t279;
  wire [9:0] _t280;
  wire _t281;
  wire _t282;
  wire [9:0] _t283;
  wire [5:0] _t284;
  wire _t285;
  wire [2:0] _t286;
  wire [9:0] _t287;
  wire _t288;
  wire _t289;
  wire [9:0] _t290;
  wire [6:0] _t291;
  wire _t292;
  wire [1:0] _t293;
  wire [9:0] _t294;
  wire _t295;
  wire _t296;
  wire [9:0] _t297;
  wire [7:0] _t298;
  wire _t299;
  wire _t300;
  wire [9:0] _t301;
  wire _t302;
  wire _t303;
  wire [9:0] _t304;
  wire [8:0] _t305;
  wire [9:0] _t306;
  wire _t307;
  wire _t308;
  wire [3:0] _t309;
  wire [3:0] _t310;
  wire _t311;
  wire _t312;
  wire _t313;
  wire _t314;
  wire _t315;
  wire _t316;
  wire _t317;
  wire [6:0] _t318;
  wire [6:0] _t319;
  wire _t320;
  wire _t321;
  wire _t322;
  wire [6:0] _t323;
  wire [3:0] _t324;
  wire [1:0] _t325;
  wire _t326;
  wire _t327;
  wire [7:0] _t328;
  wire [7:0] _t329;
  wire _t330;
  wire [15:0] _t331;
  wire _t332;
  wire [9:0] _t333;
  wire [3:0] _t334;
  wire [6:0] _t335;
  wire _t336;
  assign _t0 = (~s1);
  assign _t1 = ({30'b0, rxm_state} == 32'd0);
  assign _t2 = ((|_t1) && (|_t0));
  assign _t3 = ({30'b0, rxm_state} == 32'd0);
  assign _t4 = ((|_t3) && (|_t0));
  assign _t5 = ({30'b0, rxm_state} == 32'd0);
  assign _t6 = ((|_t5) && (|_t0));
  assign _t7 = (ph == 7'd44);
  assign _t8 = ({30'b0, rxm_state} == 32'd1);
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = (ph == 7'd50);
  assign _t11 = ({30'b0, rxm_state} == 32'd1);
  assign _t12 = ((|_t11) && (|_t10));
  assign _t13 = ((|_t2) ? 7'd1 : ph);
  assign _t14 = (ph == 7'd99);
  assign _t15 = ({30'b0, rxm_state} == 32'd1);
  assign _t16 = ((|_t15) && (|_t14));
  assign _t17 = ((|_t4) ? 4'd0 : idx);
  assign _t18 = (idx + 4'd1);
  assign _t19 = ({30'b0, rxm_state} == 32'd1);
  assign _t20 = ((|_t19) && (|_t14));
  assign _t21 = ((|_t16) ? 7'd0 : _t13);
  assign _t22 = (ph + 7'd1);
  assign _t23 = (~_t14);
  assign _t24 = ({30'b0, rxm_state} == 32'd1);
  assign _t25 = ((|_t24) && (|_t23));
  assign _t26 = ((|m1) && (|s1));
  assign _t27 = ((|m0) && (|s1));
  assign _t28 = ((|m0) && (|m1));
  assign _t29 = ((|_t28) || (|_t27));
  assign _t30 = ((|_t29) || (|_t26));
  assign _t31 = ({30'b0, rxm_state} == 32'd1);
  assign _t32 = ((|_t6) ? 32'd1 : rxm_state);
  assign _t33 = (idx == 4'd0);
  assign _t34 = (ph == 7'd56);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ((|_t35) && (|vote));
  assign _t37 = ({30'b0, rxm_state} == 32'd1);
  assign _t38 = ((|_t37) && (|_t36));
  assign _t39 = (idx == 4'd9);
  assign _t40 = (~_t33);
  assign _t41 = ((|_t34) && (|_t40));
  assign _t42 = ((|_t41) && (|_t39));
  assign _t43 = ({30'b0, rxm_state} == 32'd1);
  assign _t44 = ((|_t43) && (|_t42));
  assign _t45 = (~vote);
  assign _t46 = ((|_t34) && (|_t40));
  assign _t47 = ((|_t46) && (|_t39));
  assign _t48 = ({30'b0, rxm_state} == 32'd1);
  assign _t49 = ((|_t48) && (|_t47));
  assign _t50 = ((|_t38) ? 32'd0 : _t32);
  assign _t51 = ((|_t34) && (|_t40));
  assign _t52 = ((|_t51) && (|_t39));
  assign _t53 = ((|_t52) && (|vote));
  assign _t54 = ({30'b0, rxm_state} == 32'd1);
  assign _t55 = ((|_t54) && (|_t53));
  assign _t56 = ((|_t55) ? 32'd0 : _t50);
  assign _t57 = (~vote);
  assign _t58 = ((|_t34) && (|_t40));
  assign _t59 = ((|_t58) && (|_t39));
  assign _t60 = ((|_t59) && (|_t57));
  assign _t61 = ({30'b0, rxm_state} == 32'd1);
  assign _t62 = ((|_t61) && (|_t60));
  assign _t63 = rsh[1];
  assign _t64 = rsh[7:1];
  assign _t65 = {_t64, _t63};
  assign _t66 = (~_t39);
  assign _t67 = ((|_t34) && (|_t40));
  assign _t68 = ((|_t67) && (|_t66));
  assign _t69 = ({30'b0, rxm_state} == 32'd1);
  assign _t70 = ((|_t69) && (|_t68));
  assign _t71 = ((|_t70) ? _t65 : rsh);
  assign _t72 = _t71[0:0];
  assign _t73 = rsh[2];
  assign _t74 = _t71[7:2];
  assign _t75 = {_t74, _t73, _t72};
  assign _t76 = ((|_t34) && (|_t40));
  assign _t77 = ((|_t76) && (|_t66));
  assign _t78 = ({30'b0, rxm_state} == 32'd1);
  assign _t79 = ((|_t78) && (|_t77));
  assign _t80 = ((|_t79) ? _t75 : _t71);
  assign _t81 = _t80[1:0];
  assign _t82 = rsh[3];
  assign _t83 = _t80[7:3];
  assign _t84 = {_t83, _t82, _t81};
  assign _t85 = ((|_t34) && (|_t40));
  assign _t86 = ((|_t85) && (|_t66));
  assign _t87 = ({30'b0, rxm_state} == 32'd1);
  assign _t88 = ((|_t87) && (|_t86));
  assign _t89 = ((|_t88) ? _t84 : _t80);
  assign _t90 = _t89[2:0];
  assign _t91 = rsh[4];
  assign _t92 = _t89[7:4];
  assign _t93 = {_t92, _t91, _t90};
  assign _t94 = ((|_t34) && (|_t40));
  assign _t95 = ((|_t94) && (|_t66));
  assign _t96 = ({30'b0, rxm_state} == 32'd1);
  assign _t97 = ((|_t96) && (|_t95));
  assign _t98 = ((|_t97) ? _t93 : _t89);
  assign _t99 = _t98[3:0];
  assign _t100 = rsh[5];
  assign _t101 = _t98[7:5];
  assign _t102 = {_t101, _t100, _t99};
  assign _t103 = ((|_t34) && (|_t40));
  assign _t104 = ((|_t103) && (|_t66));
  assign _t105 = ({30'b0, rxm_state} == 32'd1);
  assign _t106 = ((|_t105) && (|_t104));
  assign _t107 = ((|_t106) ? _t102 : _t98);
  assign _t108 = _t107[4:0];
  assign _t109 = rsh[6];
  assign _t110 = _t107[7:6];
  assign _t111 = {_t110, _t109, _t108};
  assign _t112 = ((|_t34) && (|_t40));
  assign _t113 = ((|_t112) && (|_t66));
  assign _t114 = ({30'b0, rxm_state} == 32'd1);
  assign _t115 = ((|_t114) && (|_t113));
  assign _t116 = ((|_t115) ? _t111 : _t107);
  assign _t117 = _t116[5:0];
  assign _t118 = rsh[7];
  assign _t119 = _t116[7:7];
  assign _t120 = {_t119, _t118, _t117};
  assign _t121 = ((|_t34) && (|_t40));
  assign _t122 = ((|_t121) && (|_t66));
  assign _t123 = ({30'b0, rxm_state} == 32'd1);
  assign _t124 = ((|_t123) && (|_t122));
  assign _t125 = ((|_t124) ? _t120 : _t116);
  assign _t126 = _t125[6:0];
  assign _t127 = {vote, _t126};
  assign _t128 = ((|_t34) && (|_t40));
  assign _t129 = ((|_t128) && (|_t66));
  assign _t130 = ({30'b0, rxm_state} == 32'd1);
  assign _t131 = ((|_t130) && (|_t129));
  assign _t132 = ((|_t62) ? 32'd2 : _t56);
  assign _t133 = ({30'b0, rxm_state} == 32'd2);
  assign _t134 = ((|_t133) && (|s1));
  assign _t135 = ({31'b0, hm_state} == 32'd0);
  assign _t136 = ((|_t135) && (|deliver));
  assign _t137 = ({31'b0, hm_state} == 32'd0);
  assign _t138 = ((|_t137) && (|deliver));
  assign _t139 = (nerr + 16'd1);
  assign _t140 = ((|deliver) && (|bad));
  assign _t141 = ({31'b0, hm_state} == 32'd0);
  assign _t142 = ((|_t141) && (|_t140));
  assign _t143 = ({31'b0, hm_state} == 32'd0);
  assign _t144 = ((|_t143) && (|deliver));
  assign _t145 = ({31'b0, hm_state} == 32'd1);
  assign _t146 = ((|_t136) ? rsh : hv);
  assign _t147 = ({31'b0, hm_state} == 32'd1);
  assign _t148 = ((|_t147) && (|deliver));
  assign _t149 = (~rx_ready);
  assign _t150 = ((|_t138) ? bad : herr);
  assign _t151 = ((|bad) || (|_t149));
  assign _t152 = ({31'b0, hm_state} == 32'd1);
  assign _t153 = ((|_t152) && (|deliver));
  assign _t154 = ((|_t142) ? _t139 : nerr);
  assign _t155 = (nerr + 16'd1);
  assign _t156 = (~rx_ready);
  assign _t157 = ((|bad) || (|_t156));
  assign _t158 = ((|deliver) && (|_t157));
  assign _t159 = ({31'b0, hm_state} == 32'd1);
  assign _t160 = ((|_t159) && (|_t158));
  assign _t161 = ((|_t144) ? 32'd1 : hm_state);
  assign _t162 = (~deliver);
  assign _t163 = ((|_t162) && (|rx_ready));
  assign _t164 = ({31'b0, hm_state} == 32'd1);
  assign _t165 = ((|_t164) && (|_t163));
  assign _t166 = ({31'b0, txm_state} == 32'd0);
  assign _t167 = tsh[9:1];
  assign _t168 = {_t167, 1'd0};
  assign _t169 = ({31'b0, txm_state} == 32'd0);
  assign _t170 = ((|_t169) && (|tx_valid));
  assign _t171 = ((|_t170) ? _t168 : tsh);
  assign _t172 = _t171[0:0];
  assign _t173 = tx_data[0];
  assign _t174 = _t171[9:2];
  assign _t175 = {_t174, _t173, _t172};
  assign _t176 = ({31'b0, txm_state} == 32'd0);
  assign _t177 = ((|_t176) && (|tx_valid));
  assign _t178 = ((|_t177) ? _t175 : _t171);
  assign _t179 = _t178[1:0];
  assign _t180 = tx_data[1];
  assign _t181 = _t178[9:3];
  assign _t182 = {_t181, _t180, _t179};
  assign _t183 = ({31'b0, txm_state} == 32'd0);
  assign _t184 = ((|_t183) && (|tx_valid));
  assign _t185 = ((|_t184) ? _t182 : _t178);
  assign _t186 = _t185[2:0];
  assign _t187 = tx_data[2];
  assign _t188 = _t185[9:4];
  assign _t189 = {_t188, _t187, _t186};
  assign _t190 = ({31'b0, txm_state} == 32'd0);
  assign _t191 = ((|_t190) && (|tx_valid));
  assign _t192 = ((|_t191) ? _t189 : _t185);
  assign _t193 = _t192[3:0];
  assign _t194 = tx_data[3];
  assign _t195 = _t192[9:5];
  assign _t196 = {_t195, _t194, _t193};
  assign _t197 = ({31'b0, txm_state} == 32'd0);
  assign _t198 = ((|_t197) && (|tx_valid));
  assign _t199 = ((|_t198) ? _t196 : _t192);
  assign _t200 = _t199[4:0];
  assign _t201 = tx_data[4];
  assign _t202 = _t199[9:6];
  assign _t203 = {_t202, _t201, _t200};
  assign _t204 = ({31'b0, txm_state} == 32'd0);
  assign _t205 = ((|_t204) && (|tx_valid));
  assign _t206 = ((|_t205) ? _t203 : _t199);
  assign _t207 = _t206[5:0];
  assign _t208 = tx_data[5];
  assign _t209 = _t206[9:7];
  assign _t210 = {_t209, _t208, _t207};
  assign _t211 = ({31'b0, txm_state} == 32'd0);
  assign _t212 = ((|_t211) && (|tx_valid));
  assign _t213 = ((|_t212) ? _t210 : _t206);
  assign _t214 = _t213[6:0];
  assign _t215 = tx_data[6];
  assign _t216 = _t213[9:8];
  assign _t217 = {_t216, _t215, _t214};
  assign _t218 = ({31'b0, txm_state} == 32'd0);
  assign _t219 = ((|_t218) && (|tx_valid));
  assign _t220 = ((|_t219) ? _t217 : _t213);
  assign _t221 = _t220[7:0];
  assign _t222 = tx_data[7];
  assign _t223 = _t220[9:9];
  assign _t224 = {_t223, _t222, _t221};
  assign _t225 = ({31'b0, txm_state} == 32'd0);
  assign _t226 = ((|_t225) && (|tx_valid));
  assign _t227 = ((|_t226) ? _t224 : _t220);
  assign _t228 = _t227[8:0];
  assign _t229 = {1'd1, _t228};
  assign _t230 = ({31'b0, txm_state} == 32'd0);
  assign _t231 = ((|_t230) && (|tx_valid));
  assign _t232 = ({31'b0, txm_state} == 32'd0);
  assign _t233 = ((|_t232) && (|tx_valid));
  assign _t234 = ({31'b0, txm_state} == 32'd0);
  assign _t235 = ((|_t234) && (|tx_valid));
  assign _t236 = ({31'b0, txm_state} == 32'd0);
  assign _t237 = ((|_t236) && (|tx_valid));
  assign _t238 = ((|_t235) ? 7'd99 : tcnt);
  assign _t239 = (tcnt == 7'd0);
  assign _t240 = ({31'b0, txm_state} == 32'd1);
  assign _t241 = ((|_t240) && (|_t239));
  assign _t242 = ((|_t231) ? _t229 : _t227);
  assign _t243 = tsh[1];
  assign _t244 = _t242[9:1];
  assign _t245 = {_t244, _t243};
  assign _t246 = ({31'b0, txm_state} == 32'd1);
  assign _t247 = ((|_t246) && (|_t239));
  assign _t248 = ((|_t247) ? _t245 : _t242);
  assign _t249 = _t248[0:0];
  assign _t250 = tsh[2];
  assign _t251 = _t248[9:2];
  assign _t252 = {_t251, _t250, _t249};
  assign _t253 = ({31'b0, txm_state} == 32'd1);
  assign _t254 = ((|_t253) && (|_t239));
  assign _t255 = ((|_t254) ? _t252 : _t248);
  assign _t256 = _t255[1:0];
  assign _t257 = tsh[3];
  assign _t258 = _t255[9:3];
  assign _t259 = {_t258, _t257, _t256};
  assign _t260 = ({31'b0, txm_state} == 32'd1);
  assign _t261 = ((|_t260) && (|_t239));
  assign _t262 = ((|_t261) ? _t259 : _t255);
  assign _t263 = _t262[2:0];
  assign _t264 = tsh[4];
  assign _t265 = _t262[9:4];
  assign _t266 = {_t265, _t264, _t263};
  assign _t267 = ({31'b0, txm_state} == 32'd1);
  assign _t268 = ((|_t267) && (|_t239));
  assign _t269 = ((|_t268) ? _t266 : _t262);
  assign _t270 = _t269[3:0];
  assign _t271 = tsh[5];
  assign _t272 = _t269[9:5];
  assign _t273 = {_t272, _t271, _t270};
  assign _t274 = ({31'b0, txm_state} == 32'd1);
  assign _t275 = ((|_t274) && (|_t239));
  assign _t276 = ((|_t275) ? _t273 : _t269);
  assign _t277 = _t276[4:0];
  assign _t278 = tsh[6];
  assign _t279 = _t276[9:6];
  assign _t280 = {_t279, _t278, _t277};
  assign _t281 = ({31'b0, txm_state} == 32'd1);
  assign _t282 = ((|_t281) && (|_t239));
  assign _t283 = ((|_t282) ? _t280 : _t276);
  assign _t284 = _t283[5:0];
  assign _t285 = tsh[7];
  assign _t286 = _t283[9:7];
  assign _t287 = {_t286, _t285, _t284};
  assign _t288 = ({31'b0, txm_state} == 32'd1);
  assign _t289 = ((|_t288) && (|_t239));
  assign _t290 = ((|_t289) ? _t287 : _t283);
  assign _t291 = _t290[6:0];
  assign _t292 = tsh[8];
  assign _t293 = _t290[9:8];
  assign _t294 = {_t293, _t292, _t291};
  assign _t295 = ({31'b0, txm_state} == 32'd1);
  assign _t296 = ((|_t295) && (|_t239));
  assign _t297 = ((|_t296) ? _t294 : _t290);
  assign _t298 = _t297[7:0];
  assign _t299 = tsh[9];
  assign _t300 = _t297[9:9];
  assign _t301 = {_t300, _t299, _t298};
  assign _t302 = ({31'b0, txm_state} == 32'd1);
  assign _t303 = ((|_t302) && (|_t239));
  assign _t304 = ((|_t303) ? _t301 : _t297);
  assign _t305 = _t304[8:0];
  assign _t306 = {1'd1, _t305};
  assign _t307 = ({31'b0, txm_state} == 32'd1);
  assign _t308 = ((|_t307) && (|_t239));
  assign _t309 = ((|_t233) ? 4'd10 : tn);
  assign _t310 = (tn - 4'd1);
  assign _t311 = ({31'b0, txm_state} == 32'd1);
  assign _t312 = ((|_t311) && (|_t239));
  assign _t313 = ((|_t237) ? 32'd1 : txm_state);
  assign _t314 = (tn == 4'd1);
  assign _t315 = ((|_t239) && (|_t314));
  assign _t316 = ({31'b0, txm_state} == 32'd1);
  assign _t317 = ((|_t316) && (|_t315));
  assign _t318 = ((|_t241) ? 7'd99 : _t238);
  assign _t319 = (tcnt - 7'd1);
  assign _t320 = (~_t239);
  assign _t321 = ({31'b0, txm_state} == 32'd1);
  assign _t322 = ((|_t321) && (|_t320));
  assign _t323 = ((|_t25) ? _t22 : _t21);
  assign _t324 = ((|_t20) ? _t18 : _t17);
  assign _t325 = ((|_t134) ? 32'd0 : _t132);
  assign _t326 = ((|_t9) ? s1 : m0);
  assign _t327 = ((|_t12) ? s1 : m1);
  assign vote = ((|_t31) ? _t30 : 1'd0);
  assign deliver = ((|_t44) ? 1'd1 : 1'd0);
  assign bad = ((|_t49) ? _t45 : 1'd0);
  assign _t328 = ((|_t131) ? _t127 : _t125);
  assign _t329 = ((|_t148) ? rsh : _t146);
  assign _t330 = ((|_t153) ? _t151 : _t150);
  assign _t331 = ((|_t160) ? _t155 : _t154);
  assign _t332 = ((|_t165) ? 32'd0 : _t161);
  assign rx_valid = ((|_t145) ? 1'd1 : 1'd0);
  assign rx_data_v = hv;
  assign rx_data_err = herr;
  assign tx_ready = ((|_t166) ? 1'd1 : 1'd0);
  assign _t333 = ((|_t308) ? _t306 : _t304);
  assign _t334 = ((|_t312) ? _t310 : _t309);
  assign _t335 = ((|_t322) ? _t319 : _t318);
  assign _t336 = ((|_t317) ? 32'd0 : _t313);
  assign txd = tsh[0];
  always @(posedge clk) begin
    if (rst) begin
      s0 <= 1'd1;
      s1 <= 1'd1;
      ph <= 7'd0;
      idx <= 4'd0;
      m0 <= 1'd1;
      m1 <= 1'd1;
      rsh <= 8'd0;
      hv <= 8'd0;
      herr <= 1'd0;
      nerr <= 16'd0;
      tsh <= 10'd1023;
      tcnt <= 7'd0;
      tn <= 4'd0;
      rxm_state <= 2'd0;
      hm_state <= 1'd0;
      txm_state <= 1'd0;
    end else begin
      s0 <= rxd;
      s1 <= s0;
      ph <= _t323;
      idx <= _t324;
      m0 <= _t326;
      m1 <= _t327;
      rsh <= _t328;
      hv <= _t329;
      herr <= _t330;
      nerr <= _t331;
      tsh <= _t333;
      tcnt <= _t335;
      tn <= _t334;
      rxm_state <= _t325;
      hm_state <= _t332;
      txm_state <= _t336;
    end
  end
endmodule
`default_nettype wire

`default_nettype none
module crc32_bit (
  input  wire clk,
  input  wire rst,
  input  wire [31:0] c,
  input  wire b,
  output wire [31:0] n
);
  wire fb;
  wire _t0;
  wire _t1;
  wire [30:0] _t2;
  wire [31:0] _t3;
  wire _t4;
  wire _t5;
  wire [29:0] _t6;
  wire [31:0] _t7;
  wire [1:0] _t8;
  wire _t9;
  wire [28:0] _t10;
  wire [31:0] _t11;
  wire [2:0] _t12;
  wire _t13;
  wire [27:0] _t14;
  wire [31:0] _t15;
  wire [3:0] _t16;
  wire _t17;
  wire [26:0] _t18;
  wire _t19;
  wire [31:0] _t20;
  wire [4:0] _t21;
  wire _t22;
  wire [25:0] _t23;
  wire [31:0] _t24;
  wire [5:0] _t25;
  wire _t26;
  wire [24:0] _t27;
  wire [31:0] _t28;
  wire [6:0] _t29;
  wire _t30;
  wire [23:0] _t31;
  wire _t32;
  wire [31:0] _t33;
  wire [7:0] _t34;
  wire _t35;
  wire [22:0] _t36;
  wire _t37;
  wire [31:0] _t38;
  wire [8:0] _t39;
  wire _t40;
  wire [21:0] _t41;
  wire [31:0] _t42;
  wire [9:0] _t43;
  wire _t44;
  wire [20:0] _t45;
  wire [31:0] _t46;
  wire [10:0] _t47;
  wire _t48;
  wire [19:0] _t49;
  wire [31:0] _t50;
  wire [11:0] _t51;
  wire _t52;
  wire [18:0] _t53;
  wire [31:0] _t54;
  wire [12:0] _t55;
  wire _t56;
  wire [17:0] _t57;
  wire [31:0] _t58;
  wire [13:0] _t59;
  wire _t60;
  wire [16:0] _t61;
  wire _t62;
  wire [31:0] _t63;
  wire [14:0] _t64;
  wire _t65;
  wire [15:0] _t66;
  wire [31:0] _t67;
  wire [15:0] _t68;
  wire _t69;
  wire [14:0] _t70;
  wire [31:0] _t71;
  wire [16:0] _t72;
  wire _t73;
  wire [13:0] _t74;
  wire [31:0] _t75;
  wire [17:0] _t76;
  wire _t77;
  wire [12:0] _t78;
  wire _t79;
  wire [31:0] _t80;
  wire [18:0] _t81;
  wire _t82;
  wire [11:0] _t83;
  wire _t84;
  wire [31:0] _t85;
  wire [19:0] _t86;
  wire _t87;
  wire [10:0] _t88;
  wire _t89;
  wire [31:0] _t90;
  wire [20:0] _t91;
  wire _t92;
  wire [9:0] _t93;
  wire [31:0] _t94;
  wire [21:0] _t95;
  wire _t96;
  wire [8:0] _t97;
  wire _t98;
  wire [31:0] _t99;
  wire [22:0] _t100;
  wire _t101;
  wire [7:0] _t102;
  wire _t103;
  wire [31:0] _t104;
  wire [23:0] _t105;
  wire _t106;
  wire [6:0] _t107;
  wire [31:0] _t108;
  wire [24:0] _t109;
  wire _t110;
  wire [5:0] _t111;
  wire _t112;
  wire [31:0] _t113;
  wire [25:0] _t114;
  wire _t115;
  wire [4:0] _t116;
  wire _t117;
  wire [31:0] _t118;
  wire [26:0] _t119;
  wire _t120;
  wire [3:0] _t121;
  wire [31:0] _t122;
  wire [27:0] _t123;
  wire _t124;
  wire [2:0] _t125;
  wire _t126;
  wire [31:0] _t127;
  wire [28:0] _t128;
  wire _t129;
  wire [1:0] _t130;
  wire _t131;
  wire [31:0] _t132;
  wire [29:0] _t133;
  wire _t134;
  wire _t135;
  wire [31:0] _t136;
  wire [30:0] _t137;
  assign _t0 = c[0];
  assign _t1 = c[1];
  assign _t2 = 31'd0;
  assign _t3 = {_t2, _t1};
  assign _t4 = _t3[0:0];
  assign _t5 = c[2];
  assign _t6 = _t3[31:2];
  assign _t7 = {_t6, _t5, _t4};
  assign _t8 = _t7[1:0];
  assign _t9 = c[3];
  assign _t10 = _t7[31:3];
  assign _t11 = {_t10, _t9, _t8};
  assign _t12 = _t11[2:0];
  assign _t13 = c[4];
  assign _t14 = _t11[31:4];
  assign _t15 = {_t14, _t13, _t12};
  assign _t16 = _t15[3:0];
  assign _t17 = c[5];
  assign _t18 = _t15[31:5];
  assign _t19 = c[6];
  assign _t20 = {_t18, _t17, _t16};
  assign _t21 = _t20[4:0];
  assign _t22 = (_t19 ^ fb);
  assign _t23 = _t20[31:6];
  assign _t24 = {_t23, _t22, _t21};
  assign _t25 = _t24[5:0];
  assign _t26 = c[7];
  assign _t27 = _t24[31:7];
  assign _t28 = {_t27, _t26, _t25};
  assign _t29 = _t28[6:0];
  assign _t30 = c[8];
  assign _t31 = _t28[31:8];
  assign _t32 = c[9];
  assign _t33 = {_t31, _t30, _t29};
  assign _t34 = _t33[7:0];
  assign _t35 = (_t32 ^ fb);
  assign _t36 = _t33[31:9];
  assign _t37 = c[10];
  assign _t38 = {_t36, _t35, _t34};
  assign _t39 = _t38[8:0];
  assign _t40 = (_t37 ^ fb);
  assign _t41 = _t38[31:10];
  assign _t42 = {_t41, _t40, _t39};
  assign _t43 = _t42[9:0];
  assign _t44 = c[11];
  assign _t45 = _t42[31:11];
  assign _t46 = {_t45, _t44, _t43};
  assign _t47 = _t46[10:0];
  assign _t48 = c[12];
  assign _t49 = _t46[31:12];
  assign _t50 = {_t49, _t48, _t47};
  assign _t51 = _t50[11:0];
  assign _t52 = c[13];
  assign _t53 = _t50[31:13];
  assign _t54 = {_t53, _t52, _t51};
  assign _t55 = _t54[12:0];
  assign _t56 = c[14];
  assign _t57 = _t54[31:14];
  assign _t58 = {_t57, _t56, _t55};
  assign _t59 = _t58[13:0];
  assign _t60 = c[15];
  assign _t61 = _t58[31:15];
  assign _t62 = c[16];
  assign _t63 = {_t61, _t60, _t59};
  assign _t64 = _t63[14:0];
  assign _t65 = (_t62 ^ fb);
  assign _t66 = _t63[31:16];
  assign _t67 = {_t66, _t65, _t64};
  assign _t68 = _t67[15:0];
  assign _t69 = c[17];
  assign _t70 = _t67[31:17];
  assign _t71 = {_t70, _t69, _t68};
  assign _t72 = _t71[16:0];
  assign _t73 = c[18];
  assign _t74 = _t71[31:18];
  assign _t75 = {_t74, _t73, _t72};
  assign _t76 = _t75[17:0];
  assign _t77 = c[19];
  assign _t78 = _t75[31:19];
  assign _t79 = c[20];
  assign _t80 = {_t78, _t77, _t76};
  assign _t81 = _t80[18:0];
  assign _t82 = (_t79 ^ fb);
  assign _t83 = _t80[31:20];
  assign _t84 = c[21];
  assign _t85 = {_t83, _t82, _t81};
  assign _t86 = _t85[19:0];
  assign _t87 = (_t84 ^ fb);
  assign _t88 = _t85[31:21];
  assign _t89 = c[22];
  assign _t90 = {_t88, _t87, _t86};
  assign _t91 = _t90[20:0];
  assign _t92 = (_t89 ^ fb);
  assign _t93 = _t90[31:22];
  assign _t94 = {_t93, _t92, _t91};
  assign _t95 = _t94[21:0];
  assign _t96 = c[23];
  assign _t97 = _t94[31:23];
  assign _t98 = c[24];
  assign _t99 = {_t97, _t96, _t95};
  assign _t100 = _t99[22:0];
  assign _t101 = (_t98 ^ fb);
  assign _t102 = _t99[31:24];
  assign _t103 = c[25];
  assign _t104 = {_t102, _t101, _t100};
  assign _t105 = _t104[23:0];
  assign _t106 = (_t103 ^ fb);
  assign _t107 = _t104[31:25];
  assign _t108 = {_t107, _t106, _t105};
  assign _t109 = _t108[24:0];
  assign _t110 = c[26];
  assign _t111 = _t108[31:26];
  assign _t112 = c[27];
  assign _t113 = {_t111, _t110, _t109};
  assign _t114 = _t113[25:0];
  assign _t115 = (_t112 ^ fb);
  assign _t116 = _t113[31:27];
  assign _t117 = c[28];
  assign _t118 = {_t116, _t115, _t114};
  assign _t119 = _t118[26:0];
  assign _t120 = (_t117 ^ fb);
  assign _t121 = _t118[31:28];
  assign _t122 = {_t121, _t120, _t119};
  assign _t123 = _t122[27:0];
  assign _t124 = c[29];
  assign _t125 = _t122[31:29];
  assign _t126 = c[30];
  assign _t127 = {_t125, _t124, _t123};
  assign _t128 = _t127[28:0];
  assign _t129 = (_t126 ^ fb);
  assign _t130 = _t127[31:30];
  assign _t131 = c[31];
  assign _t132 = {_t130, _t129, _t128};
  assign _t133 = _t132[29:0];
  assign _t134 = (_t131 ^ fb);
  assign _t135 = _t132[31:31];
  assign _t136 = {_t135, _t134, _t133};
  assign _t137 = _t136[30:0];
  assign fb = (_t0 ^ b);
  assign n = {fb, _t137};
endmodule
`default_nettype wire

`default_nettype none
module crc32_nibble (
  input  wire clk,
  input  wire rst,
  input  wire [31:0] c,
  input  wire [3:0] d,
  output wire [31:0] s4
);
  wire [31:0] s1;
  wire [31:0] s2;
  wire [31:0] s3;
  wire _t0;
  wire _t1;
  wire _t2;
  wire _t3;
  wire [31:0] b0_n;
  wire [31:0] b1_n;
  wire [31:0] b2_n;
  wire [31:0] b3_n;
  assign _t0 = d[0];
  assign _t1 = d[1];
  assign _t2 = d[2];
  assign _t3 = d[3];
  assign s1 = b0_n;
  assign s2 = b1_n;
  assign s3 = b2_n;
  assign s4 = b3_n;
  crc32_bit b0 (
    .clk(clk),
    .rst(rst),
    .c(c),
    .b(_t0),
    .n(b0_n)
  );
  crc32_bit b1 (
    .clk(clk),
    .rst(rst),
    .c(s1),
    .b(_t1),
    .n(b1_n)
  );
  crc32_bit b2 (
    .clk(clk),
    .rst(rst),
    .c(s2),
    .b(_t2),
    .n(b2_n)
  );
  crc32_bit b3 (
    .clk(clk),
    .rst(rst),
    .c(s3),
    .b(_t3),
    .n(b3_n)
  );
endmodule
`default_nettype wire

`default_nettype none
module mii_rx_2048 (
  input  wire clk,
  input  wire rst,
  input  wire rx_dv,
  input  wire [3:0] rxd,
  input  wire rx_er,
  output wire [7:0] rx_data,
  output wire rx_last,
  output wire rx_valid,
  input  wire rx_ready,
  output reg  [15:0] ngood,
  output reg  [15:0] nbad
);
  reg  dv;
  reg  [3:0] d;
  reg  er;
  reg  [3:0] lo;
  reg  [31:0] crc;
  reg  [2:0] nb;
  reg  bad;
  reg  [7:0] old;
  wire [7:0] l8_byte;
  wire ben;
  wire wr;
  wire wlast;
  wire commit;
  wire rewind;
  wire full;
  wire [31:0] crcn;
  reg  [2:0] rxm2_state;
  reg  [7:0] old_m1;
  reg  [7:0] old_m2;
  reg  [7:0] old_m3;
  reg  [7:0] old_m4;
  wire [3:0] _t0;
  wire [7:0] _t1;
  wire [3:0] _t2;
  wire _t3;
  wire _t4;
  wire _t5;
  wire _t6;
  wire _t7;
  wire _t8;
  wire _t9;
  wire [2:0] _t10;
  wire _t11;
  wire _t12;
  wire _t13;
  wire [2:0] _t14;
  wire _t15;
  wire _t16;
  wire _t17;
  wire _t18;
  wire _t19;
  wire [2:0] _t20;
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
  wire [15:0] _t44;
  wire _t45;
  wire _t46;
  wire _t47;
  wire _t48;
  wire _t49;
  wire _t50;
  wire _t51;
  wire [15:0] _t52;
  wire _t53;
  wire _t54;
  wire _t55;
  wire [2:0] _t56;
  wire _t57;
  wire _t58;
  wire _t59;
  wire _t60;
  wire _t61;
  wire [31:0] _t62;
  wire _t63;
  wire _t64;
  wire _t65;
  wire _t66;
  wire _t67;
  wire _t68;
  wire [2:0] _t69;
  wire _t70;
  wire _t71;
  wire _t72;
  wire _t73;
  wire _t74;
  wire _t75;
  wire [15:0] _t76;
  wire [15:0] _t77;
  wire _t78;
  wire _t79;
  wire [2:0] _t80;
  wire _t81;
  wire _t82;
  wire _t83;
  wire _t84;
  wire _t85;
  wire [31:0] _t86;
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
  wire [2:0] _t103;
  wire [2:0] _t104;
  wire _t105;
  wire _t106;
  wire _t107;
  wire _t108;
  wire [2:0] _t109;
  wire _t110;
  wire _t111;
  wire [2:0] _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire [31:0] _t116;
  wire [2:0] _t117;
  wire _t118;
  wire [2:0] _t119;
  wire [15:0] _t120;
  wire [15:0] _t121;
  wire [3:0] _t122;
  wire [7:0] _t123;
  wire [7:0] _t124;
  wire [7:0] _t125;
  wire [7:0] _t126;
  wire [7:0] _t127;
  wire [31:0] cn_s4;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  assign _t0 = 4'd0;
  assign _t1 = {_t0, lo};
  assign _t2 = _t1[3:0];
  assign _t3 = ({29'b0, rxm2_state} == 32'd0);
  assign _t4 = ({29'b0, rxm2_state} == 32'd0);
  assign _t5 = ({29'b0, rxm2_state} == 32'd0);
  assign _t6 = (d == 4'd5);
  assign _t7 = ((|dv) && (|_t6));
  assign _t8 = ({29'b0, rxm2_state} == 32'd0);
  assign _t9 = ((|_t8) && (|_t7));
  assign _t10 = ((|_t9) ? 32'd1 : rxm2_state);
  assign _t11 = (~dv);
  assign _t12 = ({29'b0, rxm2_state} == 32'd1);
  assign _t13 = ((|_t12) && (|_t11));
  assign _t14 = ((|_t13) ? 32'd0 : _t10);
  assign _t15 = (d == 4'd13);
  assign _t16 = (~_t11);
  assign _t17 = ((|_t16) && (|_t15));
  assign _t18 = ({29'b0, rxm2_state} == 32'd1);
  assign _t19 = ((|_t18) && (|_t17));
  assign _t20 = ((|_t19) ? 32'd2 : _t14);
  assign _t21 = (d != 4'd5);
  assign _t22 = (~_t15);
  assign _t23 = ((|_t16) && (|_t22));
  assign _t24 = ((|_t23) && (|_t21));
  assign _t25 = ({29'b0, rxm2_state} == 32'd1);
  assign _t26 = ((|_t25) && (|_t24));
  assign _t27 = (~full);
  assign _t28 = (nb == 3'd5);
  assign _t29 = (~bad);
  assign _t30 = (crc == 32'd3736805603);
  assign _t31 = ((|_t30) && (|_t29));
  assign _t32 = ((|_t31) && (|_t28));
  assign _t33 = ((|_t32) && (|_t27));
  assign _t34 = (~dv);
  assign _t35 = ((|_t34) && (|_t33));
  assign _t36 = ({29'b0, rxm2_state} == 32'd2);
  assign _t37 = ((|_t36) && (|_t35));
  assign _t38 = ((|_t34) && (|_t33));
  assign _t39 = ({29'b0, rxm2_state} == 32'd2);
  assign _t40 = ((|_t39) && (|_t38));
  assign _t41 = ((|_t34) && (|_t33));
  assign _t42 = ({29'b0, rxm2_state} == 32'd2);
  assign _t43 = ((|_t42) && (|_t41));
  assign _t44 = (ngood + 16'd1);
  assign _t45 = ((|_t34) && (|_t33));
  assign _t46 = ({29'b0, rxm2_state} == 32'd2);
  assign _t47 = ((|_t46) && (|_t45));
  assign _t48 = (~_t33);
  assign _t49 = ((|_t34) && (|_t48));
  assign _t50 = ({29'b0, rxm2_state} == 32'd2);
  assign _t51 = ((|_t50) && (|_t49));
  assign _t52 = (nbad + 16'd1);
  assign _t53 = ((|_t34) && (|_t48));
  assign _t54 = ({29'b0, rxm2_state} == 32'd2);
  assign _t55 = ((|_t54) && (|_t53));
  assign _t56 = ((|_t26) ? 32'd4 : _t20);
  assign _t57 = ({29'b0, rxm2_state} == 32'd2);
  assign _t58 = ((|_t57) && (|_t34));
  assign _t59 = (~_t34);
  assign _t60 = ({29'b0, rxm2_state} == 32'd2);
  assign _t61 = ((|_t60) && (|_t59));
  assign _t62 = ((|_t3) ? 32'd4294967295 : crc);
  assign _t63 = ({29'b0, rxm2_state} == 32'd2);
  assign _t64 = ((|_t63) && (|_t59));
  assign _t65 = ((|_t5) ? 1'd0 : bad);
  assign _t66 = ((|_t59) && (|er));
  assign _t67 = ({29'b0, rxm2_state} == 32'd2);
  assign _t68 = ((|_t67) && (|_t66));
  assign _t69 = ((|_t58) ? 32'd0 : _t56);
  assign _t70 = ({29'b0, rxm2_state} == 32'd2);
  assign _t71 = ((|_t70) && (|_t59));
  assign _t72 = ((|_t51) ? 1'd1 : 1'd0);
  assign _t73 = (~dv);
  assign _t74 = ({29'b0, rxm2_state} == 32'd3);
  assign _t75 = ((|_t74) && (|_t73));
  assign _t76 = ((|_t55) ? _t52 : nbad);
  assign _t77 = (nbad + 16'd1);
  assign _t78 = ({29'b0, rxm2_state} == 32'd3);
  assign _t79 = ((|_t78) && (|_t73));
  assign _t80 = ((|_t71) ? 32'd3 : _t69);
  assign _t81 = ({29'b0, rxm2_state} == 32'd3);
  assign _t82 = ((|_t81) && (|_t73));
  assign _t83 = (~_t73);
  assign _t84 = ({29'b0, rxm2_state} == 32'd3);
  assign _t85 = ((|_t84) && (|_t83));
  assign _t86 = ((|_t64) ? crcn : _t62);
  assign _t87 = ({29'b0, rxm2_state} == 32'd3);
  assign _t88 = ((|_t87) && (|_t83));
  assign _t89 = ((|_t68) ? 1'd1 : _t65);
  assign _t90 = ((|_t83) && (|er));
  assign _t91 = ({29'b0, rxm2_state} == 32'd3);
  assign _t92 = ((|_t91) && (|_t90));
  assign _t93 = ((|_t37) ? 1'd1 : 1'd0);
  assign _t94 = (nb == 3'd5);
  assign _t95 = ((|_t83) && (|_t94));
  assign _t96 = ({29'b0, rxm2_state} == 32'd3);
  assign _t97 = ((|_t96) && (|_t95));
  assign _t98 = ((|_t92) ? 1'd1 : _t89);
  assign _t99 = ((|_t83) && (|_t94));
  assign _t100 = ((|_t99) && (|full));
  assign _t101 = ({29'b0, rxm2_state} == 32'd3);
  assign _t102 = ((|_t101) && (|_t100));
  assign _t103 = ((|_t4) ? 3'd0 : nb);
  assign _t104 = (nb + 3'd1);
  assign _t105 = (~_t94);
  assign _t106 = ((|_t83) && (|_t105));
  assign _t107 = ({29'b0, rxm2_state} == 32'd3);
  assign _t108 = ((|_t107) && (|_t106));
  assign _t109 = ((|_t82) ? 32'd0 : _t80);
  assign _t110 = ({29'b0, rxm2_state} == 32'd3);
  assign _t111 = ((|_t110) && (|_t83));
  assign _t112 = ((|_t111) ? 32'd2 : _t109);
  assign _t113 = (~dv);
  assign _t114 = ({29'b0, rxm2_state} == 32'd4);
  assign _t115 = ((|_t114) && (|_t113));
  assign crcn = cn_s4;
  assign l8_byte = {d, _t2};
  assign _t116 = ((|_t88) ? crcn : _t86);
  assign _t117 = ((|_t108) ? _t104 : _t103);
  assign _t118 = ((|_t102) ? 1'd1 : _t98);
  assign _t119 = ((|_t115) ? 32'd0 : _t112);
  assign wr = ((|_t97) ? 1'd1 : _t93);
  assign wlast = ((|_t40) ? 1'd1 : 1'd0);
  assign commit = ((|_t43) ? 1'd1 : 1'd0);
  assign _t120 = ((|_t47) ? _t44 : ngood);
  assign rewind = ((|_t75) ? 1'd1 : _t72);
  assign _t121 = ((|_t79) ? _t77 : _t76);
  assign _t122 = ((|_t61) ? d : lo);
  assign ben = ((|_t85) ? 1'd1 : 1'd0);
  assign _t123 = ((|ben) ? old_m1 : old);
  assign _t124 = ((|ben) ? old_m2 : old_m1);
  assign _t125 = ((|ben) ? old_m3 : old_m2);
  assign _t126 = ((|ben) ? old_m4 : old_m3);
  assign _t127 = ((|ben) ? l8_byte : old_m4);
  assign rx_data = q_dst_data;
  assign rx_last = q_dst_last;
  assign rx_valid = q_dst_valid;
  assign full = q_full;
  always @(posedge clk) begin
    if (rst) begin
      dv <= 1'd0;
      d <= 4'd0;
      er <= 1'd0;
      lo <= 4'd0;
      crc <= 32'd0;
      nb <= 3'd0;
      bad <= 1'd0;
      old <= 8'd0;
      ngood <= 16'd0;
      nbad <= 16'd0;
      rxm2_state <= 3'd0;
      old_m1 <= 8'd0;
      old_m2 <= 8'd0;
      old_m3 <= 8'd0;
      old_m4 <= 8'd0;
    end else begin
      dv <= rx_dv;
      d <= rxd;
      er <= rx_er;
      lo <= _t122;
      crc <= _t116;
      nb <= _t117;
      bad <= _t118;
      old <= _t123;
      ngood <= _t120;
      nbad <= _t121;
      rxm2_state <= _t119;
      old_m1 <= _t124;
      old_m2 <= _t125;
      old_m3 <= _t126;
      old_m4 <= _t127;
    end
  end
  crc32_nibble cn (
    .clk(clk),
    .rst(rst),
    .c(crc),
    .d(d),
    .s4(cn_s4)
  );
  pktfifo_8_2048_1 q (
    .clk(clk),
    .rst(rst),
    .wr(wr),
    .wdata(old),
    .wlast(wlast),
    .commit(commit),
    .rewind(rewind),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(rx_ready),
    .full(q_full),
    .tight(q_tight)
  );
endmodule
`default_nettype wire

`default_nettype none
module mii_tx_2048 (
  input  wire clk,
  input  wire rst,
  output wire tx_en,
  output wire [3:0] txd,
  input  wire [7:0] tx_data,
  input  wire tx_last,
  input  wire tx_valid,
  output wire tx_ready,
  output reg  [15:0] nsent
);
  reg  en;
  reg  [3:0] dq;
  reg  [31:0] crc;
  reg  [4:0] pn;
  reg  [10:0] bc;
  reg  ph;
  reg  [3:0] fk;
  reg  [4:0] gc;
  wire [3:0] cin;
  wire [31:0] crcn;
  wire [31:0] fcs;
  wire full;
  wire w;
  wire c;
  wire zero;
  wire [7:0] f_data;
  wire f_last;
  wire f_valid;
  wire f_ready;
  reg  jam;
  wire rw;
  reg  [2:0] txm2_state;
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
  wire [3:0] _t23;
  wire _t24;
  wire _t25;
  wire _t26;
  wire [2:0] _t27;
  wire _t28;
  wire _t29;
  wire [3:0] _t30;
  wire _t31;
  wire _t32;
  wire _t33;
  wire [4:0] _t34;
  wire [4:0] _t35;
  wire _t36;
  wire _t37;
  wire [3:0] _t38;
  wire [3:0] _t39;
  wire _t40;
  wire [3:0] _t41;
  wire _t42;
  wire [31:0] _t43;
  wire _t44;
  wire [2:0] _t45;
  wire _t46;
  wire [3:0] _t47;
  wire [3:0] _t48;
  wire _t49;
  wire [3:0] _t50;
  wire [3:0] _t51;
  wire _t52;
  wire [31:0] _t53;
  wire _t54;
  wire _t55;
  wire [10:0] _t56;
  wire [10:0] _t57;
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
  wire [2:0] _t69;
  wire _t70;
  wire _t71;
  wire _t72;
  wire [3:0] _t73;
  wire _t74;
  wire [3:0] _t75;
  wire _t76;
  wire [31:0] _t77;
  wire _t78;
  wire _t79;
  wire _t80;
  wire _t81;
  wire [10:0] _t82;
  wire [10:0] _t83;
  wire _t84;
  wire _t85;
  wire [2:0] _t86;
  wire _t87;
  wire _t88;
  wire _t89;
  wire _t90;
  wire [3:0] _t91;
  wire [3:0] _t92;
  wire _t93;
  wire _t94;
  wire _t95;
  wire [3:0] _t96;
  wire [3:0] _t97;
  wire _t98;
  wire _t99;
  wire _t100;
  wire [3:0] _t101;
  wire [3:0] _t102;
  wire _t103;
  wire _t104;
  wire _t105;
  wire [3:0] _t106;
  wire [3:0] _t107;
  wire _t108;
  wire _t109;
  wire _t110;
  wire [3:0] _t111;
  wire [3:0] _t112;
  wire _t113;
  wire _t114;
  wire _t115;
  wire [3:0] _t116;
  wire [3:0] _t117;
  wire _t118;
  wire _t119;
  wire _t120;
  wire [3:0] _t121;
  wire [3:0] _t122;
  wire _t123;
  wire _t124;
  wire _t125;
  wire [3:0] _t126;
  wire [3:0] _t127;
  wire _t128;
  wire _t129;
  wire _t130;
  wire [3:0] _t131;
  wire [3:0] _t132;
  wire _t133;
  wire [15:0] _t134;
  wire _t135;
  wire _t136;
  wire _t137;
  wire [2:0] _t138;
  wire _t139;
  wire _t140;
  wire _t141;
  wire _t142;
  wire [3:0] _t143;
  wire _t144;
  wire [4:0] _t145;
  wire [4:0] _t146;
  wire _t147;
  wire [2:0] _t148;
  wire _t149;
  wire _t150;
  wire _t151;
  wire _t152;
  wire _t153;
  wire [3:0] _t154;
  wire [31:0] _t155;
  wire [4:0] _t156;
  wire [10:0] _t157;
  wire _t158;
  wire [3:0] _t159;
  wire [4:0] _t160;
  wire [2:0] _t161;
  wire [15:0] _t162;
  wire [7:0] q_dst_data;
  wire q_dst_last;
  wire q_dst_valid;
  wire q_full;
  wire q_tight;
  wire [31:0] cn_s4;
  assign _t0 = (~full);
  assign _t1 = (~jam);
  assign _t2 = (~full);
  assign _t3 = ((|tx_valid) && (|_t2));
  assign _t4 = ((|jam) && (|tx_valid));
  assign _t5 = (~jam);
  assign _t6 = (~f_valid);
  assign _t7 = ((|full) && (|_t6));
  assign _t8 = ((|_t7) && (|tx_valid));
  assign _t9 = ((|_t8) && (|_t5));
  assign _t10 = ((|_t9) ? 1'd1 : jam);
  assign _t11 = ({29'b0, txm2_state} == 32'd0);
  assign _t12 = ({29'b0, txm2_state} == 32'd0);
  assign _t13 = ({29'b0, txm2_state} == 32'd0);
  assign _t14 = ({29'b0, txm2_state} == 32'd0);
  assign _t15 = ({29'b0, txm2_state} == 32'd0);
  assign _t16 = ({29'b0, txm2_state} == 32'd0);
  assign _t17 = ({29'b0, txm2_state} == 32'd0);
  assign _t18 = ({29'b0, txm2_state} == 32'd0);
  assign _t19 = ({29'b0, txm2_state} == 32'd0);
  assign _t20 = ((|_t19) && (|f_valid));
  assign _t21 = ((|_t11) ? 1'd0 : en);
  assign _t22 = ({29'b0, txm2_state} == 32'd1);
  assign _t23 = ((|_t12) ? 4'd0 : dq);
  assign _t24 = (pn == 5'd15);
  assign _t25 = ({29'b0, txm2_state} == 32'd1);
  assign _t26 = ((|_t25) && (|_t24));
  assign _t27 = ((|_t20) ? 32'd1 : txm2_state);
  assign _t28 = ({29'b0, txm2_state} == 32'd1);
  assign _t29 = ((|_t28) && (|_t24));
  assign _t30 = ((|_t26) ? 4'd13 : _t23);
  assign _t31 = (~_t24);
  assign _t32 = ({29'b0, txm2_state} == 32'd1);
  assign _t33 = ((|_t32) && (|_t31));
  assign _t34 = ((|_t14) ? 5'd0 : pn);
  assign _t35 = (pn + 5'd1);
  assign _t36 = ({29'b0, txm2_state} == 32'd1);
  assign _t37 = ((|_t36) && (|_t31));
  assign _t38 = ((|_t33) ? 4'd5 : _t30);
  assign _t39 = f_data[3:0];
  assign _t40 = ({29'b0, txm2_state} == 32'd2);
  assign _t41 = f_data[3:0];
  assign _t42 = ({29'b0, txm2_state} == 32'd2);
  assign _t43 = ((|_t13) ? 32'd4294967295 : crc);
  assign _t44 = ({29'b0, txm2_state} == 32'd2);
  assign _t45 = ((|_t29) ? 32'd2 : _t27);
  assign _t46 = ({29'b0, txm2_state} == 32'd2);
  assign _t47 = ((|_t40) ? _t39 : _t38);
  assign _t48 = f_data[7:4];
  assign _t49 = ({29'b0, txm2_state} == 32'd3);
  assign _t50 = ((|_t42) ? _t41 : 4'd0);
  assign _t51 = f_data[7:4];
  assign _t52 = ({29'b0, txm2_state} == 32'd3);
  assign _t53 = ((|_t44) ? crcn : _t43);
  assign _t54 = ({29'b0, txm2_state} == 32'd3);
  assign _t55 = ({29'b0, txm2_state} == 32'd3);
  assign _t56 = ((|_t15) ? 11'd0 : bc);
  assign _t57 = (bc + 11'd1);
  assign _t58 = ({29'b0, txm2_state} == 32'd3);
  assign _t59 = ((|_t46) ? 32'd3 : _t45);
  assign _t60 = (bc < 11'd59);
  assign _t61 = ((|f_last) && (|_t60));
  assign _t62 = ({29'b0, txm2_state} == 32'd3);
  assign _t63 = ((|_t62) && (|_t61));
  assign _t64 = ((|_t63) ? 32'd4 : _t59);
  assign _t65 = (~_t60);
  assign _t66 = ((|f_last) && (|_t65));
  assign _t67 = ({29'b0, txm2_state} == 32'd3);
  assign _t68 = ((|_t67) && (|_t66));
  assign _t69 = ((|_t68) ? 32'd5 : _t64);
  assign _t70 = (~f_last);
  assign _t71 = ({29'b0, txm2_state} == 32'd3);
  assign _t72 = ((|_t71) && (|_t70));
  assign _t73 = ((|_t49) ? _t48 : _t47);
  assign _t74 = ({29'b0, txm2_state} == 32'd4);
  assign _t75 = ((|_t52) ? _t51 : _t50);
  assign _t76 = ({29'b0, txm2_state} == 32'd4);
  assign _t77 = ((|_t54) ? crcn : _t53);
  assign _t78 = ({29'b0, txm2_state} == 32'd4);
  assign _t79 = ((|_t16) ? 1'd0 : ph);
  assign _t80 = (~ph);
  assign _t81 = ({29'b0, txm2_state} == 32'd4);
  assign _t82 = ((|_t58) ? _t57 : _t56);
  assign _t83 = (bc + 11'd1);
  assign _t84 = ({29'b0, txm2_state} == 32'd4);
  assign _t85 = ((|_t84) && (|ph));
  assign _t86 = ((|_t72) ? 32'd2 : _t69);
  assign _t87 = (bc == 11'd59);
  assign _t88 = ((|ph) && (|_t87));
  assign _t89 = ({29'b0, txm2_state} == 32'd4);
  assign _t90 = ((|_t89) && (|_t88));
  assign _t91 = ((|_t74) ? 4'd0 : _t73);
  assign _t92 = fcs[3:0];
  assign _t93 = (fk == 4'd0);
  assign _t94 = ({29'b0, txm2_state} == 32'd5);
  assign _t95 = ((|_t94) && (|_t93));
  assign _t96 = ((|_t95) ? _t92 : _t91);
  assign _t97 = fcs[7:4];
  assign _t98 = (fk == 4'd1);
  assign _t99 = ({29'b0, txm2_state} == 32'd5);
  assign _t100 = ((|_t99) && (|_t98));
  assign _t101 = ((|_t100) ? _t97 : _t96);
  assign _t102 = fcs[11:8];
  assign _t103 = (fk == 4'd2);
  assign _t104 = ({29'b0, txm2_state} == 32'd5);
  assign _t105 = ((|_t104) && (|_t103));
  assign _t106 = ((|_t105) ? _t102 : _t101);
  assign _t107 = fcs[15:12];
  assign _t108 = (fk == 4'd3);
  assign _t109 = ({29'b0, txm2_state} == 32'd5);
  assign _t110 = ((|_t109) && (|_t108));
  assign _t111 = ((|_t110) ? _t107 : _t106);
  assign _t112 = fcs[19:16];
  assign _t113 = (fk == 4'd4);
  assign _t114 = ({29'b0, txm2_state} == 32'd5);
  assign _t115 = ((|_t114) && (|_t113));
  assign _t116 = ((|_t115) ? _t112 : _t111);
  assign _t117 = fcs[23:20];
  assign _t118 = (fk == 4'd5);
  assign _t119 = ({29'b0, txm2_state} == 32'd5);
  assign _t120 = ((|_t119) && (|_t118));
  assign _t121 = ((|_t120) ? _t117 : _t116);
  assign _t122 = fcs[27:24];
  assign _t123 = (fk == 4'd6);
  assign _t124 = ({29'b0, txm2_state} == 32'd5);
  assign _t125 = ((|_t124) && (|_t123));
  assign _t126 = ((|_t125) ? _t122 : _t121);
  assign _t127 = fcs[31:28];
  assign _t128 = (fk == 4'd7);
  assign _t129 = ({29'b0, txm2_state} == 32'd5);
  assign _t130 = ((|_t129) && (|_t128));
  assign _t131 = ((|_t17) ? 4'd0 : fk);
  assign _t132 = (fk + 4'd1);
  assign _t133 = ({29'b0, txm2_state} == 32'd5);
  assign _t134 = (nsent + 16'd1);
  assign _t135 = (fk == 4'd7);
  assign _t136 = ({29'b0, txm2_state} == 32'd5);
  assign _t137 = ((|_t136) && (|_t135));
  assign _t138 = ((|_t90) ? 32'd5 : _t86);
  assign _t139 = ({29'b0, txm2_state} == 32'd5);
  assign _t140 = ((|_t139) && (|_t135));
  assign _t141 = ((|_t22) ? 1'd1 : _t21);
  assign _t142 = ({29'b0, txm2_state} == 32'd6);
  assign _t143 = ((|_t130) ? _t127 : _t126);
  assign _t144 = ({29'b0, txm2_state} == 32'd6);
  assign _t145 = ((|_t18) ? 5'd0 : gc);
  assign _t146 = (gc + 5'd1);
  assign _t147 = ({29'b0, txm2_state} == 32'd6);
  assign _t148 = ((|_t140) ? 32'd6 : _t138);
  assign _t149 = (gc == 5'd22);
  assign _t150 = ({29'b0, txm2_state} == 32'd6);
  assign _t151 = ((|_t150) && (|_t149));
  assign zero = 1'd0;
  assign tx_ready = ((|_t0) || (|jam));
  assign w = ((|_t3) && (|_t1));
  assign c = ((|w) && (|tx_last));
  assign rw = ((|_t4) && (|tx_last));
  assign _t152 = ((|rw) ? 1'd0 : _t10);
  assign f_data = q_dst_data;
  assign f_last = q_dst_last;
  assign f_valid = q_dst_valid;
  assign full = q_full;
  assign crcn = cn_s4;
  assign fcs = (crc ^ 32'd4294967295);
  assign _t153 = ((|_t142) ? 1'd0 : _t141);
  assign _t154 = ((|_t144) ? 4'd0 : _t143);
  assign _t155 = ((|_t78) ? crcn : _t77);
  assign _t156 = ((|_t37) ? _t35 : _t34);
  assign _t157 = ((|_t85) ? _t83 : _t82);
  assign _t158 = ((|_t81) ? _t80 : _t79);
  assign _t159 = ((|_t133) ? _t132 : _t131);
  assign _t160 = ((|_t147) ? _t146 : _t145);
  assign _t161 = ((|_t151) ? 32'd0 : _t148);
  assign cin = ((|_t76) ? 4'd0 : _t75);
  assign f_ready = ((|_t55) ? 1'd1 : 1'd0);
  assign _t162 = ((|_t137) ? _t134 : nsent);
  assign tx_en = en;
  assign txd = dq;
  always @(posedge clk) begin
    if (rst) begin
      en <= 1'd0;
      dq <= 4'd0;
      crc <= 32'd0;
      pn <= 5'd0;
      bc <= 11'd0;
      ph <= 1'd0;
      fk <= 4'd0;
      gc <= 5'd0;
      nsent <= 16'd0;
      jam <= 1'd0;
      txm2_state <= 3'd0;
    end else begin
      en <= _t153;
      dq <= _t154;
      crc <= _t155;
      pn <= _t156;
      bc <= _t157;
      ph <= _t158;
      fk <= _t159;
      gc <= _t160;
      nsent <= _t162;
      jam <= _t152;
      txm2_state <= _t161;
    end
  end
  pktfifo_8_2048_1 q (
    .clk(clk),
    .rst(rst),
    .wr(w),
    .wdata(tx_data),
    .wlast(tx_last),
    .commit(c),
    .rewind(rw),
    .dst_data(q_dst_data),
    .dst_last(q_dst_last),
    .dst_valid(q_dst_valid),
    .dst_ready(f_ready),
    .full(q_full),
    .tight(q_tight)
  );
  crc32_nibble cn (
    .clk(clk),
    .rst(rst),
    .c(crc),
    .d(cin),
    .s4(cn_s4)
  );
endmodule
`default_nettype wire

`default_nettype none
module xc7a100tcsg324 (
  input  wire clk,
  input  wire rst,
  input  wire E3,
  output wire H5,
  output wire J5,
  output wire T9,
  output wire T10,
  output wire G6,
  output wire F6,
  output wire E1,
  output wire G3,
  output wire J4,
  output wire G4,
  output wire J3,
  output wire J2,
  output wire H4,
  output wire K1,
  output wire H6,
  output wire K2,
  input  wire A8,
  input  wire C11,
  input  wire C10,
  input  wire A10,
  input  wire D9,
  input  wire C9,
  input  wire B9,
  input  wire B8,
  output wire D10,
  input  wire A9,
  output wire G13,
  output wire B11,
  output wire A11,
  output wire D12,
  output wire D13,
  output wire B18,
  output wire A18,
  output wire K16,
  output wire E15,
  output wire E16,
  output wire D15,
  output wire C15,
  output wire J17,
  output wire J18,
  output wire K15,
  output wire J15,
  output wire U12,
  output wire V12,
  output wire V10,
  output wire V11,
  output wire U14,
  output wire V14,
  output wire T13,
  output wire U13,
  output wire F3,
  input  wire H2,
  input  wire G2,
  output wire R2,
  output wire M6,
  output wire N4,
  output wire T1,
  output wire N6,
  output wire R7,
  output wire V6,
  output wire U7,
  output wire R8,
  output wire V7,
  output wire R6,
  output wire U6,
  output wire T6,
  output wire T8,
  output wire R1,
  output wire P4,
  output wire P2,
  output wire P3,
  output wire M4,
  output wire P5,
  output wire U8,
  output wire L1,
  output wire U1,
  output wire N5,
  output wire R5,
  output wire K6,
  output wire U9,
  output wire V9,
  input  wire D17,
  input  wire G14,
  output wire F16,
  output wire G18,
  output wire C16,
  input  wire F15,
  input  wire G16,
  input  wire D18,
  input  wire E17,
  input  wire E18,
  input  wire G17,
  input  wire C17,
  input  wire H16,
  output wire H15,
  output wire H14,
  output wire J14,
  output wire J13,
  output wire H17,
  output wire eth_mdio_o,
  output wire eth_mdio_en,
  input  wire eth_mdio_i,
  inout  wire [15:0] ddr3_dq_o,
  output wire ddr3_dq_en,
  input  wire [15:0] ddr3_dq_i,
  output wire sd_cmd_o,
  output wire sd_cmd_en,
  input  wire sd_cmd_i,
  output wire sd_dat0_o,
  output wire sd_dat0_en,
  input  wire sd_dat0_i,
  output wire sd_dat1_o,
  output wire sd_dat1_en,
  input  wire sd_dat1_i,
  output wire sd_dat2_o,
  output wire sd_dat2_en,
  input  wire sd_dat2_i,
  output wire sd_dat3_o,
  output wire sd_dat3_en,
  input  wire sd_dat3_i,
  inout  wire [1:0] ddr3_dqs_p_o,
  output wire ddr3_dqs_p_en,
  input  wire [1:0] ddr3_dqs_p_i,
  inout  wire [1:0] ddr3_dqs_n_o,
  output wire ddr3_dqs_n_en,
  input  wire [1:0] ddr3_dqs_n_i,
  output wire ddr3_dqs_en
);
  wire clk100;
  wire ddr3_sys_clk;
  wire ddr3_ref_clk;
  wire ddr3_lock;
  wire nolock;
  reg  [8:0] settle;
  wire ddr3_sys_rst;
  wire userclk;
  wire userrst;
  wire [3:0] leds;
  wire [11:0] rgb;
  wire [3:0] sw;
  wire [3:0] btn;
  wire uart_tx;
  wire uart_rx;
  wire [3:0] vga_r;
  wire [3:0] vga_g;
  wire [3:0] vga_b;
  wire vga_hs;
  wire vga_vs;
  wire sd_sck;
  wire sd_cd;
  wire sd_wp;
  wire [13:0] ddr3_addr;
  wire [2:0] ddr3_ba;
  wire [1:0] ddr3_dm;
  wire ddr3_ras_n;
  wire ddr3_cas_n;
  wire ddr3_we_n;
  wire ddr3_reset_n;
  wire ddr3_cke;
  wire ddr3_odt;
  wire ddr3_ck_p;
  wire ddr3_ck_n;
  reg  eth_div;
  reg  eth_ref;
  wire eth_rx_clk;
  wire eth_tx_clk;
  reg  erx0;
  reg  erx1;
  reg  etx0;
  reg  etx1;
  wire eth_rx_rst;
  wire eth_tx_rst;
  wire [3:0] eth_rxd;
  wire [3:0] eth_txd;
  wire eth_up;
  wire tck;
  wire trst;
  wire jtdi;
  wire jsel;
  wire jshift;
  wire jcapture;
  wire jdrck;
  wire jruntest;
  wire jtms;
  wire jupdate;
  wire jtdo;
  wire mem_cs_n;
  wire uart_txd_in;
  wire uart_txd_in_en;
  wire [7:0] dut_hurx_data_v_in;
  wire dut_hurx_data_v_in_en;
  wire dut_hurx_data_err_in;
  wire dut_hurx_data_err_in_en;
  wire dut_hurx_valid_in;
  wire dut_hurx_valid_in_en;
  wire dut_hutx_ready_in;
  wire dut_hutx_ready_in_en;
  wire [7:0] dut_erx_data_in;
  wire dut_erx_data_in_en;
  wire dut_erx_last_in;
  wire dut_erx_last_in_en;
  wire dut_erx_valid_in;
  wire dut_erx_valid_in_en;
  wire eth_tx_en_in;
  wire eth_tx_en_in_en;
  wire [3:0] eth_txd_in;
  wire eth_txd_in_en;
  wire dut_etx_ready_in;
  wire dut_etx_ready_in_en;
  wire [8:0] _t0;
  wire _t1;
  wire _t2;
  wire [2:0] _t3;
  wire [3:0] _t4;
  wire _t5;
  wire [1:0] _t6;
  wire [3:0] _t7;
  wire [1:0] _t8;
  wire _t9;
  wire [3:0] _t10;
  wire [2:0] _t11;
  wire [2:0] _t12;
  wire [3:0] _t13;
  wire _t14;
  wire [1:0] _t15;
  wire [3:0] _t16;
  wire [1:0] _t17;
  wire _t18;
  wire [3:0] _t19;
  wire [2:0] _t20;
  wire _t21;
  wire [2:0] _t22;
  wire [3:0] _t23;
  wire _t24;
  wire [1:0] _t25;
  wire [3:0] _t26;
  wire [1:0] _t27;
  wire _t28;
  wire [3:0] _t29;
  wire [2:0] _t30;
  wire [8:0] _t31;
  wire _t32;
  wire _t33;
  wire pll_clkout0;
  wire pll_clkout1;
  wire pll_lock;
  wire uart_txd;
  wire eth_mdc;
  wire eth_mdio_o_1;
  wire eth_mdio_en_1;
  wire eth_rstn;
  wire eth_tx_en;
  wire [3:0] eth_txd_1;
  wire eth_up_1;
  wire bs_CAPTURE;
  wire bs_DRCK;
  wire bs_RESET;
  wire bs_RUNTEST;
  wire bs_SEL;
  wire bs_SHIFT;
  wire bs_TCK;
  wire bs_TDI;
  wire bs_TMS;
  wire bs_UPDATE;
  wire jtag_tdo;
  wire [13:0] mem_addr;
  wire [2:0] mem_ba;
  wire mem_ras_n;
  wire mem_cas_n;
  wire mem_we_n;
  wire mem_reset_n;
  wire mem_cke;
  wire mem_odt;
  wire mem_ck_p;
  wire mem_ck_n;
  wire [1:0] mem_dm;
  wire mem_ui_clk;
  wire mem_ui_rst;
  wire n_txd;
  wire [7:0] n_rx_data_v;
  wire n_rx_data_err;
  wire n_rx_valid;
  wire n_tx_ready;
  wire [15:0] n_nerr;
  wire [7:0] r_rx_data;
  wire r_rx_last;
  wire r_rx_valid;
  wire [15:0] r_ngood;
  wire [15:0] r_nbad;
  wire t_tx_en;
  wire [3:0] t_txd;
  wire t_tx_ready;
  wire [15:0] t_nsent;
  wire [3:0] dut_leds;
  wire [11:0] dut_rgb;
  wire dut_hurx_ready;
  wire [7:0] dut_hutx_data;
  wire dut_hutx_valid;
  wire dut_erx_ready;
  wire [7:0] dut_etx_data;
  wire dut_etx_last;
  wire dut_etx_valid;
  assign _t0 = (settle + 9'd1);
  assign _t1 = settle[8];
  assign _t2 = (~_t1);
  assign _t3 = 3'd0;
  assign _t4 = {_t3, A8};
  assign _t5 = _t4[0:0];
  assign _t6 = _t4[3:2];
  assign _t7 = {_t6, C11, _t5};
  assign _t8 = _t7[1:0];
  assign _t9 = _t7[3:3];
  assign _t10 = {_t9, C10, _t8};
  assign _t11 = _t10[2:0];
  assign _t12 = 3'd0;
  assign _t13 = {_t12, D9};
  assign _t14 = _t13[0:0];
  assign _t15 = _t13[3:2];
  assign _t16 = {_t15, C9, _t14};
  assign _t17 = _t16[1:0];
  assign _t18 = _t16[3:3];
  assign _t19 = {_t18, B9, _t17};
  assign _t20 = _t19[2:0];
  assign _t21 = (~eth_ref);
  assign _t22 = 3'd0;
  assign _t23 = {_t22, D18};
  assign _t24 = _t23[0:0];
  assign _t25 = _t23[3:2];
  assign _t26 = {_t25, E17, _t24};
  assign _t27 = _t26[1:0];
  assign _t28 = _t26[3:3];
  assign _t29 = {_t28, E18, _t27};
  assign _t30 = _t29[2:0];
  assign clk100 = E3;
  assign ddr3_sys_clk = pll_clkout0;
  assign ddr3_ref_clk = pll_clkout1;
  assign ddr3_lock = pll_lock;
  assign nolock = (~ddr3_lock);
  assign _t31 = ((|_t2) ? _t0 : settle);
  assign ddr3_sys_rst = settle[8];
  assign H5 = leds[0];
  assign J5 = leds[1];
  assign T9 = leds[2];
  assign T10 = leds[3];
  assign G6 = rgb[0];
  assign F6 = rgb[1];
  assign E1 = rgb[2];
  assign G3 = rgb[3];
  assign J4 = rgb[4];
  assign G4 = rgb[5];
  assign J3 = rgb[6];
  assign J2 = rgb[7];
  assign H4 = rgb[8];
  assign K1 = rgb[9];
  assign H6 = rgb[10];
  assign K2 = rgb[11];
  assign sw = {A10, _t11};
  assign btn = {B8, _t20};
  assign D10 = uart_tx;
  assign uart_rx = A9;
  assign E15 = vga_r[0];
  assign E16 = vga_r[1];
  assign D15 = vga_r[2];
  assign C15 = vga_r[3];
  assign J17 = vga_b[0];
  assign J18 = vga_b[1];
  assign K15 = vga_b[2];
  assign J15 = vga_b[3];
  assign U12 = vga_g[0];
  assign V12 = vga_g[1];
  assign V10 = vga_g[2];
  assign V11 = vga_g[3];
  assign U14 = vga_hs;
  assign V14 = vga_vs;
  assign F3 = sd_sck;
  assign sd_cd = H2;
  assign sd_wp = G2;
  assign R2 = ddr3_addr[0];
  assign M6 = ddr3_addr[1];
  assign N4 = ddr3_addr[2];
  assign T1 = ddr3_addr[3];
  assign N6 = ddr3_addr[4];
  assign R7 = ddr3_addr[5];
  assign V6 = ddr3_addr[6];
  assign U7 = ddr3_addr[7];
  assign R8 = ddr3_addr[8];
  assign V7 = ddr3_addr[9];
  assign R6 = ddr3_addr[10];
  assign U6 = ddr3_addr[11];
  assign T6 = ddr3_addr[12];
  assign T8 = ddr3_addr[13];
  assign R1 = ddr3_ba[0];
  assign P4 = ddr3_ba[1];
  assign P2 = ddr3_ba[2];
  assign L1 = ddr3_dm[0];
  assign U1 = ddr3_dm[1];
  assign P3 = ddr3_ras_n;
  assign M4 = ddr3_cas_n;
  assign P5 = ddr3_we_n;
  assign K6 = ddr3_reset_n;
  assign N5 = ddr3_cke;
  assign R5 = ddr3_odt;
  assign U9 = ddr3_ck_p;
  assign V9 = ddr3_ck_n;
  assign uart_tx = uart_txd;
  assign _t32 = (~eth_div);
  assign _t33 = ((|eth_div) ? _t21 : eth_ref);
  assign G18 = eth_ref;
  assign eth_rx_clk = F15;
  assign eth_tx_clk = H16;
  assign eth_rx_rst = (~erx1);
  assign eth_tx_rst = (~etx1);
  assign eth_rxd = {G17, _t30};
  assign H14 = eth_txd[0];
  assign J14 = eth_txd[1];
  assign J13 = eth_txd[2];
  assign H17 = eth_txd[3];
  assign F16 = eth_mdc;
  assign eth_mdio_o = eth_mdio_o_1;
  assign eth_mdio_en = eth_mdio_en_1;
  assign C16 = eth_rstn;
  assign H15 = eth_tx_en;
  assign eth_txd = eth_txd_1;
  assign eth_up = eth_up_1;
  assign jcapture = bs_CAPTURE;
  assign jdrck = bs_DRCK;
  assign trst = bs_RESET;
  assign jruntest = bs_RUNTEST;
  assign jsel = bs_SEL;
  assign jshift = bs_SHIFT;
  assign tck = bs_TCK;
  assign jtdi = bs_TDI;
  assign jtms = bs_TMS;
  assign jupdate = bs_UPDATE;
  assign jtdo = jtag_tdo;
  assign U8 = mem_cs_n;
  assign ddr3_addr = mem_addr;
  assign ddr3_ba = mem_ba;
  assign ddr3_ras_n = mem_ras_n;
  assign ddr3_cas_n = mem_cas_n;
  assign ddr3_we_n = mem_we_n;
  assign ddr3_reset_n = mem_reset_n;
  assign ddr3_cke = mem_cke;
  assign ddr3_odt = mem_odt;
  assign ddr3_ck_p = mem_ck_p;
  assign ddr3_ck_n = mem_ck_n;
  assign ddr3_dm = mem_dm;
  assign userclk = mem_ui_clk;
  assign userrst = mem_ui_rst;
  assign uart_txd_in = n_txd;
  assign uart_txd_in_en = 1'd1;
  assign dut_hurx_data_v_in = n_rx_data_v;
  assign dut_hurx_data_v_in_en = 1'd1;
  assign dut_hurx_data_err_in = n_rx_data_err;
  assign dut_hurx_data_err_in_en = 1'd1;
  assign dut_hurx_valid_in = n_rx_valid;
  assign dut_hurx_valid_in_en = 1'd1;
  assign dut_hutx_ready_in = n_tx_ready;
  assign dut_hutx_ready_in_en = 1'd1;
  assign dut_erx_data_in = r_rx_data;
  assign dut_erx_data_in_en = 1'd1;
  assign dut_erx_last_in = r_rx_last;
  assign dut_erx_last_in_en = 1'd1;
  assign dut_erx_valid_in = r_rx_valid;
  assign dut_erx_valid_in_en = 1'd1;
  assign eth_tx_en_in = t_tx_en;
  assign eth_tx_en_in_en = 1'd1;
  assign eth_txd_in = t_txd;
  assign eth_txd_in_en = 1'd1;
  assign dut_etx_ready_in = t_tx_ready;
  assign dut_etx_ready_in_en = 1'd1;
  assign leds = dut_leds;
  assign rgb = dut_rgb;
  assign G13 = 1'd0;
  assign B11 = 1'd0;
  assign A11 = 1'd0;
  assign D12 = 1'd0;
  assign D13 = 1'd0;
  assign B18 = 1'd0;
  assign A18 = 1'd0;
  assign K16 = 1'd0;
  assign T13 = 1'd0;
  assign U13 = 1'd0;
  assign ddr3_dq_en = 1'd0;
  assign sd_cmd_o = 1'd0;
  assign sd_cmd_en = 1'd0;
  assign sd_dat0_o = 1'd0;
  assign sd_dat0_en = 1'd0;
  assign sd_dat1_o = 1'd0;
  assign sd_dat1_en = 1'd0;
  assign sd_dat2_o = 1'd0;
  assign sd_dat2_en = 1'd0;
  assign sd_dat3_o = 1'd0;
  assign sd_dat3_en = 1'd0;
  assign ddr3_dqs_p_en = 1'd0;
  assign ddr3_dqs_n_en = 1'd0;
  assign ddr3_dqs_en = 1'd0;
  assign vga_r = 4'd0;
  assign vga_g = 4'd0;
  assign vga_b = 4'd0;
  assign vga_hs = 1'd0;
  assign vga_vs = 1'd0;
  assign sd_sck = 1'd0;
  assign mem_cs_n = 1'd0;
  always @(posedge clk100) begin
    if (nolock) begin
      settle <= 9'd0;
      eth_div <= 1'd0;
      eth_ref <= 1'd0;
    end else begin
      settle <= _t31;
      eth_div <= _t32;
      eth_ref <= _t33;
    end
  end
  always @(posedge eth_rx_clk) begin
    if (nolock) begin
      erx0 <= 1'd0;
      erx1 <= 1'd0;
    end else begin
      erx0 <= 1'd1;
      erx1 <= erx0;
    end
  end
  always @(posedge eth_tx_clk) begin
    if (nolock) begin
      etx0 <= 1'd0;
      etx1 <= 1'd0;
    end else begin
      etx0 <= 1'd1;
      etx1 <= etx0;
    end
  end

  wire pll_clkin, pll_fb;
  BUFG pll_clkin_bufg (.I(clk100), .O(pll_clkin));
  wire pll_clkout0_raw;
  wire pll_clkout1_raw;
  PLLE2_BASE #(
    .BANDWIDTH("LOW"),
    .CLKFBOUT_MULT(8),
    .DIVCLK_DIVIDE(1),
    .STARTUP_WAIT("TRUE"),

    .CLKOUT0_DIVIDE(8),

    .CLKOUT1_DIVIDE(4)
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
  uart_link_100 uart (
    .clk(clk100),
    .rst(nolock),
    .rxd(uart_rx),
    .txd(uart_txd),
    .txd_in(uart_txd_in),
    .txd_in_en(uart_txd_in_en)
  );
  eth_mii_link_64_1_0 eth (
    .clk(clk100),
    .rst(nolock),
    .mdc(eth_mdc),
    .mdio_o(eth_mdio_o_1),
    .mdio_en(eth_mdio_en_1),
    .mdio_i(eth_mdio_i),
    .rstn(eth_rstn),
    .rx_clk(eth_rx_clk),
    .rx_rst(eth_rx_rst),
    .rx_dv(G16),
    .rxd(eth_rxd),
    .rx_er(C17),
    .tx_clk(eth_tx_clk),
    .tx_rst(eth_tx_rst),
    .tx_en(eth_tx_en),
    .txd(eth_txd_1),
    .up(eth_up_1),
    .tx_en_in(eth_tx_en_in),
    .tx_en_in_en(eth_tx_en_in_en),
    .txd_in(eth_txd_in),
    .txd_in_en(eth_txd_in_en)
  );
  hostlink_eth_2200301993985_3232255234 hostlink (
    .clk(clk),
    .rst(rst)
  );
  BSCANE2 #(.JTAG_CHAIN(2)) bs (
    .CAPTURE(bs_CAPTURE),
    .DRCK(bs_DRCK),
    .RESET(bs_RESET),
    .RUNTEST(bs_RUNTEST),
    .SEL(bs_SEL),
    .SHIFT(bs_SHIFT),
    .TCK(bs_TCK),
    .TDI(bs_TDI),
    .TMS(bs_TMS),
    .UPDATE(bs_UPDATE),
    .TDO(jtdo)
  );
  xc7_jtag_link_16 jtag (
    .clk(tck),
    .rst(trst),
    .tdi(jtdi),
    .sel(jsel),
    .shift(jshift),
    .capture(jcapture),
    .tdo(jtag_tdo)
  );
  ddr3_if mem (
    .clk(userclk),
    .rst(userrst),
    .addr(mem_addr),
    .ba(mem_ba),
    .ras_n(mem_ras_n),
    .cas_n(mem_cas_n),
    .we_n(mem_we_n),
    .reset_n(mem_reset_n),
    .cke(mem_cke),
    .odt(mem_odt),
    .ck_p(mem_ck_p),
    .ck_n(mem_ck_n),
    .dm(mem_dm),
    .dq(ddr3_dq_o),
    .dqs_p(ddr3_dqs_p_o),
    .dqs_n(ddr3_dqs_n_o),
    .sys_clk(ddr3_sys_clk),
    .ref_clk(ddr3_ref_clk),
    .sys_rst(ddr3_sys_rst),
    .ui_clk(mem_ui_clk),
    .ui_rst(mem_ui_rst),
    .idle_clk(ddr3_sys_clk),
    .idle_rst(ddr3_sys_rst)
  );
  uart_rxtx_100 n (
    .clk(clk100),
    .rst(nolock),
    .rxd(uart_rx),
    .txd(n_txd),
    .rx_data_v(n_rx_data_v),
    .rx_data_err(n_rx_data_err),
    .rx_valid(n_rx_valid),
    .rx_ready(dut_hurx_ready),
    .tx_data(dut_hutx_data),
    .tx_valid(dut_hutx_valid),
    .tx_ready(n_tx_ready),
    .nerr(n_nerr)
  );
  mii_rx_2048 r (
    .clk(eth_rx_clk),
    .rst(eth_rx_rst),
    .rx_dv(G16),
    .rxd(eth_rxd),
    .rx_er(C17),
    .rx_data(r_rx_data),
    .rx_last(r_rx_last),
    .rx_valid(r_rx_valid),
    .rx_ready(dut_erx_ready),
    .ngood(r_ngood),
    .nbad(r_nbad)
  );
  mii_tx_2048 t (
    .clk(eth_tx_clk),
    .rst(eth_tx_rst),
    .tx_en(t_tx_en),
    .txd(t_txd),
    .tx_data(dut_etx_data),
    .tx_last(dut_etx_last),
    .tx_valid(dut_etx_valid),
    .tx_ready(t_tx_ready),
    .nsent(t_nsent)
  );
  z1013_arty dut (
    .clk(userclk),
    .rst(userrst),
    .clk100(clk100),
    .leds(dut_leds),
    .rgb(dut_rgb),
    .hurx_ready(dut_hurx_ready),
    .hutx_data(dut_hutx_data),
    .hutx_valid(dut_hutx_valid),
    .hurx_data_v_in(dut_hurx_data_v_in),
    .hurx_data_v_in_en(dut_hurx_data_v_in_en),
    .hurx_data_err_in(dut_hurx_data_err_in),
    .hurx_data_err_in_en(dut_hurx_data_err_in_en),
    .hurx_valid_in(dut_hurx_valid_in),
    .hurx_valid_in_en(dut_hurx_valid_in_en),
    .hutx_ready_in(dut_hutx_ready_in),
    .hutx_ready_in_en(dut_hutx_ready_in_en),
    .erx_ready(dut_erx_ready),
    .etx_data(dut_etx_data),
    .etx_last(dut_etx_last),
    .etx_valid(dut_etx_valid),
    .erx_data_in(dut_erx_data_in),
    .erx_data_in_en(dut_erx_data_in_en),
    .erx_last_in(dut_erx_last_in),
    .erx_last_in_en(dut_erx_last_in_en),
    .erx_valid_in(dut_erx_valid_in),
    .erx_valid_in_en(dut_erx_valid_in_en),
    .etx_ready_in(dut_etx_ready_in),
    .etx_ready_in_en(dut_etx_ready_in_en),
    .eth_rx_clk(eth_rx_clk),
    .eth_rx_rst(eth_rx_rst),
    .eth_tx_clk(eth_tx_clk),
    .eth_tx_rst(eth_tx_rst),
    .nolock(nolock)
  );
endmodule
`default_nettype wire

`default_nettype none
module top(
  input  wire clk100,
  output wire [3:0] leds,
  output wire [11:0] rgb,
  output wire uart_tx,
  input  wire uart_rx,
  output wire [13:0] ddr3_addr,
  output wire [2:0] ddr3_ba,
  output wire [1:0] ddr3_dm,
  output wire ddr3_ras_n,
  output wire ddr3_cas_n,
  output wire ddr3_we_n,
  output wire ddr3_reset_n,
  output wire ddr3_cke,
  output wire ddr3_odt,
  output wire ddr3_ck_p,
  output wire ddr3_ck_n,
  output wire eth_ref,
  input  wire eth_rx_clk,
  input  wire eth_tx_clk,
  input  wire [3:0] eth_rxd,
  output wire [3:0] eth_txd,
  output wire C16,
  input  wire C17,
  output wire F16,
  input  wire G16,
  output wire H15,
  inout  wire [15:0] ddr3_dq,
  inout  wire [1:0] ddr3_dqs_n,
  inout  wire [1:0] ddr3_dqs_p,
  inout  wire eth_mdio,
  output wire mem_cs_n
);
  wire eth_mdio_o;
  wire eth_mdio_en;
  wire eth_mdio_i;
  wire l8_pair_ddr3_ck, l8_pair_ddr3_ck_unused;
  OBUFDS l8_obufds_ddr3_ck (.I(l8_pair_ddr3_ck), .O(ddr3_ck_p), .OB(ddr3_ck_n));
  xc7a100tcsg324 u (
    .clk(clk100),
    .rst(1'b0),
    .E3(clk100),
    .H5(leds[0]),
    .J5(leds[1]),
    .T9(leds[2]),
    .T10(leds[3]),
    .G6(rgb[0]),
    .F6(rgb[1]),
    .E1(rgb[2]),
    .G3(rgb[3]),
    .J4(rgb[4]),
    .G4(rgb[5]),
    .J3(rgb[6]),
    .J2(rgb[7]),
    .H4(rgb[8]),
    .K1(rgb[9]),
    .H6(rgb[10]),
    .K2(rgb[11]),
    .D10(uart_tx),
    .A9(uart_rx),
    .R2(ddr3_addr[0]),
    .M6(ddr3_addr[1]),
    .N4(ddr3_addr[2]),
    .T1(ddr3_addr[3]),
    .N6(ddr3_addr[4]),
    .R7(ddr3_addr[5]),
    .V6(ddr3_addr[6]),
    .U7(ddr3_addr[7]),
    .R8(ddr3_addr[8]),
    .V7(ddr3_addr[9]),
    .R6(ddr3_addr[10]),
    .U6(ddr3_addr[11]),
    .T6(ddr3_addr[12]),
    .T8(ddr3_addr[13]),
    .R1(ddr3_ba[0]),
    .P4(ddr3_ba[1]),
    .P2(ddr3_ba[2]),
    .L1(ddr3_dm[0]),
    .U1(ddr3_dm[1]),
    .P3(ddr3_ras_n),
    .M4(ddr3_cas_n),
    .P5(ddr3_we_n),
    .K6(ddr3_reset_n),
    .N5(ddr3_cke),
    .R5(ddr3_odt),
    .U9(l8_pair_ddr3_ck),
    .V9(l8_pair_ddr3_ck_unused),
    .G18(eth_ref),
    .F15(eth_rx_clk),
    .H16(eth_tx_clk),
    .D18(eth_rxd[0]),
    .E17(eth_rxd[1]),
    .E18(eth_rxd[2]),
    .G17(eth_rxd[3]),
    .H14(eth_txd[0]),
    .J14(eth_txd[1]),
    .J13(eth_txd[2]),
    .H17(eth_txd[3]),
    .C16(C16),
    .C17(C17),
    .F16(F16),
    .G16(G16),
    .H15(H15),
    .ddr3_dq_o(ddr3_dq),
    .ddr3_dqs_n_o(ddr3_dqs_n),
    .ddr3_dqs_p_o(ddr3_dqs_p),
    .eth_mdio_o(eth_mdio_o),
    .eth_mdio_en(eth_mdio_en),
    .eth_mdio_i(eth_mdio_i)
  );
  assign eth_mdio = eth_mdio_en ? eth_mdio_o : 1'bz;
  assign eth_mdio_i = eth_mdio;
  assign mem_cs_n = 1'd0;
endmodule
`default_nettype wire
