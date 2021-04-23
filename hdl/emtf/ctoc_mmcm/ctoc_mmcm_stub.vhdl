-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Tue Nov 26 15:50:21 2019
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.6 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub -rename_top ctoc_mmcm -prefix
--               ctoc_mmcm_ ctoc_mmcm_stub.vhdl
-- Design      : ctoc_mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ctoc_mmcm is
  Port ( 
    clk_625M : out STD_LOGIC;
    clk_125M : out STD_LOGIC;
    reset : in STD_LOGIC;
    input_clk_stopped : out STD_LOGIC;
    locked : out STD_LOGIC;
    clk_125M_in : in STD_LOGIC
  );

end ctoc_mmcm;

architecture stub of ctoc_mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_625M,clk_125M,reset,input_clk_stopped,locked,clk_125M_in";
begin
end;
