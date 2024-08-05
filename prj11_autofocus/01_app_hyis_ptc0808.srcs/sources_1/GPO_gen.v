`timescale 1ns / 1ps

module GPO_gen(
input													clk,
input                                                   avmm_clk,
input													rst_n,
input    [5:0]										    GPO_ID,
input    [5:0]                                          mask_ID,
(* DONT_TOUCH= "TRUE" *)input													mb_wr_en,
(* DONT_TOUCH= "TRUE" *)input    [21:0]										    mb_addr,
(* DONT_TOUCH= "TRUE" *)input	 [31:0]										    mb_data,

(* DONT_TOUCH= "TRUE" *)input                                                   light_outputing,

input													cycle_rst,
input                                                   clear_key_d,

input    [3:0]										    work_mode,
input	 [7:0]										    light_wave,

input   [31:0]                                          chx_delay_GPO,
input   [7:0]											step_mask_standard,
input   [31:0]										    output_width,

input   [63:0]										    step_pluse,
input   [7:0]									        step_cnt,

input													master_switch,
input													software_trigger,						
input													invert_en,

output reg  [31:0]								        GPO_pose_cnt,
output  												GPO_wave
);

wire                                                    GPO_wave_t_pose;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_pose_cnt <= 32'd0;
	else if(cycle_rst | clear_key_d)
		GPO_pose_cnt <= 32'd0;
	else if(GPO_wave_t_pose)
		GPO_pose_cnt <= GPO_pose_cnt + 1'b1;
end


reg  [63:0]											    step_mask_cycle;


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		step_mask_cycle <= 64'd0;
	else if((mb_wr_en) && (mb_addr[17:12]) == mask_ID)
    begin
        case(mb_addr[11:0])
            12'd0 : step_mask_cycle[0 ] <= mb_data[0];
            12'd1 : step_mask_cycle[1 ] <= mb_data[0];
            12'd2 : step_mask_cycle[2 ] <= mb_data[0];
            12'd3 : step_mask_cycle[3 ] <= mb_data[0];
            12'd4 : step_mask_cycle[4 ] <= mb_data[0];
            12'd5 : step_mask_cycle[5 ] <= mb_data[0];
            12'd6 : step_mask_cycle[6 ] <= mb_data[0];
            12'd7 : step_mask_cycle[7 ] <= mb_data[0];
            12'd8 : step_mask_cycle[8 ] <= mb_data[0];
            12'd9 : step_mask_cycle[9 ] <= mb_data[0];
            12'd10: step_mask_cycle[10] <= mb_data[0];
            12'd11: step_mask_cycle[11] <= mb_data[0];
            12'd12: step_mask_cycle[12] <= mb_data[0];
            12'd13: step_mask_cycle[13] <= mb_data[0];
            12'd14: step_mask_cycle[14] <= mb_data[0];
            12'd15: step_mask_cycle[15] <= mb_data[0];
            12'd16: step_mask_cycle[16] <= mb_data[0];
            12'd17: step_mask_cycle[17] <= mb_data[0];
            12'd18: step_mask_cycle[18] <= mb_data[0];
            12'd19: step_mask_cycle[19] <= mb_data[0];
            12'd20: step_mask_cycle[20] <= mb_data[0];
            12'd21: step_mask_cycle[21] <= mb_data[0];
            12'd22: step_mask_cycle[22] <= mb_data[0];
            12'd23: step_mask_cycle[23] <= mb_data[0];
            12'd24: step_mask_cycle[24] <= mb_data[0];
            12'd25: step_mask_cycle[25] <= mb_data[0];
            12'd26: step_mask_cycle[26] <= mb_data[0];
            12'd27: step_mask_cycle[27] <= mb_data[0];
            12'd28: step_mask_cycle[28] <= mb_data[0];
            12'd29: step_mask_cycle[29] <= mb_data[0];
            12'd30: step_mask_cycle[30] <= mb_data[0];
            12'd31: step_mask_cycle[31] <= mb_data[0];
            12'd32: step_mask_cycle[32] <= mb_data[0];
            12'd33: step_mask_cycle[33] <= mb_data[0];
            12'd34: step_mask_cycle[34] <= mb_data[0];
            12'd35: step_mask_cycle[35] <= mb_data[0];
            12'd36: step_mask_cycle[36] <= mb_data[0];
            12'd37: step_mask_cycle[37] <= mb_data[0];
            12'd38: step_mask_cycle[38] <= mb_data[0];
            12'd39: step_mask_cycle[29] <= mb_data[0];
            12'd40: step_mask_cycle[40] <= mb_data[0];
            12'd41: step_mask_cycle[41] <= mb_data[0];
            12'd42: step_mask_cycle[42] <= mb_data[0];
            12'd43: step_mask_cycle[43] <= mb_data[0];
            12'd44: step_mask_cycle[44] <= mb_data[0];
            12'd45: step_mask_cycle[45] <= mb_data[0];
            12'd46: step_mask_cycle[46] <= mb_data[0];
            12'd47: step_mask_cycle[47] <= mb_data[0];
            12'd48: step_mask_cycle[48] <= mb_data[0];
            12'd49: step_mask_cycle[49] <= mb_data[0];
            12'd50: step_mask_cycle[50] <= mb_data[0];
            12'd51: step_mask_cycle[51] <= mb_data[0];
            12'd52: step_mask_cycle[52] <= mb_data[0];
            12'd53: step_mask_cycle[53] <= mb_data[0];
            12'd54: step_mask_cycle[54] <= mb_data[0];
            12'd55: step_mask_cycle[55] <= mb_data[0];
            12'd56: step_mask_cycle[56] <= mb_data[0];
            12'd57: step_mask_cycle[57] <= mb_data[0];
            12'd58: step_mask_cycle[58] <= mb_data[0];
            12'd59: step_mask_cycle[59] <= mb_data[0];
            12'd60: step_mask_cycle[60] <= mb_data[0];
            12'd61: step_mask_cycle[61] <= mb_data[0];
            12'd62: step_mask_cycle[62] <= mb_data[0];
            12'd63: step_mask_cycle[63] <= mb_data[0];
        endcase
    end
end


//reg [63:0]											GPO_mask;
//
//always @(posedge clk or negedge rst_n)
//begin
//	if(!rst_n)
//		GPO_mask <= 64'd0;
//	else if(work_mode > 4'd1)
//		GPO_mask <= step_mask_cycle;
//	else
//		GPO_mask <= {56'd0,step_mask_standard};
//end

/*************************************
*
*        不同模式下，GPO的触发源不同
*
**************************************/
(* KEEP="TRUE" *)reg [63:0]				        wave;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave <= 64'd0;
	else if(work_mode >= 4'd2) // 循环模式
        wave <= (step_pluse & step_mask_cycle);
	else 
    begin
		wave[7:0] <= (light_wave & step_mask_standard);
        wave[63:8] <= 56'd0;
    end
end

//ila_0 your_instance_name (
//	.clk(avmm_clk), // input wire clk
//
//
//	.probe0({step_cnt,light_outputing,wave,step_pluse,step_mask_cycle,step_mask_standard,software_trigger,work_mode,current_GPI_t,current_GPI,current_GPI_posedge,c_state,light_wave,mb_wr_en,mb_addr,mb_data}) // input wire [255:0] probe0
//);



/*************************************
*
*              GPO的触发源
*
**************************************/
(* KEEP="TRUE" *)reg  							current_GPI_t;

wire  							current_GPI;

assign current_GPI = current_GPI_t | software_trigger;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		current_GPI_t <= 1'b0;
	else
	begin
		if((wave > 64'd0) || (software_trigger == 1'b1))
			current_GPI_t <= 1'b1;
		else
			current_GPI_t <= 1'b0;
	end
end

reg							    current_GPI_cache;
reg							    current_GPI_cache2;
wire						    current_GPI_posedge;

assign current_GPI_posedge = ({current_GPI_cache2,current_GPI_cache} == 2'b01) ? 1'b1 : 1'b0;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		current_GPI_cache  <= 1'b0;
		current_GPI_cache2 <= 1'b0;
	end
	else
	begin
		current_GPI_cache  <= current_GPI;
		current_GPI_cache2 <= current_GPI_cache;
	end
end

/*************************************
*
*               GPO RAM
*
**************************************/

reg													wea;
reg  [6:0]											addrb;
reg  [6:0] 											addra;
reg  [31:0] 										dina;
wire [31:0] 										doutb;

GPO_ram GPO_ram (
  .clka(avmm_clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [6 : 0] addra
  .dina(dina), // input [31 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addrb), // input [6 : 0] addrb
  .doutb(doutb) // output [31 : 0] doutb
);


/*************************************
*
*           write RAM & REG
*
**************************************/

(* KEEP="TRUE" *)reg  [31:0]					delay_times;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		delay_times <= 32'd0;
	else if(work_mode >= 4'd2)
		delay_times <= doutb;
	else
		delay_times <= chx_delay_GPO;
end


always @(posedge avmm_clk  or negedge rst_n)
begin
	if(!rst_n)
	begin
		addra <= 7'd0;
		dina <= 32'd0;
	end
	else
	begin
		addra <= mb_addr[9:0];
		dina  <= mb_data;
	end
end

always @(posedge avmm_clk  or negedge rst_n)
begin
	if(!rst_n)
		wea <= 1'b0;
	else if((mb_wr_en) && (mb_addr[17:12] == GPO_ID))
		wea <= 1'b1;
	else
		wea <= 1'b0;
end


/*************************************
*
*             RAM addr 
*
**************************************/

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
      addrb <= 7'd0;
	else
      addrb <= step_cnt; 		
end


/*************************************
*
*        width and delay count
*
**************************************/
reg    [3:0]				c_state;
reg    [3:0]				n_state;
localparam					IDLE				= 4'd0;
localparam					WAIT_trigger		= 4'd1;
localparam					DELAY1				= 4'd2; 
localparam					OUTPUTing			= 4'd3;
localparam					END					= 4'd4;

reg  [31:0]											delay_cnt;
reg  [31:0]											width_cnt;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		delay_cnt <= 32'd0;
	else if(c_state == DELAY1)
		delay_cnt <= delay_cnt + 1'b1;
	else
		delay_cnt <= 32'd0;
end


always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		width_cnt <= 32'd0;
	else if(c_state == OUTPUTing)
		width_cnt <= width_cnt + 1'b1;
	else
		width_cnt <= 32'd0;
end


/*************************************
*
*             GPO FSM
*
**************************************/
always @(posedge clk or negedge rst_n) 
begin
  if(!rst_n)
    c_state <= IDLE;
  else
    c_state <= n_state;
end

always @(*)
begin
  case(c_state)
    IDLE : 
		begin
			if(master_switch == 1'b1)
				n_state = WAIT_trigger;
		    else
				n_state = c_state;
	    end
	WAIT_trigger : 
	    begin
			if(current_GPI_posedge)
				n_state = DELAY1;
			else
				n_state = c_state;
			
		end
	DELAY1 : 
		begin
			if(delay_cnt >= delay_times)
				n_state = OUTPUTing;
			else
				n_state = c_state;
		end
	OUTPUTing :
		begin
			if(width_cnt >= output_width)
				n_state = END;
			else
				n_state = c_state;
		end
	END:
		begin
			n_state = IDLE;
		end
	default : n_state = IDLE;
  endcase
end

(* KEEP="TRUE" *)reg GPO_wave_t;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_wave_t <= 1'b0;
	else
	begin
		if(c_state == OUTPUTing)
			GPO_wave_t <= 1'b1;
		else
			GPO_wave_t <= 1'b0;
	end
end

assign GPO_wave = (invert_en == 1'b1)? (~GPO_wave_t) : GPO_wave_t; 


(* KEEP="TRUE" *)reg                                        GPO_wave_t_cache;

assign GPO_wave_t_pose = ~GPO_wave_t_cache & GPO_wave_t;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		GPO_wave_t_cache <= 1'b0;
	else
		GPO_wave_t_cache <= GPO_wave_t;
end



endmodule
