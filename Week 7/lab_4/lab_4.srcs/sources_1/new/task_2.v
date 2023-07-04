`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2021 21:27:58
// Design Name: 
// Module Name: task_2
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


module task_2(
    input CLOCK,
    input pushbutton,
    output single_pulse
    );
    
    wire Q1;
    wire Q2;
    wire clk_3Hz;
    
    clk_3hz slow (CLOCK, clk_3Hz);    
    my_dff DFF1 (clk_3Hz, pushbutton, Q1);
    my_dff DFF2 (clk_3Hz, Q1, Q2);
    
    assign single_pulse = Q1 & ~Q2;
endmodule
