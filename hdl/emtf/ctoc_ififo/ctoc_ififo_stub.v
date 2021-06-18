// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Fri Jun 18 09:47:50 2021
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo_stub.v
// Design      : ctoc_ififo
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_5,Vivado 2020.1" *)
module ctoc_ififo(rst, wr_clk, rd_clk, din, wr_en, rd_en, dout, full, 
  empty, valid)
/* synthesis syn_black_box black_box_pad_pin="rst,wr_clk,rd_clk,din[68:0],wr_en,rd_en,dout[68:0],full,empty,valid" */;
  input rst;
  input wr_clk;
  input rd_clk;
  input [68:0]din;
  input wr_en;
  input rd_en;
  output [68:0]dout;
  output full;
  output empty;
  output valid;
endmodule
