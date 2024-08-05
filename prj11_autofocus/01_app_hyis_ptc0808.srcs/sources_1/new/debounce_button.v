`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/31 16:45:07
// Design Name: 
// Module Name: debounce_button
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debounce_button (
input             clk,
input             rst_n,

input  [31:0]     db_time,
input 	          key,                        					
output            key_pulse
);
	
reg      key_cache2;                
reg      key_cache;                    

always @(posedge clk  or  negedge rst_n)
  begin
     if (!rst_n) begin
         key_cache <= 1'b1;
         key_cache2 <= 1'b1;
     end
     else begin
         key_cache <= key;
         key_cache2 <= key_cache;
     end    
   end


reg	[31:0]	  cnt;

//产生20ms延时，当检测到key_edge有效是计数器清零开始计数
always @(posedge clk or negedge rst_n)
begin
if(!rst_n)
   cnt <= 32'h0;
else if(key_cache2 != key_cache)
   cnt <= 32'h0;
else
   cnt <= cnt + 1'h1;
end  

reg        key_db_cache;               
reg        key_db;                    

always @(posedge clk  or  negedge rst_n)
  begin
     if (!rst_n)
         key_db <= 1'b1;
     else if (cnt == db_time)
         key_db <= key;  
  end
always @(posedge clk  or  negedge rst_n)
  begin
     if (!rst_n)
         key_db_cache <= 1'b1;
     else                   
         key_db_cache <= key_db;             
 end      

assign   key_pulse = ({key_db,key_db_cache} == 2'b01);   //key pose
 
endmodule
