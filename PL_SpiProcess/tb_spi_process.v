`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/08 09:12:45
// Design Name: 
// Module Name: tb_spi_process
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


module tb_spi_process;

parameter 				P_DATA_IN_WIDTH			=	1;  //输入数据位宽
parameter 				P_DATA_TEMP_WIDTH  		=   8; //组装的输入数据位宽

reg								clk			;
reg							    sclk		;
reg							    cs_n	    ;
reg							    rst_n	    ;
reg [P_DATA_IN_WIDTH-1:0]       mosi_7_0    ;	
wire [P_DATA_TEMP_WIDTH-1:0]    dout        ;
wire                            rd_en       ;
wire							sclk_1		; //根据cs_n的状态有停歇的时钟sclk_1
reg [8:0] csn_cnt;

// output
wire    SPI0_MISO_I;
wire    SPI0_SCLK_I;
wire    SPI0_SS_I;

//the clk generation
initial begin
	clk = 1;
    cs_n = 1'b1;
	sclk = 1;
	rst_n = 1'b0;
	csn_cnt = 0;
	#1 rst_n = 1'b1; 
	#5 cs_n = 1'b0;
  end

always #5 clk = ~clk;       //100MHz clk， 读数为10MHz采样
always #200 sclk = ~sclk;   //2.5MHz SPI 

initial begin
    mosi_7_0 <= 1;
    #160
    mosi_7_0 <= 1;
    repeat(1000) begin
        @(posedge sclk_1) begin
            if (mosi_7_0 == 0) begin
                mosi_7_0 <= 1;
            end
            else begin
                mosi_7_0 <= 0;
            end
        end
    end
end

// simulate cs_n
always @(posedge sclk) begin
    if(~cs_n) begin
        if(csn_cnt == 7'd80) begin
            cs_n <= ~cs_n;
            csn_cnt <= 7'd0;
        end 
        else begin 
            csn_cnt <= csn_cnt + 1'd1;
        end
    end
    else begin
        if(csn_cnt == 7'd5) begin
            cs_n <= ~cs_n;
            #200 csn_cnt <= 7'd0;          
        end 
        else begin 
            csn_cnt <= csn_cnt + 1'd1;
        end
    end
end

assign sclk_1 = sclk & (~cs_n); 
assign sclk_1_fan = ~sclk_1;

spi_process#(
		.P_DATA_IN_WIDTH(P_DATA_IN_WIDTH),
		.P_DATA_TEMP_WIDTH(P_DATA_TEMP_WIDTH)
) u_spi_process (
	.clk           (clk         ),
	.rst_n         (rst_n       ),
    .SPI0_MOSI_O   (mosi_7_0    ),
    .SPI0_SCLK_O   (sclk_1      ),
    .SPI0_SS_O     (cs_n        ),
    .SPI0_MISO_I   (SPI0_MISO_I ),
    .SPI0_SCLK_I   (SPI0_SCLK_I ),
    .SPI0_SS_I     (SPI0_SS_I   )
);
  
endmodule
