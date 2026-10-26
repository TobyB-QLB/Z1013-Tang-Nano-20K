# build.tcl -- the Z1013 for the Arty A7-100T: `make bitstream` (vivado -mode batch -source vivado/build.tcl, run
# in build/).  The machine is the project's own src/ files; rtl/ is the Arty wrapper (generated Verilog); the paths
# are relative to this script.
set here [file dirname [file normalize [info script]]]
set arty [file normalize $here/..]
set src  [file normalize $here/../..]
create_project -force -name top -part xc7a100tcsg324-1
set_msg_config -id {Common 17-55} -new_severity {Warning}
set_param general.maxThreads 8

read_verilog $arty/rtl/z1013_arty.v
read_verilog $arty/rtl/top.v
read_xdc $arty/constr/top.xdc

read_vhdl -vhdl2008 -library work $src/t80/T80_Pack.vhd
read_vhdl -vhdl2008 -library work $src/t80/T80_ALU.vhd
read_vhdl -vhdl2008 -library work $src/t80/T80_MCode.vhd
read_vhdl -vhdl2008 -library work $src/t80/T80_Reg.vhd
read_vhdl -vhdl2008 -library work $src/t80/T80.vhd
read_vhdl -vhdl2008 -library work $src/t80/T80se.vhd
read_vhdl -vhdl2008 -library work $src/z80_core_wrapper.vhd
read_vhdl -vhdl2008 -library work $src/main_ram.vhd
read_vhdl -vhdl2008 -library work $src/video_ram.vhd
read_vhdl -vhdl2008 -library work $src/color_ram.vhd
read_vhdl -vhdl2008 -library work $src/font_rom.vhd
read_vhdl -vhdl2008 -library work $src/sector_buffer.vhd
read_vhdl -vhdl2008 -library work $src/sd_spi_block_reader.vhd
read_vhdl -vhdl2008 -library work $src/ps2_keyboard.vhd
read_vhdl -vhdl2008 -library work $src/usb_keyboard.vhd
read_vhdl -vhdl2008 -library work $src/dual_keyboard.vhd
read_vhdl -vhdl2008 -library work $arty/rtl/Gowin_Z1013_ROM.vhd
read_vhdl -vhdl2008 -library work $src/testpattern.vhd
read_verilog -sv $src/hdmi_audio/ted_sound_core.sv

synth_design -top top -part xc7a100tcsg324-1
set l8_sync0 [get_cells -hier -regexp {.*_sync0_reg(\[[0-9]+\])?$}]
if {[llength $l8_sync0] > 0} {
  set_property ASYNC_REG TRUE $l8_sync0
  set_property ASYNC_REG TRUE [get_cells -hier -regexp {.*_sync1_reg(\[[0-9]+\])?$}]
  foreach l8_c $l8_sync0 {
    set l8_ck [get_clocks -of_objects [get_pins -of_objects $l8_c -filter {REF_PIN_NAME == C}]]
    if {[llength $l8_ck] > 0} { set_max_delay -datapath_only -from [get_clocks] -to $l8_c [get_property PERIOD [lindex $l8_ck 0]] }
  }
}
report_utilization -file top_utilization_synth.rpt
write_checkpoint -force top_synth.dcp

opt_design
# the previous route as the reference: what did not change keeps its place
write_checkpoint -force top_opt.dcp
set l8_quick [info exists ::env(L8_QUICK)]
set l8_incr [expr {[file exists top_route.dcp] && !$l8_quick}]
set l8_pd {}
set l8_rd {}
if {$l8_quick} { puts "L8_QUICK: an iteration bitstream -- a fresh placement, no physical optimization" }
if {$l8_incr} { read_checkpoint -incremental top_route.dcp }
if {[catch {place_design {*}$l8_pd} l8_err]} {
  if {!$l8_incr} { error $l8_err }
  puts "incremental placement failed -- placing from scratch: $l8_err"
  close_design
  open_checkpoint top_opt.dcp
  place_design {*}$l8_pd
  set l8_incr 0
}
if {!$l8_quick} {
  set l8_wns [get_property SLACK [get_timing_paths -max_paths 1 -setup]]
  if {$l8_wns ne "" && $l8_wns < 0} {
    puts "setup is missed by $l8_wns ns after placement -- post-place physical optimization"
    phys_opt_design -directive AggressiveExplore
  }
}
if {[catch {route_design {*}$l8_rd} l8_err]} {
  if {!$l8_incr} { error $l8_err }
  puts "routing after the incremental placement failed -- placing and routing from scratch: $l8_err"
  close_design
  open_checkpoint top_opt.dcp
  place_design {*}$l8_pd
  route_design {*}$l8_rd
}
for {set l8_k 0} {$l8_k < 3 && !$l8_quick} {incr l8_k} {
  set l8_wns [get_property SLACK [get_timing_paths -max_paths 1 -setup]]
  if {$l8_wns eq "" || $l8_wns >= 0} break
  puts "setup is missed by $l8_wns ns after routing -- post-route physical optimization, round $l8_k"
  phys_opt_design -directive AggressiveExplore
}
for {set l8_k 0} {$l8_k < 2} {incr l8_k} {
  set l8_whs [get_property SLACK [get_timing_paths -max_paths 1 -hold]]
  if {$l8_whs eq "" || $l8_whs >= 0} break
  puts "hold is missed by $l8_whs ns after routing -- the hold repair, round $l8_k"
  phys_opt_design -directive AggressiveExplore
}
report_timing_summary -file top_timing.rpt
report_utilization -file top_utilization.rpt
write_checkpoint -force top_route.dcp

write_bitstream -force top.bit
exit
