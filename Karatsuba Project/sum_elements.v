`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 09:43:56
// Design Name: 
// Module Name: sum_elements
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


module sum_elements(
                    input[63:0] mult1,
                    input[63:0] mult2,
                    input[63:0] mult3,
                    input clk,
                    input rst,
                    output reg[63:0] result
    );
    always@(posedge clk or negedge rst)begin
            if(!rst) begin
                result <= 0;
            end else begin
                result = mult1 + mult2 + mult3; 
            end
    end
endmodule
