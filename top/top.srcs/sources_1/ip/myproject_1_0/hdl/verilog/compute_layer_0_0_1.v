// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module compute_layer_0_0_1 (
        ap_clk,
        ap_rst,
        data_0_V_read,
        data_1_V_read,
        data_2_V_read,
        data_3_V_read,
        data_4_V_read,
        data_5_V_read,
        data_6_V_read,
        data_7_V_read,
        data_8_V_read,
        data_9_V_read,
        data_10_V_read,
        data_11_V_read,
        data_12_V_read,
        data_13_V_read,
        data_14_V_read,
        data_15_V_read,
        ap_return,
        ap_ce
);


input   ap_clk;
input   ap_rst;
input  [17:0] data_0_V_read;
input  [17:0] data_1_V_read;
input  [17:0] data_2_V_read;
input  [17:0] data_3_V_read;
input  [17:0] data_4_V_read;
input  [17:0] data_5_V_read;
input  [17:0] data_6_V_read;
input  [17:0] data_7_V_read;
input  [17:0] data_8_V_read;
input  [17:0] data_9_V_read;
input  [17:0] data_10_V_read;
input  [17:0] data_11_V_read;
input  [17:0] data_12_V_read;
input  [17:0] data_13_V_read;
input  [17:0] data_14_V_read;
input  [17:0] data_15_V_read;
output  [17:0] ap_return;
input   ap_ce;

reg[17:0] ap_return;

