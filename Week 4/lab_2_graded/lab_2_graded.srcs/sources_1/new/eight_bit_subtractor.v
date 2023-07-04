`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 21:39:07
// Design Name: 
// Module Name: eight_bit_subtractor
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


module eight_bit_subtractor(
    input [7:0] A,
    input [7:0] B,
    output [7:0] S,
    output V
    );

    
    wire Cin, Ctemp, Cout;
    wire [7:0] comp_B;
    
    assign Cin = 1; // A - B = A + ~B + 1
    assign comp_B = ~B;

    five_bit_adder lsb (A[4:0], comp_B[4:0], Cin, S[4:0], Ctemp);
    three_bit_adder msb (A[7:5], comp_B[7:5], Ctemp, S[7:5], Cout);
    
    assign V = (~S[7] & A[7] & comp_B[7]) | (S[7] & ~A[7] & ~comp_B[7]);
    
endmodule
