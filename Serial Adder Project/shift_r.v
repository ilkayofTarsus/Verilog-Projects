`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2023 14:25:49
// Design Name: 
// Module Name: shift_r
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


module shift_r(
                input [7:0] data_i,
                input load_i,
                input clk_i,
                input rst_n,
                input enable_i,
                output reg data_o
    );
    
    reg[7:0] local;
  
    always@(posedge clk_i or negedge rst_n)begin
        if(!rst_n)begin
            local <= 0;
            data_o <= 0;
        end else begin
            if(load_i) begin
                    local = data_i;
            end
            else if(enable_i)begin
                    data_o <= local[0];
                    local <= {1'b0,local[7:1]};
            end
         end
        
    end
endmodule
