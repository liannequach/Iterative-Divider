`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: register
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

module Register(
    input clk,
    input reset,
    input E,
    input [3:0] D,
    output reg [3:0] Q
    );
    
always @ (posedge clk, posedge reset)
if (reset) Q <= 4'b0; else
if (E) Q <= D;
  
endmodule


