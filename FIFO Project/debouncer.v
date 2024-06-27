`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2023 08:48:26
// Design Name: 
// Module Name: debouncer
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


module debouncer(
                input clk,
                input clk_from_divider,
                input rst_n,
                input button,
                output reg out_state
    );
    
     
  
    reg[8:0] total_button_states;
    always@(posedge clk_from_divider or negedge rst_n)begin
        if(!rst_n)begin
            
            total_button_states <= 0;
        end
        else begin
            total_button_states[8:1] <= total_button_states[7:0];
            total_button_states[0] <=!button;               
        end
    end
        
    always@(posedge clk_from_divider or negedge rst_n
     )begin
          if(!rst_n) out_state <= 0;
          out_state <= (&total_button_states);
    end  
  
  
    
endmodule
