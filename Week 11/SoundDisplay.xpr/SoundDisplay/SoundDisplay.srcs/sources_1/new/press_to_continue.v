`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 15:22:51
// Design Name: 
// Module Name: press_to_continue
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
`include "colours.vh"

module press_to_continue(
    input clk,
    input btnL,
    input btnR,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] oled_data
    );
    
    wire player1_not_ready;
    wire player2_not_ready;
    wire player1_ready;
    wire player2_ready;
    wire left_side;
    
    assign player1_not_ready = ((x <= 30 && x >= 18) && (y <= 40 && y >= 32)) || ((x <= 32 && x >= 16) && (y <= 42 && y >= 40));
    assign player1_ready = ((x <= 30 && x >= 18) && (y <= 40 && y >= 38)) || ((x <= 32 && x >= 16) && (y <= 42 && y >= 40));
    assign player2_not_ready = ((x <= 78 && x >= 66) && (y <= 40 && y >= 32)) || ((x <= 80 && x >= 64) && (y <= 42 && y >= 40));
    assign player2_ready = ((x <= 78 && x >= 66) && (y <= 40 && y >= 38)) || ((x <= 80 && x >= 64) && (y <= 42 && y >= 40));
    
    assign left_side = (x <= 48);
    
    always @ (posedge clk)
    begin
        if (btnL == 1 && btnR == 1)
            oled_data <= (left_side) ? ((player1_ready) ? `RED : `BLUE) : ((player2_ready) ? `BLUE : `RED);
        else if (btnL == 1 && btnR == 0)
            oled_data <= (left_side) ? ((player1_ready) ? `RED : `BLUE) : ((player2_not_ready) ? `BLUE : `RED);
        else if (btnL == 0 && btnR == 1)
            oled_data <= (left_side) ? ((player1_not_ready) ? `RED : `BLUE) : ((player2_ready) ? `BLUE : `RED);
        else if (btnL == 0 && btnR == 0)
            oled_data <= (left_side) ? ((player1_not_ready) ? `RED : `BLUE) : ((player2_not_ready) ? `BLUE : `RED);
    end
    
endmodule
