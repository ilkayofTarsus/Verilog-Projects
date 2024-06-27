`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 09:09:23
// Design Name: 
// Module Name: divider_for_debouncer
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


module divider_for_debouncer(
                               input clk,
                               input rst_n,
                               output reg out_clk
    );
    
                
            reg[9:0] counter;
            always@(posedge clk or negedge rst_n)begin
                    
                    if(!rst_n)begin
                        out_clk <= 0;
                        counter <= 0;
                    end
                    else begin
                        counter <= counter + 1;
                        if(counter == 512 || counter == 0)
                            out_clk <= ~out_clk;  
                    end  
            end
    
    
            
            
    
    
    
endmodule
