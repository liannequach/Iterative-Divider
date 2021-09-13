`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CECS 361 
// Engineer: Len Quach
// 
// Create Date: 10/29/2020 02:20:28 PM
// Design Name: 
// Module Name: FSM
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

module FSM(
    input clk,reset,E,cout,zC,
    output reg LAB,EA,EC,sclrC,sclrR,LR,ER,done
    );
   
   
parameter
    RESET = 0,
    S1 = 1,
    S2 = 2,
    S3 = 3;


reg [1:0] present_state;
reg [1:0] next_state;


always@(*)
    case({present_state})
        RESET: begin                         
                LAB = 0;
                EA = 0;
                EC = 0;
                sclrC = 0;
                sclrR = 0;
                LR = 0;
                ER = 0;
                done = 0;
                next_state = S1;
               end                          
        S1: begin                            
                LAB =0 ;
                EA = 0;
                EC = 1;
                sclrC =1 ;
                sclrR = 1;
                LR = 0;
                ER = 1;
                done = 0;
                if(E) begin
                    next_state = S2;
                    LAB =1 ;
                    EA = 1;
                end      
                else
                    next_state = S1;      
            end
        S2: begin                           
                LAB =0 ;
                EA = 1;
                EC = 0;
                sclrC =0 ;
                sclrR = 0;
                LR = 0;
                ER = 1;
                done = 0;
                if(cout)
                    LR = 1 ;
                if(zC)
                    next_state = S3;
                else begin
                    EC = 1;
                    next_state = S2;    
                end                  
            end  
        S3: begin                          
                LAB = 0;
                EA = 0;
                EC = 0;
                sclrC = 0;
                sclrR = 0;
                LR = 0;
                ER = 0;
                done = 1;
                if(E)
                    next_state = S3;
                else
                    next_state = S1;      
            end
        default: next_state = RESET;               
    endcase
   

always@(posedge clk, posedge reset)
    if(reset)
        present_state <= RESET;            
    else
        present_state <= next_state;       

endmodule



