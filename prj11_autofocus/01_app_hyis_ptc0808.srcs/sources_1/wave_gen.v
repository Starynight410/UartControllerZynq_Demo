`timescale 1ns / 1ps

module wave_gen(
    input													clk,
    input													avmm_clk,
    input													rst_n,
    
    input [5:0]                                             wave_No,
    input													mb_wr_en,
    input  [21:0]				                            mb_addr,
    input	[31:0]				                            mb_data,
    
    input  [7:0]            	                            GPI_after_mul,
    input													soft_ware,
    input  [1:0]                                            intr_trigger,
    input													master_switch,
    input													main_switch,
    input  												    cycle_rst,
    input													END_SOF_posedge,
    
    input  		[3:0]									    work_mode,
    
    input       [7:0]                                       step_group1,
    input  		[9:0]               				        GPI_group1,       //reg  第1组的GPI， 
    
    input  		[9:0]									    brightness,
    input  		[9:0]									    brightness_all_light,
    input  		[9:0]									    GPI_select,
    input  		[1:0]            					        trigger_polarity,
    input  		[31:0]								        chx_width,
    input  		[31:0]								        chx_delay,
    
    input	    [9:0]									    ram_addr_rd,
    input													trigger_polarity_cycle,
    
    output reg    										    light_end,
    output reg    										    light_outputing,
    
    output reg                						        light_wave,
    output reg       					                    Turbo,
    output reg  [9:0]         						        DAC_data,
    output reg  [1:0]                                       c_trigger_polarity,
    output      [31:0]                                      PW
);
reg  [31:0]					output_width;

assign PW = output_width;

/*************************************
*
*         current_GPI Set 
*
**************************************/

(* KEEP="TRUE" *)reg                     current_GPI;
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		current_GPI <= 1'b0;
	else if(work_mode >4'd1)
	begin
        case(GPI_group1)
            10'd0 : current_GPI <= GPI_after_mul[0];
            10'd1 : current_GPI <= GPI_after_mul[1];
            10'd2 : current_GPI <= GPI_after_mul[2];
            10'd3 : current_GPI <= GPI_after_mul[3];
            10'd4 : current_GPI <= GPI_after_mul[4];
            10'd5 : current_GPI <= GPI_after_mul[5];
            10'd6 : current_GPI <= GPI_after_mul[6];
            10'd7 : current_GPI <= GPI_after_mul[7];
            10'd8 : current_GPI <= soft_ware;
            10'd9 : current_GPI <= intr_trigger[0];
            10'd10: current_GPI <= intr_trigger[1];
            default : current_GPI <= 1'b0;
        endcase
	end
	else
	begin
        case(GPI_select)
            10'd0 : current_GPI <= GPI_after_mul[0];
            10'd1 : current_GPI <= GPI_after_mul[1];
            10'd2 : current_GPI <= GPI_after_mul[2];
            10'd3 : current_GPI <= GPI_after_mul[3];
            10'd4 : current_GPI <= GPI_after_mul[4];
            10'd5 : current_GPI <= GPI_after_mul[5];
            10'd6 : current_GPI <= GPI_after_mul[6];
            10'd7 : current_GPI <= GPI_after_mul[7];
            10'd8 : current_GPI <= soft_ware;
            10'd9 : current_GPI <= intr_trigger[0];
            10'd10: current_GPI <= intr_trigger[1];
            default : current_GPI <= 1'b0;
        endcase
	end
end



/*************************************
*
*      当前GPI上升沿下降沿抓取
*
**************************************/

(* KEEP="TRUE" *)reg                     	current_GPI_cache;
(* KEEP="TRUE" *)reg                     	current_GPI_cache2;
(* KEEP="TRUE" *)wire                    	current_GPI_posedge;
(* KEEP="TRUE" *)reg                     	current_GPI_negedge;

always @(posedge clk  or negedge rst_n)
begin
	if(!rst_n)
	begin
		current_GPI_cache <= 1'b0;
		current_GPI_cache2 <= 1'b0;
		current_GPI_negedge <= 1'b0;
  end
  else
  begin
		current_GPI_cache   <= current_GPI;
		current_GPI_cache2  <= current_GPI_cache;
		current_GPI_negedge <=  current_GPI_cache2 & ~current_GPI;
  end
end
assign current_GPI_posedge = ~current_GPI_cache2 & current_GPI_cache;




/*************************************
*
*           Port of RAM 接口
*
**************************************/

(* KEEP="TRUE" *)wire [31:0]						        ram_data_rd; 
(* KEEP="TRUE" *)wire [9:0]						            ram_addr_rd_real;
reg												            ram_wr_en;
reg  [31:0]           								        ram_data_wr;
reg  [9:0]            								        ram_addr_wr;

/**********************************
//
//                脉宽    亮度值      Turbo      mask      step-序号       延时        触发极性--预留
// ram_data_rd   [31:0]    [41:32]    [45:42]      [46]       [54:47]       [86:55]         [127:87] 
//    
//
***********************************/
reg  [2:0]   frame_cnt;

assign ram_addr_rd_real = ram_addr_rd + frame_cnt;

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		frame_cnt <= 3'd0;
	else if(work_mode >4'd1)
	begin
		if(frame_cnt == 3'd7)
			frame_cnt <= 3'd0;
		else
			frame_cnt <= frame_cnt + 1'b1;
	end
	else
		frame_cnt <= 3'd0;
end

always @(posedge avmm_clk  or negedge rst_n)
begin
	if(!rst_n)
	begin
		ram_addr_wr <= 10'd0;
		ram_data_wr <= 32'd0;
	end	
	else
	begin
		ram_addr_wr <= mb_addr[9:0];
		ram_data_wr <= mb_data;
	end
end

always @(posedge avmm_clk  or negedge rst_n)
begin
	if(!rst_n)
		ram_wr_en <= 1'b0;
	else if((mb_wr_en) && (mb_addr[17:12] == wave_No))
		ram_wr_en <= 1'b1;
	else
		ram_wr_en <= 1'b0;
end

cycle_mode cycle_mode (
  .clka(avmm_clk), 
  .wea(ram_wr_en),
  .addra(ram_addr_wr),                  // input [9 : 0] addra
  .dina(ram_data_wr),                   // input [31 : 0] dina
  .clkb(avmm_clk),
  .addrb(ram_addr_rd_real),             // input [9 : 0] addrb
  .doutb(ram_data_rd)                   //output [31 : 0] doutb
);


//                脉宽      亮度值      GPI选择      mask      step-序号       延时        触发极性--预留
// ram_data_rd   [31:0]    [41:32]     [45:42]      [46]       [54:47]       [86:55]         [127:87] 

reg  [31:0]					delay_cnt;
reg  [31:0]					width_cnt;
reg  [31:0]					delay_times;


//***********       RAM_delay      ***********
(* KEEP="TRUE" *)reg  [31:0]					delay_ram;
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		delay_ram <= 32'd0;
	else if(frame_cnt == 3'd7)
		delay_ram <= ram_data_rd;
	else
		delay_ram <= delay_ram;
end

//***********       RAM_width      ***********
(* KEEP="TRUE" *)reg  [31:0]					width_ram;
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		width_ram <= 32'd0;
    else if(frame_cnt == 3'd2)
		width_ram <= ram_data_rd[31:0];
	else
		width_ram <= width_ram;
end

//***********       delay      ***********
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		delay_times <= 32'd0;
	else if(work_mode == 4'd0)
		delay_times <= chx_delay;
	else if(work_mode >4'd1)
		delay_times <= delay_ram;
	else
		delay_times <= 32'd0;
end

//***********       脉宽分配      ***********
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		output_width <= 32'd0;
	else if(work_mode == 4'd0)
		output_width <= chx_width;
	else if(work_mode >4'd1)
		output_width <= width_ram;
	else
		output_width <= 32'd0;
end

//***********       RAM亮度读取      ***********
reg  [9:0] 					DAC_ram;

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		DAC_ram <= 10'd0;
	else if(frame_cnt == 3'd3)
		DAC_ram <= ram_data_rd[9:0];
	else
		DAC_ram <= DAC_ram;
end


//***********       Turbo_Grar      ***********


always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		Turbo <= 1'b0;
	else if(frame_cnt == 3'd4)
		Turbo <= ram_data_rd[0];
	else
		Turbo <= Turbo;
end

//***********       亮度分配      ***********
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		DAC_data <= 10'd0;
	else if(!main_switch)
		DAC_data <= 10'd0;
	else begin
        if(work_mode >4'd1)
            DAC_data <= DAC_ram;
        else if(work_mode == 4'd1)
            DAC_data <= brightness_all_light;
        else
            DAC_data <= brightness;
	end
end

//***********       mask      ***********

(* KEEP="TRUE" *)reg 				mask_ram;     //valude of RAM
reg 										pulse_mask;   //true value 
always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
		mask_ram <= 1'b0;
	else if(frame_cnt == 3'd5)
		mask_ram <= ram_data_rd[0];
	else
		mask_ram <= mask_ram;
end

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    pulse_mask <= 1'b1;
  else if(work_mode >4'd1)
    pulse_mask <= mask_ram;
  else
    pulse_mask <= 1'b1;
end



/*************************************
*
*          延时、脉宽 count
*
**************************************/
localparam					IDLE					= 4'd0;
localparam					WAIT_trigger		= 4'd1;
localparam					System_delay		= 4'd2;
localparam					DELAY1				= 4'd3;
localparam					OUTPUTing			= 4'd4;
localparam					DELAY2				= 4'd5;
localparam					END					= 4'd6;

reg    [3:0]				c_state;
reg    [3:0]				n_state = 0;
//reg  [1:0]      c_trigger_polarity;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		delay_cnt <= 32'd0;
	else if((c_state == DELAY1) || (c_state == DELAY2))
		delay_cnt <= delay_cnt + 1'b1;
	else
		delay_cnt <= 32'd0;
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		width_cnt <= 32'd0;
	else if((c_state == OUTPUTing) && (c_trigger_polarity[1] == 1'b0))
		width_cnt <= width_cnt + 1'b1;
	else
		width_cnt <= 32'd0;
end


/*************************************
*
*         光源输出状态机 FSM
*
**************************************/
always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
    c_state <= IDLE;
  else
    c_state <= n_state;
end


// work_mode          工作模式    :单次触发-0   常亮模式-1    循环触发-2
// c_trigger_polarity 触发极性    :上升沿/下降沿触发  高跟随/低跟随触发
always @(*)
begin
  case(c_state)
    IDLE : 
		begin
			if((master_switch == 1'b1) && (work_mode != 4'd1))
				n_state = WAIT_trigger;
		    else
				n_state = c_state;
	    end
	WAIT_trigger : 
	    begin
			case(c_trigger_polarity)
				2'd0,2'd2:
					begin
						if(current_GPI_posedge)
							n_state = DELAY1;
				        else
							n_state = c_state;
					end
				2'd1,2'd3:	
					begin
						if(current_GPI_negedge)
							n_state = DELAY1;
						else
							n_state = c_state;
					end
				default : ;
			endcase 
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
			case(c_trigger_polarity)
				2'd0,2'd1:
				begin 
					if(width_cnt >= output_width)
						n_state = END;
					else
						n_state = c_state;
				end
				2'd2:
				begin
					if(current_GPI_negedge)
						n_state = DELAY2;
					else
						n_state = c_state;
				end
				2'd3:
				begin
					if(current_GPI_posedge)
						n_state = DELAY2;
					else
						n_state = c_state;
				end
				default :;
			endcase
		end
	DELAY2: 
		begin
			if(delay_cnt >= delay_times)
				n_state = END;
			else
				n_state = c_state;
		end
	END:
		begin
			if(work_mode >4'd1)
			begin
				if(END_SOF_posedge)
					n_state = IDLE;
				else
					n_state = c_state;
			end
			else
				n_state = IDLE;
		end
	default :n_state = IDLE;
  endcase
end

reg idle_out;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		light_wave <= 1'b0;
	else
	begin
		if(work_mode == 4'd1)      //常亮
			light_wave <= main_switch & master_switch;
		else if(work_mode >4'd1)
		begin
			if((c_state == OUTPUTing))
				light_wave <= pulse_mask & main_switch & master_switch;
			else
				light_wave <= 1'b0;//idle_out
		end
		else
		begin
			if((c_state == OUTPUTing) || (c_state == DELAY2))
				light_wave <= pulse_mask & main_switch & master_switch;
			else
				light_wave <= 1'b0;//idle_out
		end
	end
end

/*************************************
*
*          循环模式下组别触发极性
*
**************************************/
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		c_trigger_polarity <= 2'd0;
	else if(work_mode >4'd1)
		c_trigger_polarity <= {1'b0,trigger_polarity_cycle};
	else
		c_trigger_polarity <= trigger_polarity;
end




/*************************************
*
*       光源输出、光源结束标志
*
**************************************/
always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		light_end <= 1'b1;
	else if(work_mode >4'd1)
	begin
		if(c_state == END)
			light_end <= 1'b1;
		else
			light_end <= 1'b0;
	end
	else
		light_end <= 1'b1;
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		light_outputing <= 1'b0;
	else if(work_mode >4'd1)
	begin
		if(c_state == OUTPUTing)
			light_outputing <= 1'b1;
		else if(END_SOF_posedge)
			light_outputing <= 1'b0;
        else
            light_outputing <= light_outputing;
	end
	else
		light_outputing <= 1'b0;
end


endmodule
