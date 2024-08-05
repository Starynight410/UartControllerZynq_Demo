// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Apr 15 19:07:15 2024
// Host        : ZKHY-BJ-GXQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/CASI_Project/4_hyis_ptc0808_10/f02.app_rtl/01_app_hyis_ptc0808/01_app_hyis_ptc0808.gen/sources_1/ip/cycle_mode/cycle_mode_sim_netlist.v
// Design      : cycle_mode
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cycle_mode,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module cycle_mode
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [9:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [9:0]addra;
  wire [9:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_douta_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.254725 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "cycle_mode.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  cycle_mode_blk_mem_gen_v8_4_5 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[31:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oESHD2Q5NORrmTVTCApB+YFZJwjA1ezq7U6VZh96by+ofPCvSFp06AIoCLvB4BhPvxfob6kIkBpR
xVCOLM7HsDk7nO1JVWiYIJ6okoWTA8hAlPj3sdGuMwRlZNSBKn/c6F+CW5Jl37TEGotkhycSB3Bg
B/uu1THUZwIG87RPahE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RovEhaqHrFqzjckk+DIWG8LQeqg2Y/nACQDyXKKtSav7YHlgpKmgHZnsxwwNpqrqVRGyjTecSQ+e
6Mr/Pi9au3AgJVPL6VOgwNVE0yj2LpA4LPyWzxLN3+DiSDmsaCBNCBlVQi2MRKUabou8nLaXldbL
+7pv4pYhQdcyjDzuC2dx3HmzADqstdEiyXeU3ktJ29CDLDmGwDWdmsrl90s4YQSfBV2nj4/Vut3L
p/8dzphf1htPaNMujMxxgp3z4JzUEDJJokDL+gNutEEHiaWpI3URIA5v22vJu+NPD+eEraSioHfL
DPKAajZTwK5FHnonu4O2D0co8GWqWW5cUqZz9A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jBQ6Th9yy7jtKQD1h235YLT6qO6XiBaBKGJrV1Z8H9M9ePJ9R/fA8E1okt4LyBvoWjR7tmCbIg7A
0/vuKOogkLtDE/BtTlp4z1iurO8rQrAcdZy/e+7GATawyJxFY7kZhnXASu9zB8TiOBELSlapkpxe
WuAzXLde9FBMBkq4RSc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eucSNV2Zbm4zYc2tIGRlGmlVM8+WHY1NHe9drZdgDhGPOHz8PTqHapfnZ1kWuTLtPBLSMvcXNScn
UTvpULofBV6qD7WHLPg7UJcjpZVDL69lk88chgqrlc/RqaJXKNVv+Ubku53ZLU20uZK71bNymjSM
855RVWw5lvTHTCNC2MYIS94Fmrzuq8i0+tFh5qBKkHK2BC+fD7xVyyfuh4mZR2yr/hRs/emoI79E
IKoJnLiglVp6RXTsXFzZW4pIthbjWSuZlOQvoYkS2RMj8a0r9lyariphRQunoudc0bLO4Phk578c
40gusaaS/MI7idMT7k1Di96kvu5mHi23loRcZQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E/syLaRG2Ss/xTTkuAkOKXzm53+rCptYO2DkVukWhvlLmEB2daHCPrXt4gKeuG+0hIGWedSwCiLJ
7KNtEAiTumJ/j+3p7s3oXN9ftCSRolXoACsCclEAmwYjVM0ubCXUx6JNFOGt0yDl2Jsd5+W10mSJ
bYEKvRKi7koXM/eYJqbhTrtsrHDwRJEY0JVUPh8EOkLLqaIKbnjb6ENEY6qZOamp5PaWsSS30gJM
N6fB8D1AmGKnFbfY+d5TexS55Z92aYcAHNX2XwHsKnm45az1vHeZ0rTEU/oONIaSZfikRni1iDBg
x2GOue6sLiwxTEHaVkTJsOVR4mx0VsfFxavwRg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dSHHpkQiOEzzKs4D71WVyDXLpkKuR9h9h3pBLtnCq2bXiwE/eQHmk5HeQb+qREg0Yv193OukqaQz
RZyuF5GQcqOpqFHMxO62HQ2pdjdpMT5CC7gHvmgiw9qBkJJrXpihIHER4X7OF2iNUfeqxJ8eiSz3
C0V20NlIwKG7Mxg8MVj++xmb32KMUqL7ptikkym20vVdhecVMNvpPoXp8uvaGT7991enWP9HGKUC
9kLY2DEYwRGE71UJJLGWo4n49R50ExFRj91xWnYfvp7uJsMNwnBp5l3GTZiMELX2RkRVSPOHr7l1
n2p5Vq7Uee2drny1IxZ/4c0hYY6y3QWSEqpESw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HUtfqZ9dh5oZTOAt9a0ebo+wQbzg3izFQ0kVqZN81S4cBjQEF53WUiVlTKBDVjvLNUby4Se9WZjj
j86TQzuGJxLPDTohmbytErsg5JrlXHbHGwR4zGNGTbBs12X7PkxtS8wVCp+7b1rX6pOGOPqm6FoG
g6rZY/bTzVfGYF2CAOhjJUqUOXEAKnZRehspRyiBI28/ZZPSAUD/abKprW8PWCxMx2zPWztZz4No
R96jgvHezNzB1Ta8W7uRBFTMp+XVSToxTp2jzSXJZ0V5xJl+gdVjAMmf6+te2vqrK2wDWdMxk3Sf
iyLI4d0s25vCybcY2fZWacq5iO9pSlSaOQWgCA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
vYYu2Kvhv3RZi0pFbjRTQ/BBwfilCrGpkMls+Dz6HBGTZvSaC/anWgymoDS0XnoSENGG3Pz3EBF0
19OqLbyna95IHFe2bA7f8RgU9SEUffZ8eXGigfOjAWpZCN07Q77RkhGUKal7okWe3Q6xHtZy83l2
kW8ma3kOYL7GzQjtpbP3lINHLMqpGEo0dzbOHiJ5r6W5U6DsILGsoLQOXcw+MwrevvNRB0KkSklj
QnL8K2AK8PIsJGM6F8dj5KwRYhSBYNb1opuVpiJWlbHgADoeM+dhiRxBLmnaDE8PWs1ReY6uMzzH
SvvO6UEyxQtvS/Smm/uogr1eUFedUaBHPMEXnYlTAv/SKrh942GeknsqfrjGkZxWTN2NEnvpRUwT
fS0pyd/Err0s94b0srmcTYyxZfJGRUct2T8MCphZFaScAlhn655pxW9RaHMfcvDJUHpW8Qa+KhRt
9CWYScPIH6YNDByLQbhKL5BTpAYMNYPF2W7vM2ZzDob2NB7m6GGeKRr3

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QSNmIeTT4pBji+CTjknWXN6sH9Wff8+t8KF+AC3fIoIw08jtLtShcB9ZGeEKG02RGCO4lNIUf5YB
2TVYk6EJ5XyCav12qDhc60n56UVrnpfo7drorY0NmOypuxECgO43h6SDWp9W7px3r4CJnQ4+X2Mj
943GdP30WfL5kbWHZJC1Dz9cBIqRa1EbNXvvAqBvRPS2+aXBXAPOC4rNVZGeIUspn/33IW3yJLSp
Jm5GIct87ZuSoz8+DXhUvsTj4hq8lgirVhfz1qhHm8SfODcE91FGUPw3vbpGWXsBX73t2zxFC1Hz
/6m4YqQJVxd+H5iGE4kbHxHyHnH7FIerqc8Phw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UhfxKxECbuHK/o9ZExa2zP/MIPmFXuDNZwgpiawuBmPeRI1nJsYB7vzbBGMPKny4yIHLT8mHrQRc
fs05atkjIAbLea4+WNoCdCeg7/0PzuodM1ol3it6BHQ6Yzq4mnZbzlk8Xtwmk8ACAbzOr2SYxYWX
ueuUlimUSRusIe4+NiPvzbfHMAOVPjdmSY7zaSyeJuhdAR+fUGeHy5B23Xe2X6cDPeJ75IqcBeul
ox3dTXi3L8r/s1bTKX3FhxRyPZuh/xCWuEajsF2fEYdwWHKtLX6IQniLBJ5ZnVSS8D7IYPsvV4t0
9rWJqto5O1n3rAM44OvKvc9pOYXJupuv7g3gWg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fmo66vhS7nigYtLDMjdj7hgUnDG/fnO+cIaY/3qHrcwT7u/paj5enLuWHovegu9O9WRq3pPNnjuN
6vZRpuCgz5p4VAV7dVg9fuzg99BAjThp1Q/+HIPfdQ2LM14ZpTh4FXxthHGkTyS5PJArvZ3/UMpW
zwfdYd5+k2/emJ4/nuqoJHQG8k+O5EjSprLTvNZ/wrE1cT/fW/Lu2pxI4msHqVVYAXz7sJ13cQ+C
7tKxCV8vTyf0rpStdE+kZXg+jrc7vFKuPJO0U9axMsC0nXyeYx2jzfAHptGWKvfQaPg/Eo9mgLyN
qSJfFS6aIycuxNmg7L82WK401aWhnUn7GNrudg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28288)
`pragma protect data_block
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
xl/s5IBcTwo108DC6z2tfw==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
