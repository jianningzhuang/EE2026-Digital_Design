`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 21:53:13
// Design Name: 
// Module Name: two_complement
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


module two_complement(
    input [7:0] B,
    output [7:0] neg_B
    );
    
    wire [7:0] comp_B;
    wire [7:0] plus_one;
    wire C0, C1, C4;
    
    assign C0 = 0;
    assign comp_B = ~B;
    assign plus_one = 8'b00000001;
    
    five_bit_adder lsb (comp_B[4:0], plus_one[4:0], C0, neg_B[4:0], C1);
    three_bit_adder msb (comp_B[7:5], plus_one[7:5], C1, neg_B[7:5], C4);
    
endmodule
