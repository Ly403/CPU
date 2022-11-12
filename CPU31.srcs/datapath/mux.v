`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 15:35:36
// Design Name: 
// Module Name: mux
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


module mux(
    input [31:0]dataa,
    input [31:0]datab,
    output reg[31:0] out,
    input op,
    input rst
    );
     always @(*)begin
        if (rst)
            out<=0;
        else begin 
            if(!op)
                out = dataa;
            else
                out = datab;      
        end
      end
endmodule
