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


module Mod10_counter(
                    input SystemClock,
                    input Increment,
                    input ResetCounter,
                    output reg Count10
    );
    
    reg[3:0] counter;
    always@(posedge SystemClock or negedge ResetCounter)begin
        if(!ResetCounter)begin
            counter <= 0;
            Count10 <= 0;
        end else begin
            if(Increment) counter <= counter +1;
            if(counter == 9)begin
                counter <= 0;
                Count10 <= 1;
            end 
        end
    end
    
    
    
endmodule
