----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2022 09:03:44 AM
-- Design Name: 
-- Module Name: emtfnn_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use ieee.std_logic_textio.all; -- require for writing/reading std_logic etc.

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_tb is
end top_tb;

architecture Behavioral of top_tb is

  constant T : time := 8 ns;
  signal clk1 : STD_LOGIC := '0';
  signal reset : STD_LOGIC := '0';
  file input_buf: text;
     
  
    signal input1_0_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_1_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_2_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_3_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_4_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_5_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_6_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_7_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_8_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_9_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_10_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_11_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_12_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_13_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_14_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_15_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_16_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_17_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_18_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_19_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_20_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_21_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_22_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_23_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_24_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_25_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_26_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_27_V : STD_LOGIC_VECTOR (12 downto 0);
    signal input1_28_V : STD_LOGIC_VECTOR (12 downto 0);
    signal layer12_out_0_V : STD_LOGIC_VECTOR (7 downto 0);
    signal layer12_out_0_V_ap_vld :  STD_LOGIC;
    signal layer12_out_1_V : STD_LOGIC_VECTOR (6 downto 0);
    signal layer12_out_1_V_ap_vld : STD_LOGIC;


begin

  
 -- Instantiate unit under test 
  uut : entity work.emtfptnn 
  port map (
    ap_clk => clk1,
    ap_rst => reset,
    ap_start => '1',
    ap_done => open,
    ap_idle => open,
    ap_ready => open,
    input1_0_V => input1_0_V,
    input1_1_V => input1_1_V,
    input1_2_V => input1_2_V,
    input1_3_V => input1_3_V,
    input1_4_V => input1_4_V,
    input1_5_V => input1_5_V,
    input1_6_V => input1_6_V,
    input1_7_V => input1_7_V,
    input1_8_V => input1_8_V,
    input1_9_V => input1_9_V,
    input1_10_V => input1_10_V,
    input1_11_V => input1_11_V,
    input1_12_V => input1_12_V,
    input1_13_V => input1_13_V,
    input1_14_V => input1_14_V,
    input1_15_V => input1_15_V,
    input1_16_V => input1_16_V,
    input1_17_V => input1_17_V,
    input1_18_V => input1_18_V,
    input1_19_V => input1_19_V,
    input1_20_V => input1_20_V,
    input1_21_V => input1_21_V,
    input1_22_V => input1_22_V,
    input1_23_V => input1_23_V,
    input1_24_V => input1_24_V,
    input1_25_V => input1_25_V,
    input1_26_V => input1_26_V,
    input1_27_V => input1_27_V,
    input1_28_V => input1_28_V,
    layer12_out_0_V => layer12_out_0_V,
    layer12_out_1_V => layer12_out_1_V,
    layer12_out_0_V_ap_vld => layer12_out_0_V_ap_vld,
    layer12_out_1_V_ap_vld => layer12_out_1_V_ap_vld
    );

   clk1 <= not clk1 after T/2;
   
   process   
     variable read_col_from_input_buf : line;
     variable col1: std_logic_vector(376 downto 0);                                      

     
   begin 
    file_open(input_buf, "/home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/read_file_ex.txt",  read_mode); 
    while not endfile(input_buf) loop
      readline(input_buf, read_col_from_input_buf);
      read(read_col_from_input_buf, col1);
    
      input1_0_V  <= col1(12 downto 0);
      input1_1_V  <= col1(25 downto 13);
      input1_2_V  <= col1(38 downto 26);
      input1_3_V  <= col1(51 downto 39);
      input1_4_V  <= col1(64 downto 52);
      input1_5_V  <= col1(77 downto 65);
      input1_6_V  <= col1(90 downto 78);
      input1_7_V  <= col1(103 downto 91);
      input1_8_V  <= col1(116 downto 104);
      input1_9_V  <= col1(129 downto 117);
      input1_10_V  <= col1(142 downto 130);
      input1_11_V  <= col1(155 downto 143);
      input1_12_V  <= col1(168 downto 156);
      input1_13_V  <= col1(181 downto 169);
      input1_14_V  <= col1(194 downto 182);
      input1_15_V  <= col1(207 downto 195);
      input1_16_V  <= col1(220 downto 208);
      input1_17_V  <= col1(233 downto 221);
      input1_18_V  <= col1(246 downto 234);
      input1_19_V  <= col1(259 downto 247);
      input1_20_V  <= col1(272 downto 260);
      input1_21_V  <= col1(285 downto 273);
      input1_22_V  <= col1(298 downto 286);
      input1_23_V  <= col1(311 downto 299);
      input1_24_V  <= col1(324 downto 312);
      input1_25_V  <= col1(337 downto 325);
      input1_26_V  <= col1(350 downto 338);
      input1_27_V  <= col1(363 downto 351);
      input1_28_V  <= col1(376 downto 364);
      wait for T;
    end loop;
    
    file_close(input_buf);
  end process;
  
    
end Behavioral;