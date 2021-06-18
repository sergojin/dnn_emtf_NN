-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Jun 18 09:47:03 2021
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_stub.vhdl
-- Design      : ctoc_mmcm_in
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ctoc_mmcm_in is
  Port ( 
    clk_625M : out STD_LOGIC;
    clk_125M : out STD_LOGIC;
    psclk : in STD_LOGIC;
    psen : in STD_LOGIC;
    psincdec : in STD_LOGIC;
    psdone : out STD_LOGIC;
    reset : in STD_LOGIC;
    input_clk_stopped : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_125M_in : in STD_LOGIC
  );

end ctoc_mmcm_in;

architecture stub of ctoc_mmcm_in is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_625M,clk_125M,psclk,psen,psincdec,psdone,reset,input_clk_stopped,locked,clk_125M_in";
begin
end;
