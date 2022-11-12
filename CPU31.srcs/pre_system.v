`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 22:40:50
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


module pre_system();
    reg [31:0]im[2047:0];
    reg clk,rst;
    wire [31:0]inst;
    wire [31:0]pc;
    wire [31:0]data;
    wire [31:0]dataout;
    wire imr,dmr,dmw,dm_cs;
    wire [31:0]addr;
    integer file_out;
    integer counter;

    cpu31 cpu(
        .clk(clk),
        .rst(rst),
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
        .clk(clk),
        .rst(rst),
        .write(dmw),
        .addr(addr),
        .dm_cs(dm_cs)       
     );
     
     initial begin
        $readmemh("D:/digital_logic/project/CPU31/CPU31.srcs/out.txt",im);
        file_out = $fopen("D:/digital_logic/project/CPU31/CPU31.srcs/result.txt","w+");
        clk=0;
        rst=1;
        counter = -1;
        #49 ;
        rst=0;
     end
    
    
     assign inst =  !rst && imr ? im [pc >> 2] : inst; 
     
     always #1 clk =~ clk;
     
     always @(posedge clk) begin
        if(!rst)begin
            if(counter==400)begin
                $fclose(file_out);
            end
            else begin
                counter = counter + 1;
                if(counter>0)begin
                $fdisplay(file_out,"pc: %h",pc+ 32'h00400000); 
                $fdisplay(file_out,"instr: %h",cpu.inst);
                $fdisplay(file_out,"regfile0: %h",cpu.Regfile.RegFile[0]);
                $fdisplay(file_out,"regfile1: %h",cpu.Regfile.RegFile[1]);
                $fdisplay(file_out,"regfile2: %h",cpu.Regfile.RegFile[2]);
                $fdisplay(file_out,"regfile3: %h",cpu.Regfile.RegFile[3]);
                $fdisplay(file_out,"regfile4: %h",cpu.Regfile.RegFile[4]);
                $fdisplay(file_out,"regfile5: %h",cpu.Regfile.RegFile[5]);
                $fdisplay(file_out,"regfile6: %h",cpu.Regfile.RegFile[6]);
                $fdisplay(file_out,"regfile7: %h",cpu.Regfile.RegFile[7]);
                $fdisplay(file_out,"regfile8: %h",cpu.Regfile.RegFile[8]);
                $fdisplay(file_out,"regfile9: %h",cpu.Regfile.RegFile[9]);
                $fdisplay(file_out,"regfile10: %h",cpu.Regfile.RegFile[10]);
                $fdisplay(file_out,"regfile11: %h",cpu.Regfile.RegFile[11]);
                $fdisplay(file_out,"regfile12: %h",cpu.Regfile.RegFile[12]);
                $fdisplay(file_out,"regfile13: %h",cpu.Regfile.RegFile[13]);
                $fdisplay(file_out,"regfile14: %h",cpu.Regfile.RegFile[14]);
                $fdisplay(file_out,"regfile15: %h",cpu.Regfile.RegFile[15]);
                $fdisplay(file_out,"regfile16: %h",cpu.Regfile.RegFile[16]);
                $fdisplay(file_out,"regfile17: %h",cpu.Regfile.RegFile[17]);
                $fdisplay(file_out,"regfile18: %h",cpu.Regfile.RegFile[18]);
                $fdisplay(file_out,"regfile19: %h",cpu.Regfile.RegFile[19]);
                $fdisplay(file_out,"regfile20: %h",cpu.Regfile.RegFile[20]);
                $fdisplay(file_out,"regfile21: %h",cpu.Regfile.RegFile[21]);
                $fdisplay(file_out,"regfile22: %h",cpu.Regfile.RegFile[22]);
                $fdisplay(file_out,"regfile23: %h",cpu.Regfile.RegFile[23]);
                $fdisplay(file_out,"regfile24: %h",cpu.Regfile.RegFile[24]);
                $fdisplay(file_out,"regfile25: %h",cpu.Regfile.RegFile[25]);
                $fdisplay(file_out,"regfile26: %h",cpu.Regfile.RegFile[26]);
                $fdisplay(file_out,"regfile27: %h",cpu.Regfile.RegFile[27]);
                $fdisplay(file_out,"regfile28: %h",cpu.Regfile.RegFile[28]);
                $fdisplay(file_out,"regfile29: %h",cpu.Regfile.RegFile[29]);
                $fdisplay(file_out,"regfile30: %h",cpu.Regfile.RegFile[30]);
                $fdisplay(file_out,"regfile31: %h",cpu.Regfile.RegFile[31]);
                end
            end  
        end  
     end
endmodule
