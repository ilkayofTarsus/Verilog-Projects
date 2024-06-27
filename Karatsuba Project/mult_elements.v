`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 09:40:48
// Design Name: 
// Module Name: mult_elements
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


module mult_elements(
                    input [15:0]x_l,
                    input [15:0]y_l,
                    input [15:0]x_r,
                    input [15:0]y_r,
                    input clk,
                    input rst,
                    output reg[63:0] mult1,
                    output reg[63:0] mult2,
                    output reg[63:0] mult3
    );
         always@(posedge clk or negedge rst)begin
                if(!rst) begin
                    mult1 <= 0;
                    mult2 <= 0;
                    mult3 <= 0;
                end else begin
                    mult1 = 2**32*x_l*y_l;            
                    mult2 = 2**16*(x_l*y_r + x_r*y_l);
                    mult3 = x_r*y_r;                  
                end
            end
endmodule
