`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/26 18:10:09
// Design Name: 
// Module Name: clock_wizard
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


module clock_wizard(
    input clkin,
    input rst,
    output reg clk
    );
    
    reg [31:0] i;
    always @(posedge clkin or posedge rst)begin
        if(rst)
            clk<=0;
        else if(i==10000000)begin
            i <= 0;
            clk <= ~clk;
        end
        else 
            i=i+1;
    end
endmodule
