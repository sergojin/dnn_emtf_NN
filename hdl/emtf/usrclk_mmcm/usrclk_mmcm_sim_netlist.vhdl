-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Fri Jun 18 09:46:59 2021
-- Host        : correlator2.fnal.gov running 64-bit Scientific Linux release 7.9 (Nitrogen)
-- Command     : write_vhdl -force -mode funcsim
--               /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_sim_netlist.vhdl
-- Design      : usrclk_mmcm
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx690tffg1927-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity usrclk_mmcm_usrclk_mmcm_clk_wiz is
  port (
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
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of usrclk_mmcm_usrclk_mmcm_clk_wiz : entity is "usrclk_mmcm_clk_wiz";
end usrclk_mmcm_usrclk_mmcm_clk_wiz;

architecture STRUCTURE of usrclk_mmcm_usrclk_mmcm_clk_wiz is
  signal CLK_OUT1_usrclk_mmcm : STD_LOGIC;
  signal CLK_OUT2_usrclk_mmcm : STD_LOGIC;
  signal CLK_OUT3_usrclk_mmcm : STD_LOGIC;
  signal CLK_OUT4_usrclk_mmcm : STD_LOGIC;
  signal CLK_OUT5_usrclk_mmcm : STD_LOGIC;
  signal CLK_OUT6_usrclk_mmcm : STD_LOGIC;
  signal clkfbout_buf_usrclk_mmcm : STD_LOGIC;
  signal clkfbout_usrclk_mmcm : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_mmcm_adv_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkf_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout1_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout2_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout3_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout4_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout5_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of clkout6_buf : label is "PRIMITIVE";
  attribute BOX_TYPE of mmcm_adv_inst : label is "PRIMITIVE";
begin
clkf_buf: unisim.vcomponents.BUFG
     port map (
      I => clkfbout_usrclk_mmcm,
      O => clkfbout_buf_usrclk_mmcm
    );
clkout1_buf: unisim.vcomponents.BUFG
     port map (
      I => CLK_OUT1_usrclk_mmcm,
      O => CLK_OUT1
    );
clkout2_buf: unisim.vcomponents.BUFG
     port map (
      I => CLK_OUT2_usrclk_mmcm,
      O => CLK_OUT2
    );
clkout3_buf: unisim.vcomponents.BUFG
     port map (
      I => CLK_OUT3_usrclk_mmcm,
      O => CLK_OUT3
    );
clkout4_buf: unisim.vcomponents.BUFG
     port map (
      I => CLK_OUT4_usrclk_mmcm,
      O => CLK_OUT4
    );
clkout5_buf: unisim.vcomponents.BUFG
     port map (
      I => CLK_OUT5_usrclk_mmcm,
      O => CLK_OUT5
    );
clkout6_buf: unisim.vcomponents.BUFG
     port map (
      I => CLK_OUT6_usrclk_mmcm,
      O => CLK_OUT6
    );
mmcm_adv_inst: unisim.vcomponents.MMCME2_ADV
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_MULT_F => 20.000000,
      CLKFBOUT_PHASE => 0.000000,
      CLKFBOUT_USE_FINE_PS => false,
      CLKIN1_PERIOD => 25.000000,
      CLKIN2_PERIOD => 0.000000,
      CLKOUT0_DIVIDE_F => 5.000000,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_USE_FINE_PS => false,
      CLKOUT1_DIVIDE => 20,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_USE_FINE_PS => false,
      CLKOUT2_DIVIDE => 8,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_USE_FINE_PS => false,
      CLKOUT3_DIVIDE => 7,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_USE_FINE_PS => false,
      CLKOUT4_CASCADE => false,
      CLKOUT4_DIVIDE => 2,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_USE_FINE_PS => false,
      CLKOUT5_DIVIDE => 3,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_USE_FINE_PS => false,
      CLKOUT6_DIVIDE => 1,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_USE_FINE_PS => false,
      COMPENSATION => "ZHOLD",
      DIVCLK_DIVIDE => 1,
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 10000,
      STARTUP_WAIT => false
    )
        port map (
      CLKFBIN => clkfbout_buf_usrclk_mmcm,
      CLKFBOUT => clkfbout_usrclk_mmcm,
      CLKFBOUTB => NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED,
      CLKFBSTOPPED => NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => CLK_IN1,
      CLKIN2 => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => CLK_OUT1_usrclk_mmcm,
      CLKOUT0B => NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED,
      CLKOUT1 => CLK_OUT2_usrclk_mmcm,
      CLKOUT1B => NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED,
      CLKOUT2 => CLK_OUT3_usrclk_mmcm,
      CLKOUT2B => NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED,
      CLKOUT3 => CLK_OUT4_usrclk_mmcm,
      CLKOUT3B => NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED,
      CLKOUT4 => CLK_OUT5_usrclk_mmcm,
      CLKOUT5 => CLK_OUT6_usrclk_mmcm,
      CLKOUT6 => NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_mmcm_adv_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_mmcm_adv_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => LOCKED,
      PSCLK => PSCLK,
      PSDONE => PSDONE,
      PSEN => PSEN,
      PSINCDEC => PSINCDEC,
      PWRDWN => '0',
      RST => RESET
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity usrclk_mmcm is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of usrclk_mmcm : entity is true;
end usrclk_mmcm;

architecture STRUCTURE of usrclk_mmcm is
begin
inst: entity work.usrclk_mmcm_usrclk_mmcm_clk_wiz
     port map (
      CLK_IN1 => CLK_IN1,
      CLK_OUT1 => CLK_OUT1,
      CLK_OUT2 => CLK_OUT2,
      CLK_OUT3 => CLK_OUT3,
      CLK_OUT4 => CLK_OUT4,
      CLK_OUT5 => CLK_OUT5,
      CLK_OUT6 => CLK_OUT6,
      LOCKED => LOCKED,
      PSCLK => PSCLK,
      PSDONE => PSDONE,
      PSEN => PSEN,
      PSINCDEC => PSINCDEC,
      RESET => RESET
    );
end STRUCTURE;
