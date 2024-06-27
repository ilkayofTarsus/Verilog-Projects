`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 14:10:08
// Design Name: 
// Module Name: switch_Hz
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


module switch_Hz(
                input clk,
                input rst_n,
                input switch,
                output reg out_clk
    );
    
        reg[30:0] counter;
        always@(posedge clk or negedge rst_n)begin
            if(!rst_n)begin
                out_clk <= 0;
                counter <= 0;
            end
            else begin
                   if(!switch) begin
                        counter <= counter + 1;
                        if(counter == 25000000)begin
                                counter <= 0;
                                out_clk <= ~out_clk;
                        end
                    end
                    else begin
                        counter <= counter + 1;
                        if(counter == 250000)begin
                                counter <= 0;
                                out_clk <= ~out_clk;
                        end
                    end
            end
        end
    
    
endmodule
