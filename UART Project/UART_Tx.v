`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 13:04:27
// Design Name: 
// Module Name: UART_Tx
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


module UART_Tx(
              input Sent,
              input ParitySelect,
              input [7:0] Din,
              input rst,
              input clk,
              output Busy,
              output Dout
    );
        wire nextbit,ct_10,paritybit,rst_timer,rst_counter;
        /*one_wave ow(
                .clk(clk),
                .rst(rst),
                .button_wave(nextbit),
                .button_out(NextBit_out)
                );
        */
        
        
        Hz_Timer ht(
                    .ResetTimer(rst_timer),
                    .SystemClock(clk), 
                    .NextBit(nextbit)
                );
        Mod10_counter m10c(
                    .SystemClock(clk),
                    .Increment(inc),
                    .ResetCounter(rst_counter),
                    .Count10(ct_10)
                );
        Transmitter_SM tsm(
                      .Sent(Sent)  ,
                      .NextBit(nextbit),
                      .Count10(ct_10),
                      .clk(clk),
                      .rst(rst),
                      .Busy(Busy),
                      .Increment(inc),
                      .ResetCounter(rst_counter),
                      .ResetTimer(rst_timer),
                      .Shift(shift),
                      .Load(load)
                );
        Parity_gen pg(
                    .ParitySelect(ParitySelect),
                    .Din(Din),
                    .ParityBit(paritybit)                    
                );
        Shift_Reg sr(
                     .ParityBit(paritybit),
                     .Din(Din),
                     .clk(clk),
                     .rst(rst),
                     .Load(load),
                     .Shift(shift),
                     .Dout(Dout)
                );   
        
                        
endmodule
