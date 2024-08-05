`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:17 11/14/2022 
// Design Name: 
// Module Name:    io_led 
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
module led_test(
input				clk,
input				rst_n,
output  	        led
);

reg [20:0]cnt;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 21'd0;
	else
		cnt <= cnt + 1'b1;
end



assign led = cnt[20];
endmodule
