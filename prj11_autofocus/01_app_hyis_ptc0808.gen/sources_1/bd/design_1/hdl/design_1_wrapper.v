//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
//Date        : Mon Aug  5 10:49:53 2024
//Host        : huiyi running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GPIO,
    IIC_0_0_scl_io,
    IIC_0_0_sda_io,
    SPI0_MOSI_O,
    SPI0_SCLK_O,
    SPI0_SS_O,
    aAvmmBase_address,
    aAvmmBase_byteenable,
    aAvmmBase_read,
    aAvmmBase_readdata,
    aAvmmBase_readdatavalid,
    aAvmmBase_write,
    aAvmmBase_writedata,
    avmm_clk,
    uart_16550_baudoutn,
    uart_16550_ctsn,
    uart_16550_dcdn,
    uart_16550_ddis,
    uart_16550_dsrn,
    uart_16550_dtrn,
    uart_16550_out1n,
    uart_16550_out2n,
    uart_16550_ri,
    uart_16550_rtsn,
    uart_16550_rxd,
    uart_16550_rxrdyn,
    uart_16550_txd,
    uart_16550_txrdyn);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [2:0]GPIO;
  inout IIC_0_0_scl_io;
  inout IIC_0_0_sda_io;
  output SPI0_MOSI_O;
  output SPI0_SCLK_O;
  output SPI0_SS_O;
  output [21:0]aAvmmBase_address;
  output [3:0]aAvmmBase_byteenable;
  output aAvmmBase_read;
  input [31:0]aAvmmBase_readdata;
  input aAvmmBase_readdatavalid;
  output aAvmmBase_write;
  output [31:0]aAvmmBase_writedata;
  output avmm_clk;
  output uart_16550_baudoutn;
  input uart_16550_ctsn;
  input uart_16550_dcdn;
  output uart_16550_ddis;
  input uart_16550_dsrn;
  output uart_16550_dtrn;
  output uart_16550_out1n;
  output uart_16550_out2n;
  input uart_16550_ri;
  output uart_16550_rtsn;
  input uart_16550_rxd;
  output uart_16550_rxrdyn;
  output uart_16550_txd;
  output uart_16550_txrdyn;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [2:0]GPIO;
  wire IIC_0_0_scl_i;
  wire IIC_0_0_scl_io;
  wire IIC_0_0_scl_o;
  wire IIC_0_0_scl_t;
  wire IIC_0_0_sda_i;
  wire IIC_0_0_sda_io;
  wire IIC_0_0_sda_o;
  wire IIC_0_0_sda_t;
  wire SPI0_MOSI_O;
  wire SPI0_SCLK_O;
  wire SPI0_SS_O;
  wire [21:0]aAvmmBase_address;
  wire [3:0]aAvmmBase_byteenable;
  wire aAvmmBase_read;
  wire [31:0]aAvmmBase_readdata;
  wire aAvmmBase_readdatavalid;
  wire aAvmmBase_write;
  wire [31:0]aAvmmBase_writedata;
  wire avmm_clk;
  wire uart_16550_baudoutn;
  wire uart_16550_ctsn;
  wire uart_16550_dcdn;
  wire uart_16550_ddis;
  wire uart_16550_dsrn;
  wire uart_16550_dtrn;
  wire uart_16550_out1n;
  wire uart_16550_out2n;
  wire uart_16550_ri;
  wire uart_16550_rtsn;
  wire uart_16550_rxd;
  wire uart_16550_rxrdyn;
  wire uart_16550_txd;
  wire uart_16550_txrdyn;

  IOBUF IIC_0_0_scl_iobuf
       (.I(IIC_0_0_scl_o),
        .IO(IIC_0_0_scl_io),
        .O(IIC_0_0_scl_i),
        .T(IIC_0_0_scl_t));
  IOBUF IIC_0_0_sda_iobuf
       (.I(IIC_0_0_sda_o),
        .IO(IIC_0_0_sda_io),
        .O(IIC_0_0_sda_i),
        .T(IIC_0_0_sda_t));
  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO(GPIO),
        .IIC_0_0_scl_i(IIC_0_0_scl_i),
        .IIC_0_0_scl_o(IIC_0_0_scl_o),
        .IIC_0_0_scl_t(IIC_0_0_scl_t),
        .IIC_0_0_sda_i(IIC_0_0_sda_i),
        .IIC_0_0_sda_o(IIC_0_0_sda_o),
        .IIC_0_0_sda_t(IIC_0_0_sda_t),
        .SPI0_MOSI_O(SPI0_MOSI_O),
        .SPI0_SCLK_O(SPI0_SCLK_O),
        .SPI0_SS_O(SPI0_SS_O),
        .aAvmmBase_address(aAvmmBase_address),
        .aAvmmBase_byteenable(aAvmmBase_byteenable),
        .aAvmmBase_read(aAvmmBase_read),
        .aAvmmBase_readdata(aAvmmBase_readdata),
        .aAvmmBase_readdatavalid(aAvmmBase_readdatavalid),
        .aAvmmBase_write(aAvmmBase_write),
        .aAvmmBase_writedata(aAvmmBase_writedata),
        .avmm_clk(avmm_clk),
        .uart_16550_baudoutn(uart_16550_baudoutn),
        .uart_16550_ctsn(uart_16550_ctsn),
        .uart_16550_dcdn(uart_16550_dcdn),
        .uart_16550_ddis(uart_16550_ddis),
        .uart_16550_dsrn(uart_16550_dsrn),
        .uart_16550_dtrn(uart_16550_dtrn),
        .uart_16550_out1n(uart_16550_out1n),
        .uart_16550_out2n(uart_16550_out2n),
        .uart_16550_ri(uart_16550_ri),
        .uart_16550_rtsn(uart_16550_rtsn),
        .uart_16550_rxd(uart_16550_rxd),
        .uart_16550_rxrdyn(uart_16550_rxrdyn),
        .uart_16550_txd(uart_16550_txd),
        .uart_16550_txrdyn(uart_16550_txrdyn));
endmodule
