`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.08.2023 10:46:19
// Design Name: 
// Module Name: module1
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


module module1( input X,
                input clk,rst_n,
                output reg [2:0]out
    );
    
    wire [2:0] i;
   
    
    always @(posedge clk or negedge rst_n)

      begin
            if (!rst_n)
                out = 0;
    
           else begin
                if(X == 1)
                        out = out +1;
               else  
                        out = out -1;    
            end
        end    
    
    assign i = out;
    
endmodule
