`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2023 17:04:54
// Design Name: 
// Module Name: Top_modul
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


module Top_modul(
                input [63:0] plain_text,
                input clk,
                input rst,
                input[79:0] key,
                output [63:0] plain_text_o
    );
    
    
    wire[63:0] cipher_text;
    wire done;
    Encryption enc(
                    .plain_text(plain_text),
                    .key(key),
                    .clk(clk),
                    .rst(rst),
                    .cipher_text(cipher_text),
                    .done(done)
        );
        
        Decryption dec(
                    .key(key),
                    .clk(clk),
                    .rst(rst),
                    .done(done),
                    .cipher_text(cipher_text),
                    .plain_text(plain_text_o)
        );
    
endmodule
