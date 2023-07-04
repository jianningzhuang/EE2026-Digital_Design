`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2021 14:49:13
// Design Name: 
// Module Name: my_2_to_1_mux
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


module my_2_to_1_mux(
    input A,
    input B,
    input S,
    output Z
    );
    
    assign Z = S ? B : A;
endmodule
