`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: Counter
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

module Counter(
    input clk,
    input reset,
    input E,
    input sclr,
    output reg [2:0] Q,
    output zC
    );
  
assign zC = (Q == 3'd5) ? 1'b1 : 1'b0;
     
always@(posedge clk, posedge reset) begin
    if (reset) begin
        Q  <= 3'b0;
    end
    else if(E && sclr)
        Q <= 3'b0;
    else if (E && ~sclr && Q == 3'd5)
        Q <= 3'b0;  
    else if (E && ~sclr)      
        Q <= Q + 1'b1;    
end
  
endmodule


