`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 13:14:14
// Design Name: 
// Module Name: ifu
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


module ifu(
    input nPC_sel,
    input clk,
    input rst,
    input [31:0]zero,
    output [31:0]instruction
    );
    reg [31:0] PC;
    reg [7:0]im[1023:0];
    reg [31:0]nPC;
    reg [31:0]ext;
    wire [31:0]temp,t0,t1;
    wire [15:0]imm;
    
    //fetch the instruction
    assign instruction = {imm[PC[9:0]],imm[PC[9:0]]+1,imm[PC[9:0]]+2,imm[PC[9:0]]+3};
    assign t0 = PC+4;//normal
    assign t1=t0+ext;//jump
    //set imm
    assign temp={{16{imm[15]}},imm};
    always @(*)
        ext=temp[31:0]<<2;//这个移两位是因为指令地址都是4的倍数
    //mul  choose the new pc
    always @(*)begin
        if(nPC_sel==1'b0)
            nPC=t0;
        else if(nPC_sel==1'b1)
            nPC=t1;
    end
    
    always@(posedge clk or posedge clk)
    begin
        if(rst)
            PC='h0000_3000;
        else
            PC=nPC;
    end
endmodule