reg  signed [17:0] data_13_V_read_4_reg_1548;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_pp0_stage0_11001;
reg  signed [17:0] data_12_V_read13_reg_1553;
reg   [17:0] tmp_38_reg_1628;
reg   [17:0] tmp_38_1_reg_1633;
reg   [17:0] tmp_38_2_reg_1638;
reg   [17:0] tmp_38_3_reg_1643;
reg   [17:0] tmp_38_4_reg_1648;
reg   [17:0] tmp_38_5_reg_1653;
reg   [17:0] tmp_38_6_reg_1658;
reg   [17:0] tmp_38_7_reg_1663;
reg   [17:0] tmp_38_8_reg_1668;
reg   [17:0] tmp_38_9_reg_1673;
reg   [17:0] tmp_38_s_reg_1678;
reg   [17:0] tmp_38_10_reg_1683;
reg   [17:0] tmp_38_13_reg_1698;
reg   [17:0] tmp_38_14_reg_1703;
reg   [17:0] tmp_38_11_reg_1708;
reg   [17:0] tmp_38_12_reg_1713;
wire   [17:0] tmp2_fu_1483_p2;
reg   [17:0] tmp2_reg_1718;
reg   [17:0] tmp2_reg_1718_pp0_iter3_reg;
reg   [17:0] tmp2_reg_1718_pp0_iter4_reg;
wire   [17:0] tmp5_fu_1497_p2;
reg   [17:0] tmp5_reg_1723;
reg   [17:0] tmp5_reg_1723_pp0_iter3_reg;
reg   [17:0] tmp5_reg_1723_pp0_iter4_reg;
wire   [17:0] tmp10_fu_1503_p2;
reg   [17:0] tmp10_reg_1728;
reg   [17:0] tmp10_reg_1728_pp0_iter3_reg;
wire   [17:0] tmp11_fu_1507_p2;
reg   [17:0] tmp11_reg_1733;
reg   [17:0] tmp11_reg_1733_pp0_iter3_reg;
wire   [17:0] tmp14_fu_1516_p2;
reg   [17:0] tmp14_reg_1738;
wire   [17:0] tmp12_fu_1525_p2;
reg   [17:0] tmp12_reg_1743;
wire   [17:0] tmp8_fu_1534_p2;
reg   [17:0] tmp8_reg_1748;
wire   [14:0] grp_fu_196_p1;
wire    ap_block_pp0_stage0;
wire   [13:0] grp_fu_197_p1;
wire   [15:0] grp_fu_198_p1;
wire  signed [12:0] grp_fu_199_p1;
wire  signed [14:0] grp_fu_200_p1;
wire   [15:0] grp_fu_201_p1;
wire  signed [15:0] grp_fu_202_p1;
wire  signed [15:0] grp_fu_203_p1;
wire  signed [13:0] grp_fu_204_p1;
wire  signed [14:0] grp_fu_205_p1;
wire   [13:0] grp_fu_206_p1;
wire  signed [14:0] grp_fu_207_p1;
wire  signed [15:0] grp_fu_208_p1;
wire   [14:0] grp_fu_209_p1;
wire   [15:0] grp_fu_210_p1;
wire   [13:0] grp_fu_211_p1;
wire   [29:0] grp_fu_206_p2;
wire   [29:0] grp_fu_198_p2;
wire   [29:0] grp_fu_200_p2;
wire   [29:0] grp_fu_204_p2;
wire   [29:0] grp_fu_197_p2;
wire   [29:0] grp_fu_201_p2;
wire   [29:0] grp_fu_210_p2;
wire   [29:0] grp_fu_211_p2;
wire   [29:0] grp_fu_203_p2;
wire   [29:0] grp_fu_208_p2;
wire   [29:0] grp_fu_196_p2;
wire   [29:0] grp_fu_207_p2;
wire   [29:0] grp_fu_202_p2;
wire   [29:0] grp_fu_199_p2;
wire   [29:0] grp_fu_205_p2;
wire   [29:0] grp_fu_209_p2;
wire   [17:0] tmp4_fu_1479_p2;
wire   [17:0] tmp3_fu_1475_p2;
wire   [17:0] tmp7_fu_1493_p2;
wire   [17:0] tmp6_fu_1489_p2;
wire   [17:0] tmp15_fu_1511_p2;
wire   [17:0] tmp13_fu_1521_p2;
wire   [17:0] tmp9_fu_1530_p2;
wire   [17:0] tmp1_fu_1539_p2;
reg    grp_fu_196_ce;
reg    grp_fu_197_ce;
reg    grp_fu_198_ce;
reg    grp_fu_199_ce;
reg    grp_fu_200_ce;
reg    grp_fu_201_ce;
reg    grp_fu_202_ce;
reg    grp_fu_203_ce;
reg    grp_fu_204_ce;
reg    grp_fu_205_ce;
reg    grp_fu_206_ce;
reg    grp_fu_207_ce;
reg    grp_fu_208_ce;
reg    grp_fu_209_ce;
reg    grp_fu_210_ce;
reg    grp_fu_211_ce;
wire   [17:0] res_V_write_assign_fu_1543_p2;
reg    ap_ce_reg;
reg  signed [17:0] data_0_V_read_int_reg;
reg  signed [17:0] data_1_V_read_int_reg;
reg  signed [17:0] data_2_V_read_int_reg;
reg  signed [17:0] data_3_V_read_int_reg;
reg  signed [17:0] data_4_V_read_int_reg;
reg  signed [17:0] data_5_V_read_int_reg;
reg  signed [17:0] data_6_V_read_int_reg;
reg  signed [17:0] data_7_V_read_int_reg;
reg  signed [17:0] data_8_V_read_int_reg;
reg  signed [17:0] data_9_V_read_int_reg;
reg  signed [17:0] data_10_V_read_int_reg;
reg  signed [17:0] data_11_V_read_int_reg;
reg   [17:0] data_12_V_read_int_reg;
reg   [17:0] data_13_V_read_int_reg;
reg  signed [17:0] data_14_V_read_int_reg;
reg  signed [17:0] data_15_V_read_int_reg;
reg   [17:0] ap_return_int_reg;

myproject_mul_18sHfu #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sHfu_U3228(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_10_V_read_int_reg),
    .din1(grp_fu_196_p1),
    .ce(grp_fu_196_ce),
    .dout(grp_fu_196_p2)
);

