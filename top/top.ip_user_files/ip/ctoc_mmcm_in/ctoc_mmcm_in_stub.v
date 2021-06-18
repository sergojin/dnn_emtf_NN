// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri Jun 18 09:47:03 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_stub.v
// Design      : ctoc_mmcm_in
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module ctoc_mmcm_in(clk_625M, clk_125M, psclk, psen, psincdec, psdone, 
  reset, input_clk_stopped, locked, clk_125M_in)
/* synthesis syn_black_box black_box_pad_pin="clk_625M,clk_125M,psclk,psen,psincdec,psdone,reset,input_clk_stopped,locked,clk_125M_in" */;
  output clk_625M;
  output clk_125M;
  input psclk;
  input psen;
  input psincdec;
  output psdone;
  input reset;
  output input_clk_stopped;
  output locked;
  input clk_125M_in;
endmodule
