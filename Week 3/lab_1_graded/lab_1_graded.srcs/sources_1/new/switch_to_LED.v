`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 19:45:14
// Design Name: 
// Module Name: switch_to_LED
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


module switch_to_LED(
    input SW0,
    input SW1,
    input SW2,
    input SW3,
    input SW4,
    input SW5,
    input SW6,
    input SW7,
    input SW8,
    input SW9,
    output AN0,
    output AN1,
    output AN2,
    output AN3,
    output LD0,
    output LD1,
    output LD2,
    output LD3,
    output LD4,
    output LD5,
    output LD6,
    output LD7,
    output LD8,
    output LD9,
    output SEG0,
    output SEG1,
    output SEG2,
    output SEG3,
    output SEG4,
    output SEG5,
    output SEG6,
    output DP  
    );
    
    assign LD0 = SW0;
    assign LD1 = SW1;
    assign LD2 = SW2;
    assign LD3 = SW3;
    assign LD4 = SW4;
    assign LD5 = SW5;
    assign LD6 = SW6;
    assign LD7 = SW7;
    assign LD8 = SW8;
    assign LD9 = SW9;
    assign SEG0 = ~SW1 | ~SW4 | ~SW5 | ~SW6 | SW0 | SW2 | SW3 | SW7 | SW8 | SW9;
    assign SEG2 = ~SW1 | ~SW4 | ~SW5 | ~SW6 | SW0 | SW2 | SW3 | SW7 | SW8 | SW9;
    assign SEG4 = ~SW1 | ~SW4 | ~SW5 | ~SW6 | SW0 | SW2 | SW3 | SW7 | SW8 | SW9;
    assign SEG1 = 1;
    assign SEG3 = 1;
    assign SEG5 = 1;
    assign SEG6 = 1;
    assign DP = 1;
    assign AN0 = 1;
    assign AN1 = 0;
    assign AN2 = 0;
    assign AN3 = 0;

endmodule
