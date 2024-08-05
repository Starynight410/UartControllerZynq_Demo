module dac_controller(
input  											avmm_clk,		
input  											rst_n,	
input											light_wave,

input [9:0]  									dac_data,	
output  										scl,		
inout  											sda		
);

reg  [9:0]                                      dac_data_t1;
reg  [9:0]                                      dac_data_t2;

reg[3:0]                                    cstate,nstate;
parameter IDLE		= 4'd0;
parameter START	    = 4'd1;
parameter ADDR		= 4'd2;
parameter ACK1		= 4'd3;
parameter CMSB		= 4'd4;
parameter ACK2		= 4'd5;
parameter LSBI		= 4'd6;
parameter ACK3		= 4'd7;
parameter ACK4		= 4'd8;
parameter STOP		= 4'd9;
parameter HS_IDLE	= 4'd10;
parameter HS_START	= 4'd11;
parameter HS_INIT	= 4'd12;
parameter HS_ACK	= 4'd13;

always @(posedge avmm_clk)
begin
    if(!rst_n)
    begin
        dac_data_t1 <= 10'd0;
        dac_data_t2 <= 10'd0;
    end
    else
    begin
        dac_data_t1 <= dac_data;
        dac_data_t2 <= dac_data_t1;
    end
end

reg                                            dac_en;
always @(posedge avmm_clk)
begin
    if(!rst_n)
        dac_en <= 1'b0;
    else if(dac_data_t2 != dac_data_t1)
        dac_en <= 1'b1;
    else if(cstate == STOP)
        dac_en <= 1'b0;
end


reg  [7:0]  									cnti;														

always @(posedge avmm_clk or negedge rst_n)
begin								
	if(!rst_n)
        cnti <= 8'd0;
	else if(cnti < 8'd16 && cstate != HS_IDLE) //8'd50
        cnti <= cnti + 1'b1;
	else 
        cnti <= 8'd0;
end

wire scl_low  =         (cnti == 8'd14);//8'd37
wire scl_high =         (cnti == 8'd4);//8'd13

assign scl = (cnti<8'd8) ? 1'b1:1'b0;														

parameter   MASTER_CODE                     = 8'b0000_1010;
parameter   DEVICE_ADDR	                    = 8'b1001_1000;
wire[7:0]   dac_mdata                       = {4'b0000,dac_data[9:6]};	
wire[7:0]   dac_ldata                       = {dac_data[5:0],2'b00};	

reg                                         sdar;	
reg[2:0]                                    bcnt;																
reg                                         sdlink;																	

always @(posedge avmm_clk or negedge rst_n)
begin
	if(!rst_n)
        cstate <= HS_IDLE;
	else 
        cstate <= nstate;
end

always @(cstate or dac_en or scl_high or scl_low or bcnt) begin				
	case(cstate)
        HS_IDLE:  if(dac_en) nstate <= HS_START;
				  else nstate <= HS_IDLE;
        HS_START: if(scl_high) nstate <= HS_INIT;
				  else nstate <= HS_START;
        HS_INIT:  if(scl_low && bcnt == 3'd0) nstate <= HS_ACK;
				  else nstate <= HS_INIT;
        HS_ACK:   if(scl_low) nstate <= START;
				  else nstate <= HS_ACK;
		IDLE: 	if(dac_en) nstate <= START;
				else nstate <= IDLE;
		START:  if(scl_high) nstate <= ADDR;
				else nstate <= START;
		ADDR: 	if(scl_low && bcnt == 3'd0) nstate <= ACK1;
				else nstate <= ADDR;
		ACK1: 	if(scl_low) nstate <= CMSB;
				else nstate <= ACK1;
		CMSB: 	if(scl_low && bcnt == 3'd0) nstate <= ACK2;
				else nstate <= CMSB;
		ACK2: 	if(scl_low) nstate <= LSBI;
				else nstate <= ACK2;
		LSBI:	if(scl_low && bcnt == 3'd0) nstate <= ACK3;
				else nstate <= LSBI;
		ACK3: 	if(scl_low) nstate <= ACK4;
				else nstate <= ACK3;
		ACK4: 	if(scl_low) nstate <= STOP;
				else nstate <= ACK4;
		STOP: 	if(scl_high) nstate <= HS_IDLE;
				else nstate <= STOP;
		default: nstate <= HS_IDLE;
		endcase
end

always @(posedge avmm_clk or negedge rst_n)										
	if(!rst_n) 
    begin
		sdar <= 1'b1;
		sdlink <= 1'b1;
	end
	else 
    begin
		case(cstate)
			HS_IDLE,IDLE: 
            begin
				sdar <= 1'b1;
				sdlink <= 1'b1;	
			end
			HS_START,START: 	
            begin
                if(scl_high) 
                begin
					sdar <= 1'b0;
					sdlink <= 1'b1;	
				end			
            end
            HS_INIT: if(scl_low) begin
					sdar <= MASTER_CODE[bcnt];	
					sdlink <= 1'b1;	
				end
			ADDR: if(scl_low) begin
					sdar <= DEVICE_ADDR[bcnt];	
					sdlink <= 1'b1;	
				end					
			CMSB: if(scl_low) begin 
					sdar <= dac_mdata[bcnt];	
					sdlink <= 1'b1;	
				end
			LSBI: if(scl_low) begin
					sdar <= dac_ldata[bcnt];	
					sdlink <= 1'b1;	
				end
			HS_ACK,ACK1,ACK2,ACK3: if(scl_low) begin
					sdar <= 1'b0;
					sdlink <= 1'b0;	
				end
			ACK4: if(scl_low) begin
					sdar <= 1'b0;
					sdlink <= 1'b1;	
				end
			STOP: if(scl_high) begin 
					sdar <= 1'b1;
					sdlink <= 1'b1;	
				end
			default: ;
			endcase
		end
	
assign sda = sdlink ? sdar : 1'bz;											

always @(posedge avmm_clk or negedge rst_n)										
	if(!rst_n) bcnt <= 3'd0;
	else 
    begin
		case(cstate)
			HS_INIT,ADDR,CMSB,LSBI:	
            begin
				if(scl_low) bcnt <= bcnt-1'b1;
				else ;
			end
            default: bcnt <= 3'd7;
        endcase
	end

endmodule
