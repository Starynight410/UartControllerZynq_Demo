// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Mon Aug  5 09:39:26 2024
// Host        : huiyi running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/prj11_autofocus/01_app_hyis_ptc0808.gen/sources_1/bd/design_1/ip/design_1_spi_regmap_top_0_0/design_1_spi_regmap_top_0_0_stub.v
// Design      : design_1_spi_regmap_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "spi_regmap_top,Vivado 2022.2" *)
module design_1_spi_regmap_top_0_0(clk, reset, sclk, ss_n, mosi, miso)
/* synthesis syn_black_box black_box_pad_pin="clk,reset,sclk,ss_n,mosi,miso" */;
  input clk;
  input reset;
  input sclk;
  input ss_n;
  input mosi;
  output miso;
endmodule
