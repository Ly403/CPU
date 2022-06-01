`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 18:04:55
// Design Name: 
// Module Name: II
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


module II(
    input [3:0] a,
    input [25:0] b,
    output [31:0] out,
    input rst
    );
    //ÒÆÎ»Æ´½Ó
    assign out = rst? 0 :{a,b,2'b00};
endmodule
