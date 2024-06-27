`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 11:09:12
// Design Name: 
// Module Name: full_adder
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


module full_adder(
                input A,
                input B,
                input C0,
                output C1,
                output Sum
    );
    wire[4:0] kablo;
    //xor #40 xo1(Sum,A,B,C0);
    assign #20 kablo[0] = A^C0;
    assign #20 kablo[3]= B^kablo[0];
    assign #15 kablo[1] = kablo[0]&C0;
    assign #15 kablo[2] = A&B;
    assign #15 C1 = kablo[2] | kablo[1] ;
    assign Sum = kablo[3]; 
    /*
    assign #15 kablo[0] = ~A&B;
    assign #15 kablo[1] = kablo[0]&C0; 
    assign #15 kablo[3] = B | C0;
    assign #15 kablo[4] = A&kablo[3];
    assign #15 kablo[2] = kablo[1] | kablo[4];
    assign #15 C1 = kablo[2];*/
    
endmodule
