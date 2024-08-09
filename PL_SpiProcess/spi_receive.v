`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/07 14:51:42
// Design Name: 
// Module Name: spi_receive
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


module spi_receive#(
    parameter 		P_DATA_IN_WIDTH			=	1, //输入数据位宽
    parameter 		P_DATA_TEMP_WIDTH  		=   8  //输出数据位宽 
)(
    input clk,
    input rst_n,
    
    // signal from ps
    input   [P_DATA_IN_WIDTH-1:0]       SPI0_MOSI_O,    
    input                               SPI0_SCLK_O,
    input                               SPI0_SS_O,
    
    output                              valid,
    output  [P_DATA_TEMP_WIDTH-1:0]     dout
);

localparam		LP_WIDTH_RATIO	=   (P_DATA_TEMP_WIDTH/P_DATA_IN_WIDTH);

/*构造状态机*/
localparam IDLE        = 3'b001;    //等待开始
localparam STORE_DATA  = 3'b010;    //移位寄存
localparam READ_ENABLE = 3'b100;    //完成寄存进行输出使能

reg sclk_s, sclk_d, csn_s, csn_d;
wire sclk_posdege;
wire csn_posedge, csn_negedge;
reg [2:0] state;
reg [P_DATA_TEMP_WIDTH-1:0] shift_register; 
reg [($clog2(LP_WIDTH_RATIO)):0] store_cnt;   //打包计数器

reg valid_reg;
reg [P_DATA_TEMP_WIDTH-1:0] dout_reg;

assign valid = valid_reg;
assign dout = dout_reg;

//提取边沿
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        sclk_s <= 0;
        sclk_d <= 0;
        csn_s <= 0;
        csn_d <= 0;
    end
    else begin
        sclk_s <= SPI0_SCLK_O;
        sclk_d <= sclk_s;
        csn_s <= SPI0_SS_O;
        csn_d <= csn_s;
    end
end

assign sclk_posedge = ~sclk_d & sclk_s;
assign csn_negedge  = csn_d & (~csn_s);
assign csn_posedge  = ~csn_d & csn_s;

//状态机控制
always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= STORE_DATA;    //启动直接开始发数
    end
    else begin
        case (state)
            IDLE: if (sclk_posedge)                      state <= STORE_DATA;
                  else if (csn_negedge)                  state <= STORE_DATA;
                  else                                   state <= IDLE;
            
            STORE_DATA: if (store_cnt==P_DATA_TEMP_WIDTH)state <= READ_ENABLE;
                        else if (csn_posedge)            state <= IDLE;
                        else                             state <= STORE_DATA;
                             
            READ_ENABLE: if(csn_posedge)                 state <= IDLE;
                         else                            state <= STORE_DATA;                                    
        endcase
    end  
end

always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        dout_reg <= 0;
        valid_reg <= 0;
        shift_register <= 0;
        store_cnt <= 0;
    end 
    else begin
        case (state)
            IDLE: begin
                shift_register <= 0;
                valid_reg <= 0;
                dout_reg <= 0;
                store_cnt <= 0;                        
            end
            
            STORE_DATA: begin
                valid_reg <= 0;
                if (sclk_posedge) begin
//                    shift_register[(store_cnt*P_DATA_IN_WIDTH)+:P_DATA_IN_WIDTH] <= SPI0_MOSI_O;  //低位为先传输的数据 
                    shift_register[((P_DATA_TEMP_WIDTH-1-store_cnt)*P_DATA_IN_WIDTH)-:P_DATA_IN_WIDTH] <= SPI0_MOSI_O;    //高位为先传输的数据          
                    store_cnt <= store_cnt + 1;             
                end
                else begin
                    shift_register <= shift_register;
                end       
            end
            
            READ_ENABLE: begin     
                valid_reg <= 1;                                         
                dout_reg <= shift_register;
                store_cnt <= 0;
            end                
            
        endcase
    end
end

ila_1 ila_spi_receive (
	.clk(clk),                 // input wire clk

	.probe0(SPI0_MOSI_O),      // input wire [0:0]  probe0  
	.probe1(state),            // input wire [2:0]  probe1 
	.probe2(shift_register),   // input wire [7:0]  probe2 
	.probe3(store_cnt),        // input wire [3:0]  probe3 
	.probe4(sclk_posedge)      // input wire [0:0]  probe4 
);

endmodule