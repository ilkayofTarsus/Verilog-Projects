`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 09:37:27
// Design Name: 
// Module Name: divide_to_16b
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


module divide_to_16b(
                    input clk,
                    input rst,
                    input [31:0]x,
                    input [31:0]y,
                    output reg[15:0] xl,
                    output reg[15:0] xr,
                    output reg[15:0] yl,
                    output reg[15:0] yr
    );

        always@(posedge clk or negedge rst)begin
                if(!rst) begin
                    xl <= 0;
                    xr <= 0;
                    yr <= 0;
                    yl <= 0;
                end else begin
                    xl = x[31:16];
                    yl = y[31:16];
                    xr = x[15:0];
                    yr = y[15:0];
                end
            end
endmodule
