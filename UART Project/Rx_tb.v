`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.09.2023 13:07:14
// Design Name: 
// Module Name: Rx_tb
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


module Rx_tb(

    );
    
    
    reg din , clk , rst;
    wire[6:0] dout;
    UART_Rx ux(
                .Din(din),
                .clk(clk),
                .rst(rst),
                .Dout(dout)
    );
    initial begin
        din = 0; clk = 0; rst = 0;
        #10 rst=1;
    end
    always begin
        #10 clk = ~clk;
    end
    
endmodule
