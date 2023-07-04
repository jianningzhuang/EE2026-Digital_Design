`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2021 15:02:38
// Design Name: 
// Module Name: test_two_complement
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


module test_two_complement(

    );
    
    reg [7:0] B;
    
    wire [7:0] comp_B;
    
    two_complement test1 (B, comp_B);
    
    initial
    begin
        B = 8'b00000000; #100;
        B = 8'b10000000; #100;
        B = 8'b11111111; #100;
    end
endmodule
