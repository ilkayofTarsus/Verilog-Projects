`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2023 16:12:03
// Design Name: 
// Module Name: diff_data
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


module diff_data(
                input clk,
                input rst,
                input [6:0] data_i,
                output reg flag
    );
    
    
    always@(posedge clk or negedge rst or data_i)
    begin
        if(!rst) begin
            flag <= 0;  
        end else begin
            
        end
    
    end       
    
endmodule
