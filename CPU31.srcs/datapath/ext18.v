`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 17:43:16
// Design Name: 
// Module Name: ext18
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


module ext18(
    input [15:0] datain,
    output reg [31:0] dataout,
    input rst
    );
    //for beq
    always@(*)begin
        if(rst)
            dataout <= 0;
        else
            dataout = {{14{datain[15]}},datain,2'b00};    
    end
endmodule
