`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 13:51:07
// Design Name: 
// Module Name: ext
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


module ext(
    input [15:0] imm16,
    output reg [31:0] imm32,
    input ext,
    input rst
    );
    parameter ZERO = 2'b0;
    parameter SIGN = 2'b1;
    always@(*)begin
        if(rst)
            imm32 <= 0;
        else begin
        case(ext)
            ZERO: imm32={16'b0,imm16};
            SIGN: imm32={{16{imm16[15]}},imm16};
            default: ;//²»²Ù×÷
        endcase
        end        
    end
    
endmodule
