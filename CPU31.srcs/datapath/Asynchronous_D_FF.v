`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 19:45:17
// Design Name: 
// Module Name: Asynchronous_D_FF
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


module Asynchronous_D_FF(
    input CLK,
    input D,
    input RST_n,
    input ena,
    output reg Q1,
    output reg Q2
    );
        
     always@(posedge CLK or posedge RST_n)
     begin
     if(RST_n==1)
     begin
          Q1=0;
          Q2=1;
     end
     else
     begin
        if(ena==1)begin
          Q1=D;
          Q2=~D;  
        end
     end
     end
endmodule

