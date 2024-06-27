`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2023 14:22:23
// Design Name: 
// Module Name: full_adder
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


module full_adder(
            
            input a_i,
            input b_i,
            input c_i,
            output s_o,
            output c_o
    );
    
    wire [3:0]kablo;
    assign  kablo[0] = a_i^b_i;
    assign  kablo[3]= c_i^kablo[0];
    assign  kablo[1] = kablo[0]&c_i;
    assign  kablo[2] = a_i&b_i;
    assign  c_o = kablo[2] | kablo[1] ;
    assign s_o = kablo[3]; 
    
endmodule
