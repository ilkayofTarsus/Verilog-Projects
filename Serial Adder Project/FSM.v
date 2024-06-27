`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2023 09:44:17
// Design Name: 
// Module Name: FSM
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


module FSM(
            input rst_i,
            input start_i,
            input clk_i,
            output reg rst_n,
            output reg enable,
            output reg load
    );
    
    reg[3:0] current_state, next_state;
    parameter   start =     4'b0000,
                rst_state=  4'b0001,
                load_state= 4'b0010,
                enable1=    4'b0011,
                enable2=    4'b0100,
                enable3=    4'b0101,
                enable4=    4'b0110,
                enable5=    4'b0111,
                enable6=    4'b1000,
                enable7=    4'b1001,
                enable8=    4'b1010,
                enable9=    4'b1011,
                enable10=   4'b1100,
                enable11=   4'b1101;
    
    always@(posedge clk_i , negedge rst_i)begin
        if(!rst_i)begin
            rst_n <= 0;
            enable <= 0;
            load <= 0;
            current_state <= start;
        end else begin
            current_state <= next_state;
        end
    end
 
    always@(current_state or start_i) begin
        case(current_state)
            start : if(start_i == 1) next_state <= rst_state;
            rst_state : next_state <= load_state;
            load_state : next_state <= enable1;
            enable1 : next_state <= enable2;
            enable2 : next_state <= enable3;
            enable3 : next_state <= enable4;
            enable4 : next_state <= enable5;
            enable5 : next_state <= enable6;
            enable6 : next_state <= enable7;
            enable7 : next_state <= enable8;
            enable8 : next_state <= enable9;
            enable9 : next_state <= enable10;
            enable10 : next_state <= enable11;
            enable11 : next_state <= start;
            default : next_state <= start;
        endcase
    end
    
    always@(current_state or start_i) begin:out_logic
        case(current_state)
            start :      begin  load <= 0 ; enable <= 0; rst_n <= 0; end
            rst_state :  begin  load <= 0 ; enable = 0;  rst_n  = 1; end
            load_state:  begin  load <= 1 ; enable = 0;  rst_n  = 1; end
            enable1   :  begin  load <= 0 ; enable = 1;  rst_n  = 1; end
            enable2:     begin  load <= 0 ; enable = 1;  rst_n  = 1; end
            enable3: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable4: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable5: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable6: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable7: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable8: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable9: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable10: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
            enable11: begin      load <= 0 ; enable = 1;  rst_n  = 1; end
        endcase
    
    end
    
    
    
endmodule
