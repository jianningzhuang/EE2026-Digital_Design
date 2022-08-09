`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 19:52:07
// Design Name: 
// Module Name: switch_to_LED_simulation
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


module switch_to_LED_simulation(

    );
    reg SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9;
    wire LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7, LD8, LD9, AN0, AN1, AN2, AN3, SEG0, SEG1, SEG2, SEG3, SEG4, SEG5, SEG6, DP;
    
    switch_to_LED sim_stl(SW0, SW1, SW2, SW3, SW4, SW5, SW6, SW7, SW8, SW9, AN0, AN1, AN2, AN3,
    LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7, LD8, LD9, SEG0, SEG1, SEG2 ,SEG3, SEG4, SEG5, SEG6, DP);
    initial
    begin
        SW0 = 1; SW1 = 0; SW2 = 0; SW3 = 0; SW4 = 0; SW5 = 0; SW6 = 0; SW7 = 0; SW8 = 0; SW9 = 0;
        #30 SW0 = 0; SW1 = 1; SW2 = 0; SW3 = 0; SW4 = 1; SW5 = 1; SW6 = 1; SW7 = 0; SW8 = 0; SW9 = 0;
        #30 SW0 = 1; SW1 = 1; SW2 = 0; SW3 = 0; SW4 = 1; SW5 = 1; SW6 = 1; SW7 = 0; SW8 = 0; SW9 = 0;
    end
endmodule
