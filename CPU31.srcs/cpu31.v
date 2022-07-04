`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 19:52:58
// Design Name: 
// Module Name: cpu31
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


module cpu31(
    input clk,
    input rst,
    input [31:0] inst,
    input [31:0] rdata,
    output [31:0] pc,
    output [31:0] dataout,
    output imr,
    output dmr,
    output dmw,
    output dm_cs,
    output [31:0] addr
    );
    
    wire pcclk;
    wire M1,M2,M3,M4,M5,M6,M7,M8,M9;
    wire [3:0]aluc;
    wire rfw;
    wire rfclk;
    wire EXT16;
    
    wire zero,carry,overflow,negative,over;
    //////////////////////////data bus
    wire [31:0] instruction;
    wire [31:0] O_MUX_1;
    wire [31:0] I_MUX_2_1,I_MUX_2_2,O_MUX_2;
    wire [31:0] I_MUX_3_1,O_MUX_3;
    wire [4:0]  O_MUX_4;
    wire [4:0]  O_MUX_5;
    wire [31:0] I_MUX_6_2,O_MUX_6;
    wire [31:0] I_MUX_7_1,O_MUX_7;
    wire [31:0] I_MUX_8_1,I_MUX_8_2,O_MUX_8;
    wire [31:0] I_MUX_9_1,I_MUX_9_2,O_MUX_9;
    wire [31:0] ADD_A;
    wire [31:0] PC;
    wire PC_ENA;
    assign PC_ENA=1;
    ////////////////////////////////ภýปฏ

     
    pcreg uPC(
        .clk(pcclk),
        .rst(rst),
        .ena(PC_ENA),
        .data_in(O_MUX_1),
        .data_out(PC)
    );
    dec udec(inst,instruction);
    CU uCU(
        .clk(clk),
        .z(zero),
        .instruction(instruction),
        .PC_CLK(pcclk),
        .IM_R(imr),
        .M1(M1),
        .M2(M2),
        .M3(M3),
        .M4(M4),
        .M5(M5),
        .M6(M6),
        .M7(M7),
        .M8(M8),
        .M9(M9),
        .aluc(aluc),
        .rfw(rfw),
        .rfclk(rfclk),
        .dmw(dmw),
        .dmr(dmr),
        .dm_cs(dm_cs),
        .EXT16(EXT16)
        );
    mux mux1(
        .dataa(O_MUX_3- 32'h00400000),
        .datab(O_MUX_2),
        .out(O_MUX_1),
        .op(M1),
        .rst(rst)
        );
    mux mux2(
        .dataa(I_MUX_2_1),
        .datab(I_MUX_2_2),
        .out(O_MUX_2),
        .op(M2),
        .rst(rst)
    );
    mux mux3(
        .dataa(I_MUX_3_1),
        .datab(I_MUX_8_2),
        .out(O_MUX_3),
        .op(M3),
        .rst(rst)
    );
    mux5 mux4(
        .rt(inst[10:6]),
        .rs(I_MUX_8_2[4:0]),
        .rd(O_MUX_4),
        .op({instruction[30],M4}),
        .rst(rst)
    );
    mux5 mux_5(
        .rt(inst[15:11]),
        .rs(inst[20:16]),
        .rd(O_MUX_5),
        .op({instruction[30],M5}),
        .rst(rst)
    );    
    mux mux6(
        .dataa(O_MUX_7),
        .datab(I_MUX_6_2),
        .out(O_MUX_6),
        .op(M6),
        .rst(rst)
    );
    mux mux7(
        .dataa(I_MUX_7_1),
        .datab(rdata),
        .out(O_MUX_7),
        .op(M7),
        .rst(rst)
    );
    mux mux8(
        .dataa(I_MUX_8_1),
        .datab(I_MUX_8_2),
        .out(O_MUX_8),
        .op(M8),
        .rst(rst)
    );
    mux mux9(
        .dataa(I_MUX_9_1),
        .datab(I_MUX_9_2),
        .out(O_MUX_9),
        .op(M9),
        .rst(rst)
    );
    
    ext uext(    
        .imm16(inst[15:0]),
        .imm32(I_MUX_9_2),
        .ext(EXT16),
        .rst(rst)
    );
    ext5 uext5(
          .datain(O_MUX_4),
          .dataout(I_MUX_8_1),
          .rst(rst)
    );
    ext18 uext18(
        .datain(inst[15:0]),
        .dataout(ADD_A),
        .rst(rst)   
    );
    
   add uadd(
        .a(ADD_A),
        .b(I_MUX_2_1),
        .r(I_MUX_2_2),
        .overflow(over),
        .rst(rst) 
    );
    add4 uadd4(
        .a(PC),
        .r(I_MUX_6_2),
        .rst(rst) 
    );
    

    nPC PCNEW(
        .datain(PC),
        .rst(rst),
        .dataout(I_MUX_2_1)
    );
    alu uAlu(
      .a(O_MUX_8),
      .b(O_MUX_9),
      .aluc(aluc),
      .r(I_MUX_7_1),
      .zero(zero),
      .carry(carry),
      .negative(negative),
      .overflow(overflow)
     );
     
     II uII(
        .a(PC[31:28]),
        .b(inst[25:0]),
        .out(I_MUX_3_1),
        .rst(rst) 
     );
     gpr Regfile(
           .write(rfw),
           .clk(rfclk),
           .rst(rst),
           .ra(inst[25:21]),
           .rb(inst[20:16]),
           .rw(O_MUX_5),
           .busW(O_MUX_6),
           .busA(I_MUX_8_2),
           .busB(I_MUX_9_1),
           .Datain()
     );
     assign pc = PC;
     assign addr = I_MUX_7_1;
     assign dataout = I_MUX_9_1;
endmodule