myproject_mul_18sCeG #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sCeG_U3229(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_4_V_read_int_reg),
    .din1(grp_fu_197_p1),
    .ce(grp_fu_197_ce),
    .dout(grp_fu_197_p2)
);

myproject_mul_18sThq #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sThq_U3230(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_1_V_read_int_reg),
    .din1(grp_fu_198_p1),
    .ce(grp_fu_198_ce),
    .dout(grp_fu_198_p2)
);

myproject_mul_18sNgs #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 13 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sNgs_U3231(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_15_V_read_int_reg),
    .din1(grp_fu_199_p1),
    .ce(grp_fu_199_ce),
    .dout(grp_fu_199_p2)
);

myproject_mul_18sMgi #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sMgi_U3232(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_2_V_read_int_reg),
    .din1(grp_fu_200_p1),
    .ce(grp_fu_200_ce),
    .dout(grp_fu_200_p2)
);

myproject_mul_18sThq #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sThq_U3233(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_5_V_read_int_reg),
    .din1(grp_fu_201_p1),
    .ce(grp_fu_201_ce),
    .dout(grp_fu_201_p2)
);

myproject_mul_18sUhA #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sUhA_U3234(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_14_V_read_int_reg),
    .din1(grp_fu_202_p1),
    .ce(grp_fu_202_ce),
    .dout(grp_fu_202_p2)
);

myproject_mul_18sUhA #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sUhA_U3235(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_8_V_read_int_reg),
    .din1(grp_fu_203_p1),
    .ce(grp_fu_203_ce),
    .dout(grp_fu_203_p2)
);

myproject_mul_18sFfa #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sFfa_U3236(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_3_V_read_int_reg),
    .din1(grp_fu_204_p1),
    .ce(grp_fu_204_ce),
    .dout(grp_fu_204_p2)
);

myproject_mul_18sMgi #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sMgi_U3237(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_12_V_read13_reg_1553),
    .din1(grp_fu_205_p1),
    .ce(grp_fu_205_ce),
    .dout(grp_fu_205_p2)
);

myproject_mul_18sCeG #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sCeG_U3238(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_0_V_read_int_reg),
    .din1(grp_fu_206_p1),
    .ce(grp_fu_206_ce),
    .dout(grp_fu_206_p2)
);

myproject_mul_18sMgi #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sMgi_U3239(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_11_V_read_int_reg),
    .din1(grp_fu_207_p1),
    .ce(grp_fu_207_ce),
    .dout(grp_fu_207_p2)
);

myproject_mul_18sUhA #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sUhA_U3240(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_9_V_read_int_reg),
    .din1(grp_fu_208_p1),
    .ce(grp_fu_208_ce),
    .dout(grp_fu_208_p2)
);

myproject_mul_18sHfu #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sHfu_U3241(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_13_V_read_4_reg_1548),
    .din1(grp_fu_209_p1),
    .ce(grp_fu_209_ce),
    .dout(grp_fu_209_p2)
);

myproject_mul_18sThq #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 16 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sThq_U3242(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_6_V_read_int_reg),
    .din1(grp_fu_210_p1),
    .ce(grp_fu_210_ce),
    .dout(grp_fu_210_p2)
);

myproject_mul_18sCeG #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 18 ),
    .din1_WIDTH( 14 ),
    .dout_WIDTH( 30 ))
myproject_mul_18sCeG_U3243(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(data_7_V_read_int_reg),
    .din1(grp_fu_211_p1),
    .ce(grp_fu_211_ce),
    .dout(grp_fu_211_p2)
);

