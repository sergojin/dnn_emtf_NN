create_clock -period 8.000 -name pcie_clk [get_ports pcie_clk]

create_clock -period 8.000 -name ext_clk_in [get_ports ext_clk_in]

create_clock -period 24.000 -name clk40_in_p [get_ports clk40_in_p]


#connect_debug_port u_ila_0/probe2 [get_nets [list {my_test_algo/phi_ME3[0]} {my_test_algo/phi_ME3[1]} {my_test_algo/phi_ME3[2]} {my_test_algo/phi_ME3[3]} {my_test_algo/phi_ME3[4]} {my_test_algo/phi_ME3[5]} {my_test_algo/phi_ME3[6]} {my_test_algo/phi_ME3[7]} {my_test_algo/phi_ME3[8]} {my_test_algo/phi_ME3[9]} {my_test_algo/phi_ME3[10]} {my_test_algo/phi_ME3[11]} {my_test_algo/phi_ME3[12]} {my_test_algo/phi_ME3[13]} {my_test_algo/phi_ME3[14]} {my_test_algo/phi_ME3[15]} {my_test_algo/phi_ME3[16]} {my_test_algo/phi_ME3[17]}]]
#connect_debug_port u_ila_0/probe3 [get_nets [list {my_test_algo/phi_me11[0]} {my_test_algo/phi_me11[1]} {my_test_algo/phi_me11[2]} {my_test_algo/phi_me11[3]} {my_test_algo/phi_me11[4]} {my_test_algo/phi_me11[5]} {my_test_algo/phi_me11[6]} {my_test_algo/phi_me11[7]} {my_test_algo/phi_me11[8]} {my_test_algo/phi_me11[9]} {my_test_algo/phi_me11[10]} {my_test_algo/phi_me11[11]} {my_test_algo/phi_me11[12]} {my_test_algo/phi_me11[13]} {my_test_algo/phi_me11[14]} {my_test_algo/phi_me11[15]} {my_test_algo/phi_me11[16]} {my_test_algo/phi_me11[17]}]]
#connect_debug_port u_ila_0/probe4 [get_nets [list {my_test_algo/phi_ME2[0]} {my_test_algo/phi_ME2[1]} {my_test_algo/phi_ME2[2]} {my_test_algo/phi_ME2[3]} {my_test_algo/phi_ME2[4]} {my_test_algo/phi_ME2[5]} {my_test_algo/phi_ME2[6]} {my_test_algo/phi_ME2[7]} {my_test_algo/phi_ME2[8]} {my_test_algo/phi_ME2[9]} {my_test_algo/phi_ME2[10]} {my_test_algo/phi_ME2[11]} {my_test_algo/phi_ME2[12]} {my_test_algo/phi_ME2[13]} {my_test_algo/phi_ME2[14]} {my_test_algo/phi_ME2[15]} {my_test_algo/phi_ME2[16]} {my_test_algo/phi_ME2[17]}]]
#connect_debug_port u_ila_0/probe5 [get_nets [list {my_test_algo/phi_ME12[0]} {my_test_algo/phi_ME12[1]} {my_test_algo/phi_ME12[2]} {my_test_algo/phi_ME12[3]} {my_test_algo/phi_ME12[4]} {my_test_algo/phi_ME12[5]} {my_test_algo/phi_ME12[6]} {my_test_algo/phi_ME12[7]} {my_test_algo/phi_ME12[8]} {my_test_algo/phi_ME12[9]} {my_test_algo/phi_ME12[10]} {my_test_algo/phi_ME12[11]} {my_test_algo/phi_ME12[12]} {my_test_algo/phi_ME12[13]} {my_test_algo/phi_ME12[14]} {my_test_algo/phi_ME12[15]} {my_test_algo/phi_ME12[16]} {my_test_algo/phi_ME12[17]}]]
#connect_debug_port u_ila_0/probe10 [get_nets [list my_test_algo/vb_phi_ME2]]
#connect_debug_port u_ila_0/probe11 [get_nets [list my_test_algo/vb_phi_ME3]]
#connect_debug_port u_ila_0/probe12 [get_nets [list my_test_algo/vb_phi_me11]]
#connect_debug_port u_ila_0/probe13 [get_nets [list my_test_algo/vb_phi_ME12]]

