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


module Hz_Timer(
                input ResetTimer,
                input SystemClock, 
                output reg NextBit
    );
    
    reg[120:0] counter;
    
        always@(posedge SystemClock or negedge ResetTimer)begin
            if(!ResetTimer)begin
                counter <= 0;
                NextBit <= 0;
            end else begin
                counter <= counter +1;
                NextBit <= 0;
                if(counter == /*2640237*/5281/*166666*/)begin
                    counter <= 0;
                    NextBit <= 1;
                end
            end        
        end
endmodule
