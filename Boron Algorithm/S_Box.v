`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2023 15:08:28
// Design Name: 
// Module Name: S_Box
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


module S_Box(
            input[3:0] data_i,
            output[3:0] data_o
    );
    
    assign data_o[0] =  (~data_i[3]&~data_i[2]&data_i[1]) | (~data_i[2]&data_i[1]&data_i[0]) | (~data_i[3]&data_i[2]&~data_i[1])
                        | (data_i[2]&~data_i[1]&data_i[0]) | (data_i[3]&~data_i[2]&~data_i[1]&~data_i[0]) | (data_i[3]&data_i[2]&data_i[1]&~data_i[0]);
   
    assign data_o[1] =  (~data_i[3]&~data_i[2]&~data_i[0]) | (~data_i[3]&~data_i[1]&~data_i[0]) 
                        | (data_i[2]&data_i[1]&data_i[0]) | (data_i[3]&~data_i[2]&data_i[0]) | (data_i[3]&data_i[2]&data_i[1]);
    
    assign data_o[2] =  (~data_i[3]&~data_i[2]&~data_i[1]) | (~data_i[2]&~data_i[1]&~data_i[0]) 
                        | (~data_i[3]&data_i[2]&~data_i[0]) | (data_i[3]&data_i[1]&data_i[0]) | (data_i[3]&data_i[2]&data_i[0]);/// sonuncu hatalıydı
                        
    assign data_o[3] =  (~data_i[3]&~data_i[2]&~data_i[0]) | (~data_i[3]&data_i[1]&~data_i[0]) 
                        | (~data_i[3]&data_i[2]&data_i[0]) | (data_i[3]&~data_i[1]&~data_i[0]) | (data_i[3]&~data_i[2]&data_i[1]&data_i[0]);
    
    
endmodule
