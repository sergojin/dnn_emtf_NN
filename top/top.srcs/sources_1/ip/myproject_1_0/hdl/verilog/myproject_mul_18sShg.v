// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.1
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ==============================================================


`timescale 1 ns / 1 ps

module myproject_mul_18sShg_MulnS_43(clk, ce, a, b, p);
input clk;
input ce;
input signed [18 - 1 : 0] a; // synthesis attribute keep a "true"
input [9 - 1 : 0] b; // synthesis attribute keep b "true"
output[27 - 1 : 0] p;
reg signed [27 - 1 : 0] p;
wire signed [27 - 1 : 0] tmp_product;

assign tmp_product = $signed(a) * $signed({1'b0, b});
always @ (posedge clk) begin
    if (ce) begin
        p <= tmp_product;
    end
end
endmodule

`timescale 1 ns / 1 ps
module myproject_mul_18sShg(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



myproject_mul_18sShg_MulnS_43 myproject_mul_18sShg_MulnS_43_U(
    .clk( clk ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

