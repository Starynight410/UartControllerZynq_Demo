`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:33 10/24/2022 
// Design Name: 
// Module Name:    dac_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dac_top(
input  											    avmm_clk,
input  											    rst_n,
input												light_wave,
input  [9:0]         						        brightness,

output											    scl_real,
inout												sda
);

dac_controller dac_controller (
.avmm_clk  											(avmm_clk), 
.rst_n  											(rst_n), 
.light_wave										    (light_wave),
.dac_data  										    (brightness), //dac_data
.scl  											    (scl_real), 
.sda  											    (sda)
);

endmodule
