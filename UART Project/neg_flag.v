`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2023 14:37:48
// Design Name: 
// Module Name: one_wave
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


module neg_flag(
                input clk,
                input rst,
                input button_wave,
                output reg button_out
    );
    reg local;
    reg flag;
    
        always@(posedge clk or negedge rst)begin
            if(!rst) begin
                button_out <= 0;
                local <= 0;
                flag <= 0;
            end else begin
                button_out <= 0;
                if(button_wave == 1 & local == 0)begin
                    local <= 1;
                end else if (button_wave == 0 & local == 1)begin
                    button_out <= 1;
                    local <= 0;
                end
                
            end
        end
endmodule
