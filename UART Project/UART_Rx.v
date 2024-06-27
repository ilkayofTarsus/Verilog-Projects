`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2023 14:49:43
// Design Name: 
// Module Name: UART_Rx
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


module UART_Rx(
                input Din,
                input clk,
                input rst,
                output reg[7:0] Dout,
                output reg flag
    );
    reg[6:0] counter;
    reg[8:0] local; 
    wire slow_clk;
    hz_for_rx hfr(
                .ResetTimer(rst),
                .SystemClock(clk), 
                .NextBit(slow_clk)
    );
    always@(posedge slow_clk or negedge rst)begin
        if(!rst)begin
            counter <= 0;
            local <= 0;
            //Dout <= 7'b1111111;
            flag <= 0;
        end else begin
            if(flag == 0 & Din == 0)begin
                flag = ~flag;
            end else if(flag == 1)begin      
                local[counter] <= Din;
                counter = counter +1;
                if(counter == 9)begin//8
                    counter <= 0;
                    flag = ~flag;
                    Dout <= local[7:0];
                 end
            end    
        end
    end
endmodule
