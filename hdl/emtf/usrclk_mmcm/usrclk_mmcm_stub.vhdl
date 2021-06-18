-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Jun 18 09:46:59 2021
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_stub.vhdl
-- Design      : usrclk_mmcm
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity usrclk_mmcm is
  Port ( 
    CLK_OUT1 : out STD_LOGIC;
    CLK_OUT2 : out STD_LOGIC;
    CLK_OUT3 : out STD_LOGIC;
    CLK_OUT4 : out STD_LOGIC;
    CLK_OUT5 : out STD_LOGIC;
    CLK_OUT6 : out STD_LOGIC;
    PSCLK : in STD_LOGIC;
    PSEN : in STD_LOGIC;
    PSINCDEC : in STD_LOGIC;
    PSDONE : out STD_LOGIC;
    RESET : in STD_LOGIC;
    LOCKED : out STD_LOGIC;
    CLK_IN1 : in STD_LOGIC
  );

end usrclk_mmcm;

architecture stub of usrclk_mmcm is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_OUT1,CLK_OUT2,CLK_OUT3,CLK_OUT4,CLK_OUT5,CLK_OUT6,PSCLK,PSEN,PSINCDEC,PSDONE,RESET,LOCKED,CLK_IN1";
begin
end;
