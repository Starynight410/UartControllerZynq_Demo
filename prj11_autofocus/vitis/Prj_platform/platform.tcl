# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\prj11_autofocus\vitis\Prj_platform\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\prj11_autofocus\vitis\Prj_platform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {Prj_platform}\
-hw {E:\prj11_autofocus\IS_PTC_top.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {E:/prj11_autofocus/vitis}

platform write
platform generate -domains 
platform active {Prj_platform}
platform generate
catch {platform remove prj_plat}
bsp reload
domain active {zynq_fsbl}
bsp reload
catch {bsp regenerate}
domain active {standalone_domain}
catch {bsp regenerate}
platform generate -domains standalone_domain,zynq_fsbl 
platform clean
platform generate
platform generate -domains standalone_domain 
platform clean
platform generate
platform active {Prj_platform}
bsp reload
bsp reload
platform active {Prj_platform}
platform config -updatehw {E:/prj11_autofocus/IS_PTC_top.xsa}
domain active {zynq_fsbl}
bsp reload
catch {bsp regenerate}
domain active {standalone_domain}
bsp reload
catch {bsp regenerate}
catch {bsp regenerate}
platform clean
platform generate
platform generate -domains standalone_domain 
platform active {Prj_platform}
platform config -updatehw {E:/prj11_autofocus/IS_PTC_top.xsa}
domain active {zynq_fsbl}
bsp reload
catch {bsp regenerate}
domain active {standalone_domain}
bsp reload
catch {bsp regenerate}
platform clean
platform generate
platform generate -domains standalone_domain 
platform active {Prj_platform}
platform config -updatehw {E:/prj11_autofocus/IS_PTC_top.xsa}
domain active {zynq_fsbl}
bsp reload
catch {bsp regenerate}
domain active {standalone_domain}
bsp reload
catch {bsp regenerate}
platform clean
platform generate
