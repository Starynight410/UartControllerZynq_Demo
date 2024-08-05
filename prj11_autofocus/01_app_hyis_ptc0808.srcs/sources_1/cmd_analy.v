`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:41 11/08/2022 
// Design Name: 
// Module Name:    cmd_analy 
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

`include "addr_cmd.v"

module cmd_analy(
//input									            clk,
input                                               avmm_clk,
input									            rst_n,
	
(* DONT_TOUCH= "TRUE" *)input							                    wr_en,
(* DONT_TOUCH= "TRUE" *)input      [21:0]					                addr,
(* DONT_TOUCH= "TRUE" *)input      [31:0]					                data,
	
(* DONT_TOUCH= "TRUE" *)output     [7:0]					                user_output,
output reg [7:0]					                invert_en_GPO,
	
output reg [3:0]					                work_mode,
output reg							                master_switch,
output reg [7:0]					                main_switch,

output 								                soft_ware,

output reg  						                trigger_polarity_cycle,

output reg [7:0]                                    step_group1,   
output reg [9:0]                                    GPI_group1,     

output reg [7:0]					                GPO_function,

output     [1:0]					                group_switch,

output reg [31:0]					                step_end_time,
output reg 							                cycle_rst,
output reg [31:0]					                db_width_GPI1,
output reg [31:0]					                db_width_GPI2,
output reg [31:0]					                db_width_GPI3,
output reg [31:0]					                db_width_GPI4,
output reg [31:0]					                db_width_GPI5,
output reg [31:0]					                db_width_GPI6,
output reg [31:0]					                db_width_GPI7,
output reg [31:0]					                db_width_GPI8,

output reg [7:0]					                mul_frequency_coefficient_GPI1,
output reg [7:0]					                mul_frequency_coefficient_GPI2,
output reg [7:0]					                mul_frequency_coefficient_GPI3,
output reg [7:0]					                mul_frequency_coefficient_GPI4,
output reg [7:0]					                mul_frequency_coefficient_GPI5,
output reg [7:0]					                mul_frequency_coefficient_GPI6,
output reg [7:0]					                mul_frequency_coefficient_GPI7,
output reg [7:0]					                mul_frequency_coefficient_GPI8,
	
output reg [31:0]					                mul_frequency_period_GPI1,
output reg [31:0]					                mul_frequency_period_GPI2,
output reg [31:0]					                mul_frequency_period_GPI3,
output reg [31:0]					                mul_frequency_period_GPI4,
output reg [31:0]					                mul_frequency_period_GPI5,
output reg [31:0]					                mul_frequency_period_GPI6,
output reg [31:0]					                mul_frequency_period_GPI7,
output reg [31:0]					                mul_frequency_period_GPI8,

output reg [9:0]                                    brightness_light1, 
output reg [9:0]                                    brightness_light2, 
output reg [9:0]                                    brightness_light3, 
output reg [9:0]                                    brightness_light4, 
output reg [9:0]                                    brightness_light5, 
output reg [9:0]                                    brightness_light6, 
output reg [9:0]                                    brightness_light7, 
output reg [9:0]                                    brightness_light8, 

output reg [9:0]                                    contanst_brightness_light1, 
output reg [9:0]                                    contanst_brightness_light2, 
output reg [9:0]                                    contanst_brightness_light3, 
output reg [9:0]                                    contanst_brightness_light4, 
output reg [9:0]                                    contanst_brightness_light5, 
output reg [9:0]                                    contanst_brightness_light6, 
output reg [9:0]                                    contanst_brightness_light7, 
output reg [9:0]                                    contanst_brightness_light8, 

output reg [9:0]                                    GPI_select_light1, 
output reg [9:0]                                    GPI_select_light2, 
output reg [9:0]                                    GPI_select_light3, 
output reg [9:0]                                    GPI_select_light4, 
output reg [9:0]                                    GPI_select_light5, 
output reg [9:0]                                    GPI_select_light6, 
output reg [9:0]                                    GPI_select_light7, 
output reg [9:0]                                    GPI_select_light8, 

output reg [1:0]                                    trigger_polarity_light1, 
output reg [1:0]                                    trigger_polarity_light2, 
output reg [1:0]                                    trigger_polarity_light3, 
output reg [1:0]                                    trigger_polarity_light4, 
output reg [1:0]                                    trigger_polarity_light5, 
output reg [1:0]                                    trigger_polarity_light6, 
output reg [1:0]                                    trigger_polarity_light7, 
output reg [1:0]                                    trigger_polarity_light8, 

output reg [31:0]                                   chx_width_light1, 
output reg [31:0]                                   chx_width_light2, 
output reg [31:0]                                   chx_width_light3, 
output reg [31:0]                                   chx_width_light4, 
output reg [31:0]                                   chx_width_light5, 
output reg [31:0]                                   chx_width_light6, 
output reg [31:0]                                   chx_width_light7, 
output reg [31:0]                                   chx_width_light8,

output reg [31:0] idle_freq_cnt,
output reg [31:0] idle_width_cnt,

output reg [31:0]                                   chx_delay_light1, 
output reg [31:0]                                   chx_delay_light2, 
output reg [31:0]                                   chx_delay_light3, 
output reg [31:0]                                   chx_delay_light4, 
output reg [31:0]                                   chx_delay_light5, 
output reg [31:0]                                   chx_delay_light6, 
output reg [31:0]                                   chx_delay_light7, 
output reg [31:0]                                   chx_delay_light8, 

(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO1,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO2,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO3,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO4,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO5,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO6,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO7,
(* DONT_TOUCH= "TRUE" *)output reg  [7:0]                                   step_mask_standard_GPO8,

output reg [31:0]                                   output_width_GPO1,
output reg [31:0]                                   output_width_GPO2,
output reg [31:0]                                   output_width_GPO3,
output reg [31:0]                                   output_width_GPO4,
output reg [31:0]                                   output_width_GPO5,
output reg [31:0]                                   output_width_GPO6,
output reg [31:0]                                   output_width_GPO7,
output reg [31:0]                                   output_width_GPO8,

output reg [31:0]                                   chx_delay_GPO1,
output reg [31:0]                                   chx_delay_GPO2,
output reg [31:0]                                   chx_delay_GPO3,
output reg [31:0]                                   chx_delay_GPO4,
output reg [31:0]                                   chx_delay_GPO5,
output reg [31:0]                                   chx_delay_GPO6,
output reg [31:0]                                   chx_delay_GPO7,
output reg [31:0]                                   chx_delay_GPO8,

output reg [31:0]                                   intr0_width_cnt,
output reg [31:0]                                   intr1_width_cnt,
output reg [31:0]                                   intr0_period_cnt,
output reg [31:0]                                   intr1_period_cnt,
output reg                                          width_limit_enable,

output reg                                          Out12Ven,
output reg                                          Out24Ven,

output reg                                          In5Ven,
output reg                                          In12Ven,
output reg                                          In24Ven,

output reg [7:0]								    start_step,
output reg [7:0]								    stop_step,
output reg 										    start_stop_switch,

output reg [7:0]                                    Turbo

);

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		db_width_GPI1 <= 32'd0;
		db_width_GPI2 <= 32'd0;
		db_width_GPI3 <= 32'd0;
		db_width_GPI4 <= 32'd0;
		db_width_GPI5 <= 32'd0;
		db_width_GPI6 <= 32'd0;
		db_width_GPI7 <= 32'd0;
		db_width_GPI8 <= 32'd0;
	end
	else if(wr_en)
	begin
		case(addr)
			`DB_WIDTH_GPI1 : db_width_GPI1 <= data;
			`DB_WIDTH_GPI2 : db_width_GPI2 <= data;
			`DB_WIDTH_GPI3 : db_width_GPI3 <= data;
			`DB_WIDTH_GPI4 : db_width_GPI4 <= data;
			`DB_WIDTH_GPI5 : db_width_GPI5 <= data;
			`DB_WIDTH_GPI6 : db_width_GPI6 <= data;
			`DB_WIDTH_GPI7 : db_width_GPI7 <= data;
			`DB_WIDTH_GPI8 : db_width_GPI8 <= data;
			default :;
		endcase
	end
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		mul_frequency_coefficient_GPI1 <= 8'd1;
		mul_frequency_coefficient_GPI2 <= 8'd1;
		mul_frequency_coefficient_GPI3 <= 8'd1;
		mul_frequency_coefficient_GPI4 <= 8'd1;
		mul_frequency_coefficient_GPI5 <= 8'd1;
		mul_frequency_coefficient_GPI6 <= 8'd1;
		mul_frequency_coefficient_GPI7 <= 8'd1;
		mul_frequency_coefficient_GPI8 <= 8'd1;
	end
	else if(wr_en)
	begin
		case(addr)
			`MUL_FREQUENCY_COEFFICIENT_GPI1 : mul_frequency_coefficient_GPI1 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI2 : mul_frequency_coefficient_GPI2 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI3 : mul_frequency_coefficient_GPI3 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI4 : mul_frequency_coefficient_GPI4 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI5 : mul_frequency_coefficient_GPI5 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI6 : mul_frequency_coefficient_GPI6 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI7 : mul_frequency_coefficient_GPI7 <= data[7:0];
			`MUL_FREQUENCY_COEFFICIENT_GPI8 : mul_frequency_coefficient_GPI8 <= data[7:0];
			default :;
		endcase
	end
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		mul_frequency_period_GPI1 <= 32'd0;
		mul_frequency_period_GPI2 <= 32'd0;
		mul_frequency_period_GPI3 <= 32'd0;
		mul_frequency_period_GPI4 <= 32'd0;
		mul_frequency_period_GPI5 <= 32'd0;
		mul_frequency_period_GPI6 <= 32'd0;
		mul_frequency_period_GPI7 <= 32'd0;
		mul_frequency_period_GPI8 <= 32'd0;
	end
	else if(wr_en)
	begin
		case(addr)
			`MUL_FREQUENCY_PERIOD_GPI1 : mul_frequency_period_GPI1 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI2 : mul_frequency_period_GPI2 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI3 : mul_frequency_period_GPI3 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI4 : mul_frequency_period_GPI4 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI5 : mul_frequency_period_GPI5 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI6 : mul_frequency_period_GPI6 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI7 : mul_frequency_period_GPI7 <= data[31:0];
			`MUL_FREQUENCY_PERIOD_GPI8 : mul_frequency_period_GPI8 <= data[31:0];
			default :;
		endcase
	end
end

reg [7:0]   user_output_1;
reg [7:0]   user_output_2;
reg [7:0]   user_output_3;
reg [7:0]   user_output_4;
reg [7:0]   user_output_5;
reg [7:0]   user_output_6;
reg [7:0]   user_output_7;
reg [7:0]   user_output_8;

assign user_output[0] = (user_output_1 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[1] = (user_output_2 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[2] = (user_output_3 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[3] = (user_output_4 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[4] = (user_output_5 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[5] = (user_output_6 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[6] = (user_output_7 > 8'd0) ? 1'b1 : 1'b0;
assign user_output[7] = (user_output_8 > 8'd0) ? 1'b1 : 1'b0;

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_1 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_1))
		user_output_1 <= 8'd10;
	else if(user_output_1 > 8'd0)
        user_output_1 <= user_output_1 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_2 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_2))
		user_output_2 <= 8'd10;
	else if(user_output_2 > 8'd0)
        user_output_2 <= user_output_2 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_3 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_3))
		user_output_3 <= 8'd10;
	else if(user_output_3 > 8'd0)
        user_output_3 <= user_output_3 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_4 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_4))
		user_output_4 <= 8'd10;
	else if(user_output_4 > 8'd0)
        user_output_4 <= user_output_4 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_5 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_5))
		user_output_5 <= 8'd10;
	else if(user_output_5 > 8'd0)
        user_output_5 <= user_output_5 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_6 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_6))
		user_output_6 <= 8'd10;
	else if(user_output_6 > 8'd0)
        user_output_6 <= user_output_6 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_7 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_7))
		user_output_7 <= 8'd10;
	else if(user_output_7 > 8'd0)
        user_output_7 <= user_output_7 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        user_output_8 <= 8'd0;
	else if((wr_en) && (addr == `USER_OUTPUT_8))
		user_output_8 <= 8'd10;
	else if(user_output_8 > 8'd0)
        user_output_8 <= user_output_8 - 1'b1;      
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		invert_en_GPO <= 8'd0;
	else if(wr_en)
	begin
		case(addr)
			`INVERT_EN_GPO1 : invert_en_GPO[0] <= data[0];
			`INVERT_EN_GPO2 : invert_en_GPO[1] <= data[0];
			`INVERT_EN_GPO3 : invert_en_GPO[2] <= data[0];
			`INVERT_EN_GPO4 : invert_en_GPO[3] <= data[0];
			`INVERT_EN_GPO5 : invert_en_GPO[4] <= data[0];
			`INVERT_EN_GPO6 : invert_en_GPO[5] <= data[0];
			`INVERT_EN_GPO7 : invert_en_GPO[6] <= data[0];
			`INVERT_EN_GPO8 : invert_en_GPO[7] <= data[0];
			default :;
		endcase
	end
end


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		work_mode <= 4'd0;
	else if((wr_en) && (addr == `WORK_MODE))
		work_mode <= data[3:0];
end


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		master_switch <= 1'b0;
	else
		master_switch <= 1'b1;
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		main_switch <= 16'd0;
	else if(wr_en)
	begin
		case(addr)
			`MAIN_SWITCH_1  : main_switch[0 ] <= data[0];
			`MAIN_SWITCH_2  : main_switch[1 ] <= data[0];
			`MAIN_SWITCH_3  : main_switch[2 ] <= data[0];
			`MAIN_SWITCH_4  : main_switch[3 ] <= data[0];
			`MAIN_SWITCH_5  : main_switch[4 ] <= data[0];
			`MAIN_SWITCH_6  : main_switch[5 ] <= data[0];
			`MAIN_SWITCH_7  : main_switch[6 ] <= data[0];
			`MAIN_SWITCH_8  : main_switch[7 ] <= data[0];
            default         : main_switch <= main_switch;
		endcase                 
	end
end


reg  soft_ware_cache;
reg  soft_ware_cache2;
reg  soft_ware_cache3;
reg  soft_ware_cache4;
reg  soft_ware_cache5;
assign soft_ware = soft_ware_cache | soft_ware_cache2 | soft_ware_cache3 | soft_ware_cache4 | soft_ware_cache5;

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		soft_ware_cache2 <= 1'b0;
		soft_ware_cache3 <= 1'b0;
        soft_ware_cache4 <= 1'b0;
        soft_ware_cache5 <= 1'b0;
	end
	else
	begin
		soft_ware_cache2 <= soft_ware_cache;
		soft_ware_cache3 <= soft_ware_cache2;
        soft_ware_cache4 <= soft_ware_cache3;
        soft_ware_cache5 <= soft_ware_cache4;
	end
end
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		soft_ware_cache <= 1'b0;
	else if((wr_en) && (addr == `SOFT_WARE))
		soft_ware_cache <= 1'b1;
	else
		soft_ware_cache <= 1'b0;
end


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		step_group1 <= 8'd0; 
	else if((wr_en) && (addr == `STEP_GROUP1))
		step_group1 <= data[7:0];
end


//*******************************
//
//   循环模式的GPI (原8个Group的GPI)
//
//*******************************
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		GPI_group1 <= 10'd1; 
	else if((wr_en) && (addr == `GPI_GROUP1))
		GPI_group1 <= data[9:0]; 
end


////////////组别切换模式
reg   [1:0] group_switch_t;
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		group_switch_t <= 2'd0; 
	else if((wr_en) && (addr == `GROUP_SWITCH))
		group_switch_t <= data[1:0]; 
end

assign group_switch = (work_mode > 4'd1) ? group_switch_t : 2'd0;



always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		cycle_rst <= 1'b0; 
	else if((wr_en) && (addr == `CYCLE_RST))
		cycle_rst <= data[0];
	else
		cycle_rst <= cycle_rst; 
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		step_end_time <= 32'd0;
	else if((wr_en) &&  (addr == `STEP_END_TIME))
		step_end_time <= data;
end



always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_function <= 8'd0;
	else if((wr_en) && (addr == `GPO_FUNCTION))
		GPO_function <= data[7:0];
end



always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		trigger_polarity_cycle <= 1'b0;
	else if((wr_en) &&  (addr == `TRIGGER_POLARITY_CYCLE))
		trigger_polarity_cycle <= data[0];	
end
///////////////////////////////////////////////////////////////
always @(posedge avmm_clk)
begin
	if(!rst_n)
    begin
		brightness_light1 <= 10'd0;
        brightness_light2 <= 10'd0;
        brightness_light3 <= 10'd0;
        brightness_light4 <= 10'd0;
        brightness_light5 <= 10'd0;
        brightness_light6 <= 10'd0;
        brightness_light7 <= 10'd0;
        brightness_light8 <= 10'd0;
    end
	else if(wr_en)
    begin
    case(addr)
        `BRIGHTNESS_LIGHT1 :brightness_light1  <= data[9:0];
        `BRIGHTNESS_LIGHT2 :brightness_light2  <= data[9:0];
        `BRIGHTNESS_LIGHT3 :brightness_light3  <= data[9:0];
        `BRIGHTNESS_LIGHT4 :brightness_light4  <= data[9:0];
        `BRIGHTNESS_LIGHT5 :brightness_light5  <= data[9:0];
        `BRIGHTNESS_LIGHT6 :brightness_light6  <= data[9:0];
        `BRIGHTNESS_LIGHT7 :brightness_light7  <= data[9:0];
        `BRIGHTNESS_LIGHT8 :brightness_light8  <= data[9:0];
        default:;
    endcase
    end
end

always @(posedge avmm_clk)
begin
	if(!rst_n)
    begin
		contanst_brightness_light1 <= 10'd0;
        contanst_brightness_light2 <= 10'd0;
        contanst_brightness_light3 <= 10'd0;
        contanst_brightness_light4 <= 10'd0;
        contanst_brightness_light5 <= 10'd0;
        contanst_brightness_light6 <= 10'd0;
        contanst_brightness_light7 <= 10'd0;
        contanst_brightness_light8 <= 10'd0;
    end
	else if(wr_en)
    begin
    case(addr)
        `BRIGHTNESS_ALL_LIGHT1 : contanst_brightness_light1  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT2 : contanst_brightness_light2  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT3 : contanst_brightness_light3  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT4 : contanst_brightness_light4  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT5 : contanst_brightness_light5  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT6 : contanst_brightness_light6  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT7 : contanst_brightness_light7  <= data[9:0];
        `BRIGHTNESS_ALL_LIGHT8 : contanst_brightness_light8  <= data[9:0];
        default:;
    endcase
    end
end


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		GPI_select_light1  <= 10'd0;
        GPI_select_light2  <= 10'd0;
        GPI_select_light3  <= 10'd0;
        GPI_select_light4  <= 10'd0;
        GPI_select_light5  <= 10'd0;
        GPI_select_light6  <= 10'd0;
        GPI_select_light7  <= 10'd0;
        GPI_select_light8  <= 10'd0;
    end
	else if(wr_en)
    begin
    case(addr)
		`GPI_SECELT_LIGHT1  : GPI_select_light1  <= data[9:0];
        `GPI_SECELT_LIGHT2  : GPI_select_light2  <= data[9:0];
        `GPI_SECELT_LIGHT3  : GPI_select_light3  <= data[9:0];
        `GPI_SECELT_LIGHT4  : GPI_select_light4  <= data[9:0];
        `GPI_SECELT_LIGHT5  : GPI_select_light5  <= data[9:0];
        `GPI_SECELT_LIGHT6  : GPI_select_light6  <= data[9:0];
        `GPI_SECELT_LIGHT7  : GPI_select_light7  <= data[9:0];
        `GPI_SECELT_LIGHT8  : GPI_select_light8  <= data[9:0];
        default:;
    endcase
    end
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		trigger_polarity_light1  <= 2'd0;
        trigger_polarity_light2  <= 2'd0;
        trigger_polarity_light3  <= 2'd0;
        trigger_polarity_light4  <= 2'd0;
        trigger_polarity_light5  <= 2'd0;
        trigger_polarity_light6  <= 2'd0;
        trigger_polarity_light7  <= 2'd0;
        trigger_polarity_light8  <= 2'd0;
    end
	else if(wr_en)
    begin
    case(addr)
        `TRIGGER_POLARITY_LIGHT1  : trigger_polarity_light1  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT2  : trigger_polarity_light2  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT3  : trigger_polarity_light3  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT4  : trigger_polarity_light4  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT5  : trigger_polarity_light5  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT6  : trigger_polarity_light6  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT7  : trigger_polarity_light7  <= data[1:0];
        `TRIGGER_POLARITY_LIGHT8  : trigger_polarity_light8  <= data[1:0];
        default:;
    endcase
    end
end


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		chx_width_light1   <= 32'd0;	
        chx_width_light2   <= 32'd0;
        chx_width_light3   <= 32'd0;
        chx_width_light4   <= 32'd0;
        chx_width_light5   <= 32'd0;	
        chx_width_light6   <= 32'd0;
        chx_width_light7   <= 32'd0;
        chx_width_light8   <= 32'd0;
        width_limit_enable <= 1'b1;
    end
	else if(wr_en)
    begin
    case(addr)
        `CHX_WIDTH_LIGHT1  : chx_width_light1  <= data[31:0];
        `CHX_WIDTH_LIGHT2  : chx_width_light2  <= data[31:0];
        `CHX_WIDTH_LIGHT3  : chx_width_light3  <= data[31:0];
        `CHX_WIDTH_LIGHT4  : chx_width_light4  <= data[31:0];
        `CHX_WIDTH_LIGHT5  : chx_width_light5  <= data[31:0];
        `CHX_WIDTH_LIGHT6  : chx_width_light6  <= data[31:0];
        `CHX_WIDTH_LIGHT7  : chx_width_light7  <= data[31:0];
        `CHX_WIDTH_LIGHT8  : chx_width_light8  <= data[31:0];
        `LIGHT_WIDTH_LIMIT_ENABLE : width_limit_enable <= data[0];
        default:;
    endcase
    end
end


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		chx_delay_light1   <= 32'd0;	
        chx_delay_light2   <= 32'd0;
        chx_delay_light3   <= 32'd0;
        chx_delay_light4   <= 32'd0;
        chx_delay_light5   <= 32'd0;	
        chx_delay_light6   <= 32'd0;
        chx_delay_light7   <= 32'd0;
        chx_delay_light8   <= 32'd0;
    end
	else if(wr_en)
    begin
    case(addr)
        `CHX_DELAY_LIGHT1  : chx_delay_light1  <= data[31:0];
        `CHX_DELAY_LIGHT2  : chx_delay_light2  <= data[31:0];
        `CHX_DELAY_LIGHT3  : chx_delay_light3  <= data[31:0];
        `CHX_DELAY_LIGHT4  : chx_delay_light4  <= data[31:0];
        `CHX_DELAY_LIGHT5  : chx_delay_light5  <= data[31:0];
        `CHX_DELAY_LIGHT6  : chx_delay_light6  <= data[31:0];
        `CHX_DELAY_LIGHT7  : chx_delay_light7  <= data[31:0];
        `CHX_DELAY_LIGHT8  : chx_delay_light8  <= data[31:0];
        default:;
    endcase
    end
end

(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight1; 
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight2;
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight3;
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight4;
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight5;
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight6;
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight7;
(* DONT_TOUCH= "TRUE" *)reg  [7:0]     GPO_LightOrTriggerLight8;

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		GPO_LightOrTriggerLight1 <= 8'd0;
        GPO_LightOrTriggerLight2 <= 8'd0;
        GPO_LightOrTriggerLight3 <= 8'd0;
        GPO_LightOrTriggerLight4 <= 8'd0;
        GPO_LightOrTriggerLight5 <= 8'd0;
        GPO_LightOrTriggerLight6 <= 8'd0;
        GPO_LightOrTriggerLight7 <= 8'd0;
        GPO_LightOrTriggerLight8 <= 8'd0;
    end
	else if(wr_en)
    begin
        case(addr)
            `STEP_MASK_GPO1_STANDARD : GPO_LightOrTriggerLight1 <= data[7:0];
            `STEP_MASK_GPO2_STANDARD : GPO_LightOrTriggerLight2 <= data[7:0];
            `STEP_MASK_GPO3_STANDARD : GPO_LightOrTriggerLight3 <= data[7:0];
            `STEP_MASK_GPO4_STANDARD : GPO_LightOrTriggerLight4 <= data[7:0];
            `STEP_MASK_GPO5_STANDARD : GPO_LightOrTriggerLight5 <= data[7:0];
            `STEP_MASK_GPO6_STANDARD : GPO_LightOrTriggerLight6 <= data[7:0];
            `STEP_MASK_GPO7_STANDARD : GPO_LightOrTriggerLight7 <= data[7:0];
            `STEP_MASK_GPO8_STANDARD : GPO_LightOrTriggerLight8 <= data[7:0];
            default:;
        endcase
    end
end




always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO1 <= 8'd0;
    else
        step_mask_standard_GPO1 <= {GPO_LightOrTriggerLight8[0],GPO_LightOrTriggerLight7[0],GPO_LightOrTriggerLight6[0],GPO_LightOrTriggerLight5[0],GPO_LightOrTriggerLight4[0],GPO_LightOrTriggerLight3[0],GPO_LightOrTriggerLight2[0],GPO_LightOrTriggerLight1[0]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO2 <= 8'd0;
    else
        step_mask_standard_GPO2 <= {GPO_LightOrTriggerLight8[1],GPO_LightOrTriggerLight7[1],GPO_LightOrTriggerLight6[1],GPO_LightOrTriggerLight5[1],GPO_LightOrTriggerLight4[1],GPO_LightOrTriggerLight3[1],GPO_LightOrTriggerLight2[1],GPO_LightOrTriggerLight1[1]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO3 <= 8'd0;
    else
        step_mask_standard_GPO3 <= {GPO_LightOrTriggerLight8[2],GPO_LightOrTriggerLight7[2],GPO_LightOrTriggerLight6[2],GPO_LightOrTriggerLight5[2],GPO_LightOrTriggerLight4[2],GPO_LightOrTriggerLight3[2],GPO_LightOrTriggerLight2[2],GPO_LightOrTriggerLight1[2]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO4 <= 8'd0;
    else
        step_mask_standard_GPO4 <= {GPO_LightOrTriggerLight8[3],GPO_LightOrTriggerLight7[3],GPO_LightOrTriggerLight6[3],GPO_LightOrTriggerLight5[3],GPO_LightOrTriggerLight4[3],GPO_LightOrTriggerLight3[3],GPO_LightOrTriggerLight2[3],GPO_LightOrTriggerLight1[3]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO5 <= 8'd0;
    else
        step_mask_standard_GPO5 <= {GPO_LightOrTriggerLight8[4],GPO_LightOrTriggerLight7[4],GPO_LightOrTriggerLight6[4],GPO_LightOrTriggerLight5[4],GPO_LightOrTriggerLight4[4],GPO_LightOrTriggerLight3[4],GPO_LightOrTriggerLight2[4],GPO_LightOrTriggerLight1[4]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO6 <= 8'd0;
    else
        step_mask_standard_GPO6 <= {GPO_LightOrTriggerLight8[5],GPO_LightOrTriggerLight7[5],GPO_LightOrTriggerLight6[5],GPO_LightOrTriggerLight5[5],GPO_LightOrTriggerLight4[5],GPO_LightOrTriggerLight3[5],GPO_LightOrTriggerLight2[5],GPO_LightOrTriggerLight1[5]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO7 <= 8'd0;
    else
        step_mask_standard_GPO7 <= {GPO_LightOrTriggerLight8[6],GPO_LightOrTriggerLight7[6],GPO_LightOrTriggerLight6[6],GPO_LightOrTriggerLight5[6],GPO_LightOrTriggerLight4[6],GPO_LightOrTriggerLight3[6],GPO_LightOrTriggerLight2[6],GPO_LightOrTriggerLight1[6]};
end

always @(posedge avmm_clk or negedge rst_n)
begin
    if(!rst_n)
        step_mask_standard_GPO8 <= 8'd0;
    else
        step_mask_standard_GPO8 <= {GPO_LightOrTriggerLight8[7],GPO_LightOrTriggerLight7[7],GPO_LightOrTriggerLight6[7],GPO_LightOrTriggerLight5[7],GPO_LightOrTriggerLight4[7],GPO_LightOrTriggerLight3[7],GPO_LightOrTriggerLight2[7],GPO_LightOrTriggerLight1[7]};
end

//assign step_mask_standard_GPO1 = {GPO_LightOrTriggerLight1[0],GPO_LightOrTriggerLight2[0],GPO_LightOrTriggerLight3[0],GPO_LightOrTriggerLight4[0],GPO_LightOrTriggerLight5[0],GPO_LightOrTriggerLight6[0],GPO_LightOrTriggerLight7[0],GPO_LightOrTriggerLight8[0]};
//assign step_mask_standard_GPO2 = {GPO_LightOrTriggerLight1[1],GPO_LightOrTriggerLight2[1],GPO_LightOrTriggerLight3[1],GPO_LightOrTriggerLight4[1],GPO_LightOrTriggerLight5[1],GPO_LightOrTriggerLight6[1],GPO_LightOrTriggerLight7[1],GPO_LightOrTriggerLight8[1]};
//assign step_mask_standard_GPO3 = {GPO_LightOrTriggerLight1[2],GPO_LightOrTriggerLight2[2],GPO_LightOrTriggerLight3[2],GPO_LightOrTriggerLight4[2],GPO_LightOrTriggerLight5[2],GPO_LightOrTriggerLight6[2],GPO_LightOrTriggerLight7[2],GPO_LightOrTriggerLight8[2]};
//assign step_mask_standard_GPO4 = {GPO_LightOrTriggerLight1[3],GPO_LightOrTriggerLight2[3],GPO_LightOrTriggerLight3[3],GPO_LightOrTriggerLight4[3],GPO_LightOrTriggerLight5[3],GPO_LightOrTriggerLight6[3],GPO_LightOrTriggerLight7[3],GPO_LightOrTriggerLight8[3]};
//assign step_mask_standard_GPO5 = {GPO_LightOrTriggerLight1[4],GPO_LightOrTriggerLight2[4],GPO_LightOrTriggerLight3[4],GPO_LightOrTriggerLight4[4],GPO_LightOrTriggerLight5[4],GPO_LightOrTriggerLight6[4],GPO_LightOrTriggerLight7[4],GPO_LightOrTriggerLight8[4]};
//assign step_mask_standard_GPO6 = {GPO_LightOrTriggerLight1[5],GPO_LightOrTriggerLight2[5],GPO_LightOrTriggerLight3[5],GPO_LightOrTriggerLight4[5],GPO_LightOrTriggerLight5[5],GPO_LightOrTriggerLight6[5],GPO_LightOrTriggerLight7[5],GPO_LightOrTriggerLight8[5]};
//assign step_mask_standard_GPO7 = {GPO_LightOrTriggerLight1[6],GPO_LightOrTriggerLight2[6],GPO_LightOrTriggerLight3[6],GPO_LightOrTriggerLight4[6],GPO_LightOrTriggerLight5[6],GPO_LightOrTriggerLight6[6],GPO_LightOrTriggerLight7[6],GPO_LightOrTriggerLight8[6]};
//assign step_mask_standard_GPO8 = {GPO_LightOrTriggerLight1[7],GPO_LightOrTriggerLight2[7],GPO_LightOrTriggerLight3[7],GPO_LightOrTriggerLight4[7],GPO_LightOrTriggerLight5[7],GPO_LightOrTriggerLight6[7],GPO_LightOrTriggerLight7[7],GPO_LightOrTriggerLight8[7]};
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		output_width_GPO1 <= 32'd0;
        output_width_GPO2 <= 32'd0;
        output_width_GPO3 <= 32'd0;
        output_width_GPO4 <= 32'd0;
        output_width_GPO5 <= 32'd0;
        output_width_GPO6 <= 32'd0;
        output_width_GPO7 <= 32'd0;
        output_width_GPO8 <= 32'd0;
    end
	else if(wr_en)
    begin
        case(addr)
            `OUTPUT_WIDTH_GPO1 : output_width_GPO1 <= data;
            `OUTPUT_WIDTH_GPO2 : output_width_GPO2 <= data;
            `OUTPUT_WIDTH_GPO3 : output_width_GPO3 <= data;
            `OUTPUT_WIDTH_GPO4 : output_width_GPO4 <= data;
            `OUTPUT_WIDTH_GPO5 : output_width_GPO5 <= data;
            `OUTPUT_WIDTH_GPO6 : output_width_GPO6 <= data;
            `OUTPUT_WIDTH_GPO7 : output_width_GPO7 <= data;
            `OUTPUT_WIDTH_GPO8 : output_width_GPO8 <= data;
            default:;
        endcase
    end
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
    begin
		chx_delay_GPO1 <= 32'd0;
        chx_delay_GPO2 <= 32'd0;
        chx_delay_GPO3 <= 32'd0;
        chx_delay_GPO4 <= 32'd0;
        chx_delay_GPO5 <= 32'd0;
        chx_delay_GPO6 <= 32'd0;
        chx_delay_GPO7 <= 32'd0;
        chx_delay_GPO8 <= 32'd0;
    end
	else if(wr_en)
    begin
        case(addr)
            `CHX_DELAY_GPO1 : chx_delay_GPO1 <= data;
            `CHX_DELAY_GPO2 : chx_delay_GPO2 <= data;
            `CHX_DELAY_GPO3 : chx_delay_GPO3 <= data;
            `CHX_DELAY_GPO4 : chx_delay_GPO4 <= data;
            `CHX_DELAY_GPO5 : chx_delay_GPO5 <= data;
            `CHX_DELAY_GPO6 : chx_delay_GPO6 <= data;
            `CHX_DELAY_GPO7 : chx_delay_GPO7 <= data;
            `CHX_DELAY_GPO8 : chx_delay_GPO8 <= data;
            default:;
        endcase
    end
end


always @(posedge avmm_clk)
begin
    if(!rst_n)
        {Out24Ven,Out12Ven} <= 2'b00;
    else if((wr_en) && (addr == `OUTVEN))
        {Out24Ven,Out12Ven} <= data[1:0];
end





reg  [31:0]                                         InVen_t;

always @(posedge avmm_clk)
begin
    if(!rst_n)
        InVen_t <= 32'd0;
    else if((wr_en) && (addr == `INVEN))
        InVen_t <= data; 
    else
        InVen_t <= InVen_t;
end

always @(posedge avmm_clk)
begin
    if(!rst_n)
    begin
        In24Ven <= 1'b0;
        In12Ven <= 1'b0;
        In5Ven <= 1'b1;
    end
    else if(InVen_t == 32'd1)
    begin
        In24Ven <= 1'b0;
        In12Ven <= 1'b1;
        In5Ven <= 1'b0;
    end
    else if(InVen_t == 32'd2)
    begin
        In24Ven <= 1'b1;
        In12Ven <= 1'b0;
        In5Ven <= 1'b0;
    end
    else
    begin
        In24Ven <= 1'b0;
        In12Ven <= 1'b0;
        In5Ven <= 1'b1;
    end
end

always @(posedge avmm_clk)
begin
    if(!rst_n)
        Turbo <= 8'd0;
    else if(wr_en)
    begin
        case(addr)
            `TURBO1 :Turbo[0] <= data[0];
            `TURBO2 :Turbo[1] <= data[0];
            `TURBO3 :Turbo[2] <= data[0];
            `TURBO4 :Turbo[3] <= data[0];
            `TURBO5 :Turbo[4] <= data[0];
            `TURBO6 :Turbo[5] <= data[0];
            `TURBO7 :Turbo[6] <= data[0];
            `TURBO8 :Turbo[7] <= data[0];
            default: Turbo <= Turbo;
        endcase
    end
end

always @(posedge avmm_clk)
begin
    if(!rst_n) begin
        intr0_width_cnt <= 5000;
        intr1_width_cnt <= 5000;
        intr0_period_cnt <= 10000;
        intr1_period_cnt <= 10000;
    end
    else if(wr_en)
    begin
        case(addr)
            `INTR0_TRIGGER_WIDTH_CNT    :intr0_width_cnt <= data;
            `INTR1_TRIGGER_WIDTH_CNT    :intr1_width_cnt <= data;
            `INTR0_TRIGGER_PERIOD_CNT   :intr0_period_cnt <= data;
            `INTR1_TRIGGER_PERIOD_CNT   :intr1_period_cnt <= data;
            default: begin
                intr0_width_cnt <= intr0_width_cnt;
                intr1_width_cnt <= intr1_width_cnt;
                intr0_period_cnt <= intr0_period_cnt;
                intr1_period_cnt <= intr1_period_cnt;
            end
        endcase
    end
end

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		start_step <= 8'd0;
        stop_step <= 8'd0;
        start_stop_switch <= 1'b0;
	end
	else if(wr_en)
	begin
		case(addr)
			`CYCLE_STEP_CONTROL_ENABLE : start_stop_switch <= data[7:0];
			`CYCLE_STEP_CONTROL_START : start_step <= data[7:0];
			`CYCLE_STEP_CONTROL_STOP : stop_step <= data[7:0];
			default :;
		endcase
	end
	else
	begin
	    start_step <= start_step;
        stop_step <= stop_step;
        start_stop_switch <= start_stop_switch;
	end
end




endmodule
