`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 15:20:59
// Design Name: 
// Module Name: my_control_module
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


module my_control_module(
    input A,
    input B,
    output LED1,
    output LED2,
    output LED3
    );
    
    assign LED1 = (A & B) | (A & ~B);
    assign LED2 = (A & B) | (~A & B);
    assign LED3 = (A & B);
endmodule
