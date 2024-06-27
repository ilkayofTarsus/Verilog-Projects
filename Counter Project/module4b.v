`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2023 15:26:48
// Design Name: 
// Module Name: module4b
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


module module4b(
                input clk,
                input switch,
                input rst_n,
                output reg[2:0] counter
    );
    
    always @ (posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            counter <=0;
        end
        else begin
            if(switch == 0)
                counter = counter +1;                       
            else
                counter = counter -1;
        end
    end
endmodule
