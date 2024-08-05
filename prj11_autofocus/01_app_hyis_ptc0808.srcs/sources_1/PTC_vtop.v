`timescale 1ns / 1ps
module PTC_vtop(
input																			clk,
input																			avmm_clk,
input																			rst_n,

input																			wr_en,
input      [21:0]																addr,
input      [31:0]																data,

input      [7:0]																GPI,
    
output     [7:0]																light_state_o,
output     [7:0]																GPO_out,
output     [7:0]																light_wave,	
output     [7:0]																scl_real, 
inout      [7:0]    															sda,											

input                                                                           clear_key_d,

output reg [2:0]														        GPI_to_mb,
output     [7:0]																step_cnt,


output reg [31:0]																GPO_pose_cnt1,
output reg [31:0]																GPO_pose_cnt2,
output reg [31:0]																GPO_pose_cnt3,
output reg [31:0]																GPO_pose_cnt4,
output reg [31:0]																GPO_pose_cnt5,
output reg [31:0]																GPO_pose_cnt6,
output reg [31:0]																GPO_pose_cnt7,
output reg [31:0]																GPO_pose_cnt8,

output reg [31:0]																GPI_pose_cnt1,
output reg [31:0]																GPI_pose_cnt2,
output reg [31:0]																GPI_pose_cnt3,
output reg [31:0]																GPI_pose_cnt4,
output reg [31:0]																GPI_pose_cnt5,
output reg [31:0]																GPI_pose_cnt6,
output reg [31:0]																GPI_pose_cnt7,
output reg [31:0]																GPI_pose_cnt8,

output     [9:0]                                                                dac_data1,
output     [9:0]                                                                dac_data2,
output     [9:0]                                                                dac_data3,
output     [9:0]                                                                dac_data4,
output     [9:0]                                                                dac_data5,
output     [9:0]                                                                dac_data6,
output     [9:0]                                                                dac_data7,
output     [9:0]                                                                dac_data8,

output     [31:0]                                                               PW1,
output     [31:0]                                                               PW2,
output     [31:0]                                                               PW3,
output     [31:0]                                                               PW4,
output     [31:0]                                                               PW5,
output     [31:0]                                                               PW6,
output     [31:0]                                                               PW7,
output     [31:0]                                                               PW8,
output     [7:0]                                                                step,

output                                                                          Out12Ven,
output                                                                          Out24Ven,

output                                                                          In5Ven,
output                                                                          In12Ven,
output                                                                          In24Ven,

output reg  [7:0]                                                               Turbo,
output      [3:0]                                                               group_value,
output      [7:0]                                                               light_switch,
output      [7:0]                                                               light_ocp
);

wire [31:0]					                                                    db_width_GPI1;
wire [31:0]					                                                    db_width_GPI2;
wire [31:0]					                                                    db_width_GPI3;
wire [31:0]					                                                    db_width_GPI4;
wire [31:0]					                                                    db_width_GPI5;
wire [31:0]					                                                    db_width_GPI6;
wire [31:0]					                                                    db_width_GPI7;
wire [31:0]					                                                    db_width_GPI8;

wire [7:0]					                                                    mul_frequency_coefficient_GPI1;
wire [7:0]					                                                    mul_frequency_coefficient_GPI2;
wire [7:0]					                                                    mul_frequency_coefficient_GPI3;
wire [7:0]					                                                    mul_frequency_coefficient_GPI4;
wire [7:0]					                                                    mul_frequency_coefficient_GPI5;
wire [7:0]					                                                    mul_frequency_coefficient_GPI6;
wire [7:0]					                                                    mul_frequency_coefficient_GPI7;
wire [7:0]					                                                    mul_frequency_coefficient_GPI8;

wire [31:0]					                                                    mul_frequency_period_GPI1;
wire [31:0]					                                                    mul_frequency_period_GPI2;
wire [31:0]					                                                    mul_frequency_period_GPI3;
wire [31:0]					                                                    mul_frequency_period_GPI4;
wire [31:0]					                                                    mul_frequency_period_GPI5;
wire [31:0]					                                                    mul_frequency_period_GPI6;
wire [31:0]					                                                    mul_frequency_period_GPI7;
wire [31:0]					                                                    mul_frequency_period_GPI8;
	
wire [7:0]																		user_output;
wire [7:0]																		invert_en_GPO;

wire [3:0]																		work_mode;
wire																		    master_switch;
wire [7:0]																		main_switch;

wire																		    soft_ware;

wire [7:0]               													    step_group1;   

wire [9:0]               													    GPI_group1;     

wire [1:0]																		group_switch;

wire 																		    cycle_rst;

wire  [7:0]       															    GPI_after_debouncer;

wire																		    END_SOF_posedge;
wire  [31:0]																	step_end_time;

wire [9:0]																		DAC_data1;
wire [9:0]																		DAC_data2;
wire [9:0]																		DAC_data3;
wire [9:0]																		DAC_data4;
wire [9:0]																		DAC_data5;
wire [9:0]																		DAC_data6;
wire [9:0]																		DAC_data7;
wire [9:0]																		DAC_data8;


wire [63:0]																	    step_pluse;
wire [9:0]																		ram_addr_rd;

wire 																		    trigger_polarity_cycle;
wire																		    step_end_valid;
wire [7:0]																		GPO_function;
wire [7:0]																		GPO;

wire [7:0]																		light_end;
wire [7:0]																		light_outputing;

  
wire [31:0]                                                                     GPO1_pose_cnt;
wire [31:0]                                                                     GPO2_pose_cnt;
wire [31:0]                                                                     GPO3_pose_cnt;
wire [31:0]                                                                     GPO4_pose_cnt;
wire [31:0]                                                                     GPO5_pose_cnt;
wire [31:0]                                                                     GPO6_pose_cnt;
wire [31:0]                                                                     GPO7_pose_cnt;
wire [31:0]                                                                     GPO8_pose_cnt;

wire [31:0]                                                                     dbGPI_pose_cnt1;
wire [31:0]                                                                     dbGPI_pose_cnt2;
wire [31:0]                                                                     dbGPI_pose_cnt3;
wire [31:0]                                                                     dbGPI_pose_cnt4;
wire [31:0]                                                                     dbGPI_pose_cnt5;
wire [31:0]                                                                     dbGPI_pose_cnt6;
wire [31:0]                                                                     dbGPI_pose_cnt7;
wire [31:0]                                                                     dbGPI_pose_cnt8;
    
wire [9:0]                                                                      brightness_light[7:0]; 

wire [9:0]                                                                      contanst_brightness_light1; 
wire [9:0]                                                                      contanst_brightness_light2; 
wire [9:0]                                                                      contanst_brightness_light3; 
wire [9:0]                                                                      contanst_brightness_light4; 
wire [9:0]                                                                      contanst_brightness_light5; 
wire [9:0]                                                                      contanst_brightness_light6; 
wire [9:0]                                                                      contanst_brightness_light7; 
wire [9:0]                                                                      contanst_brightness_light8; 



wire [9:0]                                                                      GPI_select_light1; 
wire [9:0]                                                                      GPI_select_light2; 
wire [9:0]                                                                      GPI_select_light3; 
wire [9:0]                                                                      GPI_select_light4; 
wire [9:0]                                                                      GPI_select_light5; 
wire [9:0]                                                                      GPI_select_light6; 
wire [9:0]                                                                      GPI_select_light7; 
wire [9:0]                                                                      GPI_select_light8; 
    
//wire [1:0]                                                                      trigger_polarity_light1;
//wire [1:0]                                                                      trigger_polarity_light2;
//wire [1:0]                                                                      trigger_polarity_light3;
//wire [1:0]                                                                      trigger_polarity_light4;
//wire [1:0]                                                                      trigger_polarity_light5;
//wire [1:0]                                                                      trigger_polarity_light6;
//wire [1:0]                                                                      trigger_polarity_light7;
//wire [1:0]                                                                      trigger_polarity_light8;
wire [ 1:0]                                                                     trigger_polarity_light[7:0];
wire [31:0]                                                                     chx_width_light[7:0];

wire [31:0]                                                                     chx_delay_light1; 
wire [31:0]                                                                     chx_delay_light2; 
wire [31:0]                                                                     chx_delay_light3; 
wire [31:0]                                                                     chx_delay_light4; 
wire [31:0]                                                                     chx_delay_light5; 
wire [31:0]                                                                     chx_delay_light6; 
wire [31:0]                                                                     chx_delay_light7; 
wire [31:0]                                                                     chx_delay_light8; 

wire [7:0]                                                                      step_mask_standard_GPO1;
wire [7:0]                                                                      step_mask_standard_GPO2;
wire [7:0]                                                                      step_mask_standard_GPO3;
wire [7:0]                                                                      step_mask_standard_GPO4;
wire [7:0]                                                                      step_mask_standard_GPO5;
wire [7:0]                                                                      step_mask_standard_GPO6;
wire [7:0]                                                                      step_mask_standard_GPO7;
wire [7:0]                                                                      step_mask_standard_GPO8;

wire [31:0]                                                                     output_width_GPO1;
wire [31:0]                                                                     output_width_GPO2;
wire [31:0]                                                                     output_width_GPO3;
wire [31:0]                                                                     output_width_GPO4;
wire [31:0]                                                                     output_width_GPO5;
wire [31:0]                                                                     output_width_GPO6;
wire [31:0]                                                                     output_width_GPO7;
wire [31:0]                                                                     output_width_GPO8;

wire [31:0]                                                                     chx_delay_GPO1;
wire [31:0]                                                                     chx_delay_GPO2;
wire [31:0]                                                                     chx_delay_GPO3;
wire [31:0]                                                                     chx_delay_GPO4;
wire [31:0]                                                                     chx_delay_GPO5;
wire [31:0]                                                                     chx_delay_GPO6;
wire [31:0]                                                                     chx_delay_GPO7;
wire [31:0]                                                                     chx_delay_GPO8;

wire [7:0]                                                                      Turbo_loop;
wire [7:0]                                                                      Turbo_single;

wire [7:0]								                                        start_step;
wire [7:0]								                                        stop_step;
wire										                                    start_stop_switch;


assign step = step_group1;
assign light_switch = main_switch;
assign group_value = work_mode;
assign dac_data1 = DAC_data1;
assign dac_data2 = DAC_data2;
assign dac_data3 = DAC_data3;
assign dac_data4 = DAC_data4;
assign dac_data5 = DAC_data5;
assign dac_data6 = DAC_data6;
assign dac_data7 = DAC_data7;
assign dac_data8 = DAC_data8;

always @(posedge avmm_clk)
begin
    if(!rst_n)
        Turbo <= 8'd0;
    else if(work_mode > 4'd1)
        Turbo <= Turbo_loop;
    else
        Turbo <= Turbo_single;
end

  
reg  [31:0]                                                                     timer_cnt;
wire                                                                            rst_timer;

assign rst_timer = (timer_cnt == 32'd30000000)? 1'b0:1'b1;

always @(posedge clk)
begin
    if(!rst_n)
        timer_cnt <= 32'd0;
    else if(timer_cnt == 32'd30000000)
        timer_cnt <= 32'd30000000;
    else
        timer_cnt <= timer_cnt + 1'b1;
end


wire [7:0]																		    GPI_after_mul;

always @(posedge avmm_clk)
begin
	if(!rst_n)
		GPI_to_mb <= 3'd0;
	else
		GPI_to_mb <= GPI_after_debouncer[7:5]; 
end

always @(posedge avmm_clk)
begin
	if(!rst_n)
	begin
		GPO_pose_cnt1 <= 32'd0;
		GPO_pose_cnt2 <= 32'd0;
		GPO_pose_cnt3 <= 32'd0;
		GPO_pose_cnt4 <= 32'd0;
		GPO_pose_cnt5 <= 32'd0;
		GPO_pose_cnt6 <= 32'd0;
		GPO_pose_cnt7 <= 32'd0;
		GPO_pose_cnt8 <= 32'd0;
	end
	else
	begin
		GPO_pose_cnt1 <= GPO1_pose_cnt;
		GPO_pose_cnt2 <= GPO2_pose_cnt;
		GPO_pose_cnt3 <= GPO3_pose_cnt;
		GPO_pose_cnt4 <= GPO4_pose_cnt;
		GPO_pose_cnt5 <= GPO5_pose_cnt;
		GPO_pose_cnt6 <= GPO6_pose_cnt;
		GPO_pose_cnt7 <= GPO7_pose_cnt;
		GPO_pose_cnt8 <= GPO8_pose_cnt;
	end
end

always @(posedge avmm_clk)
begin
	if(!rst_n)
	begin
		GPI_pose_cnt1 <= 32'd0;
		GPI_pose_cnt2 <= 32'd0;
		GPI_pose_cnt3 <= 32'd0;
		GPI_pose_cnt4 <= 32'd0;
		GPI_pose_cnt5 <= 32'd0;
		GPI_pose_cnt6 <= 32'd0;
		GPI_pose_cnt7 <= 32'd0;
		GPI_pose_cnt8 <= 32'd0;
	end
	else
	begin
		GPI_pose_cnt1 <= dbGPI_pose_cnt1;
		GPI_pose_cnt2 <= dbGPI_pose_cnt2;
		GPI_pose_cnt3 <= dbGPI_pose_cnt3;
		GPI_pose_cnt4 <= dbGPI_pose_cnt4;
		GPI_pose_cnt5 <= dbGPI_pose_cnt5;
		GPI_pose_cnt6 <= dbGPI_pose_cnt6;
		GPI_pose_cnt7 <= dbGPI_pose_cnt7;
		GPI_pose_cnt8 <= dbGPI_pose_cnt8;
	end
end



//*************************//
//          È¥¶¶¶¯
//*************************//
hycl_debouncer hycl_debouncer_ch1 (
    .clk																		(clk),  
    .reset_n																	(rst_n), 
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt1),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI1), 
    .sig_in																		(GPI[0]), 
    .out																		(GPI_after_debouncer[0])
);                               										
hycl_debouncer hycl_debouncer_ch2 (
    .clk																		(clk),  
    .reset_n																	(rst_n),
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt2),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI2), 
    .sig_in																		(GPI[1]), 
    .out																		(GPI_after_debouncer[1])
);                               										
hycl_debouncer hycl_debouncer_ch3 (
    .clk																	    (clk), 
    .reset_n																	(rst_n), 
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt3),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI3), 
    .sig_in																		(GPI[2]), 
    .out																	    (GPI_after_debouncer[2])
);                               										
hycl_debouncer hycl_debouncer_ch4 (
    .clk																		(clk),  
    .reset_n																	(rst_n),
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt4),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI4), 
    .sig_in																		(GPI[3]), 
    .out																		(GPI_after_debouncer[3])
);                               										
hycl_debouncer hycl_debouncer_ch5 (
    .clk																		(clk),  
    .reset_n																	(rst_n),
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt5),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI5), 
    .sig_in																		(GPI[4]), 
    .out																		(GPI_after_debouncer[4])
);                               										
hycl_debouncer hycl_debouncer_ch6 (
    .clk																		(clk),  
    .reset_n																	(rst_n), 
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt6),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI6), 
    .sig_in																		(GPI[5]), 
    .out																		(GPI_after_debouncer[5])
);                               										
hycl_debouncer hycl_debouncer_ch7 (
    .clk																		(clk),  
    .reset_n																	(rst_n),
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt7),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI7), 
    .sig_in																		(GPI[6]), 
    .out																		(GPI_after_debouncer[6])
);                               										
hycl_debouncer hycl_debouncer_ch8 (
    .clk																		(clk),  
    .reset_n																	(rst_n),
	.cycle_rst																	(cycle_rst|rst_timer),
	.dbGPI_pose_cnt															    (dbGPI_pose_cnt8),
    .clear_key_d                                                                (clear_key_d),
    .db_width																	(db_width_GPI8), 
    .sig_in																		(GPI[7]), 
    .out																		(GPI_after_debouncer[7])
);                               										
//*************************//
//           ±¶Æµ
//*************************//
mul_div mul_div_ch1 (
    .clk																	    (clk), 
    .rst_n																		(rst_n),
    .GPI																	    (GPI_after_debouncer[0]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI1), 
    .mul_frequency_period													    (mul_frequency_period_GPI1), 
    .GPI_after_mul															    (GPI_after_mul[0])
);
mul_div mul_div_ch2 (
    .clk																	    (clk),  
    .rst_n																		(rst_n),
    .GPI																	    (GPI_after_debouncer[1]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI2), 
    .mul_frequency_period													    (mul_frequency_period_GPI2), 
    .GPI_after_mul															    (GPI_after_mul[1])
);
mul_div mul_div_ch3 (
    .clk																	    (clk),  
    .rst_n																		(rst_n),
    .GPI																	    (GPI_after_debouncer[2]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI3), 
    .mul_frequency_period													    (mul_frequency_period_GPI3), 
    .GPI_after_mul															    (GPI_after_mul[2])
);
mul_div mul_div_ch4 (
    .clk																	    (clk),  
    .rst_n																		(rst_n), 
    .GPI																	    (GPI_after_debouncer[3]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI4), 
    .mul_frequency_period													    (mul_frequency_period_GPI4), 
    .GPI_after_mul															    (GPI_after_mul[3])
);
mul_div mul_div_ch5 (
    .clk																	    (clk),  
    .rst_n																		(rst_n),
    .GPI																	    (GPI_after_debouncer[4]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI5), 
    .mul_frequency_period													    (mul_frequency_period_GPI5), 
    .GPI_after_mul															    (GPI_after_mul[4])
);
mul_div mul_div_ch6 (
    .clk																	    (clk),  
    .rst_n																		(rst_n),
    .GPI																	    (GPI_after_debouncer[5]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI6), 
    .mul_frequency_period													    (mul_frequency_period_GPI6), 
    .GPI_after_mul															    (GPI_after_mul[5])
);
mul_div mul_div_ch7 (
    .clk																	    (clk),  
    .rst_n																		(rst_n), 
    .GPI																	    (GPI_after_debouncer[6]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI7), 
    .mul_frequency_period													    (mul_frequency_period_GPI7), 
    .GPI_after_mul															    (GPI_after_mul[6])
);
mul_div mul_div_ch8 (
    .clk																	    (clk),  
    .rst_n																		(rst_n),
    .GPI																	    (GPI_after_debouncer[7]), 
    .mul_frequency_coefficient											        (mul_frequency_coefficient_GPI8), 
    .mul_frequency_period													    (mul_frequency_period_GPI8), 
    .GPI_after_mul															    (GPI_after_mul[7])
);

wire [31:0] intr_width_cnt[1:0];
wire [31:0] intr_period_cnt[1:0];
wire width_limit_enable;

cmd_analy cmd_analy (
    .avmm_clk                                                                   (avmm_clk),
    .rst_n																		(rst_n), 
    .wr_en																		(wr_en), 
    .addr																		(addr), 
    .data																		(data), 
    .db_width_GPI1															    (db_width_GPI1), 
    .db_width_GPI2															    (db_width_GPI2), 
    .db_width_GPI3															    (db_width_GPI3), 
    .db_width_GPI4															    (db_width_GPI4), 
    .db_width_GPI5															    (db_width_GPI5), 
    .db_width_GPI6															    (db_width_GPI6), 
    .db_width_GPI7															    (db_width_GPI7), 
    .db_width_GPI8															    (db_width_GPI8), 
    .mul_frequency_coefficient_GPI1										        (mul_frequency_coefficient_GPI1), 
    .mul_frequency_coefficient_GPI2										        (mul_frequency_coefficient_GPI2), 
    .mul_frequency_coefficient_GPI3										        (mul_frequency_coefficient_GPI3), 
    .mul_frequency_coefficient_GPI4										        (mul_frequency_coefficient_GPI4), 
    .mul_frequency_coefficient_GPI5										        (mul_frequency_coefficient_GPI5), 
    .mul_frequency_coefficient_GPI6										        (mul_frequency_coefficient_GPI6), 
    .mul_frequency_coefficient_GPI7										        (mul_frequency_coefficient_GPI7), 
    .mul_frequency_coefficient_GPI8										        (mul_frequency_coefficient_GPI8), 
    .mul_frequency_period_GPI1											        (mul_frequency_period_GPI1), 
    .mul_frequency_period_GPI2											        (mul_frequency_period_GPI2), 
    .mul_frequency_period_GPI3											        (mul_frequency_period_GPI3), 
    .mul_frequency_period_GPI4											        (mul_frequency_period_GPI4), 
    .mul_frequency_period_GPI5											        (mul_frequency_period_GPI5), 
    .mul_frequency_period_GPI6											        (mul_frequency_period_GPI6), 
    .mul_frequency_period_GPI7											        (mul_frequency_period_GPI7), 
    .mul_frequency_period_GPI8											        (mul_frequency_period_GPI8), 
    
    .start_step																    (start_step),
	.stop_step																	(stop_step),
	.start_stop_switch														    (start_stop_switch),
	
    .user_output																(user_output), 
    .invert_en_GPO															    (invert_en_GPO), 
	.step_end_time															    (step_end_time),
    .work_mode																	(work_mode), 
    .master_switch															    (master_switch), 
    .main_switch																(main_switch), 
    .soft_ware																	(soft_ware), 
	.trigger_polarity_cycle												        (trigger_polarity_cycle),
    .step_group1																(step_group1), 
    .GPI_group1																    (GPI_group1), 
	.GPO_function																(GPO_function),
    .group_switch																(group_switch), 
    .cycle_rst																	(cycle_rst),
    .brightness_light1                                                          (brightness_light[0] ),//brightness_light1
    .brightness_light2                                                          (brightness_light[1] ),//brightness_light2
    .brightness_light3                                                          (brightness_light[2] ),//brightness_light3
    .brightness_light4                                                          (brightness_light[3] ),//brightness_light4
    .brightness_light5                                                          (brightness_light[4] ),//brightness_light5
    .brightness_light6                                                          (brightness_light[5] ),//brightness_light6
    .brightness_light7                                                          (brightness_light[6] ),//brightness_light7
    .brightness_light8                                                          (brightness_light[7] ),//brightness_light8

    .contanst_brightness_light1                                                 (contanst_brightness_light1 ),
    .contanst_brightness_light2                                                 (contanst_brightness_light2 ),
    .contanst_brightness_light3                                                 (contanst_brightness_light3 ),
    .contanst_brightness_light4                                                 (contanst_brightness_light4 ),
    .contanst_brightness_light5                                                 (contanst_brightness_light5 ),
    .contanst_brightness_light6                                                 (contanst_brightness_light6 ),
    .contanst_brightness_light7                                                 (contanst_brightness_light7 ),
    .contanst_brightness_light8                                                 (contanst_brightness_light8 ),

    .GPI_select_light1                                                          (GPI_select_light1  ),
    .GPI_select_light2                                                          (GPI_select_light2  ),
    .GPI_select_light3                                                          (GPI_select_light3  ),
    .GPI_select_light4                                                          (GPI_select_light4  ),
    .GPI_select_light5                                                          (GPI_select_light5  ),
    .GPI_select_light6                                                          (GPI_select_light6  ),
    .GPI_select_light7                                                          (GPI_select_light7  ),
    .GPI_select_light8                                                          (GPI_select_light8  ),

    .trigger_polarity_light1                                                    (trigger_polarity_light[0] ),
    .trigger_polarity_light2                                                    (trigger_polarity_light[1] ),
    .trigger_polarity_light3                                                    (trigger_polarity_light[2] ),
    .trigger_polarity_light4                                                    (trigger_polarity_light[3] ),
    .trigger_polarity_light5                                                    (trigger_polarity_light[4] ),
    .trigger_polarity_light6                                                    (trigger_polarity_light[5] ),
    .trigger_polarity_light7                                                    (trigger_polarity_light[6] ),
    .trigger_polarity_light8                                                    (trigger_polarity_light[7] ),
    
    .chx_width_light1                                                           (chx_width_light[0]  ),//chx_width_light1
    .chx_width_light2                                                           (chx_width_light[1]  ),//chx_width_light2
    .chx_width_light3                                                           (chx_width_light[2]  ),//chx_width_light3
    .chx_width_light4                                                           (chx_width_light[3]  ),//chx_width_light4
    .chx_width_light5                                                           (chx_width_light[4]  ),//chx_width_light5
    .chx_width_light6                                                           (chx_width_light[5]  ),//chx_width_light6
    .chx_width_light7                                                           (chx_width_light[6]  ),//chx_width_light7
    .chx_width_light8                                                           (chx_width_light[7]  ),//chx_width_light8

    .chx_delay_light1                                                           (chx_delay_light1  ),
    .chx_delay_light2                                                           (chx_delay_light2  ),
    .chx_delay_light3                                                           (chx_delay_light3  ),
    .chx_delay_light4                                                           (chx_delay_light4  ),
    .chx_delay_light5                                                           (chx_delay_light5  ),
    .chx_delay_light6                                                           (chx_delay_light6  ),
    .chx_delay_light7                                                           (chx_delay_light7  ),
    .chx_delay_light8                                                           (chx_delay_light8  ),

    .step_mask_standard_GPO1                                                    (step_mask_standard_GPO1),
    .step_mask_standard_GPO2                                                    (step_mask_standard_GPO2),
    .step_mask_standard_GPO3                                                    (step_mask_standard_GPO3),
    .step_mask_standard_GPO4                                                    (step_mask_standard_GPO4),
    .step_mask_standard_GPO5                                                    (step_mask_standard_GPO5),
    .step_mask_standard_GPO6                                                    (step_mask_standard_GPO6),
    .step_mask_standard_GPO7                                                    (step_mask_standard_GPO7),
    .step_mask_standard_GPO8                                                    (step_mask_standard_GPO8),

    .output_width_GPO1                                                          (output_width_GPO1),
    .output_width_GPO2                                                          (output_width_GPO2),
    .output_width_GPO3                                                          (output_width_GPO3),
    .output_width_GPO4                                                          (output_width_GPO4),
    .output_width_GPO5                                                          (output_width_GPO5),
    .output_width_GPO6                                                          (output_width_GPO6),
    .output_width_GPO7                                                          (output_width_GPO7),
    .output_width_GPO8                                                          (output_width_GPO8),

    .chx_delay_GPO1                                                             (chx_delay_GPO1),
    .chx_delay_GPO2                                                             (chx_delay_GPO2),
    .chx_delay_GPO3                                                             (chx_delay_GPO3),
    .chx_delay_GPO4                                                             (chx_delay_GPO4),
    .chx_delay_GPO5                                                             (chx_delay_GPO5),
    .chx_delay_GPO6                                                             (chx_delay_GPO6),
    .chx_delay_GPO7                                                             (chx_delay_GPO7),
    .chx_delay_GPO8                                                             (chx_delay_GPO8),
    
    .intr0_width_cnt                                                            (intr_width_cnt[0]),
    .intr1_width_cnt                                                            (intr_width_cnt[1]),
    .intr0_period_cnt                                                           (intr_period_cnt[0]),
    .intr1_period_cnt                                                           (intr_period_cnt[1]),
    .width_limit_enable                                                         (width_limit_enable),
    
    .Out12Ven                                                                   (Out12Ven),
    .Out24Ven                                                                   (Out24Ven),

    .In5Ven                                                                     (In5Ven ),
    .In12Ven                                                                    (In12Ven),
    .In24Ven                                                                    (In24Ven),
    .Turbo                                                                      (Turbo_single)
);


step_pluse_analy step_pluse_analy (
    .clk																		(clk), 
    .rst_n																		(rst_n), 
    .soft_ware																	(soft_ware),
    .work_mode																	(work_mode), 
    .light_end																	(light_end),
    .light_outputing															(light_outputing),
    .step_group1																(step_group1),
    .master_switch															    (master_switch),
    .step_cnt																	(step_cnt),
    .cycle_rst																	(cycle_rst|rst_timer),
    .ram_addr_rd																(ram_addr_rd),
    .GPI_after_mul															    (GPI_after_mul),
    .step_end_time															    (step_end_time),
    .END_SOF_posedge															(END_SOF_posedge),
    .step_end_valid															    (step_end_valid),
    .step_pluse																    (step_pluse),
    .start_stop_switch														    (start_stop_switch),
	.start_step																    (start_step),
	.stop_step																	(stop_step)
);

wire [1:0] intr_triger;

genvar m;
generate
    for(m = 0; m<2; m = m+1) begin:loop_intr_trigger
        hy_intr_trigger intr_trigger_inst(
            .clk_in         (clk),
            .reset          (~rst_n),
            
            .width_cnt      (intr_width_cnt[m]),
            .period_cnt     (intr_period_cnt[m]),
            
            .sig_out        (intr_triger[m])
        );
    end
endgenerate
//---------------------------------------------------------
//light wave gen
//---------------------------------------------------------
wire [7:0] tp_light_wave;
wire [1:0] c_trig_activation[7:0];

wave_gen wave_light1 (
    .clk																	    (clk), 
	.avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n), 
    .wave_No                                                                    (6'd1),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data),
    .step_group1																(step_group1), 
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode), 
    .master_switch															    (master_switch), 
    .cycle_rst																	(cycle_rst|rst_timer), 
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1), 
    .brightness                                                                 (brightness_light[0]),
    .brightness_all_light                                                       (contanst_brightness_light1),
    .GPI_select                                                                 (GPI_select_light1),
    .trigger_polarity                                                           (trigger_polarity_light[0]),
    .chx_width                                                                  (chx_width_light[0]),
    .chx_delay                                                                  (chx_delay_light1),
	.trigger_polarity_cycle												        (trigger_polarity_cycle),
    .main_switch																(main_switch[0]),
    .light_wave																    (tp_light_wave[0]), 
    .DAC_data																	(DAC_data1), 
    .PW                                                                         (PW1),
	.light_end																	(light_end[0]),
	.light_outputing															(light_outputing[0]),
    .Turbo                                                                      (Turbo_loop[0]),
    .c_trigger_polarity                                                         (c_trig_activation[0]),
	.ram_addr_rd																(ram_addr_rd)
);

wave_gen wave_light2 (
    .clk																	    (clk),  
	.avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n),  
    .wave_No                                                                    (6'd2),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode),
    .master_switch															    (master_switch), 
    .cycle_rst																	(cycle_rst|rst_timer), 
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1),   
    .brightness                                                                 (brightness_light[1]),
    .brightness_all_light                                                       (contanst_brightness_light2),
    .GPI_select                                                                 (GPI_select_light2),
    .trigger_polarity                                                           (trigger_polarity_light[1]),
    .chx_width                                                                  (chx_width_light[1]),
    .chx_delay                                                                  (chx_delay_light2),
	.trigger_polarity_cycle												        (trigger_polarity_cycle),
    .main_switch																(main_switch[1]),
    .light_wave																    (tp_light_wave[1]),  
	.light_end																	(light_end[1]),
	.light_outputing															(light_outputing[1]),
	.ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[1]),
    .DAC_data																	(DAC_data2),
    .c_trigger_polarity                                                         (c_trig_activation[1]),
    .PW                                                                         (PW2)

);

wave_gen wave_light3 (
    .clk																	    (clk),  
	.avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n),  
    .wave_No                                                                    (6'd3),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode), 
    .master_switch															    (master_switch), 
    .cycle_rst																	(cycle_rst|rst_timer),  
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1),  
    .brightness                                                                 (brightness_light[2]),
    .brightness_all_light                                                       (contanst_brightness_light3),
    .GPI_select                                                                 (GPI_select_light3),
    .trigger_polarity                                                           (trigger_polarity_light[2]),
    .chx_width                                                                  (chx_width_light[2]),
    .chx_delay                                                                  (chx_delay_light3),
	.trigger_polarity_cycle												        (trigger_polarity_cycle), 
    .main_switch																(main_switch[2]),  
    .light_wave																    (tp_light_wave[2]),  
	.light_end																	(light_end[2]),
	.light_outputing															(light_outputing[2]),
	.ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[2]),
    .DAC_data																	(DAC_data3),
    .c_trigger_polarity                                                         (c_trig_activation[2]),
    .PW                                                                         (PW3)
);

wave_gen wave_light4 (
    .clk																		(clk),  
	 .avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n),  
    .wave_No                                                                    (6'd4),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode), 
 
    .master_switch															    (master_switch), 
 
    .cycle_rst																	(cycle_rst|rst_timer),  
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1),  
    .brightness                                                                 (brightness_light[3]),
    .brightness_all_light                                                       (contanst_brightness_light4),
    .GPI_select                                                                 (GPI_select_light4),
    .trigger_polarity                                                           (trigger_polarity_light[3]),
    .chx_width                                                                  (chx_width_light[3]),
    .chx_delay                                                                  (chx_delay_light4),
	.trigger_polarity_cycle												        (trigger_polarity_cycle),
    .main_switch																(main_switch[3]),  
    .light_wave																    (tp_light_wave[3]), 
	.light_end																	(light_end[3]), 
	.light_outputing															(light_outputing[3]),
	.ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[3]),
    .DAC_data																	(DAC_data4),
    .c_trigger_polarity                                                         (c_trig_activation[3]),
    .PW                                                                         (PW4)
);

wave_gen wave_light5 (
    .clk																	    (clk),  
	.avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n),  
    .wave_No                                                                    (6'd5),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode),  
    .master_switch															    (master_switch),  
    .cycle_rst																	(cycle_rst|rst_timer),  
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1),  
    .brightness                                                                 (brightness_light[4]),
    .brightness_all_light                                                       (contanst_brightness_light5),
    .GPI_select                                                                 (GPI_select_light5),
    .trigger_polarity                                                           (trigger_polarity_light[4]),
    .chx_width                                                                  (chx_width_light[4]),
    .chx_delay                                                                  (chx_delay_light5),
	.trigger_polarity_cycle												        (trigger_polarity_cycle),
    .main_switch																(main_switch[4]),
    .light_wave																    (tp_light_wave[4]), 
	.light_end																	(light_end[4]),
	.light_outputing															(light_outputing[4]),
	.ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[4]),
    .DAC_data																	(DAC_data5),
    .c_trigger_polarity                                                         (c_trig_activation[4]),
    .PW                                                                         (PW5)
);

wave_gen wave_light6 (
    .clk																		(clk),  
	.avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n), 
    .wave_No                                                                    (6'd6),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode),  
    .master_switch															    (master_switch), 
    .cycle_rst																	(cycle_rst|rst_timer),  
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1),  
    .brightness                                                                 (brightness_light[5]),
    .brightness_all_light                                                       (contanst_brightness_light6),
    .GPI_select                                                                 (GPI_select_light6),
    .trigger_polarity                                                           (trigger_polarity_light[5]),
    .chx_width                                                                  (chx_width_light[5]),
    .chx_delay                                                                  (chx_delay_light6),
	.trigger_polarity_cycle												        (trigger_polarity_cycle),  
    .main_switch																(main_switch[5]),
    .light_wave																    (tp_light_wave[5]),  
	.light_end																	(light_end[5]),
	.light_outputing															(light_outputing[5]),
	.ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[5]),
    .DAC_data																	(DAC_data6),
    .c_trigger_polarity                                                         (c_trig_activation[5]),
    .PW                                                                         (PW6)
);

wave_gen wave_light7 (
    .clk																		(clk),  
	.avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n), 
    .wave_No                                                                    (6'd7),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode),  
    .master_switch															    (master_switch),  
    .cycle_rst																	(cycle_rst|rst_timer),  
    .END_SOF_posedge															(END_SOF_posedge), 
    .GPI_group1																    (GPI_group1),   
    .brightness                                                                 (brightness_light[6]),
    .brightness_all_light                                                       (contanst_brightness_light7),
    .GPI_select                                                                 (GPI_select_light7),
    .trigger_polarity                                                           (trigger_polarity_light[6]),
    .chx_width                                                                  (chx_width_light[6]),
    .chx_delay                                                                  (chx_delay_light7),
    .trigger_polarity_cycle												        (trigger_polarity_cycle),
    .main_switch																(main_switch[6]),
    .light_wave																    (tp_light_wave[6]), 
    .light_end																	(light_end[6]),
    .light_outputing															(light_outputing[6]),
    .ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[6]),
    .DAC_data																	(DAC_data7),
    .c_trigger_polarity                                                         (c_trig_activation[6]),
    .PW                                                                         (PW7)
);

wave_gen wave_light8 (
    .clk																		(clk),  
    .avmm_clk																	(avmm_clk),
    .rst_n																		(rst_n), 
    .wave_No                                                                    (6'd8),
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .step_group1																(step_group1),
    .GPI_after_mul															    (GPI_after_mul), 
    .soft_ware																	(soft_ware),
    .intr_trigger                                                               (intr_triger),
    .work_mode																	(work_mode),  
    .master_switch															    (master_switch), 

    .cycle_rst																	(cycle_rst|rst_timer),  
	.END_SOF_posedge															(END_SOF_posedge),
    .GPI_group1																    (GPI_group1),  
    .brightness                                                                 (brightness_light[7]),
    .brightness_all_light                                                       (contanst_brightness_light8),
    .GPI_select                                                                 (GPI_select_light8),
    .trigger_polarity                                                           (trigger_polarity_light[7]),
    .chx_width                                                                  (chx_width_light[7]),
    .chx_delay                                                                  (chx_delay_light8),
	.trigger_polarity_cycle											    	    (trigger_polarity_cycle),
    .main_switch																(main_switch[7]),  
    .light_wave																    (tp_light_wave[7]),  
	.light_end																	(light_end[7]),
	.light_outputing															(light_outputing[7]),
	.ram_addr_rd																(ram_addr_rd),
    .Turbo                                                                      (Turbo_loop[7]),
    .DAC_data																	(DAC_data8),
    .c_trigger_polarity                                                         (c_trig_activation[7]),
    .PW                                                                         (PW8)
);
//---------------------------------------------------------
//over current protection
//---------------------------------------------------------
wire [31:0] PW[7:0];

assign PW[0] = PW1;
assign PW[1] = PW2;
assign PW[2] = PW3;
assign PW[3] = PW4;
assign PW[4] = PW5;
assign PW[5] = PW6;
assign PW[6] = PW7;
assign PW[7] = PW8;

genvar n;
generate
    for(n = 0; n<8; n = n+1) begin:loop_ocp
        hy_ocp ocp_inst(
            .clk_in             (clk),
            .reset              (~rst_n),
            
            .sign_in            (tp_light_wave[n]),
            .width_limit_enable (width_limit_enable),
            .Turbo              (Turbo[n]),
            .light_width_cnt    (PW[n]),
            .trig_activation    (c_trig_activation[n]),
            
            .sign_missed        (light_ocp[n]),
            .sign_out           (light_wave[n])
        );
    end
endgenerate

dac_top dac_light1 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n), 
	.light_wave																    (light_wave[0]),  
    .brightness																    (DAC_data1), 
    .scl_real																	(scl_real[0]), 
    .sda																	    (sda[0])
);

dac_top dac_light2 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[1]),  
    .brightness																    (DAC_data2), 
    .scl_real																	(scl_real[1]), 
    .sda																	    (sda[1])
);

dac_top dac_light3 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[2]),  
    .brightness 																(DAC_data3), 
    .scl_real																	(scl_real[2]), 
    .sda																		(sda[2])
);


dac_top dac_light4 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[3]),  
    .brightness																    (DAC_data4), 
    .scl_real																	(scl_real[3]), 
    .sda																		(sda[3])
);

dac_top dac_light5 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[4]),  
    .brightness																    (DAC_data5), 
    .scl_real																	(scl_real[4]), 
    .sda																		(sda[4])
);

dac_top dac_light6 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[5]),  
    .brightness																    (DAC_data6), 
    .scl_real																	(scl_real[5]), 
    .sda																		(sda[5])
);

dac_top dac_light7 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[6]),  
    .brightness																    (DAC_data7), 
    .scl_real																	(scl_real[6]), 
    .sda																		(sda[6])
);

dac_top dac_light8 (
    .avmm_clk																	(avmm_clk), 
    .rst_n																		(rst_n),  
	.light_wave																    (light_wave[7]),  
    .brightness																    (DAC_data8), 
    .scl_real																	(scl_real[7]), 
    .sda																		(sda[7])
);

GPO_gen GPO1 (
    .clk																		(clk),  
    .avmm_clk																	(avmm_clk),
    .GPO_ID                                                                     (6'd17),
    .mask_ID                                                                    (6'd25),
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data),
    .light_outputing															(light_outputing[0]), 
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[0]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO1          ),
    .step_mask_standard                                                         (step_mask_standard_GPO1 ),
    .output_width                                                               (output_width_GPO1       ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch), 
	.invert_en																	(invert_en_GPO[0]),
	.GPO_pose_cnt																(GPO1_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[0])
);
GPO_gen GPO2 (
    .clk																	    (clk),  
    .avmm_clk																	(avmm_clk),
    .GPO_ID                                                                     (6'd18),
    .mask_ID                                                                    (6'd26),
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[1]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[1]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO2          ),
    .step_mask_standard                                                         (step_mask_standard_GPO2 ),
    .output_width                                                               (output_width_GPO2      ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch), 
	.invert_en																	(invert_en_GPO[1]),
	.GPO_pose_cnt																(GPO2_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[1])
);
GPO_gen GPO3 (
    .clk																	    (clk), 
    .avmm_clk																	(avmm_clk),
    .GPO_ID                                                                     (6'd19),
    .mask_ID                                                                    (6'd27), 
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[2]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[2]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO3          ),
    .step_mask_standard                                                         (step_mask_standard_GPO3 ),
    .output_width                                                               (output_width_GPO3      ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch), 
	.invert_en																	(invert_en_GPO[2]), 
	.GPO_pose_cnt																(GPO3_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[2])
);
GPO_gen GPO4 (
    .clk																	    (clk), 
    .avmm_clk																	(avmm_clk),
    .GPO_ID                                                                     (6'd20),
    .mask_ID                                                                    (6'd28), 
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[3]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[3]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO4          ),
    .step_mask_standard                                                         (step_mask_standard_GPO4 ),
    .output_width                                                               (output_width_GPO4      ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch), 
	.invert_en																	(invert_en_GPO[3]),
	.GPO_pose_cnt																(GPO4_pose_cnt), 
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[3])
);
GPO_gen GPO5 (
    .clk																		(clk), 
    .avmm_clk																	(avmm_clk),
    .GPO_ID                                                                     (6'd21),
    .mask_ID                                                                    (6'd29),
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[4]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[4]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO5          ),
    .step_mask_standard                                                         (step_mask_standard_GPO5 ),
    .output_width                                                               (output_width_GPO5      ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch), 
	.invert_en																	(invert_en_GPO[4]),
	.GPO_pose_cnt																(GPO5_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[4])
);
GPO_gen GPO6 (
    .clk																		(clk), 
    .avmm_clk																	(avmm_clk), 
    .GPO_ID                                                                     (6'd22),
    .mask_ID                                                                    (6'd30),
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[5]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[5]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO6          ),
    .step_mask_standard                                                         (step_mask_standard_GPO6 ),
    .output_width                                                               (output_width_GPO6      ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch),
	.invert_en																	(invert_en_GPO[5]),
	.GPO_pose_cnt																(GPO6_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[5])
);
GPO_gen GPO7 (
    .clk																		(clk), 
    .avmm_clk																	(avmm_clk), 
    .GPO_ID                                                                     (6'd23),
    .mask_ID                                                                    (6'd31),
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[6]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[6]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO7          ),
    .step_mask_standard                                                         (step_mask_standard_GPO7 ),
    .output_width                                                               (output_width_GPO7      ),
	 .step_cnt																	(step_cnt),
    .master_switch															    (master_switch),   
	.invert_en																	(invert_en_GPO[6]),
	.GPO_pose_cnt																(GPO7_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[6])
);
GPO_gen GPO8 (
    .clk																		(clk), 
    .avmm_clk																	(avmm_clk), 
    .GPO_ID                                                                     (6'd24),
    .mask_ID                                                                    (6'd32),
    .rst_n																		(rst_n), 
    .mb_wr_en																	(wr_en), 
    .mb_addr																	(addr), 
    .mb_data																	(data), 
    .light_outputing															(light_outputing[7]),
    .work_mode																	(work_mode), 
	.cycle_rst																	(cycle_rst|rst_timer),
    .software_trigger														    (user_output[7]), 
    .step_pluse																    (step_pluse), 
    .light_wave																    (light_wave), 
    .chx_delay_GPO                                                              (chx_delay_GPO8         ),
    .step_mask_standard                                                         (step_mask_standard_GPO8),
    .output_width                                                               (output_width_GPO8      ),
	.step_cnt																	(step_cnt),
    .master_switch															    (master_switch), 
	.invert_en																	(invert_en_GPO[7]),
	.GPO_pose_cnt																(GPO8_pose_cnt),
    .clear_key_d                                                                (clear_key_d),
    .GPO_wave																	(GPO[7])
);

GPO_func_select GPO_func_select (
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .GPO_function                                                               (GPO_function), 
    .GPO_func_wave                                                              (GPO), 
	.work_mode                                                                  (work_mode),
    .step_end_valid                                                             (step_end_valid), 
    .GPO_out                                                                    (GPO_out)
);


led_ext led_ext_light1 (
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[0]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[0])
);
led_ext led_ext_light2(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[1]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[1])
);
led_ext led_ext_light3(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[2]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[2])
);
led_ext led_ext_light4(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[3]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[3])
);

led_ext led_ext_light5(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[4]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[4])
);
led_ext led_ext_light6(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[5]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[5])
);

led_ext led_ext_light7(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[6]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[6])
);
led_ext led_ext_light8(
    .clk                                                                        (clk), 
    .rst_n                                                                      (rst_n), 
    .signal_in                                                                  (light_wave[7]), 
    .work_mode                                                                  (work_mode), 
    .led_state_o                                                                (light_state_o[7])
);



endmodule
