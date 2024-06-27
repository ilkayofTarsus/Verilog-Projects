`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2023 08:53:31
// Design Name: 
// Module Name: uart_top
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


module uart_top(
                input clk,
                input rst,
                input data_i,
                input wr_en,
                input rd_en,
                output[7:0] data_o,
                output gpio_out,
                output full,
                output empty
    );
    wire busy,empty_o,full_o,flag;
    wire[7:0] din;
    reg sent;
    wire[7:0] data_i_fifo;
    UART_Rx U_rx(
                .Din(data_i),
                .clk(clk),
                .rst(rst),
                .flag(flag),
                .Dout(data_i_fifo)
    );
    
    
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            sent <= 0;
        end else begin
            if(empty_o) sent <= 1;
            else if(full_o)  sent <= 1;
            else if(busy) sent <= 0;
        end
    end
    
    button snt(
                .clk(clk),
                .rst(rst),
                .button_wave(full),
                .button_out(full_o)
    );
    button snt_1(
                .clk(clk),
                .rst(rst),
                .button_wave(empty),
                .button_out(empty_o)
    );
    
    FIFO fifo(
           .clk(clk),
           .rst(rst),
           .data_i(data_i_fifo),
           .rd_en_i(flag),
           .wr_en_i(wr_en),
           .full(full),
           .empty(empty),
           .data_o(data_o),
           .full_empty(din)
    );
    UART_Tx U_tx(
              .Sent(sent),
              .ParitySelect(1'b1),
              .Din(din),
              .rst(rst),
              .clk(clk),
              .Busy(busy),
              .Dout(gpio_out)
    );
endmodule
