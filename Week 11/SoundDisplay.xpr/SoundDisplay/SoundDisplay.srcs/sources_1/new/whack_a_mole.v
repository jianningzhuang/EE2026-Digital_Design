`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 16:43:40
// Design Name: 
// Module Name: whack_a_mole
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

module whack_a_mole(
    input clk,
    input clk_50hz,
    input start,
    input [4:0] randNum,
    input [2:0] left_sw,
    input [2:0] right_sw,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] oled_data,
    output reg return,
    output reg [1:0] winner
    );
    
    reg [31:0] counter = 0;
    reg game_over = 0;
    reg [3:0] player1 = 0;
    reg [3:0] player2 = 0;
    reg [2:0] mole = 0;
    reg whacked = 0;
    
    always @ (posedge clk_50hz)
    begin
        if (start == 1)
            begin
                counter <= 0;
                game_over <= 0;
                winner <= 0;
                return <= 0;
                player1 <= 0;
                player2 <= 0;
                mole <= 0;
                whacked <= 0;
            end
        else if (~game_over)
            begin
                if (counter%100 == 0 && counter != 0)
                    begin
                        mole <= randNum%8;
                        whacked <= 0;                       
                    end
                if (mole == 0 && whacked == 0)
                    begin
                        if (left_sw[2] || left_sw[1] || left_sw[0])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] || right_sw[1] || right_sw[0])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                    end
                if (mole == 1 && whacked == 0)
                    begin
                        if (left_sw[2] == 1 && left_sw[1] == 0 && left_sw[0] == 0)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 1 && right_sw[1] == 0 && right_sw[0] == 0)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (left_sw[1] || left_sw[0])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[1] || right_sw[0])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        
                    end
                if (mole == 2 && whacked == 0)
                    begin
                        if (left_sw[2] == 0 && left_sw[1] == 1 && left_sw[0] == 0)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 0 && right_sw[1] == 1 && right_sw[0] == 0)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (left_sw[2] || left_sw[0])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] || right_sw[0])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        
                    end
                if (mole == 3 && whacked == 0)
                    begin
                        if (left_sw[2] == 0 && left_sw[1] == 0 && left_sw[0] == 1)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 0 && right_sw[1] == 0 && right_sw[0] == 1)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (left_sw[1] || left_sw[2])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[1] || right_sw[2])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        
                    end
                if (mole == 4 && whacked == 0)
                    begin
                        if (left_sw[2] == 1 && left_sw[1] == 1 && left_sw[0] == 0)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 1 && right_sw[1] == 1 && right_sw[0] == 0)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (left_sw[0])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[0])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        
                    end
                if (mole == 5 && whacked == 0)
                    begin
                        if (left_sw[2] == 1 && left_sw[1] == 0 && left_sw[0] == 1)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 1 && right_sw[1] == 0 && right_sw[0] == 1)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (left_sw[1])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[1])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        
                    end
                if (mole == 6 && whacked == 0)
                    begin
                        if (left_sw[2] == 0 && left_sw[1] == 1 && left_sw[0] == 1)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 0 && right_sw[1] == 1 && right_sw[0] == 1)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (left_sw[2])
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2])
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        
                    end
                if (mole == 7 && whacked == 0)
                    begin
                        if (left_sw[2] == 1 && left_sw[1] == 1 && left_sw[0] == 1)
                            begin
                                player1 <= player1 + 1;
                                whacked <= 1;
                            end
                        if (right_sw[2] == 1 && right_sw[1] == 1 && right_sw[0] == 1)
                            begin
                                player2 <= player2 + 1;
                                whacked <= 1;
                            end                       
                    end
                counter <= counter + 1;
                if (player1 == 5)
                    begin
                        game_over <= 1;
                        winner <= 1;
                        counter <= 0;
                    end
                else if (player2 == 5)
                    begin
                        game_over <= 1;
                        winner <= 2;
                        counter <= 0;
                    end               
            end
        else if (game_over)
            begin
                if (counter == 100)
                    return <= 1;
                else
                    begin
                        return <= 0;
                        counter <= counter + 1;
                    end
            end
    end
    
    wire left_up;
    wire left_down;
    wire centre_up;
    wire centre_down;
    wire right_up;
    wire right_down;
    
    assign left_up = ((x <= 22 && x >= 10) && (y <= 40 && y >= 32)) || ((x <= 24 && x >= 8) && (y <= 42 && y >= 40));
    assign left_down = ((x <= 22 && x >= 10) && (y <= 40 && y >= 38)) || ((x <= 24 && x >= 8) && (y <= 42 && y >= 40));
    assign centre_up = ((x <= 54 && x >= 42) && (y <= 40 && y >= 32)) || ((x <= 56 && x >= 40) && (y <= 42 && y >= 40));
    assign centre_down = ((x <= 54 && x >= 42) && (y <= 40 && y >= 38)) || ((x <= 56 && x >= 40) && (y <= 42 && y >= 40));
    assign right_up = ((x <= 86 && x >= 74) && (y <= 40 && y >= 32)) || ((x <= 88 && x >= 72) && (y <= 42 && y >= 40));
    assign right_down = ((x <= 86 && x >= 74) && (y <= 40 && y >= 38)) || ((x <= 88 && x >= 72) && (y <= 42 && y >= 40));
    
    always @ (posedge clk)
    begin
        if (~game_over)
            begin
                if (whacked == 1)
                    begin
                        oled_data <= (left_down || centre_down || right_down) ? `YELLOW : `GREEN;
                    end
                else
                    begin
                        if (mole == 0)
                            oled_data <= (left_down || centre_down || right_down) ? `YELLOW : `GREEN;
                        else if (mole == 1)
                            oled_data <= (left_up || centre_down || right_down) ? `YELLOW : `GREEN;
                        else if (mole == 2)
                            oled_data <= (left_down || centre_up || right_down) ? `YELLOW : `GREEN;
                        else if (mole == 3)
                            oled_data <= (left_down || centre_down || right_up) ? `YELLOW : `GREEN;
                        else if (mole == 4)
                            oled_data <= (left_up || centre_up || right_down) ? `YELLOW : `GREEN;
                        else if (mole == 5)
                            oled_data <= (left_up || centre_down || right_up) ? `YELLOW : `GREEN;
                        else if (mole == 6)
                            oled_data <= (left_down || centre_up || right_up) ? `YELLOW : `GREEN;
                        else if (mole == 7)
                            oled_data <= (left_up || centre_up || right_up) ? `YELLOW : `GREEN;
                                                  
                    end
            end
        else
            begin
                if (winner == 1)
                    oled_data <= `BLUE;
                else if (winner == 2)
                    oled_data <= `RED;
            end
    end
    
endmodule
