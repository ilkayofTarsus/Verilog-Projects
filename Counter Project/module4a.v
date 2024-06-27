`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2023 11:09:49
// Design Name: 
// Module Name: module4a
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


module module4a(
       
       input rst_n,
       input clk,
       input switch,
       output reg[3:0] counter
    
    );
    
    
   
    reg x;
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)begin
                counter = 0;
                x = 1;
        end else begin
            if(x == 1)begin
                counter = counter +1;
                if(counter == 15)
                    x = 0;
            end 
            else begin
                counter = counter - 1;
                if(counter == 0)
                    x = 1;
            end
        end
    end
endmodule