always @ (posedge ap_clk) begin
    ap_ce_reg <= ap_ce;
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce_reg)) begin
        ap_return_int_reg <= res_V_write_assign_fu_1543_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_ce)) begin
        data_0_V_read_int_reg <= data_0_V_read;
        data_10_V_read_int_reg <= data_10_V_read;
        data_11_V_read_int_reg <= data_11_V_read;
        data_12_V_read_int_reg <= data_12_V_read;
        data_13_V_read_int_reg <= data_13_V_read;
        data_14_V_read_int_reg <= data_14_V_read;
        data_15_V_read_int_reg <= data_15_V_read;
        data_1_V_read_int_reg <= data_1_V_read;
        data_2_V_read_int_reg <= data_2_V_read;
        data_3_V_read_int_reg <= data_3_V_read;
        data_4_V_read_int_reg <= data_4_V_read;
        data_5_V_read_int_reg <= data_5_V_read;
        data_6_V_read_int_reg <= data_6_V_read;
        data_7_V_read_int_reg <= data_7_V_read;
        data_8_V_read_int_reg <= data_8_V_read;
        data_9_V_read_int_reg <= data_9_V_read;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_ce_reg) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        data_12_V_read13_reg_1553 <= data_12_V_read_int_reg;
        data_13_V_read_4_reg_1548 <= data_13_V_read_int_reg;
        tmp10_reg_1728 <= tmp10_fu_1503_p2;
        tmp10_reg_1728_pp0_iter3_reg <= tmp10_reg_1728;
        tmp11_reg_1733 <= tmp11_fu_1507_p2;
        tmp11_reg_1733_pp0_iter3_reg <= tmp11_reg_1733;
        tmp12_reg_1743 <= tmp12_fu_1525_p2;
        tmp14_reg_1738 <= tmp14_fu_1516_p2;
        tmp2_reg_1718 <= tmp2_fu_1483_p2;
        tmp2_reg_1718_pp0_iter3_reg <= tmp2_reg_1718;
        tmp2_reg_1718_pp0_iter4_reg <= tmp2_reg_1718_pp0_iter3_reg;
        tmp5_reg_1723 <= tmp5_fu_1497_p2;
        tmp5_reg_1723_pp0_iter3_reg <= tmp5_reg_1723;
        tmp5_reg_1723_pp0_iter4_reg <= tmp5_reg_1723_pp0_iter3_reg;
        tmp8_reg_1748 <= tmp8_fu_1534_p2;
        tmp_38_10_reg_1683 <= {{grp_fu_207_p2[29:12]}};
        tmp_38_11_reg_1708 <= {{grp_fu_205_p2[29:12]}};
        tmp_38_12_reg_1713 <= {{grp_fu_209_p2[29:12]}};
        tmp_38_13_reg_1698 <= {{grp_fu_202_p2[29:12]}};
        tmp_38_14_reg_1703 <= {{grp_fu_199_p2[29:12]}};
        tmp_38_1_reg_1633 <= {{grp_fu_198_p2[29:12]}};
        tmp_38_2_reg_1638 <= {{grp_fu_200_p2[29:12]}};
        tmp_38_3_reg_1643 <= {{grp_fu_204_p2[29:12]}};
        tmp_38_4_reg_1648 <= {{grp_fu_197_p2[29:12]}};
        tmp_38_5_reg_1653 <= {{grp_fu_201_p2[29:12]}};
        tmp_38_6_reg_1658 <= {{grp_fu_210_p2[29:12]}};
        tmp_38_7_reg_1663 <= {{grp_fu_211_p2[29:12]}};
        tmp_38_8_reg_1668 <= {{grp_fu_203_p2[29:12]}};
        tmp_38_9_reg_1673 <= {{grp_fu_208_p2[29:12]}};
        tmp_38_reg_1628 <= {{grp_fu_206_p2[29:12]}};
        tmp_38_s_reg_1678 <= {{grp_fu_196_p2[29:12]}};
    end
end

