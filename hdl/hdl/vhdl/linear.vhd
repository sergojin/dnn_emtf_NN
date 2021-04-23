-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity linear is
port (
    ap_ready : OUT STD_LOGIC;
    data_0_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_1_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_2_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_3_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_4_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_5_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_6_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_7_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_8_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_9_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_10_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_11_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_12_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_13_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_14_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_15_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_16_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_17_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_18_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    data_19_V_read : IN STD_LOGIC_VECTOR (17 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_2 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_3 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_4 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_5 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_6 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_7 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_8 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_9 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_10 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_11 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_12 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_13 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_14 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_15 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_16 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_17 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_18 : OUT STD_LOGIC_VECTOR (17 downto 0);
    ap_return_19 : OUT STD_LOGIC_VECTOR (17 downto 0) );
end;


architecture behav of linear is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_logic_0 : STD_LOGIC := '0';



begin



    ap_ready <= ap_const_logic_1;
    ap_return_0 <= data_0_V_read;
    ap_return_1 <= data_1_V_read;
    ap_return_10 <= data_10_V_read;
    ap_return_11 <= data_11_V_read;
    ap_return_12 <= data_12_V_read;
    ap_return_13 <= data_13_V_read;
    ap_return_14 <= data_14_V_read;
    ap_return_15 <= data_15_V_read;
    ap_return_16 <= data_16_V_read;
    ap_return_17 <= data_17_V_read;
    ap_return_18 <= data_18_V_read;
    ap_return_19 <= data_19_V_read;
    ap_return_2 <= data_2_V_read;
    ap_return_3 <= data_3_V_read;
    ap_return_4 <= data_4_V_read;
    ap_return_5 <= data_5_V_read;
    ap_return_6 <= data_6_V_read;
    ap_return_7 <= data_7_V_read;
    ap_return_8 <= data_8_V_read;
    ap_return_9 <= data_9_V_read;
end behav;
