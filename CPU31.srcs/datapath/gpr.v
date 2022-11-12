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
    reg [31:0]RegFile[31:0];//�Ĵ�����
    //�첽����
    integer i;
<<<<<<< HEAD
=======
    /*
>>>>>>> b68dde7 ('更新CPU31，前后仿真均完成')
    always @(posedge rst) begin
        for(i=0;i<32;i=i+1)begin
            RegFile[i]<= 0;
        end
    end
<<<<<<< HEAD
    
=======
    */
>>>>>>> b68dde7 ('更新CPU31，前后仿真均完成')
    //˫�ڶ��� get data
    assign busA = rst? 0:RegFile[ra];
    assign busB = rst? 0:RegFile[rb];
    assign Datain = rst?0 :busB;
    
    //д��
<<<<<<< HEAD
    always @(posedge clk)begin
        if(write)begin
=======
    always @(posedge clk or posedge rst)begin
        if(rst)begin
            for(i=0;i<32;i=i+1)
                RegFile[i]<= 0;
        end
        else if(write)begin
>>>>>>> b68dde7 ('更新CPU31，前后仿真均完成')
            RegFile[rw]<=busW;
            RegFile[0]<=0;
        end
    end
endmodule
