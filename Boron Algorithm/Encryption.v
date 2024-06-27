`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.09.2023 16:00:45
// Design Name: 
// Module Name: Encryption
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


module Encryption(
                    input [63:0]plain_text,
                    input [79:0]key,
                    input clk,
                    input rst,
                    output reg[63:0]cipher_text,
                    output reg done
        );
            
            genvar i;
            reg[63:0] data_t,data_t_c;
            wire[63:0] data_t1,cipher_text_t;
            reg[79:0] key_t,key_t_c;
            wire[79:0] key_t1;
            reg[4:0] sayac;

                    round r(
                        .data_i(data_t),
                        .key(key_t),
                        .data_o(data_t1)
                    );
                    
                    key_generator kg(
                        .current_key(key_t),
                        .current_round(sayac),
                        .clk(clk),
                        .rst(rst),
                        .new_key(key_t1)
                    );  
                    Add_Round_Key a(.data_i(data_t_c),.current_key(key_t_c),.data_o(cipher_text_t));
                always@(posedge clk or negedge rst)begin
                    if(!rst)begin
                        //cipher_text <= 0;
                        done <= 0;
                        data_t <= plain_text;
                        key_t <= key;
                        sayac <= 0;
                        data_t_c <= 0;
                        key_t_c <= 0;
                    end else begin
                        if(!sayac < 24)begin    
                            $display("----- round %d-----\n",sayac);
                            $display("Plain_text => %h\n",data_t);
                            $display("Master key => %h\n",key_t);
                            sayac <= sayac+1; 
                            data_t <= data_t1;
                            key_t <= key_t1;
                        end 
                         if(sayac == 24)begin
                            sayac <= sayac+1;
                        end
                         if(sayac == 25)begin
                            sayac <= sayac+1;
                            key_t_c <= key_t;
                            data_t_c <= data_t;
                        end
                        if(sayac == 26)begin
                             $display("------------------------------\n");
                             $display("Cipher Text=> %h\n",cipher_text);
                             $display("key_t=> %h\n",key_t);
                             $display("data_t=> %h\n",data_t);
                             sayac <= sayac+1;
                             done <= 1;
                             cipher_text <= cipher_text_t; 
                        end   
                    end
                end
endmodule
