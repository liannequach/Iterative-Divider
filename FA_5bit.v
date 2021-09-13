`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: FA_5bit
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

module FA_5bit(
    input [4:0] A,
    input [4:0] B,
    input cin,
    output  [4:0] Sum,
    output Cout
    );
    
assign {Cout, Sum} = A + B + cin;

endmodule
    