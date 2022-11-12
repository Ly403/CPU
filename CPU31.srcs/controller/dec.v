`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 16:32:34
// Design Name: 
// Module Name: dec
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
`define ADD 32'b00000000000000000000000000000001
`define ADDU 32'b00000000000000000000000000000010
`define SUB 32'b00000000000000000000000000000100
`define SUBU 32'b00000000000000000000000000001000
`define AND 32'b00000000000000000000000000010000
`define OR 32'b00000000000000000000000000100000
`define XOR 32'b00000000000000000000000001000000
`define NOR 32'b00000000000000000000000010000000
`define SLT 32'b00000000000000000000000100000000
`define SLTU 32'b00000000000000000000001000000000
`define SLL 32'b00000000000000000000010000000000
`define SRL 32'b00000000000000000000100000000000
`define SRA 32'b00000000000000000001000000000000
`define SLLV 32'b00000000000000000010000000000000
`define SRLV 32'b00000000000000000100000000000000
`define SRAV 32'b00000000000000001000000000000000
`define JR 32'b00000000000000010000000000000000
`define ADDI 32'b00000000000000100000000000000000
`define ADDIU 32'b00000000000001000000000000000000
`define ANDI 32'b00000000000010000000000000000000
`define ORI 32'b00000000000100000000000000000000
`define XORI 32'b00000000001000000000000000000000
`define LW 32'b00000000010000000000000000000000
`define SW 32'b00000000100000000000000000000000
`define BEQ 32'b00000001000000000000000000000000
`define BNE 32'b00000010000000000000000000000000
`define SLTI 32'b00000100000000000000000000000000
`define SLTIU 32'b00001000000000000000000000000000
`define LUI 32'b00010000000000000000000000000000
`define J 32'b0010_0000_0000_0000_0000_0000_0000_0000
`define JAL 32'b0100_0000_0000_0000_0000_0000_0000_0000

module dec(
    input [31:0] code,
    output reg [31:0] instruction
    );
    wire [11:0]temp;
    //func and op to determine the instruction
    assign temp ={code[31:26],code[5:0]};
    
    always@(*)begin
        case(temp)
            12'b000000100000: instruction = `ADD;
            12'b000000100001: instruction = `ADDU;
            12'b000000100010: instruction = `SUB;
            12'b000000100011: instruction = `SUBU;
            12'b000000100100: instruction = `AND;
            12'b000000100101: instruction = `OR;
            12'b000000100110: instruction = `XOR;
            12'b000000100111: instruction = `NOR;
            12'b000000101010: instruction = `SLT;
            12'b000000101011: instruction = `SLTU;
            12'b000000000000: instruction = `SLL;
            12'b000000000010: instruction = `SRL;
            12'b000000000011: instruction = `SRA;
            12'b000000000100: instruction = `SLLV;
            12'b000000000110: instruction = `SRLV;
            12'b000000000111: instruction = `SRAV;
            12'b000000001000: instruction = `JR;
            default: begin
            case(temp[11:6])
            6'b001000: instruction = `ADDI;
            6'b001001: instruction = `ADDIU;
            6'b001100: instruction = `ANDI;
            6'b001101: instruction = `ORI;
            6'b001110: instruction = `XORI;
            6'b100011: instruction = `LW;
            6'b101011: instruction = `SW;
            6'b000100: instruction = `BEQ;
            6'b000101: instruction = `BNE;
            6'b001010: instruction = `SLTI;
            6'b001011: instruction = `SLTIU;
            6'b001111: instruction = `LUI;
            6'b000010: instruction = `J;
            6'b000011: instruction = `JAL;
            default : ; 
            endcase
            end
        endcase
    end
endmodule
