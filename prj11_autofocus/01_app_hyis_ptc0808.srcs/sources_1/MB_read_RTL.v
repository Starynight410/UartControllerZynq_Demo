`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:32:06 01/18/2023 
// Design Name: 
// Module Name:    MB_read_RTL 
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
module MB_read_RTL(
input									                                            clk_10m,
input									                                            avmm_clk,
input									                                            rst_n,
    
(* mark_debug = "true" , dont_touch = "true"  *)input                                                                           mode_key,
input                                                                               group_add_key,
    
input          [7:0]                                                                step_cnt,
input          [7:0]				                                                light_wave,
input          [2:0]					                                            GPI_after_mul,
(* mark_debug = "true" , dont_touch = "true"  *)input 	        								                                rd_en,
(* mark_debug = "true" , dont_touch = "true"  *)input          [21:0]	                                                        addr,

input           [31:0]														        GPO_pose_cnt1,
input           [31:0]														        GPO_pose_cnt2,
input           [31:0]														        GPO_pose_cnt3,
input           [31:0]														        GPO_pose_cnt4,
input           [31:0]														        GPO_pose_cnt5,
input           [31:0]														        GPO_pose_cnt6,
input           [31:0]														        GPO_pose_cnt7,
input           [31:0]														        GPO_pose_cnt8,
        
input           [31:0]														        GPI_pose_cnt1,
input           [31:0]														        GPI_pose_cnt2,
input           [31:0]														        GPI_pose_cnt3,
input           [31:0]														        GPI_pose_cnt4,
input           [31:0]														        GPI_pose_cnt5,
input           [31:0]														        GPI_pose_cnt6,
input           [31:0]														        GPI_pose_cnt7,
input           [31:0]														        GPI_pose_cnt8,

input           [3:0]   light_mode,  //0:normal  1:5v mode
input           [9:0]   dac_data1,dac_data2,dac_data3,dac_data4,dac_data5,dac_data6,dac_data7,dac_data8,
input           [31:0]  PW1,PW2,PW3,PW4,PW5,PW6,PW7,PW8,
input           [63:0]  temp_data,
input           [11:0]  device_alarm,
input           [3:0]                                                               group_value,
input           [7:0]                                                               light_switch,
input           [7:0]                                                               step,

(* mark_debug = "true" , dont_touch = "true"  *)output reg                                                                      rd_valid,
(* mark_debug = "true" , dont_touch = "true"  *)output         [31:0]				                                            data_to_mb
); 

reg  [31:0]                                 data_to_mb_t;
reg  [31:0]							        Firmware_Version = {8'd4,8'd0,16'd4};

localparam 							        period = 32'd10_000_000;

reg                                         rd_en_cache;
reg                                         rd_en_cache2;
wire rd_en_nege2;

assign rd_en_nege2 = ({rd_en_cache2,rd_en_cache}  == 2'b10);

reg rd_en_nege;
always @(posedge avmm_clk)
begin
    if(!rst_n)
        rd_en_nege <= 1'b0;
    else if(rd_en_nege2)
        rd_en_nege <= 1'b1;
    else
        rd_en_nege <= 1'b0;
end
always @(posedge avmm_clk)
begin
    if(!rst_n)
    begin
        rd_en_cache  <= 1'b0;
        rd_en_cache2 <= 1'b0;
    end
    else
    begin
        rd_en_cache  <= rd_en;
        rd_en_cache2 <= rd_en_cache;
    end
end

always @(posedge avmm_clk)
begin
    if(!rst_n)
        rd_valid <= 1'b0;
    else if(rd_en_nege)
        rd_valid <= 1'b1;
    else
        rd_valid <= 1'b0;
end

(* mark_debug = "true" , dont_touch = "true"  *)reg  [31:0] key_value;

always @(posedge clk_10m or negedge rst_n)
begin
    if(!rst_n)
        key_value <= 32'd0;
    else if(key_value == 32'd7)
        key_value <= 32'd0;
    else if(mode_key)
        key_value <= key_value + 1'b1;
    
end


assign data_to_mb = (rd_valid == 1'b1)? data_to_mb_t : 32'd0;

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		data_to_mb_t <= 32'd0;
	else if(rd_en)
	begin
		case(addr)
			`GPO_PluseCount1 	: data_to_mb_t <= GPO_pose_cnt1;
			`GPO_PluseCount2 	: data_to_mb_t <= GPO_pose_cnt2;
			`GPO_PluseCount3 	: data_to_mb_t <= GPO_pose_cnt3;
			`GPO_PluseCount4 	: data_to_mb_t <= GPO_pose_cnt4;
			`GPO_PluseCount5 	: data_to_mb_t <= GPO_pose_cnt5;
			`GPO_PluseCount6 	: data_to_mb_t <= GPO_pose_cnt6;
			`GPO_PluseCount7 	: data_to_mb_t <= GPO_pose_cnt7;
			`GPO_PluseCount8 	: data_to_mb_t <= GPO_pose_cnt8;
            
			`GPI_PluseCount1	: data_to_mb_t <= GPI_pose_cnt1;
			`GPI_PluseCount2	: data_to_mb_t <= GPI_pose_cnt2;
			`GPI_PluseCount3    : data_to_mb_t <= GPI_pose_cnt3;
			`GPI_PluseCount4    : data_to_mb_t <= GPI_pose_cnt4;
			`GPI_PluseCount5    : data_to_mb_t <= GPI_pose_cnt5;
			`GPI_PluseCount6    : data_to_mb_t <= GPI_pose_cnt6;
			`GPI_PluseCount7    : data_to_mb_t <= GPI_pose_cnt7;
			`GPI_PluseCount8    : data_to_mb_t <= GPI_pose_cnt8;
            
            `FIRMWARE_VERSION   :data_to_mb_t <= Firmware_Version;
            `GPI_STATE          :data_to_mb_t <= {29'd0,GPI_after_mul};
            `StepCnt_STATE      :data_to_mb_t <= step_cnt;
            `KEY_VALUE          :data_to_mb_t <= key_value; 
            `GROUP_VALUE        :data_to_mb_t <= group_value;
            
            `DacData_light1     :data_to_mb_t <= dac_data1;
            `DacData_light2     :data_to_mb_t <= dac_data2;
            `DacData_light3     :data_to_mb_t <= dac_data3;
            `DacData_light4     :data_to_mb_t <= dac_data4;
            `DacData_light5     :data_to_mb_t <= dac_data5;
            `DacData_light6     :data_to_mb_t <= dac_data6;
            `DacData_light7     :data_to_mb_t <= dac_data7;
            `DacData_light8     :data_to_mb_t <= dac_data8;
            
            `MAIN_SWITCH_1      :data_to_mb_t <= light_switch[0];
            `MAIN_SWITCH_2      :data_to_mb_t <= light_switch[1];
            `MAIN_SWITCH_3      :data_to_mb_t <= light_switch[2];
            `MAIN_SWITCH_4      :data_to_mb_t <= light_switch[3];
            `MAIN_SWITCH_5      :data_to_mb_t <= light_switch[4];
            `MAIN_SWITCH_6      :data_to_mb_t <= light_switch[5];
            `MAIN_SWITCH_7      :data_to_mb_t <= light_switch[6];
            `MAIN_SWITCH_8      :data_to_mb_t <= light_switch[7];
            `StepCnt_Total      :data_to_mb_t <= step;
            `PW1                :data_to_mb_t <= PW1;
            `PW2                :data_to_mb_t <= PW2;
            `PW3                :data_to_mb_t <= PW3;
            `PW4                :data_to_mb_t <= PW4;
            `PW5                :data_to_mb_t <= PW5;
            `PW6                :data_to_mb_t <= PW6;
            `PW7                :data_to_mb_t <= PW7;
            `PW8                :data_to_mb_t <= PW8;
            `TEMP_DATA1         :data_to_mb_t <= temp_data[15:0];
            `TEMP_DATA2         :data_to_mb_t <= temp_data[31:16];
            `TEMP_DATA3         :data_to_mb_t <= temp_data[47:32];
            `TEMP_DATA4         :data_to_mb_t <= temp_data[63:48];
            `DEVICE_ALARM       :data_to_mb_t <= device_alarm;
            `LIGHT_MODE         :data_to_mb_t <= light_mode;
			default : data_to_mb_t <= 32'd0;
		endcase
	end
end



endmodule
