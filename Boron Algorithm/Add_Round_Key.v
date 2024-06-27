`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2023 15:57:02
// Design Name: 
// Module Name: Add_Round_Key
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


module Add_Round_Key(
                    input  [63:0] data_i,
                    input  [79:0] current_key,
                    output [63:0] data_o
    );
    
    assign data_o = data_i ^ current_key[63:0];
    
endmodule
