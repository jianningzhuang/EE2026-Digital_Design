`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2021 18:40:27
// Design Name: 
// Module Name: test_four_bit_adder
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


module test_four_bit_adder(

    );
    
    reg [3:0] A;
    reg [3:0] B;
    reg C0;
    
    wire [3:0] S;
    wire C4;
    
    alt_four_bit test_alt (A, B, C0, S, C4);
    
    initial 
    begin
        A = 4'b0011; B = 4'b0011; C0 = 1'b0; #100;
        A = 4'b1011; B = 4'b0111; C0 = 1'b0; #100;
        A = 4'b1111; B = 4'b1111; C0 = 1'b0; #100;
    end
endmodule
