// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Sun Jun 28 22:31:23 2020
// Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.8 (Nitrogen)
// Command     : write_verilog -force -mode synth_stub
//               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2two_lut/eleven2two_lut_stub.v
// Design      : eleven2two_lut
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1927-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_3,Vivado 2019.1" *)
module eleven2two_lut(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[10:0],douta[2:0]" */;
  input clka;
  input [10:0]addra;
  output [2:0]douta;
endmodule
