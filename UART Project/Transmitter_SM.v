`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 08:56:28
// Design Name: 
// Module Name: Mod10_counter
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


module Transmitter_SM(
                      input Sent,
                      input NextBit,
                      input Count10,
                      input rst,
                      input clk,
                      output reg Busy,
                      output reg Increment,
                      output reg ResetCounter,
                      output reg ResetTimer,
                      output reg Shift,
                      output reg Load
    );
      
              
      
        reg[2:0] current_state, next_state;
        parameter   IDLE_s =    3'b000,
                    Load_s =    3'b001,
                    Count_s=    3'b010,
                    Shift_s =   3'b011,
                    Wait_s =    3'b100,
                    Count_s_2=  3'b101;
                    
        always@(posedge clk or negedge rst)begin: INIT
            if(!rst)begin
                current_state <= IDLE_s;
            end else begin
                current_state <= next_state;
            end
        end        
        always@(current_state or Sent or NextBit or Count10) begin: STATE
            case(current_state) 
                IDLE_s :begin
                            if(Sent)begin
                                next_state <= Count_s_2;
                            end else begin
                                next_state <= IDLE_s;
                            end
                         end
                Count_s_2:begin
                            if(NextBit)begin
                                next_state <= Load_s;
                            end else begin
                                next_state <= Count_s_2;
                            end
                        end        
                Load_s :begin
                                next_state <= Count_s;
                        end
                Count_s:begin
                            if(NextBit)begin
                                next_state <= Shift_s;
                            end else begin
                                next_state <= Count_s;
                            end
                        end
                Shift_s:begin
                            if(Count10)begin
                                next_state <= Wait_s;
                            end else begin
                                next_state <= Count_s;
                            end
                        end
                Wait_s :begin
                            if(Sent)begin
                                next_state <= Wait_s;
                            end else begin
                                next_state <= IDLE_s;
                            end
                        end
            endcase
        end
        always@(current_state)begin : OUTPUT
            case(current_state)
                IDLE_s: begin
                            Load        <= 1;
                            Shift       <= 1;
                            Increment   <= 0;
                            ResetCounter<= 0;
                            ResetTimer  <= 0;
                            Busy        <= 0; 
                        end
                Count_s_2:begin
                            Load        <= 0;
                            Shift       <= 0;
                            Increment   <= 0;
                            ResetCounter<= 1;
                            ResetTimer  <= 1;
                            Busy        <= 1; 
                        end        
                Load_s: begin
                            Load        <= 1;
                            Shift       <= 0;
                            Increment   <= 0;
                            ResetCounter<= 1;
                            ResetTimer  <= 1; 
                            Busy        <= 1;
                        end  
                Count_s:begin
                            Load        <= 0;
                            Shift       <= 0;
                            Increment   <= 0;
                            ResetCounter<= 1;
                            ResetTimer  <= 1;
                            Busy        <= 1; 
                        end
                Shift_s:begin
                            Load        <= 0;
                            Shift       <= 1;
                            Increment   <= 1;
                            ResetCounter<= 1;
                            ResetTimer  <= 1;
                            Busy        <= 1; 
                        end
                Wait_s:begin
                            Load        <= 0;
                            Shift       <= 0;
                            Increment   <= 0;
                            ResetCounter<= 0;
                            ResetTimer  <= 0;
                            Busy        <= 0; 
                        end 
            endcase
        end
endmodule
