`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2023 15:48:14
// Design Name: 
// Module Name: Round_permutation
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


module Round_permutation(
                    input[63:0] data_i,
                    output[63:0] data_o
    );
    
    wire[15:0] p1,p2,p3,p4,
               p11,p22,p33,p44 ;
    assign p11 = data_i[15:0];
    assign p22 = data_i[31:16];
    assign p33 = data_i[47:32];
    assign p44 = data_i[63:48];
    
    assign p1 = {p11[14:0],p11[15]};//p11 << 1;
    assign p2 = {p22[11:0],p22[15:12]};//p22 << 4;
    assign p3 = {p33[8:0],p33[15:9]};//p33 << 7;
    assign p4 = {p44[6:0],p44[15:7]};//p44 << 9;         
            
    assign data_o[15:0]     = p1; 
    assign data_o[31:16]    = p2;
    assign data_o[47:32]    = p3;
    assign data_o[63:48]    = p4;        
endmodule