always @ (*) begin
    if ((1'b0 == ap_ce_reg)) begin
        ap_return = ap_return_int_reg;
    end else if ((1'b1 == ap_ce_reg)) begin
        ap_return = res_V_write_assign_fu_1543_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_196_ce = 1'b1;
    end else begin
        grp_fu_196_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_197_ce = 1'b1;
    end else begin
        grp_fu_197_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_198_ce = 1'b1;
    end else begin
        grp_fu_198_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_199_ce = 1'b1;
    end else begin
        grp_fu_199_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_200_ce = 1'b1;
    end else begin
        grp_fu_200_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_201_ce = 1'b1;
    end else begin
        grp_fu_201_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_202_ce = 1'b1;
    end else begin
        grp_fu_202_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_203_ce = 1'b1;
    end else begin
        grp_fu_203_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_204_ce = 1'b1;
    end else begin
        grp_fu_204_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_205_ce = 1'b1;
    end else begin
        grp_fu_205_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_206_ce = 1'b1;
    end else begin
        grp_fu_206_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_207_ce = 1'b1;
    end else begin
        grp_fu_207_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_208_ce = 1'b1;
    end else begin
        grp_fu_208_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_209_ce = 1'b1;
    end else begin
        grp_fu_209_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_210_ce = 1'b1;
    end else begin
        grp_fu_210_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_ce_reg))) begin
        grp_fu_211_ce = 1'b1;
    end else begin
        grp_fu_211_ce = 1'b0;
    end
end

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign grp_fu_196_p1 = 30'd13791;

assign grp_fu_197_p1 = 30'd6785;

assign grp_fu_198_p1 = 30'd28359;

assign grp_fu_199_p1 = 30'd1073737806;

assign grp_fu_200_p1 = 30'd1073727505;

assign grp_fu_201_p1 = 30'd16779;

assign grp_fu_202_p1 = 30'd1073723568;

assign grp_fu_203_p1 = 30'd1073718889;

assign grp_fu_204_p1 = 30'd1073733940;

assign grp_fu_205_p1 = 30'd1073728176;

assign grp_fu_206_p1 = 30'd4638;

assign grp_fu_207_p1 = 30'd1073731740;

assign grp_fu_208_p1 = 30'd1073714875;

assign grp_fu_209_p1 = 30'd13180;

assign grp_fu_210_p1 = 30'd19364;

assign grp_fu_211_p1 = 30'd5099;

assign res_V_write_assign_fu_1543_p2 = (tmp8_reg_1748 + tmp1_fu_1539_p2);

assign tmp10_fu_1503_p2 = (tmp_38_8_reg_1668 + tmp_38_9_reg_1673);

assign tmp11_fu_1507_p2 = (tmp_38_s_reg_1678 + tmp_38_10_reg_1683);

assign tmp12_fu_1525_p2 = (tmp14_reg_1738 + tmp13_fu_1521_p2);

assign tmp13_fu_1521_p2 = (tmp_38_11_reg_1708 + tmp_38_12_reg_1713);

assign tmp14_fu_1516_p2 = (tmp15_fu_1511_p2 + tmp_38_13_reg_1698);

assign tmp15_fu_1511_p2 = ($signed(tmp_38_14_reg_1703) + $signed(18'd255404));

assign tmp1_fu_1539_p2 = (tmp5_reg_1723_pp0_iter4_reg + tmp2_reg_1718_pp0_iter4_reg);

assign tmp2_fu_1483_p2 = (tmp4_fu_1479_p2 + tmp3_fu_1475_p2);

assign tmp3_fu_1475_p2 = (tmp_38_reg_1628 + tmp_38_1_reg_1633);

assign tmp4_fu_1479_p2 = (tmp_38_2_reg_1638 + tmp_38_3_reg_1643);

assign tmp5_fu_1497_p2 = (tmp7_fu_1493_p2 + tmp6_fu_1489_p2);

assign tmp6_fu_1489_p2 = (tmp_38_4_reg_1648 + tmp_38_5_reg_1653);

assign tmp7_fu_1493_p2 = (tmp_38_6_reg_1658 + tmp_38_7_reg_1663);

assign tmp8_fu_1534_p2 = (tmp12_reg_1743 + tmp9_fu_1530_p2);

assign tmp9_fu_1530_p2 = (tmp11_reg_1733_pp0_iter3_reg + tmp10_reg_1728_pp0_iter3_reg);

endmodule //compute_layer_0_0_1
