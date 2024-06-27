`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2023 09:41:46
// Design Name: 
// Module Name: key_generator
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


module key_decryption(
                    input[79:0] current_key,
                    input[4:0] current_round,
                    input clk,
                    input rst,
                    output reg [79:0] new_key
    );
        reg [79:0] key_reg;
        wire [3:0]  key_t;
        reg [3:0] key_to;
        reg [4:0] key_to1;
        s_box_decryption sv(.data_i(current_key[3:0]),.data_o(key_t));
        always@(*)begin
                 if(current_round > 0)begin
                     key_to <= key_t;
                     key_to1 <= current_key[63:59]^(current_round-1);
                     key_reg <= {current_key[79:64],key_to1,current_key[58:4],key_to};
                     new_key <= {key_reg[12:0],key_reg[79:13]};//>>13
                 end
        end
endmodule
