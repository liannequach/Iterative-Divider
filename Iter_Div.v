`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: lter_Div
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

module Iter_Div(A,B,E,reset,clk,R,Q,done);
    input [5:0] A;
    input [3:0] B;
    input E;
    input clk;
    input reset;
    output [5:0] Q;
    output [3:0] R;
    output done;
    
    wire [3:0] Q_reg;
    wire [4:0] Sum_FA;
    wire [2:0] Q_cnt;
        
FSM             Fsm(.clk(clk),.reset(reset),.E(E),.cout(cout),.zC(zC),.LAB(LAB),.EA(EA),.EC(EC),.sclrC(sclrC),.sclrR(sclrR),.LR(LR),.ER(ER),.done(done));
Register        Reg(.clk(clk),.reset(reset),.D(B),.Q(Q_reg),.E(LAB));
LShift_Reg_Clr  LS_C(.clk(clk),.reset(reset),.D(Sum_FA[3:0]),.sclr(sclrR),.s_L(LR),.E(ER),.w(Q[5]),.Q(R));
LShift_Reg      LS(.clk(clk),.reset(reset),.D(A),.s_L(LAB),.E(EA),.w(cout),.Q(Q));
Counter         Cnt(.clk(clk),.reset(reset),.E(EC),.sclr(sclrC),.Q(Q_cnt),.zC(zC));
FA_5bit         Fa5(.A({R,Q[5]}),.B(~({1'b0,Q_reg})),.cin(1'b1),.Cout(cout),.Sum(Sum_FA));
      
endmodule