#create_debug_core u_ila_0 ila
#set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
#set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
#set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
#set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
#set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
#set_property C_INPUT_PIPE_STAGES 6 [get_debug_cores u_ila_0]
#set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
#set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
#set_property port_width 1 [get_debug_ports u_ila_0/clk]
#connect_debug_port u_ila_0/clk [get_nets [list usrclk_mmcm_/inst/CLK_OUT4]]
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
#set_property port_width 18 [get_debug_ports u_ila_0/probe0]
#connect_debug_port u_ila_0/probe0 [get_nets [list {my_test_algo/res_invpt[0]} {my_test_algo/res_invpt[1]} {my_test_algo/res_invpt[2]} {my_test_algo/res_invpt[3]} {my_test_algo/res_invpt[4]} {my_test_algo/res_invpt[5]} {my_test_algo/res_invpt[6]} {my_test_algo/res_invpt[7]} {my_test_algo/res_invpt[8]} {my_test_algo/res_invpt[9]} {my_test_algo/res_invpt[10]} {my_test_algo/res_invpt[11]} {my_test_algo/res_invpt[12]} {my_test_algo/res_invpt[13]} {my_test_algo/res_invpt[14]} {my_test_algo/res_invpt[15]} {my_test_algo/res_invpt[16]} {my_test_algo/res_invpt[17]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
#set_property port_width 18 [get_debug_ports u_ila_0/probe1]
#connect_debug_port u_ila_0/probe1 [get_nets [list {my_test_algo/res_pudiscr[0]} {my_test_algo/res_pudiscr[1]} {my_test_algo/res_pudiscr[2]} {my_test_algo/res_pudiscr[3]} {my_test_algo/res_pudiscr[4]} {my_test_algo/res_pudiscr[5]} {my_test_algo/res_pudiscr[6]} {my_test_algo/res_pudiscr[7]} {my_test_algo/res_pudiscr[8]} {my_test_algo/res_pudiscr[9]} {my_test_algo/res_pudiscr[10]} {my_test_algo/res_pudiscr[11]} {my_test_algo/res_pudiscr[12]} {my_test_algo/res_pudiscr[13]} {my_test_algo/res_pudiscr[14]} {my_test_algo/res_pudiscr[15]} {my_test_algo/res_pudiscr[16]} {my_test_algo/res_pudiscr[17]}]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
#set_property port_width 1 [get_debug_ports u_ila_0/probe2]
#connect_debug_port u_ila_0/probe2 [get_nets [list my_test_algo/data_sel]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
#set_property port_width 1 [get_debug_ports u_ila_0/probe3]
#connect_debug_port u_ila_0/probe3 [get_nets [list my_test_algo/dvDbg3]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
#set_property port_width 1 [get_debug_ports u_ila_0/probe4]
#connect_debug_port u_ila_0/probe4 [get_nets [list my_test_algo/dvOutDbg3]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
#set_property port_width 1 [get_debug_ports u_ila_0/probe5]
#connect_debug_port u_ila_0/probe5 [get_nets [list my_test_algo/ready]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
#set_property port_width 1 [get_debug_ports u_ila_0/probe6]
#connect_debug_port u_ila_0/probe6 [get_nets [list my_test_algo/vb_res_invpt]]
#create_debug_port u_ila_0 probe
#set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
#set_property port_width 1 [get_debug_ports u_ila_0/probe7]
#connect_debug_port u_ila_0/probe7 [get_nets [list my_test_algo/vb_res_pudiscr]]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk200]
