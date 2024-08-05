module hy_intr_trigger(
    input   wire    clk_in,
    input   wire    reset,
    
    input   wire    [31:0] width_cnt,
    input   wire    [31:0] period_cnt,
    
    output  reg     sig_out
);
//----------------------------------------------------------
//signal buffer
//----------------------------------------------------------
reg [31:0] tp0_period_cnt, tp1_period_cnt;
reg [31:0] tp0_width_cnt, tp1_width_cnt;

always @(posedge clk_in or posedge reset)
begin
    if(reset) begin
        tp0_period_cnt <= 0;
        tp1_period_cnt <= 0;
        
        tp0_width_cnt <= 0;
        tp1_width_cnt <= 0;
    end
    else begin
        tp0_period_cnt <= period_cnt;
        tp1_period_cnt <= tp0_period_cnt;
        
        tp0_width_cnt <= width_cnt;
        tp1_width_cnt <= tp0_width_cnt;
    end
end
//----------------------------------------------------------
//intr_trigger
//----------------------------------------------------------
reg   intr_trigger;
reg   [31:0] intr_trigger_cnt;
always@(posedge clk_in or posedge reset)
begin
    if(reset) begin
        intr_trigger_cnt <= 0;
        intr_trigger <= 1'b0;
    end
    else if(intr_trigger_cnt >= tp1_period_cnt - 1'b1) begin
        intr_trigger_cnt <= 0;
        intr_trigger <= 1'b1;
    end
    else begin
        intr_trigger_cnt <= intr_trigger_cnt + 1'b1;
        intr_trigger <= 1'b0;
    end
end

//----------------------------------------------------------
//trigger gen
//----------------------------------------------------------
reg [1:0]  st_trigger;
localparam ST0_IDLE         = 0;
localparam ST1_GEN_WIDTH    = 1;

always @(posedge clk_in or posedge reset) begin
    if(reset) begin
        st_trigger <= ST0_IDLE;
        sig_out <= 0;
    end
    else begin
        case(st_trigger)
            ST0_IDLE: begin
                sig_out <= 0;

                if(intr_trigger)
                    st_trigger <= ST1_GEN_WIDTH;
                else
                    st_trigger <= ST0_IDLE;
            end
            ST1_GEN_WIDTH: begin
                sig_out <= 1;
                
                if(intr_trigger_cnt >= tp1_width_cnt - 1)
                    st_trigger <= ST0_IDLE;
                else
                    st_trigger <= ST1_GEN_WIDTH;
            end
            default: begin
                sig_out <= 0;
                st_trigger <= ST0_IDLE;
            end
        endcase
    end
end

endmodule