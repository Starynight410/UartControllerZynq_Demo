//over current protection
module hy_ocp(
    input   wire    clk_in,
    input   wire    reset,
    
    input   wire    sign_in,
    input   wire    width_limit_enable,
    input   wire    Turbo,
    input   wire    [31:0] light_width_cnt,
    input   wire    [ 1:0] trig_activation,
    
    output  reg     sign_missed,
    output  reg     sign_out
);

localparam ENUM_TRIGGER_HIGHFOLLOW  = 2;
localparam ENUM_TRIGGER_LOWFOLLOW   = 3;
localparam OCP_DUTY_FACTOR          = 2;// light_width <= 1/4*sign_in signal period
//----------------------------------------------------------
//signal buffer
//----------------------------------------------------------
reg [31:0] tp0_width_cnt, tp1_width_cnt;
reg tp0_sign_in,tp1_sign_in,pos_sign_in,neg_sign_in;

always @(posedge clk_in or posedge reset)
begin
    if(reset) begin
        tp0_width_cnt <= 0;
        tp1_width_cnt <= 0;
        
        tp0_sign_in <= 0;
        tp1_sign_in <= 0;
        pos_sign_in <= 0;
        neg_sign_in <= 0;
    end
    else begin
        tp0_width_cnt <= light_width_cnt;
        tp1_width_cnt <= tp0_width_cnt;
        
        tp0_sign_in <= sign_in;
        tp1_sign_in <= tp0_sign_in;
        pos_sign_in <= (~tp1_sign_in) && tp0_sign_in;
        neg_sign_in <= (~tp0_sign_in) && tp1_sign_in;
    end
end
//----------------------------------------------------------
//trigger gen
//----------------------------------------------------------
reg [1:0]  st_trigger;
localparam ST0_IDLE         = 0;
localparam ST1_GEN_WIDTH    = 1;
localparam ST2_GEN_PERIOD   = 2;

reg [31:0] ocp_period_cnt;
reg [31:0] clk_cnt;

always @(posedge clk_in or posedge reset) begin
    if(reset) begin
        st_trigger <= ST0_IDLE;
        sign_out <= 0;
        ocp_period_cnt <= 0;
        clk_cnt <= 1;
    end
    else begin
        case(st_trigger)
            ST0_IDLE: begin
                clk_cnt <= 1;
                ocp_period_cnt <= tp1_width_cnt << OCP_DUTY_FACTOR;
                
                if(width_limit_enable == 0) begin//0:false 1:true
                    st_trigger <= ST0_IDLE;
                    sign_out <= tp1_sign_in;
                end
                else if(pos_sign_in && Turbo) begin
                    st_trigger <= ST1_GEN_WIDTH;
                    sign_out <= 0;
                end
                else begin
                    st_trigger <= ST0_IDLE;
                    sign_out <= tp1_sign_in;
                end
            end
            ST1_GEN_WIDTH: begin
                sign_out <= 1;
                clk_cnt <= clk_cnt + 1'b1;
                if((trig_activation == ENUM_TRIGGER_HIGHFOLLOW) || (trig_activation == ENUM_TRIGGER_LOWFOLLOW)) begin
                    if(neg_sign_in) begin
                        st_trigger <= ST2_GEN_PERIOD;
                        ocp_period_cnt <= clk_cnt << OCP_DUTY_FACTOR;
                    end
                    else
                        st_trigger <= ST1_GEN_WIDTH;
                end
                else begin
                    if(clk_cnt >= tp1_width_cnt)
                        st_trigger <= ST2_GEN_PERIOD;
                    else
                        st_trigger <= ST1_GEN_WIDTH;
                end
            end
            ST2_GEN_PERIOD: begin
                sign_out <= 0;
                clk_cnt <= clk_cnt + 1'b1;
                if(clk_cnt >= ocp_period_cnt)
                    st_trigger <= ST0_IDLE;
                else
                    st_trigger <= ST2_GEN_PERIOD;
            end
            default: begin
                sign_out <= 0;
                ocp_period_cnt <= 0;
                clk_cnt <= 1;
                st_trigger <= ST0_IDLE;
            end
        endcase
    end
end

//----------------------------------------------------------
//signal missed ctrl
//----------------------------------------------------------
reg [31:0]delay_cnt;

reg [1:0]trigger_state;
localparam TRIGGER_NORMAL = 3'd0;
localparam TRIGGER_MISSED = 3'd1;
localparam TRIGGER_WAIT   = 3'd2;

localparam TRIGGER_MISSED_TIME = 32'd30_000_000; //3s 10MHz

always@(posedge clk_in or posedge reset)
begin
    if(reset) begin
        sign_missed <= 1'b0;
        delay_cnt <= 32'd0;
        trigger_state <= TRIGGER_NORMAL;
    end
    else begin
        case(trigger_state)
            TRIGGER_NORMAL: begin
                sign_missed <= 1'b0;
                delay_cnt <= 32'd0;
                
                if(pos_sign_in && (st_trigger != ST0_IDLE))
                    trigger_state <= TRIGGER_MISSED;
                else
                    trigger_state <= TRIGGER_NORMAL;
            end
            TRIGGER_MISSED: begin
                sign_missed <= 1'b1;
                
                if(pos_sign_in && (st_trigger != ST0_IDLE)) begin
                    delay_cnt <= 32'd0;
                    trigger_state <= TRIGGER_MISSED;
                end
                else if(delay_cnt >= TRIGGER_MISSED_TIME) begin
                    delay_cnt <= 32'd0;
                    trigger_state <= TRIGGER_NORMAL;
                end
                else begin
                    delay_cnt <= delay_cnt + 1'b1;
                    trigger_state <= TRIGGER_MISSED;
                end
            end
            default: begin
                sign_missed <= 1'b0;
                delay_cnt <= 32'd0;
                trigger_state <= TRIGGER_NORMAL;
            end
        endcase
    end
end

endmodule