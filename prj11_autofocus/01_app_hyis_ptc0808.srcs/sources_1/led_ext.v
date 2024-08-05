`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:14:05 01/04/2023 
// Design Name: 
// Module Name:    led_ext 
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
module led_ext(
input							clk,
input							rst_n,
input  						    signal_in,
input			[3:0]			work_mode,
output reg      			    led_state_o
    );

wire					state_stop;
reg  [27:0]			    cnt;
    
reg  [15:0]			    signal_cache;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		signal_cache <= 16'd0;
	else
		signal_cache <= {signal_cache[14:0],signal_in};
end

assign state_stop = (cnt >= 28'd4_999_900) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt <= 28'd0;
   else if(signal_cache == 16'hFFFF)
		cnt <= 28'd0;
	else if(cnt > 28'd5_000_000)
		cnt <= cnt;
	else
		cnt <= cnt + 1'b1;
end

reg [27:0] cnt_1s;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		cnt_1s <= 28'd0;
	else if(cnt_1s > 28'd5_000_000)
		cnt_1s <= 28'd0;
	else
		cnt_1s <= cnt_1s + 1'b1;
end 

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		led_state_o <= 1'b0; 
	else if(work_mode == 4'd1)
		led_state_o <= signal_in;
	else
	begin
		if(state_stop)
			led_state_o <= 1'b0;
		else
			led_state_o <= (cnt_1s > 28'd2_500_000) ? 1'b0 : 1'b1;
	end
end

endmodule
