# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7vx690tffg1927-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.cache/wt [current_project]
set_property parent.project_path /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_repo_paths /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/user_ip_repo [current_project]
update_ip_catalog
set_property ip_output_repo /data/rrivera/ML_muon_trigger/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/my_coe.coe
add_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/my_coe_10mu.coe
add_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/my_coe_10mu_Nov13.coe
add_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/coe_i39_30_25_20.coe
add_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/conv11to8.coe
add_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/conv11to2.coe
add_files /home/sergo/cms-phase2-muon-trigger/software/gen_displayed_port_vhdl/conv11to2.coe
add_files /home/sergo/cms-phase2-muon-trigger/software/gen_displayed_port_vhdl/conv11to8.coe
read_verilog -library xil_defaultlib -sv {
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/core_params_axi.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/register_bank.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/mtf7_core_top.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/core/vppc_macros.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/inject_mem_axi.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/control_to_core_axi.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/interfaces.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/core/spbits.sv
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/emtf_core.src/services/axi_or_mux.sv
}
read_vhdl -library xil_defaultlib {
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/test_algo.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_24s_11ns_34_4_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_24s_15ns_37_4_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_24s_12ns_35_4_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_24s_13ns_36_4_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_mul_18s_24s_37_3_1.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_tanh_table1.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/normalize_0_0_0_0_0_2.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_0_0_0_2.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_16ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_12ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_9ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/product.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_24s_14ns_37_4_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_8ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_15ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_0_0_0_s.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/normalize_0_0_0_0_0_1.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_10ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_2.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_7ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_0_0_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_0_0_0_1.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/normalize_0_0_0_0_0_3.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_1_tanh_table7.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_2_tanh_table4.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/myproject_mul_13ns_18s_24_2_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_1.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/normalize_0_0_0_0_0_s.vhd
}
read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm_board.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm_late.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/inject_mem_64/inject_mem_64.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/inject_mem_64/inject_mem_64_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_board.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_late.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_board.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_late.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2nine_lut/eleven2nine_lut.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2nine_lut/eleven2nine_lut_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2two_lut/eleven2two_lut.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2two_lut/eleven2two_lut_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/mtf7_core_impl.xdc
set_property used_in_implementation false [get_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/mtf7_core_impl.xdc]

read_xdc /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/mtf7_core_synth.xdc
set_property used_in_implementation false [get_files /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/mtf7_core_synth.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top mtf7_core_top -part xc7vx690tffg1927-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mtf7_core_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mtf7_core_top_utilization_synth.rpt -pb mtf7_core_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
