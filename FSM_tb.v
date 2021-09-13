`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: FSM_tb
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

module FSM_tb();
    reg  clk,reset,E,cout,zC;
    wire LAB,EA,EC,sclrC,sclrR,LR,ER,done;

FSM uut(.clk(clk),.reset(reset),.E(E),.cout(cout),.zC(zC),.LAB(LAB),.EA(EA),.EC(EC),.sclrC(sclrC),.sclrR(sclrR),.LR(LR),.ER(ER),.done(done));
   
always #5 clk = ~clk;

initial begin
    reset = 1; clk = 0; E = 0; cout = 0; zC = 0;
    #100; 
    reset = 0; 
    #60;
    E = 1; 
    #60;
    cout = 1; zC = 1; 
    #60;
    E = 0; 
    #100;
end
endmodule


