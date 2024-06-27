`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2023 14:33:22
// Design Name: 
// Module Name: shift_r_sum
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


module shift_r_sum(
                    input data_i,
                    input clk_i,
                    input enable_i,
                    input rst_i,
                    output reg[8:0] sum_o
    );
        
        always@(posedge clk_i or negedge rst_i)begin
            if(!rst_i)begin
                sum_o <= 0;
            end else begin
                if(enable_i)begin
                        sum_o <= {data_i,sum_o[8:1]};
                end
            end
        
        end
    
    
    
endmodule
