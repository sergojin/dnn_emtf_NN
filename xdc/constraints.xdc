set_property PACKAGE_PIN AT8 [get_ports sys_clk_p]
#set_property IOSTANDARD LVDS [get_ports sys_clk_p]
#set_property IOSTANDARD LVDS [get_ports sys_clk_n]
#set_property DIFF_TERM TRUE [get_ports sys_clk_p]
create_clock -name sys_clk -period 25 -waveform {0 12.5} [get_ports sys_clk_p]

