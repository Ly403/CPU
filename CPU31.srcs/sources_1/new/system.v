`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/06/18 14:32:11
// Design Name: 
// Module Name: system
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

//œ¬∞Â≤‚ ‘≥Ã–Ú
module system(
    input clk_in,
    input reset,
    output[7:0] o_sel,
    output[7:0] o_seg
   );
   wire [31:0]inst;
   wire [31:0]pc;
   wire [31:0]data;
   wire [31:0]dataout;
   wire imr,dmr,dmw,dm_cs;
   wire [31:0]addr;
   wire pclk; 
   //assign pclk = clk_in;
   
    clock_wizard cwd(
    .clkin(clk_in),
    .rst(reset),
    .clk(pclk)
    );   
  
   cpu31 cpu(
       .clk(pclk),
       .rst(reset),
       .inst(inst),
       .rdata(data),
       .pc(pc),
       .dataout(dataout),
       .imr(imr),
       .dmr(dmr),
       .dmw(dmw),
       .dm_cs(dm_cs),
       .addr(addr)
    );
    dm datamemory(
       .datain(dataout),
       .dataout(data),
       .clk(pclk),
       .rst(rst),
       .write(dmw),
       .addr(addr),
       .dm_cs(dm_cs)       
    );
    imem instructionMemory(pc[12:2],inst);
    seg7x16 seg(
         .clk(clk_in),
         .reset(reset),
         .cs(1),
         .i_data(pc),
         .o_seg(o_seg),
         .o_sel(o_sel)
        );
endmodule
