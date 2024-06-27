`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 09:08:54
// Design Name: 
// Module Name: s_box_decryption
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


module s_box_decryption(
            input[3:0] data_i,
            output reg [3:0] data_o
    );
    always@(*)begin
        case(data_i)
            4'b0000: data_o <= 4'b1010;
            4'b0001: data_o <= 4'b0011;
            4'b0010: data_o <= 4'b1001;
            4'b0011: data_o <= 4'b1110;
            4'b0100: data_o <= 4'b0001;
            4'b0101: data_o <= 4'b1101;
            4'b0110: data_o <= 4'b1111;
            4'b0111: data_o <= 4'b0100;
            4'b1000: data_o <= 4'b1100;
            4'b1001: data_o <= 4'b0101;
            4'b1010: data_o <= 4'b0111;
            4'b1011: data_o <= 4'b0010;
            4'b1100: data_o <= 4'b0110;
            4'b1101: data_o <= 4'b1000;
            4'b1110: data_o <= 4'b0000;
            4'b1111: data_o <= 4'b1011;    
        endcase
    end
endmodule
