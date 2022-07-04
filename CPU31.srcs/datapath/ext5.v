`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 17:38:39
// Design Name: 
// Module Name: ext5
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


module ext5(
    input [4:0] datain,
    output reg [31:0] dataout,
    input rst
    );
    always@(*)begin
        if(rst)
            dataout <= 0;
        else
            dataout = {27'b0,datain};    
    end
endmodule
