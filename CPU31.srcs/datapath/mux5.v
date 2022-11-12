`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 17:34:33
// Design Name: 
// Module Name: mux5
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


module mux5(
    input [4:0] rt,
    input [4:0] rs,
    output reg [4:0] rd,
<<<<<<< HEAD
    input [2:0] op,
=======
    input [1:0] op,
>>>>>>> b68dde7 ('更新CPU31，前后仿真均完成')
    input rst
    );
    
    //choose from 2 reg[4:0]
    always @(*)begin
        if(rst)begin
            rd <= 0;
            rd <= 0;
        end
        else begin
        case(op)
            2'b00: rd<= rt; 
            2'b01: rd<= rs;
            2'b10: rd <= 5'b11111;
            2'b11: rd <= 5'b11111;      
        endcase
        end
    end
endmodule
