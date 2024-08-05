`timescale 1ns / 1ps

module step_pluse_analy(
input																			clk,
input																			rst_n,

input																			cycle_rst,
input                                        					                master_switch,

input			[7:0]														    GPI_after_mul,
input																			soft_ware,

input      		[3:0]														    work_mode,
input      		[7:0]                           					            step_group1,       //reg  第一组多少个step 

input		 	[31:0]													        step_end_time,
    
input			[7:0]													        light_end,
input 		 	[7:0]	 												        light_outputing,

output         															        END_SOF_posedge,
output  reg  	[7:0]														    step_cnt,

output  reg     [9:0]														    ram_addr_rd,
output  reg  	[63:0]	   										                step_pluse,
output      																    step_end_valid,
input											                                start_stop_switch,
input  [7:0]								                                    start_step,
input  [7:0]								                                    stop_step
);

//************************/
//
//    所有光源输出结束
//
//************************/

reg          END_SOF;
reg			 END_SOF_cache;

assign END_SOF_posedge = ~END_SOF_cache & END_SOF;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		END_SOF <= 1'b0;
	else if(light_end == 8'hFF)
		END_SOF <= 1'b1;
	else
		END_SOF <= 1'b0;
end
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		END_SOF_cache <= 1'b0;
	else
		END_SOF_cache <= END_SOF;
end


//************************/
//
//       step count
//
//************************/
wire					GPI_posegde5;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		step_cnt <= 8'd0;
	else if(cycle_rst|GPI_posegde5)
	begin
		if(start_stop_switch)
			step_cnt <= start_step;
		else
			step_cnt <= 8'd0;
	end
	else if(work_mode >= 4'd2 && master_switch)
	begin
		if(start_stop_switch)
		begin
			if(step_cnt >= stop_step)
				step_cnt <= start_step;
			else if(step_cnt <start_step)
				step_cnt <= start_step;
			else if(END_SOF_posedge)
				step_cnt <= step_cnt + 1'b1;
			else
				step_cnt <= step_cnt;
		end
		else
		begin
			if(step_cnt >= step_group1)
				step_cnt <= 8'd0;
			else if(END_SOF_posedge)
				step_cnt <= step_cnt + 1'b1;
			else
				step_cnt <= step_cnt;
		end
	end
	else
		step_cnt <= 8'd0;
end



//************************/
//
//    输出组结束标志脉冲
//
//************************/
(* KEEP="TRUE" *)reg  [31:0] step_end_pluse_time;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		step_end_pluse_time <= 32'd0;
	else if(step_end_pluse_time > step_end_time)
		step_end_pluse_time <= 32'd0;
	else if(step_cnt >= step_group1)
		step_end_pluse_time <= 32'd1;
	else if(step_end_pluse_time >= 32'd1)
		step_end_pluse_time <= step_end_pluse_time + 1'b1;
end

assign step_end_valid = (step_end_pluse_time > 32'd1) ? 1'b1 : 1'b0;
//************************/
//
//    给GPO的step跳转信号
//
//************************/

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		step_pluse <= 64'd0;
	else if(work_mode >= 4'd2)
	begin
		if(light_outputing > 8'd0)
			step_pluse[step_cnt] <= 1'b1;
		else
			step_pluse <= 64'd0;
	end
	else
		step_pluse <= 64'd0;
end


always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		ram_addr_rd <= 10'd0;
	else if(work_mode >= 4'd2)
		ram_addr_rd <= step_cnt<<3;
	else
		ram_addr_rd <= 10'd0;
end



/*************************************
*
*      所有触发源多级缓存、抓取上升沿
*
**************************************/


reg  									GPI_after_mul_cache;
reg  									GPI_after_mul_cache2;
reg  									GPI_after_mul_cache3;

assign  GPI_posegde5 = ~GPI_after_mul_cache3 & GPI_after_mul[4];

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		GPI_after_mul_cache  <= 8'd0;
		GPI_after_mul_cache2 <= 8'd0;
		GPI_after_mul_cache3 <= 8'd0;
	end
	else
	begin
		GPI_after_mul_cache  <= GPI_after_mul[4];
		GPI_after_mul_cache2 <= GPI_after_mul_cache;
		GPI_after_mul_cache3 <= GPI_after_mul_cache2;
	end
end

endmodule
