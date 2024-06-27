`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 08:56:28
// Design Name: 
// Module Name: Mod10_counter
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


module Parity_gen(
                    input ParitySelect,
                    input[7:0] Din,
                    output ParityBit                    
    );
        assign ParityBit = (^Din) ^ ParitySelect;
endmodule
