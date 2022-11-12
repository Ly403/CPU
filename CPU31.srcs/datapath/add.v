`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 20:38:25
// Design Name: 
// Module Name: add
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


module add(
    input [31:0] a,
    input [31:0] b,
    output [31:0] r,
    output overflow,
    input rst
    );
    assign r = rst ? 0:a + b;
    assign overflow = rst? 0: r < a || r < b;
endmodule
