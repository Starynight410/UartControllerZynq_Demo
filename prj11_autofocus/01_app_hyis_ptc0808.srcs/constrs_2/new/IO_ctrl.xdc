set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# clock & rst_n

#B35_D18_CLK

set_property PACKAGE_PIN M19 [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]

set_property PACKAGE_PIN M17 [get_ports uart_16550_rxd]
set_property PACKAGE_PIN L17 [get_ports uart_16550_txd]

set_property IOSTANDARD LVCMOS33 [get_ports uart_16550_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports uart_16550_txd]

set_property PACKAGE_PIN P20 [get_ports o_led1]
set_property PACKAGE_PIN P21 [get_ports o_led2]
set_property PACKAGE_PIN K21 [get_ports o_led3]
set_property IOSTANDARD LVCMOS33 [get_ports o_led1]
set_property IOSTANDARD LVCMOS33 [get_ports o_led2]
set_property IOSTANDARD LVCMOS33 [get_ports o_led3]

set_property PACKAGE_PIN R20 [get_ports IIC_scl_io]
set_property PACKAGE_PIN R21 [get_ports IIC_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_sda_io]

set_property PACKAGE_PIN R20 [get_ports IIC_0_0_scl_io]
set_property PACKAGE_PIN R21 [get_ports IIC_0_0_sda_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_0_scl_io]
set_property IOSTANDARD LVCMOS33 [get_ports IIC_0_0_sda_io]
