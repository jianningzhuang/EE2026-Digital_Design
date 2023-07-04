`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 15:49:43
// Design Name: 
// Module Name: tug_of_war
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

module tug_of_war(
    input clk,
    input clk_50hz,
    input start,
    input left_press,
    input right_press,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] oled_data,
    output reg return,
    output reg [1:0] winner
    );
    
    reg [6:0] shift = 48;
    reg [31:0] counter = 0;
    reg game_over = 0;
    
    wire left_side;
    wire ropeX;
    wire ropeY;
    
    assign left_side = (x <= 48);
    assign ropeX = (x <= (23 + shift) && x >= (shift - 23));
    assign ropeY = (y <= 33 && y >= 31);
    
    always @ (posedge clk_50hz)
    begin
        if (start == 1)
            begin
                shift <= 48;
                counter <= 0;
                winner <= 0;
                return <= 0;
                game_over <= 0;
            end
        else if (~game_over)
            begin
                if (left_press == 1)
                    shift <= (shift == 24) ? shift : shift - 1;
                if (right_press == 1)
                    shift <= (shift == 72) ? shift : shift + 1;
                if (counter == 750)
                    begin
                        game_over <= 1;
                        if (shift <= 49 && shift >= 47)
                            winner <= 3;
                        else if (shift <= 46)
                            winner <= 1;
                        else if (shift >= 50)
                            winner <= 2;
                    end
                else
                    begin
                        counter <= counter + 1;
                    end
            end
        else if (game_over)
            begin
                if (counter == 850)
                    return <= 1;
                else if (counter == 851)
                    winner <= 0;
                else
                    begin
                        return <= 0;
                        counter <= counter + 1;
                    end
            end
    end
    
    always @ (posedge clk)
    begin
        if (~game_over)
            oled_data <= (left_side) ? ((ropeX && ropeY) ? `WHITE : `BLUE) : ((ropeX && ropeY) ? `WHITE : `RED);
        else
            begin
                if (winner == 1)
                    oled_data <= `BLUE;
                else if (winner == 2)
                    oled_data <= `RED;
                else if (winner == 3)
                    oled_data <= (left_side) ? `BLUE : `RED;
            end
    end
    
    
    
    
    
    
    
    
    
    
endmodule
