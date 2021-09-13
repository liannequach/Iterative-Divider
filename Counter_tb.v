`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: Counter_tb
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

module Counter_tb();
    reg clk,reset,E,sclr;
    wire [2:0] Q;
    wire zC;
    
Counter uut(.clk(clk),.reset(reset),.E(E),.sclr(sclr),.Q(Q),.zC(zC));
    
always #5 clk = ~clk;

initial begin
    clk = 0; reset = 1; E = 0; sclr = 0;
    #20; 
    reset = 0; E = 1;
    #200; 
    sclr = 1;
    #50; 
    sclr = 0;
    #200;
    E = 0;
    #50; 
    sclr = 1;
    #50; 
    E = 1;
end
    
endmodule
