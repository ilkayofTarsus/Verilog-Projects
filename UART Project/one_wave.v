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


module button(
                input clk,
                input rst,
                input button_wave,
                output reg button_out
    );
    reg local;
        always@(posedge clk or negedge rst)begin
            if(!rst) begin
                button_out <= 0;
                local <= 0;
            end else begin
                if(button_wave == 1 & local == 0)begin
                    button_out <= 1;
                    local <= 1;
                end else if (button_wave == 0 & local == 1)begin
                    button_out <= 0;
                    local <= 0;
                end
                else 
                    button_out <= 0;
            end
        end
endmodule
