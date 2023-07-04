`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 18:22:35
// Design Name: 
// Module Name: two_bit_adder
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


module two_bit_adder(
    input [1:0] A,
    input [1:0] B,
    input C0,
    output [1:0] S,
    output C2
    );
    
    wire C1;
    
    one_bit_full_adder fa0 (A[0], B[0], C0, S[0], C1);
    one_bit_full_adder fa1 (A[1], B[1], C1, S[1], C2);
endmodule
