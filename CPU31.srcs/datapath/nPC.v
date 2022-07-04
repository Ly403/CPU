`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 21:21:31
// Design Name: 
// Module Name: nPC
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


module nPC(
    input [31:0] datain,
    input rst,
    output reg [31:0] dataout
    );
    always @(*)begin
        if(rst)
            dataout = datain;
        else
            dataout = datain + 4;
    end
endmodule
