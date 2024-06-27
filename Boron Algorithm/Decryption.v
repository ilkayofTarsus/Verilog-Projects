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


module Decryption(
                    input [79:0]key,
                    input clk,
                    input rst,
                    input done,
                    input [63:0]cipher_text,
                    output reg[63:0]plain_text
        );
            
            genvar i;
            reg[63:0] data_t,data_td;
            wire[63:0] data_t1,data_t1d;
            reg[79:0] key_t,key_td,essek;
            wire[79:0] key_t1,key_t1d;
            reg[8:0] sayac, sayac2;

                    round_decryption r(
                        .data_i(data_td),
                        .key(key_td),
                        .data_o(data_t1d)
                    );
                    
                    key_decryption kgd(//devam
                        .current_key(key_td),
                        .current_round(50-sayac),
                        .clk(clk),
                        .rst(rst),
                        .new_key(key_t1d)
                    );  
                    key_generator kg(
                        .current_key(key_t),
                        .current_round(sayac),
                        .clk(clk),
                        .rst(rst),
                        .new_key(key_t1)
                     );
                    
                    Add_Round_Key a(.data_i(cipher_text),.current_key(key_t),.data_o(data_t1));
                always@(posedge clk or negedge rst)begin
                    if(!rst)begin
                        data_t <= cipher_text;
                        sayac <= 0;
                        sayac2 <= 0;
                        key_t <= key;
                        key_td <= 0;
                        essek <= 0;
                    end else begin
                        if(done)begin
                            if(sayac == 0) $display("\n\n----- Decryption -----\n");   
                            if(sayac < 25)begin
                                $display("----- round key %d-----\n",sayac);
                                $display("%d . key => %h\n",sayac,key_t);
                                sayac <= sayac+1; 
                                data_t <= data_t1;
                                key_t <= key_t1;
                                if(sayac == 24) essek <= key_t;    
                             end else if(sayac == 25) begin
                                  sayac <= sayac+1;
                                  sayac2 <= sayac2+1;
                                  $display("key 25 => %h\n",key_t);
                                  $display("data_t1=> %h\n",data_t1);
                                  data_td <= data_t1;
                                  key_td <= essek;  
                             end else if((sayac > 25) & (sayac < 51  )) begin
                                    sayac <= sayac+1;
                                    $display("----- round_d %d-----\n",sayac);
                                    $display("%d. key => %h\n",51-sayac,key_td);
                                    $display("plain_text_dec=> %h\n",data_td);
                                    data_td <= data_t1d;
                                    key_td <= key_t1d;
                                    
                             end  else if((sayac == 51  )) begin
                                    sayac <= sayac+1;
                                     plain_text <= data_td;
                             end
                             /*else if(sayac == 49 ) begin
                                    $display("----- round_d %d-----\n",sayac);
                                    $display("%d. key => %h\n",51-sayac,key_td);
                                    $display("plain_text_dec=> %h\n",data_td);
                                    $display("%d. key_td1 => %h\n",51-sayac,key_t1d);
                                    data_td <= data_t1d;
                                    key_td <= key_t1d;
                             end*/
                        end 
                    end
                end
endmodule
