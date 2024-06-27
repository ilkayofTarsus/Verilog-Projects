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


module Shift_Reg(
                input ParityBit,
                input [7:0] Din,
                input clk,
                input Load,
                input Shift,
                input rst,
                output reg Dout
    );
    
        reg[9:0] ns;
        always@(posedge clk or negedge rst) begin
            if(!rst)begin
                   ns <= 10'b1111111111;
            end else begin
                if(Load & Shift)begin
                    ns <= 10'b1111111111;
                end else if(Load) begin
                    ns <= {ParityBit,Din[7:0],1'b0};
                end else if(Shift) begin
                    ns <= {1'b1,ns[9:1]};
                end else begin
                    ns <= ns;
                
                end 
                Dout = ns[0]; 
            end 
        end
endmodule
