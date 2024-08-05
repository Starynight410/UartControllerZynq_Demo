`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:48 12/26/2022 
// Design Name: 
// Module Name:    GPO_func_select 
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
module GPO_func_select(
input										clk,
input										rst_n,
input  		[7:0]						    GPO_function,
input  		[7:0]						    GPO_func_wave,
input	 									step_end_valid,

input       [3:0]						    work_mode,

output reg 	[7:0]						    GPO_out
);

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[0] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd1))
		GPO_out[0]   <= step_end_valid;
	else
		GPO_out[0]   <= GPO_func_wave[0];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[1] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd2))
		GPO_out[1]   <= step_end_valid;
	else
		GPO_out[1]   <= GPO_func_wave[1];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[2] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd3))
		GPO_out[2]   <= step_end_valid;
	else
		GPO_out[2]   <= GPO_func_wave[2];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[3] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd4))
		GPO_out[3]   <= step_end_valid;
	else
		GPO_out[3]   <= GPO_func_wave[3];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[4] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd5))
		GPO_out[4]   <= step_end_valid;
	else
		GPO_out[4]   <= GPO_func_wave[4];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[5] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd6))
		GPO_out[5]   <= step_end_valid;
	else
		GPO_out[5]   <= GPO_func_wave[5];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[6] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd7))
		GPO_out[6]   <= step_end_valid;
	else
		GPO_out[6]   <= GPO_func_wave[6];
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_out[7] <= 1'b0;
	else if((work_mode >= 4'd2) && (GPO_function == 8'd8))
		GPO_out[7]   <= step_end_valid;
	else
		GPO_out[7]   <= GPO_func_wave[7];
end

endmodule
