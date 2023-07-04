`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2021 14:34:01
// Design Name: 
// Module Name: alt_four_bit
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


module alt_four_bit(
    input [3:0] A,
    input [3:0] B,
    input C0,
    output [3:0] S,
    output C4
    );
    
    wire C1;
    
    two_bit_adder fa0 (A[1:0], B[1:0], C0, S[1:0], C1);
    two_bit_adder fa1 (A[3:2], B[3:2], C1, S[3:2], C4);
    
    
endmodule
