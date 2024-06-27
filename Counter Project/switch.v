`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.08.2023 14:45:51
// Design Name: 
// Module Name: switch
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


module switch(
                input clk,
                input rst_n,
                input sw_switch,
                output reg out_clk
    );
    
    reg x = 1;
    reg[128:0] counter_1;
    always@(posedge clk  or negedge rst_n ) begin
        if(!rst_n)begin
                counter_1 <= 0;
                out_clk <= 0;
        end
        else begin
            if(sw_switch == 0)begin
                counter_1 <= counter_1 + 1;
                if(counter_1 == 500000)begin
                    out_clk <= ~out_clk;
                    counter_1 <= 0;
                end
            end 
            else begin
                counter_1 <= counter_1 + 1;
                if(counter_1 == 10000)begin
                    out_clk <= ~out_clk;
                    counter_1 <= 0;
                end
            end
        end
    end
        
endmodule
