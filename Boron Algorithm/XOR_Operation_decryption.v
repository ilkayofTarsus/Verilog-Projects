`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 09:29:59
// Design Name: 
// Module Name: XOR_Operation_decryption
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


module XOR_Operation_decryption(
                    input[63:0] data_i,
                    output[63:0] data_o
    );
    
        wire[15:0] p1,p2,p3,p4,
               p11,p22,p33,p44 ;
   
    assign p11 = data_i[15:0];
    assign p22 = data_i[31:16];
    assign p33 = data_i[47:32];
    assign p44 = data_i[63:48];
    
    assign p1 = (p22^p11);
    assign p2 = (p33^p44^p22);
    assign p3 = (p22^p11^p33);
    assign p4 = (p33^p44);
    
    assign data_o[15:0]     = p1; 
    assign data_o[31:16]    = p2;
    assign data_o[47:32]    = p3;
    assign data_o[63:48]    = p4;
    
    
    
endmodule
