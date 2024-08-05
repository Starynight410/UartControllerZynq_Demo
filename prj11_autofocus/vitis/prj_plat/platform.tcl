# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct F:\WorkProject\prj11_autofocus\vitis\prj_plat\platform.tcl
# 
# OR launch xsct and run below command.
# source F:\WorkProject\prj11_autofocus\vitis\prj_plat\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {prj_plat}\
-hw {F:\WorkProject\prj11_autofocus\IS_PTC_top.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {F:/WorkProject/prj11_autofocus/vitis}

platform write
platform generate -domains 
platform active {prj_plat}
platform generate
bsp reload
platform generate -domains standalone_domain 
platform active {prj_plat}
bsp reload
platform active {prj_plat}
platform generate
platform active {prj_plat}
platform active {prj_plat}
platform config -updatehw {F:/WorkProject/prj11_autofocus/IS_PTC_top.xsa}
platform config -updatehw {F:/WorkProject/prj11_autofocus/IS_PTC_top.xsa}
platform config -updatehw {E:/prj11_autofocus/IS_PTC_top.xsa}
domain active {zynq_fsbl}
bsp reload
catch {bsp regenerate}
domain active {standalone_domain}
bsp reload
catch {bsp regenerate}
platform clean
platform clean
bsp reload
