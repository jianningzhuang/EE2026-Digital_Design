`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 19:30:24
// Design Name: 
// Module Name: five_bit_adder
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


module five_bit_adder(
    input [4:0] A,
    input [4:0] B,
    input C0,
    output [4:0] S,
    output C5
    );
    
    wire C1, C2, C3, C4;
    
    one_bit_full_adder fa0 (A[0], B[0], C0, S[0], C1);
    one_bit_full_adder fa1 (A[1], B[1], C1, S[1], C2);
    one_bit_full_adder fa2 (A[2], B[2], C2, S[2], C3);
    one_bit_full_adder fa3 (A[3], B[3], C3, S[3], C4);
    one_bit_full_adder fa4 (A[4], B[4], C4, S[4], C5);
    
endmodule
