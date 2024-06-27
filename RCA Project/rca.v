`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2023 11:07:28
// Design Name: 
// Module Name: rca
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


module rca(
           input  [31:0] A_i,
           input  [31:0] B_i,
           input         C_i,
           input         Sel_i,
           output [31:0] Sum_o,
           output        C_o,
           output        Overflow_o
    );
    
    genvar i;
    wire[31:0] kablo,B_XOR;
    //twos_complement tc(B_i,Sel_i,B_XOR);
    reg of;
    
      //      full_adder fa(A_i[0],B_XOR[0],Sel_i,kablo[0],Sum_o[0]);
            full_adder fa(A_i[0],B_i[0]^Sel_i,Sel_i^C_i,kablo[0],Sum_o[0]);
            generate
                for(i = 1; i < 32; i = i+1)begin: forloop
                    full_adder fa2(A_i[i],B_i[i]^Sel_i,kablo[i-1],kablo[i],Sum_o[i]);
                end
            endgenerate    
    always @* begin
         if((A_i[31] == 0 & B_i[31] == 0 & Sum_o[31] == 1) | (A_i[31] == 1 & B_i[31] == 1 & Sum_o[31] == 0))
            of = 1;
         else 
         of=0;
    end

    assign Overflow_o = of;

endmodule
