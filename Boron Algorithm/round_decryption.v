`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 09:33:47
// Design Name: 
// Module Name: round_decryption
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


module round_decryption(
                input[63:0] data_i,
                input[79:0] key,
                output[63:0] data_o
    );
   genvar i;
    wire [63:0]  data_t
                ,data_t1
                ,data_t2
                ,data_t3;
                
    XOR_Operation_decryption xorop(
                    .data_i(data_i),
                    .data_o(data_t)
    );                
    
    round_permutatiom_decryption roundpermutation(
                    .data_i(data_t),
                    .data_o(data_t1)
    ); 
    
    block_shuffle_decryption blockshuffle(
                    .data_i(data_t1),
                    .data_o(data_t2)
    );          
    
    for(i = 0; i < 16; i = i+1)begin
            s_box_decryption sbox(
                    .data_i(data_t2[4*i+3:4*i]),
                    .data_o(data_t3[4*i+3:4*i])
            );
        end             
    
    ad_round_decryption addroundkey(
                    .data_i(data_t3),
                    .current_key(key),
                    .data_o(data_o)
    );            
                
endmodule
