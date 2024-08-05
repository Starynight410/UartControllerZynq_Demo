// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Mon Apr 15 19:07:58 2024
// Host        : ZKHY-BJ-GXQ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/CASI_Project/4_hyis_ptc0808_10/f02.app_rtl/01_app_hyis_ptc0808/01_app_hyis_ptc0808.gen/sources_1/ip/GPO_ram/GPO_ram_sim_netlist.v
// Design      : GPO_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "GPO_ram,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module GPO_ram
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [6:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [6:0]addra;
  wire [6:0]addrb;
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
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.68295 mW" *) 
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
  (* C_INIT_FILE = "GPO_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
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
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  GPO_ram_blk_mem_gen_v8_4_5 U0
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20016)
`pragma protect data_block
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
PkPd4mvrBKaT
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
