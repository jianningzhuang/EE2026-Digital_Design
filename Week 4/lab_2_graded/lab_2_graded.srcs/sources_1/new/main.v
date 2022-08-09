`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2021 22:15:20
// Design Name: 
// Module Name: main
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


module main(
    input [7:0] A,
    input [7:0] B,
    output [7:0] S,
    output V,
    output [6:0] SEG,
    output DP,
    output [3:0] AN
    );
    
    seven_segment display (SEG, DP, AN);
    eight_bit_subtractor subtractor (A, B, S, V);
endmodule
