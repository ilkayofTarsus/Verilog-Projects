`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2023 09:39:13
// Design Name: 
// Module Name: round
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


module round(
                input[63:0] data_i,
                input[79:0] key,
                output[63:0] data_o
    );
   genvar i;
    wire [63:0]  data_t
                ,data_t1
                ,data_t2
                ,data_t3;
                
    Add_Round_Key addroundkey(
                    .data_i(data_i),
                    .current_key(key),
                    .data_o(data_t)
    );
   // generate                        //yanlýs olabilir
        for(i = 0; i < 16; i = i+1)begin
            S_Box sbox(
                    .data_i(data_t[4*i+3:4*i]),
                    .data_o(data_t1[4*i+3:4*i])
            );
        end 
    //endgenerate
    Block_Shuffle blockshuffle(
                    .data_i(data_t1),
                    .data_o(data_t2)
    );
    Round_permutation roundpermutation(
                    .data_i(data_t2),
                    .data_o(data_t3)
    );
    XOR_Operation xorop(
                    .data_i(data_t3),
                    .data_o(data_o)
    );
endmodule
