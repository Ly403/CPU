`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/26 19:15:36
// Design Name: 
// Module Name: test
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


module test();
    reg clk,rst;
    wire [7:0]o_seg;
    wire [7:0]o_sel;
    
    initial begin
           clk=0;
           rst=1;
           #49 ;
           rst=0;
        end
    system uut(
    .clk(clk),
    .rst(rst),
    .o_seg(o_seg),
    .o_sel(o_sel)
    );
    always #1 clk = ~clk;
endmodule
