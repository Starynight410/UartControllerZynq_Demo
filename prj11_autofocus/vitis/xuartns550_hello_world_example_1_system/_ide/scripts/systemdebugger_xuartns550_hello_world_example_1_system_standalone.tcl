# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: E:\prj11_autofocus\vitis\xuartns550_hello_world_example_1_system\_ide\scripts\systemdebugger_xuartns550_hello_world_example_1_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source E:\prj11_autofocus\vitis\xuartns550_hello_world_example_1_system\_ide\scripts\systemdebugger_xuartns550_hello_world_example_1_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT2 C3069968ABCD" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT2-C3069968ABCD-23727093-0"}
fpga -file E:/prj11_autofocus/vitis/xuartns550_hello_world_example_1/_ide/bitstream/IS_PTC_top.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw E:/prj11_autofocus/vitis/Prj_platform/export/Prj_platform/hw/IS_PTC_top.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source E:/prj11_autofocus/vitis/xuartns550_hello_world_example_1/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow E:/prj11_autofocus/vitis/xuartns550_hello_world_example_1/Release/xuartns550_hello_world_example_1.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
