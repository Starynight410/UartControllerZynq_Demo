`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/20 18:19:08
// Design Name: 
// Module Name: IS_PTC_top
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
 

module IS_PTC_top(
input													sys_clk,

//*--------------   7020 arm------------------
inout   [14:0]                                          DDR_addr,
inout   [2:0]                                           DDR_ba, 
inout                                                   DDR_cas_n,
inout                                                   DDR_ck_n,
inout                                                   DDR_ck_p,
inout                                                   DDR_cke,
inout                                                   DDR_cs_n,
inout   [3:0]                                           DDR_dm,
inout   [31:0]                                          DDR_dq,
inout   [3:0]                                           DDR_dqs_n,
inout   [3:0]                                           DDR_dqs_p,
inout                                                   DDR_odt,
inout                                                   DDR_ras_n,
inout                                                   DDR_reset_n,
inout                                                   DDR_we_n,
inout                                                   FIXED_IO_ddr_vrn,
inout                                                   FIXED_IO_ddr_vrp,
inout   [53:0]                                          FIXED_IO_mio,
inout                                                   FIXED_IO_ps_clk,
inout                                                   FIXED_IO_ps_porb,
inout                                                   FIXED_IO_ps_srstb,



input                                                   uart_16550_rxd,
output                                                  uart_16550_txd,
output													o_led1,o_led2,o_led3,

inout                                                   IIC_0_0_scl_io,
inout                                                   IIC_0_0_sda_io

);

//读写总线
wire   [21:0]                                           aAvmmBase_address;			 //地址
wire   [3:0]											aAvmmBase_byteenable;        //字节使能，一般不使用

wire                                                    aAvmmBase_read;          	 //读标志，输出为高时是读操作
reg    [31:0]                                           aAvmmBase_readdata;      	  //读数据
reg                                                     aAvmmBase_readdatavalid; 	//读数据有效
wire                                                    aAvmmBase_write; 			//写标志，输出为高时为写操作
wire   [31:0]                                           aAvmmBase_writedata;		//写数据
wire													avmm_clk;					//总线时钟


//测试地址和寄存器
reg		[31:0]											r_test1=32'd11111;
reg		[31:0]											r_test2=32'd22222;
parameter		addr1 = 22'd300;
parameter		addr2 = 22'd600;

//向addr1写入数据时，保存到r_test1；向addr2写入数据时，保存到r_test2；
//读取时类似
always @ (posedge avmm_clk)
begin
	if(aAvmmBase_read)
	begin
		if(aAvmmBase_address==addr1)
		begin
			aAvmmBase_readdata <= r_test1;
			aAvmmBase_readdatavalid <= 1'b1;
		end
		else if(aAvmmBase_address==addr2)
		begin
			aAvmmBase_readdata <= r_test2;
			aAvmmBase_readdatavalid <= 1'b1;
		end
	end
	else if(aAvmmBase_write)
	begin
		if(aAvmmBase_address==addr1)
		begin
			r_test1 <= aAvmmBase_writedata;
		end
		else if(aAvmmBase_address==addr2)
		begin
			r_test2 <= aAvmmBase_writedata;
		end
	end
	else
	begin
		aAvmmBase_readdata <= 32'd0;
		aAvmmBase_readdatavalid <= 1'b0;
		r_test1 <= r_test1;
		r_test2 <= r_test2;
	end

end

design_1_wrapper design_1_wrapper(
    .DDR_addr                                                   (DDR_addr), 
    .DDR_ba                                                     (DDR_ba), 
    .DDR_cas_n                                                  (DDR_cas_n), 
    .DDR_ck_n                                                   (DDR_ck_n), 
    .DDR_ck_p                                                   (DDR_ck_p), 
    .DDR_cke                                                    (DDR_cke), 
    .DDR_cs_n                                                   (DDR_cs_n), 
    .DDR_dm                                                     (DDR_dm), 
    .DDR_dq                                                     (DDR_dq), 
    .DDR_dqs_n                                                  (DDR_dqs_n), 
    .DDR_dqs_p                                                  (DDR_dqs_p), 
    .DDR_odt                                                    (DDR_odt), 
    .DDR_ras_n                                                  (DDR_ras_n), 
    .DDR_reset_n                                                (DDR_reset_n), 
    .DDR_we_n                                                   (DDR_we_n), 
    .FIXED_IO_ddr_vrn                                           (FIXED_IO_ddr_vrn), 
    .FIXED_IO_ddr_vrp                                           (FIXED_IO_ddr_vrp), 
    .FIXED_IO_mio                                               (FIXED_IO_mio), 
    .FIXED_IO_ps_clk                                            (FIXED_IO_ps_clk), 
    .FIXED_IO_ps_porb                                           (FIXED_IO_ps_porb), 
    .FIXED_IO_ps_srstb                                          (FIXED_IO_ps_srstb), 
    
    .GPIO                                                       ({o_led3,o_led2,o_led1}),

    .aAvmmBase_address                                          (aAvmmBase_address), 
    .aAvmmBase_byteenable                                       (aAvmmBase_byteenable), 
    .aAvmmBase_read                                             (aAvmmBase_read), 
    .aAvmmBase_readdata                                         (aAvmmBase_readdata), 
    .aAvmmBase_readdatavalid                                    (aAvmmBase_readdatavalid), 
    .aAvmmBase_write                                            (aAvmmBase_write), 
    .aAvmmBase_writedata                                        (aAvmmBase_writedata), 
    .avmm_clk                                                   (avmm_clk),
    .uart_16550_rxd                                             (uart_16550_rxd), 
    .uart_16550_txd                                             (uart_16550_txd),
    .IIC_0_0_scl_io                                             (IIC_0_0_scl_io),
    .IIC_0_0_sda_io                                             (IIC_0_0_sda_io)
    
);



endmodule
