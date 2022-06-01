`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/28 22:08:59
// Design Name: 
// Module Name: pcreg
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


module pcreg(
    input clk,
    input rst,
    input ena,
    input [31:0] data_in,
    output [31:0] data_out
    );
    
    
    genvar i;
    generate
        for(i=0;i<32;i=i+1)
        begin:gen
            Asynchronous_D_FF D0(
            .CLK(clk),//这里修正成下降沿有效
            .D(data_in[i]),
            .RST_n(rst),
            .ena(ena),
            .Q1(data_out[i]),
            .Q2()
            );
        end 
    endgenerate
       
endmodule
