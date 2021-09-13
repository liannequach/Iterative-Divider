`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: FA_5bit_tb
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

module FA_5bit_tb();
    reg [4:0] A,B;
    reg cin;
    wire [4:0] Sum;
    wire Cout;
    
FA_5bit uut(.A(A),.B(B), .cin(cin),.Sum(Sum),.Cout(Cout));

integer i,j;

initial begin
    cin = 0;
    for(i=0;i<32;i=i+1) begin
        for(j=0;j<32;j=j+1) begin
            cin = ~cin;
            A=i;
            B=j;
            #10;
        end
    end
end
endmodule
