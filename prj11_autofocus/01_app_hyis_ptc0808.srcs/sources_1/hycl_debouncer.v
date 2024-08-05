module hycl_debouncer(
input       												clk,
input       												reset_n,

input                                                       clear_key_d,

input  [31:0]												db_width,
input       												sig_in,

input													    cycle_rst,
output reg  [31:0] 										    dbGPI_pose_cnt,

output reg      											out
);

reg tp_sig_d0,tp_sig_d1,tp_sig_d2,sig_out;
reg [31:0] tp_cnt;


always@(posedge clk or negedge reset_n)
begin
    if(~ reset_n)
        begin
            tp_sig_d0 <= 1'b0;
            tp_sig_d1 <= 1'b0;
            tp_sig_d2 <= 1'b0;
            tp_cnt    <= 32'd0;
            sig_out   <= 1'b0;
        end
    else
        begin
            tp_sig_d0 <= sig_in;
            tp_sig_d1 <= tp_sig_d0;
            tp_sig_d2 <= tp_sig_d1;
            
            if(tp_sig_d2 != tp_sig_d1)
                tp_cnt <= 32'd0;
            else if(tp_cnt < db_width)
                tp_cnt <= tp_cnt + 1'b1;
            
            if(tp_cnt >= db_width)
                sig_out <= tp_sig_d2;
        end
end

always @(posedge clk or negedge reset_n)
begin
	if(!reset_n)
		out <= 1'b0;
	else
		out <= sig_out;
end

wire out_pose;
reg out_cache,out_cache2;

assign out_pose = ~out_cache2 & out_cache;

always @(posedge clk or negedge reset_n)
begin
	if(!reset_n)
	begin
		out_cache  <= 1'b0;
		out_cache2 <= 1'b0;
	end
	else
	begin
		out_cache  <= out;
		out_cache2 <= out_cache;
	end
end


always @(posedge clk or negedge reset_n)
begin
	if(!reset_n)
		dbGPI_pose_cnt <= 32'd0;
	else if(cycle_rst | clear_key_d)
		dbGPI_pose_cnt <= 32'd0;
	else if(out_pose)
		dbGPI_pose_cnt <= dbGPI_pose_cnt + 1'b1;
end

endmodule
