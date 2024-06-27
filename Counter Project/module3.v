`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2023 09:34:14
// Design Name: 
// Module Name: module3
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


module module3(
            input clk1,
            output reg[7:0] out_1,
            output reg[7:0] out_2,
            input rst_n
        );
        
        reg[128:0] counter;
        reg[128:0] clk;
        always @(negedge rst_n) begin
            out_1 = 0;
            out_2 = 0;  
            counter =0;      
        end
        
        
        always @(posedge clk1) begin
                counter = counter+1;
            if(counter%1000000 == 0)begin
                    counter = 0;
                    out_2 = out_2 +4;
                    out_1 <= out_1+1;
            end
        end
       
        
endmodule
