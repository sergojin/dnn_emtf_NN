-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dense_latency_0_0_0 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    data_0_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_1_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_2_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_3_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_4_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_5_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_6_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_7_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_8_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    data_9_V_read : IN STD_LOGIC_VECTOR (23 downto 0);
    ap_return_0 : OUT STD_LOGIC_VECTOR (11 downto 0);
    ap_return_1 : OUT STD_LOGIC_VECTOR (11 downto 0);
    ap_ce : IN STD_LOGIC );
end;


architecture behav of dense_latency_0_0_0 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv19_2BE91 : STD_LOGIC_VECTOR (18 downto 0) := "0101011111010010001";
    constant ap_const_lv19_6B00C : STD_LOGIC_VECTOR (18 downto 0) := "1101011000000001100";
    constant ap_const_lv19_67142 : STD_LOGIC_VECTOR (18 downto 0) := "1100111000101000010";
    constant ap_const_lv19_63A21 : STD_LOGIC_VECTOR (18 downto 0) := "1100011101000100001";
    constant ap_const_lv19_55A40 : STD_LOGIC_VECTOR (18 downto 0) := "1010101101001000000";
    constant ap_const_lv19_7D842 : STD_LOGIC_VECTOR (18 downto 0) := "1111101100001000010";
    constant ap_const_lv19_55FA2 : STD_LOGIC_VECTOR (18 downto 0) := "1010101111110100010";
    constant ap_const_lv19_62BF5 : STD_LOGIC_VECTOR (18 downto 0) := "1100010101111110101";
    constant ap_const_lv19_77548 : STD_LOGIC_VECTOR (18 downto 0) := "1110111010101001000";
    constant ap_const_lv19_25439 : STD_LOGIC_VECTOR (18 downto 0) := "0100101010000111001";
    constant ap_const_lv19_20482 : STD_LOGIC_VECTOR (18 downto 0) := "0100000010010000010";
    constant ap_const_lv19_51795 : STD_LOGIC_VECTOR (18 downto 0) := "1010001011110010101";
    constant ap_const_lv19_7D9D9 : STD_LOGIC_VECTOR (18 downto 0) := "1111101100111011001";
    constant ap_const_lv19_1C197 : STD_LOGIC_VECTOR (18 downto 0) := "0011100000110010111";
    constant ap_const_lv19_304D4 : STD_LOGIC_VECTOR (18 downto 0) := "0110000010011010100";
    constant ap_const_lv19_C1C2 : STD_LOGIC_VECTOR (18 downto 0) := "0001100000111000010";
    constant ap_const_lv19_66416 : STD_LOGIC_VECTOR (18 downto 0) := "1100110010000010110";
    constant ap_const_lv19_65DDB : STD_LOGIC_VECTOR (18 downto 0) := "1100101110111011011";
    constant ap_const_lv19_13B6 : STD_LOGIC_VECTOR (18 downto 0) := "0000001001110110110";
    constant ap_const_lv19_5A565 : STD_LOGIC_VECTOR (18 downto 0) := "1011010010101100101";
    constant ap_const_lv21_11364 : STD_LOGIC_VECTOR (20 downto 0) := "000010001001101100100";
    constant ap_const_lv21_1FD6D0 : STD_LOGIC_VECTOR (20 downto 0) := "111111101011011010000";
    constant ap_const_lv32_9 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001001";
    constant ap_const_lv32_14 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010100";

    signal trunc_ln203_4_fu_3191_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_4_reg_3397 : STD_LOGIC_VECTOR (20 downto 0);
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal trunc_ln203_5_fu_3195_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_5_reg_3402 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_fu_3255_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_reg_3407 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_594_fu_3261_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_594_reg_3412 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_598_fu_3273_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_598_reg_3417 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_600_fu_3285_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_600_reg_3422 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_603_fu_3291_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_603_reg_3427 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_604_fu_3297_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_604_reg_3432 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_608_fu_3309_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_608_reg_3437 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_610_fu_3321_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_610_reg_3442 : STD_LOGIC_VECTOR (20 downto 0);
    signal mult_13_V_product_fu_154_ap_ready : STD_LOGIC;
    signal mult_13_V_product_fu_154_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_14_V_product_fu_155_ap_ready : STD_LOGIC;
    signal mult_14_V_product_fu_155_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_10_V_product_fu_156_ap_ready : STD_LOGIC;
    signal mult_10_V_product_fu_156_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_11_V_product_fu_157_ap_ready : STD_LOGIC;
    signal mult_11_V_product_fu_157_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_1_V_product_fu_158_ap_ready : STD_LOGIC;
    signal mult_1_V_product_fu_158_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_12_V_product_fu_159_ap_ready : STD_LOGIC;
    signal mult_12_V_product_fu_159_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_7_V_product_fu_160_ap_ready : STD_LOGIC;
    signal mult_7_V_product_fu_160_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_8_V_product_fu_161_ap_ready : STD_LOGIC;
    signal mult_8_V_product_fu_161_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_16_V_product_fu_162_ap_ready : STD_LOGIC;
    signal mult_16_V_product_fu_162_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_3_V_product_fu_163_ap_ready : STD_LOGIC;
    signal mult_3_V_product_fu_163_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_15_V_product_fu_164_ap_ready : STD_LOGIC;
    signal mult_15_V_product_fu_164_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_17_V_product_fu_165_ap_ready : STD_LOGIC;
    signal mult_17_V_product_fu_165_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_0_V_product_fu_166_ap_ready : STD_LOGIC;
    signal mult_0_V_product_fu_166_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_5_V_product_fu_167_ap_ready : STD_LOGIC;
    signal mult_5_V_product_fu_167_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_9_V_product_fu_168_ap_ready : STD_LOGIC;
    signal mult_9_V_product_fu_168_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_2_V_product_fu_169_ap_ready : STD_LOGIC;
    signal mult_2_V_product_fu_169_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_18_V_product_fu_170_ap_ready : STD_LOGIC;
    signal mult_18_V_product_fu_170_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_4_V_product_fu_171_ap_ready : STD_LOGIC;
    signal mult_4_V_product_fu_171_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal mult_6_V_product_fu_172_ap_ready : STD_LOGIC;
    signal mult_6_V_product_fu_172_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal op_V_assign_0_9_1_product_fu_173_ap_ready : STD_LOGIC;
    signal op_V_assign_0_9_1_product_fu_173_ap_return : STD_LOGIC_VECTOR (23 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal trunc_ln203_2_fu_3183_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_fu_3175_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_8_fu_3207_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_6_fu_3199_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_14_fu_3231_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_12_fu_3223_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_10_fu_3215_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_597_fu_3267_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_18_fu_3247_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_16_fu_3239_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_599_fu_3279_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_3_fu_3187_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_1_fu_3179_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_9_fu_3211_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_7_fu_3203_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_15_fu_3235_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_13_fu_3227_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_11_fu_3219_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_607_fu_3303_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln703_fu_3251_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal trunc_ln203_17_fu_3243_p1 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_609_fu_3315_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_595_fu_3327_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_596_fu_3331_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_601_fu_3336_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_605_fu_3346_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_606_fu_3350_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal add_ln703_611_fu_3355_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal p_Val2_s_fu_3340_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal acc_1_V_fu_3359_p2 : STD_LOGIC_VECTOR (20 downto 0);
    signal ap_ce_reg : STD_LOGIC;
    signal ap_return_0_int_reg : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_return_1_int_reg : STD_LOGIC_VECTOR (11 downto 0);

    component product IS
    port (
        ap_ready : OUT STD_LOGIC;
        a_V : IN STD_LOGIC_VECTOR (23 downto 0);
        w_V : IN STD_LOGIC_VECTOR (18 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (23 downto 0) );
    end component;



begin
    mult_13_V_product_fu_154 : component product
    port map (
        ap_ready => mult_13_V_product_fu_154_ap_ready,
        a_V => data_6_V_read,
        w_V => ap_const_lv19_2BE91,
        ap_return => mult_13_V_product_fu_154_ap_return);

    mult_14_V_product_fu_155 : component product
    port map (
        ap_ready => mult_14_V_product_fu_155_ap_ready,
        a_V => data_7_V_read,
        w_V => ap_const_lv19_6B00C,
        ap_return => mult_14_V_product_fu_155_ap_return);

    mult_10_V_product_fu_156 : component product
    port map (
        ap_ready => mult_10_V_product_fu_156_ap_ready,
        a_V => data_5_V_read,
        w_V => ap_const_lv19_67142,
        ap_return => mult_10_V_product_fu_156_ap_return);

    mult_11_V_product_fu_157 : component product
    port map (
        ap_ready => mult_11_V_product_fu_157_ap_ready,
        a_V => data_5_V_read,
        w_V => ap_const_lv19_63A21,
        ap_return => mult_11_V_product_fu_157_ap_return);

    mult_1_V_product_fu_158 : component product
    port map (
        ap_ready => mult_1_V_product_fu_158_ap_ready,
        a_V => data_0_V_read,
        w_V => ap_const_lv19_55A40,
        ap_return => mult_1_V_product_fu_158_ap_return);

    mult_12_V_product_fu_159 : component product
    port map (
        ap_ready => mult_12_V_product_fu_159_ap_ready,
        a_V => data_6_V_read,
        w_V => ap_const_lv19_7D842,
        ap_return => mult_12_V_product_fu_159_ap_return);

    mult_7_V_product_fu_160 : component product
    port map (
        ap_ready => mult_7_V_product_fu_160_ap_ready,
        a_V => data_3_V_read,
        w_V => ap_const_lv19_55FA2,
        ap_return => mult_7_V_product_fu_160_ap_return);

    mult_8_V_product_fu_161 : component product
    port map (
        ap_ready => mult_8_V_product_fu_161_ap_ready,
        a_V => data_4_V_read,
        w_V => ap_const_lv19_62BF5,
        ap_return => mult_8_V_product_fu_161_ap_return);

    mult_16_V_product_fu_162 : component product
    port map (
        ap_ready => mult_16_V_product_fu_162_ap_ready,
        a_V => data_8_V_read,
        w_V => ap_const_lv19_77548,
        ap_return => mult_16_V_product_fu_162_ap_return);

    mult_3_V_product_fu_163 : component product
    port map (
        ap_ready => mult_3_V_product_fu_163_ap_ready,
        a_V => data_1_V_read,
        w_V => ap_const_lv19_25439,
        ap_return => mult_3_V_product_fu_163_ap_return);

    mult_15_V_product_fu_164 : component product
    port map (
        ap_ready => mult_15_V_product_fu_164_ap_ready,
        a_V => data_7_V_read,
        w_V => ap_const_lv19_20482,
        ap_return => mult_15_V_product_fu_164_ap_return);

    mult_17_V_product_fu_165 : component product
    port map (
        ap_ready => mult_17_V_product_fu_165_ap_ready,
        a_V => data_8_V_read,
        w_V => ap_const_lv19_51795,
        ap_return => mult_17_V_product_fu_165_ap_return);

    mult_0_V_product_fu_166 : component product
    port map (
        ap_ready => mult_0_V_product_fu_166_ap_ready,
        a_V => data_0_V_read,
        w_V => ap_const_lv19_7D9D9,
        ap_return => mult_0_V_product_fu_166_ap_return);

    mult_5_V_product_fu_167 : component product
    port map (
        ap_ready => mult_5_V_product_fu_167_ap_ready,
        a_V => data_2_V_read,
        w_V => ap_const_lv19_1C197,
        ap_return => mult_5_V_product_fu_167_ap_return);

    mult_9_V_product_fu_168 : component product
    port map (
        ap_ready => mult_9_V_product_fu_168_ap_ready,
        a_V => data_4_V_read,
        w_V => ap_const_lv19_304D4,
        ap_return => mult_9_V_product_fu_168_ap_return);

    mult_2_V_product_fu_169 : component product
    port map (
        ap_ready => mult_2_V_product_fu_169_ap_ready,
        a_V => data_1_V_read,
        w_V => ap_const_lv19_C1C2,
        ap_return => mult_2_V_product_fu_169_ap_return);

    mult_18_V_product_fu_170 : component product
    port map (
        ap_ready => mult_18_V_product_fu_170_ap_ready,
        a_V => data_9_V_read,
        w_V => ap_const_lv19_66416,
        ap_return => mult_18_V_product_fu_170_ap_return);

    mult_4_V_product_fu_171 : component product
    port map (
        ap_ready => mult_4_V_product_fu_171_ap_ready,
        a_V => data_2_V_read,
        w_V => ap_const_lv19_65DDB,
        ap_return => mult_4_V_product_fu_171_ap_return);

    mult_6_V_product_fu_172 : component product
    port map (
        ap_ready => mult_6_V_product_fu_172_ap_ready,
        a_V => data_3_V_read,
        w_V => ap_const_lv19_13B6,
        ap_return => mult_6_V_product_fu_172_ap_return);

    op_V_assign_0_9_1_product_fu_173 : component product
    port map (
        ap_ready => op_V_assign_0_9_1_product_fu_173_ap_ready,
        a_V => data_9_V_read,
        w_V => ap_const_lv19_5A565,
        ap_return => op_V_assign_0_9_1_product_fu_173_ap_return);





    ap_ce_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            ap_ce_reg <= ap_ce;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001))) then
                add_ln703_594_reg_3412 <= add_ln703_594_fu_3261_p2;
                add_ln703_598_reg_3417 <= add_ln703_598_fu_3273_p2;
                add_ln703_600_reg_3422 <= add_ln703_600_fu_3285_p2;
                add_ln703_603_reg_3427 <= add_ln703_603_fu_3291_p2;
                add_ln703_604_reg_3432 <= add_ln703_604_fu_3297_p2;
                add_ln703_608_reg_3437 <= add_ln703_608_fu_3309_p2;
                add_ln703_610_reg_3442 <= add_ln703_610_fu_3321_p2;
                add_ln703_reg_3407 <= add_ln703_fu_3255_p2;
                trunc_ln203_4_reg_3397 <= trunc_ln203_4_fu_3191_p1;
                trunc_ln203_5_reg_3402 <= trunc_ln203_5_fu_3195_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_ce_reg)) then
                ap_return_0_int_reg <= p_Val2_s_fu_3340_p2(20 downto 9);
                ap_return_1_int_reg <= acc_1_V_fu_3359_p2(20 downto 9);
            end if;
        end if;
    end process;
    acc_1_V_fu_3359_p2 <= std_logic_vector(unsigned(add_ln703_606_fu_3350_p2) + unsigned(add_ln703_611_fu_3355_p2));
    add_ln703_594_fu_3261_p2 <= std_logic_vector(unsigned(trunc_ln203_8_fu_3207_p1) + unsigned(trunc_ln203_6_fu_3199_p1));
    add_ln703_595_fu_3327_p2 <= std_logic_vector(unsigned(trunc_ln203_4_reg_3397) + unsigned(add_ln703_594_reg_3412));
    add_ln703_596_fu_3331_p2 <= std_logic_vector(unsigned(add_ln703_reg_3407) + unsigned(add_ln703_595_fu_3327_p2));
    add_ln703_597_fu_3267_p2 <= std_logic_vector(unsigned(trunc_ln203_14_fu_3231_p1) + unsigned(trunc_ln203_12_fu_3223_p1));
    add_ln703_598_fu_3273_p2 <= std_logic_vector(unsigned(trunc_ln203_10_fu_3215_p1) + unsigned(add_ln703_597_fu_3267_p2));
    add_ln703_599_fu_3279_p2 <= std_logic_vector(unsigned(ap_const_lv21_11364) + unsigned(trunc_ln203_18_fu_3247_p1));
    add_ln703_600_fu_3285_p2 <= std_logic_vector(unsigned(trunc_ln203_16_fu_3239_p1) + unsigned(add_ln703_599_fu_3279_p2));
    add_ln703_601_fu_3336_p2 <= std_logic_vector(unsigned(add_ln703_598_reg_3417) + unsigned(add_ln703_600_reg_3422));
    add_ln703_603_fu_3291_p2 <= std_logic_vector(unsigned(trunc_ln203_3_fu_3187_p1) + unsigned(trunc_ln203_1_fu_3179_p1));
    add_ln703_604_fu_3297_p2 <= std_logic_vector(unsigned(trunc_ln203_9_fu_3211_p1) + unsigned(trunc_ln203_7_fu_3203_p1));
    add_ln703_605_fu_3346_p2 <= std_logic_vector(unsigned(trunc_ln203_5_reg_3402) + unsigned(add_ln703_604_reg_3432));
    add_ln703_606_fu_3350_p2 <= std_logic_vector(unsigned(add_ln703_603_reg_3427) + unsigned(add_ln703_605_fu_3346_p2));
    add_ln703_607_fu_3303_p2 <= std_logic_vector(unsigned(trunc_ln203_15_fu_3235_p1) + unsigned(trunc_ln203_13_fu_3227_p1));
    add_ln703_608_fu_3309_p2 <= std_logic_vector(unsigned(trunc_ln203_11_fu_3219_p1) + unsigned(add_ln703_607_fu_3303_p2));
    add_ln703_609_fu_3315_p2 <= std_logic_vector(signed(ap_const_lv21_1FD6D0) + signed(trunc_ln703_fu_3251_p1));
    add_ln703_610_fu_3321_p2 <= std_logic_vector(unsigned(trunc_ln203_17_fu_3243_p1) + unsigned(add_ln703_609_fu_3315_p2));
    add_ln703_611_fu_3355_p2 <= std_logic_vector(unsigned(add_ln703_608_reg_3437) + unsigned(add_ln703_610_reg_3442));
    add_ln703_fu_3255_p2 <= std_logic_vector(unsigned(trunc_ln203_2_fu_3183_p1) + unsigned(trunc_ln203_fu_3175_p1));
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_return_0_assign_proc : process(p_Val2_s_fu_3340_p2, ap_ce_reg, ap_return_0_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return_0 <= ap_return_0_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return_0 <= p_Val2_s_fu_3340_p2(20 downto 9);
        end if; 
    end process;


    ap_return_1_assign_proc : process(acc_1_V_fu_3359_p2, ap_ce_reg, ap_return_1_int_reg)
    begin
        if ((ap_const_logic_0 = ap_ce_reg)) then 
            ap_return_1 <= ap_return_1_int_reg;
        elsif ((ap_const_logic_1 = ap_ce_reg)) then 
            ap_return_1 <= acc_1_V_fu_3359_p2(20 downto 9);
        end if; 
    end process;

    p_Val2_s_fu_3340_p2 <= std_logic_vector(unsigned(add_ln703_596_fu_3331_p2) + unsigned(add_ln703_601_fu_3336_p2));
    trunc_ln203_10_fu_3215_p1 <= mult_10_V_product_fu_156_ap_return(21 - 1 downto 0);
    trunc_ln203_11_fu_3219_p1 <= mult_11_V_product_fu_157_ap_return(21 - 1 downto 0);
    trunc_ln203_12_fu_3223_p1 <= mult_12_V_product_fu_159_ap_return(21 - 1 downto 0);
    trunc_ln203_13_fu_3227_p1 <= mult_13_V_product_fu_154_ap_return(21 - 1 downto 0);
    trunc_ln203_14_fu_3231_p1 <= mult_14_V_product_fu_155_ap_return(21 - 1 downto 0);
    trunc_ln203_15_fu_3235_p1 <= mult_15_V_product_fu_164_ap_return(21 - 1 downto 0);
    trunc_ln203_16_fu_3239_p1 <= mult_16_V_product_fu_162_ap_return(21 - 1 downto 0);
    trunc_ln203_17_fu_3243_p1 <= mult_17_V_product_fu_165_ap_return(21 - 1 downto 0);
    trunc_ln203_18_fu_3247_p1 <= mult_18_V_product_fu_170_ap_return(21 - 1 downto 0);
    trunc_ln203_1_fu_3179_p1 <= mult_1_V_product_fu_158_ap_return(21 - 1 downto 0);
    trunc_ln203_2_fu_3183_p1 <= mult_2_V_product_fu_169_ap_return(21 - 1 downto 0);
    trunc_ln203_3_fu_3187_p1 <= mult_3_V_product_fu_163_ap_return(21 - 1 downto 0);
    trunc_ln203_4_fu_3191_p1 <= mult_4_V_product_fu_171_ap_return(21 - 1 downto 0);
    trunc_ln203_5_fu_3195_p1 <= mult_5_V_product_fu_167_ap_return(21 - 1 downto 0);
    trunc_ln203_6_fu_3199_p1 <= mult_6_V_product_fu_172_ap_return(21 - 1 downto 0);
    trunc_ln203_7_fu_3203_p1 <= mult_7_V_product_fu_160_ap_return(21 - 1 downto 0);
    trunc_ln203_8_fu_3207_p1 <= mult_8_V_product_fu_161_ap_return(21 - 1 downto 0);
    trunc_ln203_9_fu_3211_p1 <= mult_9_V_product_fu_168_ap_return(21 - 1 downto 0);
    trunc_ln203_fu_3175_p1 <= mult_0_V_product_fu_166_ap_return(21 - 1 downto 0);
    trunc_ln703_fu_3251_p1 <= op_V_assign_0_9_1_product_fu_173_ap_return(21 - 1 downto 0);
end behav;
