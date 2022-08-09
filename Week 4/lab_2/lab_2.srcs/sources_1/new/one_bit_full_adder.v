`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 18:00:38
// Design Name: 
// Module Name: one_bit_full_adder
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


module one_bit_full_adder(
    input A,
    input B,
    input CIN,
    output S,
    output COUT
    );
    
    assign S = A ^ B ^ CIN;
    assign COUT = (A & B) | (CIN & (A ^ B));  
endmodule
