`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/07 14:51:42
// Design Name: 
// Module Name: spi_send
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


// 采用SPI模式0：上升沿采样数据，下降沿切换数据
module spi_send#(
    parameter 		P_DATA_IN_WIDTH			=	1, //输入数据位宽
    parameter 		P_DATA_TEMP_WIDTH  		=   8  //输出数据位宽 
)(
    input                           clk,
    input                           rst_n,
    
    input                           valid,
    input  [P_DATA_TEMP_WIDTH-1:0]  data_i,   //发送数据 
    // signal to ps
    output [P_DATA_IN_WIDTH-1:0]    SPI0_MISO_I,    
    output                          SPI0_SCLK_I,
    output                          SPI0_SS_I

);

localparam		LP_WIDTH_RATIO	=   (P_DATA_TEMP_WIDTH/P_DATA_IN_WIDTH);
localparam      Uart_DataLen    =   3;  // 固定一次发送的字节数

reg  valid_s, valid_d;
wire valid_posedge;
reg [7:0] send_cnt; // 记录发送字节数，拉高SS

//提取边沿
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        valid_s <= 0;
        valid_d <= 0;
        send_cnt <= 0;
    end
    else begin
        valid_s <= valid;
        valid_d <= valid_s;
        if(valid == 1'b1)   send_cnt <= send_cnt + 1'b1;
        else                send_cnt <= send_cnt;
    end
end

assign valid_posedge = ~valid_d & valid_s;

reg SPI0_SCLK_I_REG;
reg SPI0_SS_I_REG;
reg [P_DATA_IN_WIDTH-1:0] SPI0_MISO_I_REG;
reg [P_DATA_TEMP_WIDTH-1:0] data;
reg SPI0_SS_sign;   // csn标志位

assign SPI0_MISO_I = SPI0_MISO_I_REG;
assign SPI0_SCLK_I = SPI0_SCLK_I_REG_d2;
assign SPI0_SS_I   = SPI0_SS_I_REG_d2 || SPI0_SS_sign;    // 时序调整打3拍
     
/*构造状态机*/
reg [4:0] state;
localparam D7_State     = 5'd0;     //发送最高位数据-状态
localparam D6_State     = 5'd2;
localparam D5_State     = 5'd4;
localparam D4_State     = 5'd6;
localparam D3_State     = 5'd8;
localparam D2_State     = 5'd10;
localparam D1_State     = 5'd12;
localparam D0_State     = 5'd14;    //发送最低位数据-状态
localparam IDLE         = 5'd16; 
localparam STORE_DATA   = 5'd18;    //缓存有效数据 
localparam D0_CLAP_State= 5'd20;    //确保每个字节结尾拉高

always@(posedge clk or negedge rst_n)begin
    if(!rst_n)//复位
    begin
        SPI0_SCLK_I_REG <= 1'b0;    //SPI0_SCLK_I_REG初始电平为低
        SPI0_SS_I_REG <= 1'b1;      //SPI0_SS_I_REG初始电平为高
        SPI0_MISO_I_REG <= 1'b0;    //SPI0_MISO_I_REG初始电平为低
        data <= 8'b0;
        state <= IDLE;
    end
    else begin  //产生SPI时序
        if(send_cnt == 0) begin
            SPI0_SS_I_REG <= 1'b1;
        end
        else begin
            SPI0_SS_I_REG <= 1'b0;//SPI0_SS_I_REG拉低准备数据传输
        end
        case(state)
            5'd1,5'd3,5'd5,5'd7,5'd9,5'd11,5'd13,5'd15://每次放置数据完毕后 在此拉高时钟线，便于下次的下降沿产生
            begin
                SPI0_SCLK_I_REG <= 1'b1;//准备在下降沿放置数据，提前将SCK拉高
                state <= state + 5'd1;
            end
           
            IDLE:
            begin
                SPI0_SCLK_I_REG <= 1'b0;
                SPI0_MISO_I_REG <= SPI0_MISO_I_REG;
                data <= data;
                if (valid_posedge) state <= STORE_DATA;
                else state <= IDLE;
            end
            
            STORE_DATA:
            begin
                data <= data_i; //缓存数据
                SPI0_SCLK_I_REG <= 1'b1;//准备在下降沿放置数据，提前将SCK拉高
                state <= D7_State;
            end
            
            D7_State://第7位数据发送状态
            begin
                SPI0_MISO_I_REG <= data[7];//D7数据
                SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                state <= state + 5'd1;
            end
            
            D6_State://第6位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[6];//D6数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= state + 5'd1;
            end
            
            D5_State://第5位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[5];//D5数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= state + 5'd1;
            end
            
            D4_State://第4位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[4];//D4数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= state + 5'd1;
            end
            
            D3_State://第3位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[3];//D3数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= state + 5'd1;
            end
            
            D2_State://第2位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[2];//D2数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= state + 5'd1;
            end
            
            D1_State://第1位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[1];//D1数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= state + 5'd1;
            end
            
            D0_State://第0位数据发送状态
            begin
                 SPI0_MISO_I_REG <= data[0];//D0数据
                 SPI0_SCLK_I_REG <= 1'b0;//在下降沿放置数据
                 state <= D0_CLAP_State;
            end
            
            D0_CLAP_State://确保每个字节结尾拉高
            begin
                SPI0_SS_I_REG <= 1'b1;//此状态拉高一个周期SS作为单次传输结尾
                SPI0_SCLK_I_REG <= SPI0_SCLK_I_REG;
                SPI0_MISO_I_REG <= SPI0_MISO_I_REG;
                state <= IDLE;
            end
            
            default: state <= IDLE;
        endcase
    end
end

reg SPI0_SCLK_I_REG_d1, SPI0_SCLK_I_REG_d2;
reg SPI0_SS_I_REG_d1, SPI0_SS_I_REG_d2;

// 对sclk，csn打拍对其发送
always@(posedge clk or negedge rst_n)begin  
	if(!rst_n)begin                            
		SPI0_SCLK_I_REG_d1 <= 1'b0;
		SPI0_SCLK_I_REG_d2 <= 1'b0;
        SPI0_SS_I_REG_d1 <= 1'b1;
        SPI0_SS_I_REG_d2 <= 1'b1;
	end
	else begin
		SPI0_SCLK_I_REG_d1 <= SPI0_SCLK_I_REG;
		SPI0_SCLK_I_REG_d2 <= SPI0_SCLK_I_REG_d1;
		SPI0_SS_I_REG_d1 <= SPI0_SS_I_REG;
		SPI0_SS_I_REG_d2 <= SPI0_SS_I_REG_d1;
	end		
end

// 固定字节数发送完成，拉高csn
always@(posedge clk or negedge rst_n)begin  
	if(!rst_n)begin   
        SPI0_SS_sign <= 1'b0;
	end
	else begin
        if((send_cnt % Uart_DataLen == 0) && (send_cnt) && (SPI0_SS_I_REG_d2 == 1))   SPI0_SS_sign <= 1'b1;
        else if(valid == 1'b1)   SPI0_SS_sign <= 1'b0;
        else                     SPI0_SS_sign <= SPI0_SS_sign;
	end
end

ila_2 ila_spi_send (
	.clk(clk),                     // input wire clk

	.probe0(SPI0_MISO_I_REG),      // input wire [0:0]  probe0  
	.probe1(SPI0_SCLK_I_REG),      // input wire [0:0]  probe1 
	.probe2(SPI0_SS_I_REG),        // input wire [0:0]  probe2 
	.probe3(state),                // input wire [4:0]  probe3 
	.probe4(data),                 // input wire [7:0]  probe4
	.probe5(valid_posedge)         // input wire [0:0]  probe5
);

endmodule
