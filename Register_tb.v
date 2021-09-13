`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: Register_tb
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

module Register_tb(); 
    reg reset, clk, E;
    reg [3:0] D;
    wire [3:0] Q;

Register uut(.clk(clk), .reset(reset), .E(E), .D(D), .Q(Q));

initial begin
    reset= 1;
    D=4'b0001;
    E<=0;
    #50
    reset=0;
    E<=1;
    #50
    E<=0;
    #50
    E<=1;
    @(posedge clk);
    E<=0;
    @(posedge clk);
    E<=1;
    @(posedge clk);
    E<=0;
  end

initial begin
  clk=1;
  forever begin
    #5 clk = ~clk;
  end
end

endmodule
