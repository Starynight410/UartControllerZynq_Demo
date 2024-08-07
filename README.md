利用Uart实现PC与Zynq PS端的数据交互，工程包含两部分：FPGA程序+上位机。

#开发环境

Vivado/Vitis 2022.2

#实现功能

该项目搭建了基于Zynq的Uart数据收发系统，在PS端实现控制LED的亮灭、SPI发送、IIC读写EEPROM，并通过PL端进行结果验证；上位机端实现了串口功能、SPI参数配置、LED控制。此项目可用作原型系统实现PC和PS端更复杂的数据交互。

整体系统如下：
![image](./image/systembd.png)

对其中的SPI发送进行测试，上位机配置参数分别为：1、2、3，配置数据SPI发送的ila结果：
![image](./image/test.png)
