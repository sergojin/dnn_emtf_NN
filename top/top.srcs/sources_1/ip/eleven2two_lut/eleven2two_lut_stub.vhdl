-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Sun Jun 28 22:31:24 2020
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.8 (Nitrogen)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2two_lut/eleven2two_lut_stub.vhdl
-- Design      : eleven2two_lut
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eleven2two_lut is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 10 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );

end eleven2two_lut;

architecture stub of eleven2two_lut is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[10:0],douta[2:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_3,Vivado 2019.1";
begin
end;
