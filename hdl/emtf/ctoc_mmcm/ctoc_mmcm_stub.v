// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue Nov 26 15:50:21 2019
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.6 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub -rename_top ctoc_mmcm -prefix
//               ctoc_mmcm_ ctoc_mmcm_stub.v
// Design      : ctoc_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ctoc_mmcm(clk_625M, clk_125M, reset, input_clk_stopped, 
  locked, clk_125M_in)
/* synthesis syn_black_box black_box_pad_pin="clk_625M,clk_125M,reset,input_clk_stopped,locked,clk_125M_in" */;
  output clk_625M;
  output clk_125M;
  input reset;
  output input_clk_stopped;
  output locked;
  input clk_125M_in;
endmodule
