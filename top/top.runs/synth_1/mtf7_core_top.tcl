# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.runs/synth_1/mtf7_core_top.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

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
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 8
OPTRACE "Creating in-memory project" START { }
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
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
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
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_ap_fixed_ap_fixed_24_14_5_3_0_tanh_config6_s_tanh_tabkb.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/dense_latency_ap_fixed_ap_fixed_config11_0_0_0.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/normalize_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_0_s.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_ap_fixed_ap_fixed_24_14_5_3_0_tanh_config10_s.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/emtfptnn.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/relu_ap_fixed_24_14_5_3_0_ap_uint_8_relu_config12_s.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_ap_fixed_ap_fixed_24_14_5_3_0_tanh_config10_s_tanh_tcud.vhd
  /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/vhdl/tanh_ap_fixed_ap_fixed_24_14_5_3_0_tanh_config6_s.vhd
}
read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2two_lut/eleven2two_lut.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2two_lut/eleven2two_lut_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2nine_lut/eleven2nine_lut.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/top/top.srcs/sources_1/ip/eleven2nine_lut/eleven2nine_lut_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo_clocks.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_ififo/ctoc_ififo_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/inject_mem_64/inject_mem_64.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/inject_mem_64/inject_mem_64_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_board.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_late.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm_in/ctoc_mmcm_in_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_board.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_late.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/usrclk_mmcm/usrclk_mmcm_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/cgn/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

read_ip -quiet /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm.xci
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm_board.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm_late.xdc]
set_property used_in_implementation false [get_files -all /home/sergo/cms-phase2-muon-trigger/projects/dnn_emtf_displayed/hdl/emtf/ctoc_mmcm/ctoc_mmcm_ooc.xdc]

OPTRACE "Adding files" END { }
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

OPTRACE "synth_design" START { }
synth_design -top mtf7_core_top -part xc7vx690tffg1927-2
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef mtf7_core_top.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file mtf7_core_top_utilization_synth.rpt -pb mtf7_core_top_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
