`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:22 11/09/2022 
// Design Name: 
// Module Name:    trigger 
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
module trigger(
    input                                                   clk_10m,
    input                                                   clk_50m,
    input                                                   sys_rst_n,
    input                                                   avmm_clk,
    input                                                   mode_key,
    input                                                   group_add_key,
    input                                                   clear_key,
    input                                                   aAvmmBase_read,
    output [31:0]                                           aAvmmBase_readdata,     
    output                                                  aAvmmBase_readdatavalid,

    input                                                   aAvmmBase_write,   
    input  [21:0]                                           aAvmmBase_address,       							  
    input  [31:0]                                           aAvmmBase_writedata,                             

    input  [7:0]                                            GPI,              							          
    output [7:0]                                            GPO_out,           							      
    
    input   [3:0]                                           light_mode,  //0:normal  1:5v mode
    output [7:0]                                            light_wave,
    output  [7:0]                                           light_state_o,              		     	          

    output                                                  led_test,

    output  [7:0]                                           scl_real,              							      
    inout   [7:0]                                           sda,

    inout   [3:0]                                           sensor_temp,

    output                                                  Out12Ven,
    output                                                  Out24Ven,

    output                                                  In5Ven,
    output                                                  In12Ven,
    output                                                  In24Ven,

    output  [7:0]                                           Turbo
);

wire  [31:0]										    data_from_RTL;
wire  [2:0]											    GPI_to_mb;
wire  [7:0]											    step_cnt;

wire [31:0]												GPO_pose_cnt1;
wire [31:0]												GPO_pose_cnt2;
wire [31:0]												GPO_pose_cnt3;
wire [31:0]												GPO_pose_cnt4;
wire [31:0]												GPO_pose_cnt5;
wire [31:0]												GPO_pose_cnt6;
wire [31:0]												GPO_pose_cnt7;
wire [31:0]												GPO_pose_cnt8;

wire [31:0]												GPI_pose_cnt1;
wire [31:0]												GPI_pose_cnt2;
wire [31:0]												GPI_pose_cnt3;
wire [31:0]												GPI_pose_cnt4;
wire [31:0]												GPI_pose_cnt5;
wire [31:0]												GPI_pose_cnt6;
wire [31:0]												GPI_pose_cnt7;
wire [31:0]												GPI_pose_cnt8;
   
wire                                                    mode_key_d;
wire                                                    group_add_key_d;
wire                                                    clear_key_d;

reg                                                     wr_en;
reg                                                     rd_en;
reg [31:0]                                              data;
reg [21:0]                                              addr_s; 

debounce_button debounce_ModeKey(
    .clk                                                    (clk_10m),
    .rst_n                                                  (sys_rst_n),
    .db_time                                                (32'd5000),
    .key                                                    (mode_key),                        //输入的按键					
    .key_pulse                                              (mode_key_d)
);

debounce_button debounce_GroupAdd(
    .clk                                                    (clk_10m),
    .rst_n                                                  (sys_rst_n),
    .db_time                                                (32'd5000),
    .key                                                    (group_add_key),                        //输入的按键					
    .key_pulse                                              (group_add_key_d)
);

debounce_button debounce_ClearKey(
    .clk                                                    (clk_10m),
    .rst_n                                                  (sys_rst_n),
    .db_time                                                (32'd5000),
    .key                                                    (clear_key),                        //输入的按键					
    .key_pulse                                              (clear_key_d)
);


always @(posedge avmm_clk)
begin
    if(!sys_rst_n)
        wr_en <= 1'b0;
    else
        wr_en <= aAvmmBase_write;
end

always @(posedge avmm_clk)
begin
    if(!sys_rst_n)
        data <= 1'b0;
    else
        data <= aAvmmBase_writedata;
end

always @(posedge avmm_clk)
begin
    if(!sys_rst_n)
        addr_s <= 22'd0;
    else
        addr_s <= aAvmmBase_address>>2;
end

always @(posedge avmm_clk)
begin
    if(!sys_rst_n)
        rd_en <= 1'b0;
    else
        rd_en <= aAvmmBase_read;
end

/******************************\
*
*        软核读取RTL
*
\******************************/

wire [9:0]                 dac_data1,dac_data2,dac_data3,dac_data4,dac_data5,dac_data6,dac_data7,dac_data8;
wire [31:0]                PW1,PW2,PW3,PW4,PW5,PW6,PW7,PW8;
wire [3:0]                 group_value;
wire [7:0]                 light_switch;
wire [7:0]                 step;
wire [63:0] temp_data;
wire [3:0] temp_alarm;
wire [7:0] light_ocp;

MB_read_RTL MB_read_RTL (
    .clk_10m            (clk_10m), 
    .avmm_clk           (avmm_clk), 
    .rst_n              (sys_rst_n), 
                    
    .mode_key           (mode_key_d),
    .group_add_key      (group_add_key_d),
                    
    .light_wave         (light_wave), 
    .step_cnt           (step_cnt),
    .GPI_after_mul      (GPI_to_mb),
                    
    .rd_en              (rd_en),
    .rd_valid           (aAvmmBase_readdatavalid),
                    
    .addr               (addr_s), 
    .data_to_mb         (aAvmmBase_readdata),
                    
    .GPO_pose_cnt1      (GPO_pose_cnt1),
    .GPO_pose_cnt2      (GPO_pose_cnt2),
    .GPO_pose_cnt3      (GPO_pose_cnt3),
    .GPO_pose_cnt4      (GPO_pose_cnt4),
    .GPO_pose_cnt5      (GPO_pose_cnt5),
    .GPO_pose_cnt6      (GPO_pose_cnt6),
    .GPO_pose_cnt7      (GPO_pose_cnt7),
    .GPO_pose_cnt8      (GPO_pose_cnt8),
                    
    .GPI_pose_cnt1      (GPI_pose_cnt1),
    .GPI_pose_cnt2      (GPI_pose_cnt2),
    .GPI_pose_cnt3      (GPI_pose_cnt3),
    .GPI_pose_cnt4      (GPI_pose_cnt4),
    .GPI_pose_cnt5      (GPI_pose_cnt5),
    .GPI_pose_cnt6      (GPI_pose_cnt6),
    .GPI_pose_cnt7      (GPI_pose_cnt7),
    .GPI_pose_cnt8      (GPI_pose_cnt8),
            
    .light_mode         (light_mode),
    .dac_data1          (dac_data1),
    .dac_data2          (dac_data2),
    .dac_data3          (dac_data3),
    .dac_data4          (dac_data4),
    .dac_data5          (dac_data5),
    .dac_data6          (dac_data6),
    .dac_data7          (dac_data7),
    .dac_data8          (dac_data8),
            
    .PW1                (PW1),
    .PW2                (PW2),
    .PW3                (PW3),
    .PW4                (PW4),
    .PW5                (PW5),
    .PW6                (PW6),
    .PW7                (PW7),
    .PW8                (PW8),
    .temp_data          (temp_data),
    .device_alarm       ({light_ocp,temp_alarm}),
            
    .step               (step),
    .group_value        (group_value),
    .light_switch       (light_switch)
);      

PTC_vtop  PTC_vtop_inst(
    .clk												(clk_10m), 
    .avmm_clk										    (avmm_clk),
    .rst_n											    (sys_rst_n), 
    .wr_en											    (wr_en), 
    .addr											    (addr_s), 
    .data											    (data), 
    .GPI												(GPI), 
    .light_wave									        (light_wave), 
    .GPO_out										    (GPO_out),
    .scl_real										    (scl_real), 
    .sda												(sda),
    .light_state_o								        (light_state_o),
    .GPI_to_mb								            (GPI_to_mb),
    .step_cnt										    (step_cnt),

    .clear_key_d                                        (clear_key_d),

    .GPO_pose_cnt1								        (GPO_pose_cnt1),
    .GPO_pose_cnt2								        (GPO_pose_cnt2),
    .GPO_pose_cnt3								        (GPO_pose_cnt3),
    .GPO_pose_cnt4								        (GPO_pose_cnt4),
    .GPO_pose_cnt5								        (GPO_pose_cnt5),
    .GPO_pose_cnt6								        (GPO_pose_cnt6),
    .GPO_pose_cnt7								        (GPO_pose_cnt7),
    .GPO_pose_cnt8								        (GPO_pose_cnt8),

    .GPI_pose_cnt1								        (GPI_pose_cnt1),
    .GPI_pose_cnt2								        (GPI_pose_cnt2),
    .GPI_pose_cnt3								        (GPI_pose_cnt3),
    .GPI_pose_cnt4								        (GPI_pose_cnt4),
    .GPI_pose_cnt5								        (GPI_pose_cnt5),
    .GPI_pose_cnt6								        (GPI_pose_cnt6),
    .GPI_pose_cnt7								        (GPI_pose_cnt7),
    .GPI_pose_cnt8								        (GPI_pose_cnt8),

    .dac_data1                                          (dac_data1),
    .dac_data2                                          (dac_data2),
    .dac_data3                                          (dac_data3),
    .dac_data4                                          (dac_data4),
    .dac_data5                                          (dac_data5),
    .dac_data6                                          (dac_data6),
    .dac_data7                                          (dac_data7),
    .dac_data8                                          (dac_data8),

    .PW1                                                (PW1),
    .PW2                                                (PW2),
    .PW3                                                (PW3),
    .PW4                                                (PW4),
    .PW5                                                (PW5),
    .PW6                                                (PW6),
    .PW7                                                (PW7),
    .PW8                                                (PW8),
    .step                                               (step),

    .Out12Ven                                           (Out12Ven),
    .Out24Ven                                           (Out24Ven),

    .In5Ven                                             (In5Ven ),
    .In12Ven                                            (In12Ven),
    .In24Ven                                            (In24Ven),
    .Turbo                                              (Turbo),

    .group_value                                        (group_value),
    .light_switch                                       (light_switch),
    .light_ocp                                          (light_ocp)
);

genvar m;
generate
    for(m = 0; m<4; m = m+1) begin:loop0_temp
        hy_ds18b20 ds18b20_dri_inst(
            .clk            (clk_50m),
            .rst_n          (sys_rst_n),
            .dq             (sensor_temp[m]),
            .temp_data      (temp_data[16*m +: 16]),
            .temp_alarm     (temp_alarm[m])
        );
    end
endgenerate

led_test led_testI_inst(
    .clk											(clk_10m), 
    .rst_n											(sys_rst_n), 
    .led										    (led)
);

assign led_test = led;

endmodule
