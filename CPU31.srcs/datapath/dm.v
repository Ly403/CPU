`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 14:01:27
// Design Name: 
// Module Name: dm
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


module dm(
    input [31:0] datain,
    output [31:0] dataout,
    input clk,
    input rst,
    input write,
    input [31:0]addr,
    input dm_cs
    );
    reg [7:0]dm[1023:0];
    wire [9:0]p;
    assign p = addr[9:0];
    
    integer i;
    //set zero
<<<<<<< HEAD
=======
    /*
>>>>>>> b68dde7 ('更新CPU31，前后仿真均完成')
    always @(posedge rst)begin
        for(i=0;i<1024;i=i+1)begin
            dm[i]<=0;
        end
    end
<<<<<<< HEAD
    
    assign dataout = rst ? 0 :{dm[p],dm[p+1],dm[p+2],dm[p+3]};
    //write
    always @(negedge clk)begin
        if(dm_cs)begin
=======
    */
    assign dataout = rst ? 0 :{dm[p],dm[p+1],dm[p+2],dm[p+3]};
    //write
    always @(negedge clk or posedge rst)begin
        if(rst)begin
            for(i=0;i<1024;i=i+1)
                dm[i]<=0;
        end
        else if(dm_cs)begin
>>>>>>> b68dde7 ('更新CPU31，前后仿真均完成')
            if(write)begin
                dm[p]<=datain[31:24];
                dm[p+1]<=datain[23:16];
                dm[p+2]<=datain[15:8];
                dm[p+3]<=datain[7:0];
            end
        end
    end
endmodule
