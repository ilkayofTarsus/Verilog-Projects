`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 13:21:55
// Design Name: 
// Module Name: module4c
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


module module4c(
                input clk,
                input switch,
                input rst_n,
                input button,
                output reg[3:0] counter
    );
            wire clk_out,out_clk_tb,out_button;
            
            divider_for_debouncer divider_db(
                                       .clk(clk),
                                       .rst_n(rst_n),
                                       .out_clk(clk_out)
            );
            
            switch_Hz tb(
                        .clk(clk),
                        .rst_n(rst_n),
                        .switch(switch),
                        .out_clk(out_clk_tb)
            );
            
            debouncer db(
                        .clk(clk),
                        .rst_n(rst_n),
                        .clk_from_divider(clk_out),
                        .button(button),
                        .out_state(out_button)
            );
            reg inc_dec;
            always@(posedge out_clk_tb or negedge rst_n)begin
                    if(!rst_n)begin
                        counter = 0;
                    end
                    else begin
                        if(inc_dec)
                            counter = counter + 1;
                        else 
                            counter = counter - 1;
                           
                    end
            end
            always@(out_button)begin
                     if(!rst_n) inc_dec = 0;
							else begin
								if(out_button == 0)
										inc_dec = ~inc_dec;
							end
            end
            
endmodule
