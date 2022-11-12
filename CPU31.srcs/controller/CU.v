`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 18:14:23
// Design Name: 
// Module Name: CU
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
module CU(
    input clk,
    input z,
    input [31:0] instruction,
    output PC_CLK,
    output IM_R,
    output M1,
    output M2,
    output M3,
    output M4,
    output M5,
    output M6,
    output M7,
    output M8,
    output M9,
    output [3:0]aluc,
    output rfw,
    output rfclk,
    output dmw,
    output dmr,
    output dm_cs,
    output EXT16
    );
    
    parameter Add = 5'd0;
    parameter Addu = 5'd1;
    parameter Sub = 5'd2;
    parameter Subu = 5'd3;
    parameter And = 5'd4;
    parameter Or = 5'd5;
    parameter Xor = 5'd6;
    parameter Nor = 5'd7;
    parameter Slt = 5'd8;
    parameter Sltu = 5'd9;
    parameter Sll = 5'd10;
    parameter Srl = 5'd11;
    parameter Sra = 5'd12;
    parameter Sllv = 5'd13;
    parameter Srlv = 5'd14;
    parameter Srav = 5'd15;
    parameter Jr = 5'd16;
    parameter Addi = 5'd17;
    parameter Addiu = 5'd18;
    parameter Andi = 5'd19;
    parameter Ori = 5'd20;
    parameter Xori = 5'd21;
    parameter Lw = 5'd22;
    parameter Sw = 5'd23;
    parameter Beq = 5'd24;
    parameter Bne = 5'd25;
    parameter Slti = 5'd26;
    parameter Sltiu = 5'd27;
    parameter Lui = 5'd28;
    parameter J = 5'd29;
    parameter Jal = 5'd30;
    
    assign PC_CLK = clk;
    assign IM_R = 1;
    assign M1 = !(instruction[Jal]||instruction[J]||instruction[Jr]);
    assign M2 = (instruction[Beq] && z) || (instruction[Bne] && !z);
    assign M3 = instruction[Jr];
    assign M4 = instruction[Sllv] || instruction[Srlv] || instruction[Srav];
    assign M5 = instruction[Addi] || instruction[Addiu] || instruction[Andi] || instruction[Ori] ||
        instruction[Xori] ||instruction[Lw]||instruction[Sw] || instruction[Slti] || instruction[Sltiu] ||instruction[Lui];
    assign M6 = instruction[Jal] ;
    assign M7 =instruction[Lw];
    assign M8 =!(instruction[Sll]||instruction[Srl]||instruction[Sra]||instruction[Sllv]||instruction[Srlv]||instruction[Srav]);
    assign M9 = instruction[Addi] ||instruction[Addiu]||instruction[Andi]||instruction[Ori]||instruction[Xori]
        ||instruction[Lw]||instruction[Sw] || instruction[Slti] || instruction[Sltiu] ||instruction[Lui];
    
    assign aluc[0] = instruction[Sub]||instruction[Subu]||instruction[Or]||instruction[Nor]||instruction[Slt]||
        instruction[Srl]||instruction[Srlv]||instruction[Ori]||instruction[Beq]||instruction[Bne]||instruction[Slti];
    assign aluc[1]=instruction[Add]||instruction[Sub]||instruction[Xor]||instruction[Nor]||instruction[Slt]||
        instruction[Sltu]||instruction[Sll]||instruction[Sllv]||instruction[Addi]||instruction[Xori]||instruction[Lw]||
        instruction[Sw]||instruction[Beq]||instruction[Bne]||instruction[Slti]||instruction[Sltiu];
    assign aluc[2]=instruction[And]||instruction[Or]||instruction[Xor]||instruction[Nor]||instruction[Sll]||instruction[Srl]||
        instruction[Sra]||instruction[Sllv]||instruction[Srlv]||instruction[Srav]||instruction[Andi]||instruction[Ori]||instruction[Xori];
    assign aluc[3]=instruction[Slt]||instruction[Sltu]||instruction[Sll]||instruction[Srl]||instruction[Sra]||instruction[Sllv]||
        instruction[Srlv]||instruction[Srav]||instruction[Slti]||instruction[Sltiu]||instruction[Lui];
    assign rfw=!(instruction[Jr]||instruction[Sw]||instruction[Beq]||instruction[Bne]||instruction[J]);
    assign rfclk = !clk;
    assign dmw=instruction[Sw];
    assign dmr=instruction[Lw];
    assign dm_cs=instruction[Lw]||instruction[Sw];
    assign EXT16=!(instruction[Xori]||instruction[Andi]||instruction[Ori]);
endmodule
