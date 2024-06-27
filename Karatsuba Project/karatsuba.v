`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 09:25:00
// Design Name: 
// Module Name: karatsuba
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


module karatsuba(
                    input[31:0] A_i,
                    input[31:0] B_i,
                    input clk,
                    input rst,
                    output reg [63:0] C_o
                    
    );
    reg[15:0] x_l , y_l , x_r , y_r;
    reg[63:0] kablo1,kablo2,kablo3;
    always@(posedge clk or negedge rst) begin
        if(!rst)begin
            C_o <= 0;
            x_l = A_i[31:16];  
            y_l = B_i[31:16];  
            x_r = A_i[15:0];   
            y_r = A_i[15:0];   
        end else begin
            kablo1 =  2**32*x_l*y_l;             
            kablo2 =  2**16*(x_l*y_r + x_r*y_l); 
            kablo3 =  x_r*y_r;                   
            C_o =kablo1+kablo2+kablo3 ;
        end
    end
endmodule
