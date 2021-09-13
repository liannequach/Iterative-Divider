`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: Iter_Div_tb
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

module Iter_Div_tb();
    reg [5:0] A;
    reg [3:0] B;
    reg E;
    reg clk;
    reg reset;
    wire [5:0] Q;
    wire [3:0] R;
    wire done;
    
    integer i,j;
    
Iter_Div uut(.A(A),.B(B),.E(E),.reset(reset),.clk(clk),.R(R),.Q(Q),.done(done));  
  
always #5 clk = ~clk;

initial begin
    i=0; j=0;
    reset = 1;
    clk   = 0;
    E     = 1'b0;
    A     = 5'b1;
    B     = 5'b1;        
    #50;
    reset = 0;
    for(i=1; i<=16; i=i+1) begin
        #100;
        E = 1'b1;
        reset = 0;
        #100;
        B = i+1;
        
        for(j=0; j<64; j=j+1) begin
            #100;
            reset = 0;
            E = 1'b1;
            A = j+1;
            #100;
            $display("time=%t A=%2d B=%2d || done=%0d Q=%2d R=%2d",$time,A,B,done,Q,R);
            E = 0;
            
            reset = 1;
         end
     end
end
endmodule


