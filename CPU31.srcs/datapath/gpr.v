`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 13:39:52
// Design Name: 
// Module Name: gpr
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


module gpr(
    input write,
    input clk,
    input rst,
    input [4:0]ra,
    input [4:0]rb,
    input [4:0]rw,
    input [31:0]busW,
    output [31:0]busA,
    output [31:0]busB,
    output [31:0]Datain
    );
    reg [31:0]RegFile[31:0];//¼Ä´æÆ÷¶Ñ
    //Òì²½ÇåÁã
    integer i;
    always @(posedge rst) begin
        for(i=0;i<32;i=i+1)begin
            RegFile[i]<= 0;
        end
    end
    
    //Ë«¿Ú¶Á³ö get data
    assign busA = rst? 0:RegFile[ra];
    assign busB = rst? 0:RegFile[rb];
    assign Datain = rst?0 :busB;
    
    //Ð´Èë
    always @(posedge clk)begin
        if(write)begin
            RegFile[rw]<=busW;
            RegFile[0]<=0;
        end
    end
endmodule
