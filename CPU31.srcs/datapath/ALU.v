`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/11/11 19:21:48
// Design Name: 
// Module Name: ALU
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


module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] aluc,
    output reg [31:0] r,
    output reg zero,
    output reg carry,
    output reg negative,
    output reg overflow
    );
    
    reg [32:0]temp;
    reg [31:0]x;
    reg [31:0]y;
    reg [1:0]flag1;
    reg [1:0]flag2;
    wire signed [31:0] sa = a;
    wire signed [31:0] sb = b;
    /*
    initial
    begin 
    zero=0;
    carry=0;
    negative=0;
    overflow=0;
    end
    */
    
    always @ (*)
    case(aluc)
    4'b0000:
        begin
           temp = a + b;
           r=temp[31:0];
           if(r==0)
                zero=1;
           else
                zero=0;
           if(temp[32]!=0)
                carry=1;
           else
                carry=0;
           negative=r[31];
       end
    4'b0010:
        begin
            temp = a + b;
            r=temp[31:0];//不管怎么说都截断
            zero=!r;
            negative=r[31];
            //有符号溢出判断
            flag1 = a[30]+b[30];
            flag2 = a[31]+b[31]+flag1[1];
            if((flag1[1]==0&&flag2[1]!=0)||(flag1[1]!=0&&flag2[1]==0))
                overflow=1;
            else
                overflow=0;
        end
        4'b0001:
        begin
            r=a-b;
            if(r==0)
                zero = 1;
            else
                zero = 0;
            if(a<b)
                carry=1;
            else
                carry=0;
            negative=r[31];
        end
        4'b0011:
        begin
            r=a-b;
            zero=!r;
            negative=r[31];
           if((a[30] >= b[30] && a[31] < b[31])
           ||(a[30] < b[30] && a[31] - 1 >= b[31]))
                overflow=1;
           else
                overflow=0;
        end
        4'b0100:
        begin
            r=a & b;
            zero=!r;
            negative=r[31];
        end
        4'b0101:
        begin
            r=a|b;
            zero=!r;
            negative=r[31];
         end
         4'b0110:
         begin
            r=a^b;
            zero=!r;
            negative=r[31];        
         end  
         4'b0111:
         begin
            r=~(a|b);
            zero=!r;
            negative=r[31];  
         end
         4'b1000:
         begin
            r={b[15:0],16'b0};
            zero=!r;
            negative=r[31];            
         end
         4'b1001:
         begin
         r={b[15:0],16'b0};
         zero=!r;
         negative=r[31];        
         end
         4'b1010:
         begin
            r=(a<b)?1:0;
            if(a<b)
                carry=1;
            else
                carry=0;
            zero=(r==0)?1:0;
            negative= r[31];  
         end
         4'b1011:
         begin
            r = (sa < sb) ? 1 :0;
            zero=(r==0)?1:0;
            negative = r[31];  
         end
         4'b1100:
         begin
            x=b[31]==0?32'h00000000:32'hffffffff;
            x=x<<(32-a);
            if(a==0)begin
                r = b >> a;
                carry = 0;
            end
            else begin
                r=b>>(a-1);
                carry=r[0];
                r=r>>1;
            end
            r=r|x;
            zero=!r;
            negative=r[31]; 
         end
         4'b1110:
         begin
            if(a==0)begin
                r = b << a;
                carry = 0;
            end
            else begin
                r=b<<(a-1);
                carry=r[31];
                r=r<<1;
            end
            zero=!r;
            negative=r[31]; 
         end
         4'b1111:
             begin
                if(a==0)begin
                 r = b << a;
                 carry = 0;
             end
             else begin
                 r=b<<(a-1);
                 carry=r[31];
                 r=r<<1;
             end           
            zero=!r;   
            negative=r[31];  
         end
         4'b1101:
         begin
            if(a==0)begin
                r = b >> a;
                carry = 0;
            end
            else begin
                r=b>>(a-1);
                carry=r[0];
                r=r>>1;
            end
            zero=!r;  
            negative=r[31];  
         end
         default:
         begin       
          r=a+b;
         end    
    endcase  
endmodule
