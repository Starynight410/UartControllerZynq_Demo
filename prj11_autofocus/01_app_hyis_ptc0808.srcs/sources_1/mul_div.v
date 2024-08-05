

module mul_div(
input													clk,
//input													avmm_clk,
input													rst_n,

input  [7:0]										    mul_frequency_coefficient,
input  [31:0]										    mul_frequency_period,

input													GPI,


output reg 											    GPI_after_mul
);

reg 													GPI_cache;
reg 													GPI_cache2;
reg 													GPI_cache3;
wire 													GPI_posedge;

assign GPI_posedge = ({GPI_cache2,GPI_cache} == 2'b01);

always @(posedge clk or negedge rst_n)
begin
  if(!rst_n)
  begin
    GPI_cache  <= 1'b0;
	GPI_cache2 <= 1'b0;
  end
  else
  begin
    GPI_cache  <= GPI;
	GPI_cache2 <= GPI_cache;
  end
end


reg  [3:0]  											c_state;
reg  [3:0]  											n_state;


localparam     										IDLE   			    = 4'd0;
localparam     										OUTPUTING   		= 4'd1;
localparam     										OUTPUTING_END  	    = 4'd2;
localparam     										ALL_END  			= 4'd3;

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		c_state <= IDLE;
	else if(mul_frequency_period == 32'd0)
		c_state <= IDLE;
	else 
		c_state <= n_state;
end

reg  [31:0]  											period_cnt;
reg  [7:0]  											coefficient_cnt;

always @(*)
begin
	if(!rst_n)
		n_state = IDLE;
	else
	begin
	case(c_state)
		IDLE : 
		begin
			if(GPI_posedge)
				n_state = OUTPUTING;
			else
				n_state = IDLE;
		end
		OUTPUTING :
		begin
			if(period_cnt >= mul_frequency_period)
				n_state = OUTPUTING_END;
			else
				n_state = OUTPUTING;
		end
		OUTPUTING_END :
		begin
			if(coefficient_cnt >= mul_frequency_coefficient-1'b1)
				n_state = ALL_END;
			else
				n_state = OUTPUTING;
		end
		ALL_END : 
		begin
			n_state = IDLE;
		end
        default:n_state = IDLE;
	endcase
	end
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		coefficient_cnt <= 8'd0;
	else if(mul_frequency_period == 32'd0)
		coefficient_cnt <= 8'd0;
	else if(c_state == ALL_END)
		coefficient_cnt <= 8'd0;
	else if(c_state == OUTPUTING_END)
		coefficient_cnt <= coefficient_cnt + 1'b1;
	else
		coefficient_cnt <= coefficient_cnt;
end

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		period_cnt <= 32'd0;
	else if(mul_frequency_period == 32'd0)
		period_cnt <= 32'd0;
	else if(c_state == OUTPUTING)
		period_cnt <= period_cnt + 1'b1;
	else
		period_cnt <= 32'd0;
end


always @(posedge clk)
begin
	if(!rst_n)
		GPI_after_mul <= 1'b0;
	else if((mul_frequency_coefficient <= 8'd1) || (mul_frequency_period == 32'd0))
		GPI_after_mul <= GPI;
	else
	begin
		if((period_cnt < (mul_frequency_period>>1)) && (period_cnt != 32'd0))
			GPI_after_mul <= 1'b1;
		else
			GPI_after_mul <= 1'b0;
	end
end



endmodule
