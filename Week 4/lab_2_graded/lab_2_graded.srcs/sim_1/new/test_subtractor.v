`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2021 15:38:27
// Design Name: 
// Module Name: test_subtractor
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


module test_subtractor(

    );
    
    reg [7:0] A, B;
    wire [7:0] S;
    wire V;
    
    eight_bit_subtractor t1 (A, B, S, V);
    
    initial
    begin
        //A = 8'b00100000; B = 8'b00100000; #100;  //A = B no overflow
        A = 8'b01000000; B = 8'b00001000; #100;  //64 - 8 = 56 MSB opp sign no overflow
        //A = 8'b01000000; B = 8'b10100000; #100;  //64 - (-96) = 160 MSB both pos overflow
        A = 8'b00000000; B = 8'b10000000; #100;  // 0 - (-128) = 128 overflow
        A = 8'b01000000; B = 8'b11100000; #100;  //64 - (-32) = 96 MSB both pos no overflow
        A = 8'b11000000; B = 8'b01100000; #100;  //-64 - 96 = -160 MSB both neg overflow
        //A = 8'b10000000; B = 8'b00000001; #100;  // -128 - 1 = -129 overflow
        A = 8'b11000000; B = 8'b00100000; #100;  //-64 - 32 = -96 MSB both neg no overflow
        
    end
endmodule
