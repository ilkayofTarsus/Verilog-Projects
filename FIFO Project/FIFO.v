	`timescale 1ns / 1ps
	//////////////////////////////////////////////////////////////////////////////////
	// Company: 
	// Engineer: 
	// 
	// Create Date: 04.09.2023 14:09:31
	// Design Name: 
	// Module Name: FIFO
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


	module FIFO#(parameter width = 8 , depth = 8)(
					input clk,
					input rst,
					input [width-1:0]data_i,
					input rd_en_i,
					input wr_en_i,
					output reg full,
					output reg empty,
					output reg [width-1:0] data_o
		 );
						
						wire out_clk,rd_en,wr_en;
						 divider_for_debouncer db_hz(
											 .clk(clk),
											 .rst_n(rst),
											 .out_clk(out_clk)
						 );
						 debouncer deb(
									.clk(clk),
									.clk_from_divider(out_clk),
									.rst_n(rst),
									.button(rd_en_i),
									.out_state(rd_en)
						 );   
						 debouncer deb2(
									.clk(clk),
									.clk_from_divider(out_clk),
									.rst_n(rst),
									.button(wr_en_i),
									.out_state(wr_en)
						 );   
						 
						 wire rd_en_o,wr_en_o;
						 button rd_button(
                             .clk(clk),
                             .rst(rst),
                             .button_wave(rd_en),
                             .button_out(rd_en_o)
						 );
						 button wr_button(
                             .clk(clk),
                             .rst(rst),
                             .button_wave(wr_en),
                             .button_out(wr_en_o)
						 );
						 integer i;
						 reg [2:0] read ,write ;
						 reg [2:0] number_of_elements;
						 reg [width-1:0] local [depth-1:0];
						 always@(posedge clk or negedge rst)begin
							  if(!rst)begin
									read <= 0;
									write <=0;
									data_o <= 0;
									full <= 0;
									empty <= 1;
									number_of_elements <= 0;
									for(i = 0 ; i < 8 ; i = i +1)begin 
										 local[i] <= 0;
									end
							  end else begin
                                    if(number_of_elements == 0)begin 
                                       empty <= 1;
                                       full <= 0;
                                    end
                                    else if(number_of_elements == 7)begin
                                       full <= 1;
                                       empty <= 0;
                                   end
                                   else begin
                                       full <= 0;
                                       empty <= 0;
                                   end
									if(rd_en_o && !full)begin
											  local[read] <= data_i;
											  number_of_elements <= number_of_elements + 1;
											  read <= read +1;
									end else if(wr_en_o && !empty)begin
                                             data_o <= local[write];
                                             number_of_elements <= number_of_elements - 1;
                                             write <= write +1;
									end
							  end
						 end
	endmodule
