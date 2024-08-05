-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
-- Date        : Mon Aug  5 09:39:26 2024
-- Host        : huiyi running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/prj11_autofocus/01_app_hyis_ptc0808.gen/sources_1/bd/design_1/ip/design_1_spi_regmap_top_0_0/design_1_spi_regmap_top_0_0_stub.vhdl
-- Design      : design_1_spi_regmap_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_spi_regmap_top_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    sclk : in STD_LOGIC;
    ss_n : in STD_LOGIC;
    mosi : in STD_LOGIC;
    miso : out STD_LOGIC
  );

end design_1_spi_regmap_top_0_0;

architecture stub of design_1_spi_regmap_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,reset,sclk,ss_n,mosi,miso";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "spi_regmap_top,Vivado 2022.2";
begin
end;
