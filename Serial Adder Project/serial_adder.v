`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2023 10:22:22
// Design Name: 
// Module Name: serial_adder
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


module serial_adder(
                    input [7:0]A_i,
                    input [7:0] B_i,
                    input rst_ni,
                    input clk_i,
                    input start_i,      
                    output [8:0] sum_o
    );
    wire rst_n , load, enable ,data_o_A,data_o_B, s_o,c_o;
    reg c_i;
    always@(posedge clk_i) begin
            if(!rst_n) c_i <= 0;
            else       c_i <= c_o;
        end 
            FSM fsm_m(
                        .rst_i(rst_ni),
                        .start_i(start_i),
                        .clk_i(clk_i),
                        .rst_n(rst_n),
                        .enable(enable),
                        .load(load)
                    );
             shift_r shr_A(
                        .data_i(A_i),
                        .load_i(load),
                        .rst_n(rst_n),
                        .clk_i(clk_i),
                        .enable_i(enable),
                        .data_o(data_o_A)
                    );
              shift_r shr_B(
                        .data_i(B_i),
                        .load_i(load),
                        .rst_n(rst_n),
                        .clk_i(clk_i),
                        .enable_i(enable),
                        .data_o(data_o_B)
                    );
               full_adder fa(
            
                            .a_i(data_o_A),
                            .b_i(data_o_B),
                            .c_i(c_i),
                            .s_o(s_o),
                            .c_o(c_o)
                     );
                shift_r_sum shr(
                    .data_i(s_o),
                    .clk_i(clk_i),
                    .enable_i(enable),
                    .rst_i(rst_n),
                    .sum_o(sum_o)
    );
        
                 
endmodule
