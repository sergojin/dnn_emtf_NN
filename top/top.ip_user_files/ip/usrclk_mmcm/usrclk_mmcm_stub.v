// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Tue Nov 26 15:50:21 2019
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.6 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub -rename_top usrclk_mmcm -prefix
//               usrclk_mmcm_ usrclk_mmcm_stub.v
// Design      : usrclk_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module usrclk_mmcm(CLK_OUT1, CLK_OUT2, CLK_OUT3, CLK_OUT4, CLK_OUT5, 
  CLK_OUT6, PSCLK, PSEN, PSINCDEC, PSDONE, RESET, LOCKED, CLK_IN1)
/* synthesis syn_black_box black_box_pad_pin="CLK_OUT1,CLK_OUT2,CLK_OUT3,CLK_OUT4,CLK_OUT5,CLK_OUT6,PSCLK,PSEN,PSINCDEC,PSDONE,RESET,LOCKED,CLK_IN1" */;
  output CLK_OUT1;
  output CLK_OUT2;
  output CLK_OUT3;
  output CLK_OUT4;
  output CLK_OUT5;
  output CLK_OUT6;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  output PSDONE;
  input RESET;
  output LOCKED;
  input CLK_IN1;
endmodule
