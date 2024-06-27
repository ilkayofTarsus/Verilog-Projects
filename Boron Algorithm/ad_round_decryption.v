`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 09:01:32
// Design Name: 
// Module Name: ad_round_decryption
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


module ad_round_decryption(
                    input  [63:0] data_i,
                    input  [79:0] current_key,
                    output [63:0] data_o
    );
    
    assign data_o = data_i ^ current_key[63:0];
endmodule
