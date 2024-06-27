`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2023 09:45:31
// Design Name: 
// Module Name: top
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


module top(
            input[31:0] A_i,
            input[31:0] B_i,
            input clk,
            input rst,
            output[63:0] C_o
    );
    wire[31:0] A_i_l, A_i_r,B_i_l,B_i_r;
    wire[63:0] mult1,mult2,mult3;
            divide_to_16b dt16(
                    .clk(clk),
                    .rst(rst),
                    .x(A_i),
                    .y(B_i),
                    .xl(A_i_l),
                    .xr(A_i_r),
                    .yl(B_i_l),
                    .yr(B_i_r)
            );
            mult_elements me(
                    .x_l(A_i_l),
                    .x_r(A_i_r),
                    .y_l(B_i_l),
                    .y_r(B_i_r),
                    .clk(clk),
                    .rst(rst),
                    .mult1(mult1),
                    .mult2(mult2),
                    .mult3(mult3)
            );
            sum_elements se(
                    .mult1(mult1),
                    .mult2(mult2),
                    .mult3(mult3),
                    .clk(clk),
                    .rst(rst),
                    .result(C_o)
            );    
    
    
endmodule
