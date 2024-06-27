`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2023 14:57:45
// Design Name: 
// Module Name: module2
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


module module2(
        input[1 :0] x,
        input clk,
        output reg clk_out,   
        input rst_n
    );
    
    reg counter;
    
    always@(posedge clk or negedge rst_n)
    begin
            if(!rst_n)begin
                clk_out = 0;
                counter = 0;
            end
            counter = counter +1;
            if(x == 0) 
            begin
                counter = counter%2;
                if(counter == 1 || counter == 0)
                clk_out = ~clk_out;                                    
                
            end
            if(x == 1) 
            begin
                counter = counter%4;
                if(counter == 2 || counter == 0)
                    clk_out = ~clk_out;
            end
            if(x == 2) 
            begin
                counter = counter%8;
                if(counter == 4 || counter == 0)
                    clk_out = ~clk_out;
            end
            if(x == 3) 
            begin
                counter = counter%16;
                if(counter == 8 || counter == 0)
                    clk_out = ~clk_out;
            end
            
    end
    
    
    
endmodule
