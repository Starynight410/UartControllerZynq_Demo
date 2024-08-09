`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/07 14:51:42
// Design Name: 
// Module Name: spi_process
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module spi_process#(
    parameter 				P_DATA_IN_WIDTH			=	1, //输入数据位宽
    parameter 				P_DATA_TEMP_WIDTH  		=   8  //输出数据位宽
)(
    input           clk,
    input           rst_n,
    
    // signal from ps
    input           SPI0_MOSI_O,    
    input           SPI0_SCLK_O,
    input           SPI0_SS_O,
    
    // signal to ps
    output          SPI0_MISO_I,    
    output          SPI0_SCLK_I,
    output          SPI0_SS_I
    
);

wire valid_i;
wire [7:0] data_i;
wire valid_o;
wire [7:0] data_o;

assign valid_o = valid_i;
assign data_o = data_i * 2; // 写入数据x2输出

// PL端实现spi数据收发
spi_receive#(
		.P_DATA_IN_WIDTH(P_DATA_IN_WIDTH),
		.P_DATA_TEMP_WIDTH(P_DATA_TEMP_WIDTH)
)spi_receive(
    .clk            (clk),
    .rst_n          (rst_n),
    .SPI0_MOSI_O    (SPI0_MOSI_O),
    .SPI0_SCLK_O    (SPI0_SCLK_O),
    .SPI0_SS_O      (SPI0_SS_O),
    .valid          (valid_i),
    .dout           (data_i)
);

spi_send#(
		.P_DATA_IN_WIDTH(P_DATA_IN_WIDTH),
		.P_DATA_TEMP_WIDTH(P_DATA_TEMP_WIDTH)
)spi_send(
    .clk            (clk),
    .rst_n          (rst_n),
    .valid          (valid_o),
    .data_i         (data_o),
    .SPI0_MISO_I    (SPI0_MISO_I),
    .SPI0_SCLK_I    (SPI0_SCLK_I),
    .SPI0_SS_I      (SPI0_SS_I)
);

endmodule