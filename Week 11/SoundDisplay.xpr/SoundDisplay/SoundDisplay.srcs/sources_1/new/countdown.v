`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 13:20:59
// Design Name: 
// Module Name: countdown
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

module countdown(
    input clk,
    input clk_50hz,
    input start,
    input [4:0] randNum,
    input left_press,
    input right_press,
    input [6:0] x,
    input [5:0] y,
    output reg [15:0] oled_data,
    output reg return,
    output reg [1:0] winner
    );
    
    reg [31:0] counter = 0;
    reg [31:0] target = 0;
    reg game_over = 0;
    reg [31:0] player1 = 0;
    reg [31:0] player2 = 0;
    reg p1_pressed = 0;
    reg p2_pressed = 0;
    reg [2:0] count_four = 0;
    
    always @ (posedge clk_50hz)
    begin
        if (start == 1)
            begin
                counter <= 0;
                target <= (randNum * 50);
                game_over <= 0;
                player1 <= 0;
                player2 <= 0;
                p1_pressed <= 0;
                p2_pressed <= 0;
                winner <= 0;
                return <= 0;
                count_four <= 0;
            end
        else if (~game_over)
            begin
                if (counter == 50)
                    count_four <= 1;
                if (counter == 100)
                    count_four <= 2;
                if (counter == 150)
                    count_four <= 3;
                if (counter == 200)
                    count_four <= 4;
                if (left_press == 1 && p1_pressed == 0)
                    begin
                        player1 <= counter;
                        p1_pressed <= 1;
                    end
                if (right_press == 1 && p2_pressed == 0)
                    begin
                        player2 <= counter;
                        p2_pressed <= 1;
                    end
                if (counter == (target + 150))
                    begin
                        game_over <= 1;
                        if (player1 >= target && player2 >= target)
                            begin
                                if (player1 > player2)
                                    winner <= 2;
                                else if (player1 < player2)
                                    winner <= 1;
                                else if (player1 == player2)
                                    winner <= 3;
                            end
                        else if (player1 < target && player2 < target)
                            begin
                                if (player1 > player2)
                                    winner <= 1;
                                else if (player1 < player2)
                                    winner <= 2;
                                else if (player1 == player2)
                                    winner <= 3;
                            end
                        else if (player1 >= target && player2 < target)
                            begin
                                if ((player1 - target) > (target - player2))
                                    winner <= 2;
                                else if ((player1 - target) < (target - player2))
                                    winner <= 1;
                                else if ((player1 - target) == (target - player2))
                                    winner <= 3;
                            end
                        else if (player1 < target && player2 >= target)
                            begin
                                if ((player2 - target) > (target - player1))
                                    winner <= 1;
                                else if ((player2 - target) < (target - player1))
                                    winner <= 2;
                                else if ((player2 - target) == (target - player1))
                                    winner <= 3;
                            end
                    end
                else 
                    begin
                        counter <= counter + 1;
                    end
                
            end
        else if (game_over)
            begin
                if (counter == (target + 250))
                    return <= 1;
                else
                    begin
                        return <= 0;
                        counter <= counter + 1;
                    end
            end
            
    end
    
    wire left_side;
    wire one;
    wire two;
    wire three;
    wire four;
    wire five;
    wire six;
    wire seven;
    wire eight;
    wire nine;
    wire question1;
    wire question2;
    
    assign left_side = (x <= 48);
    assign one = (x <= 46 && x >= 45) && (y <= 25 && y >= 10);
    assign two = ((x <= 50 && x >= 49) && (y <= 25 && y >= 18)) || ((x <= 57 && x >= 56) && (y <= 17 && y >= 10)) 
                || ((x <= 57 && x >= 49) && (y == 10 || y == 11 || y == 17 || y == 18 || y == 24 || y ==25));
    assign three = ((x <= 57 && x >= 56) && (y <= 25 && y >= 10)) || ((x <= 57 && x >= 49) && (y == 10 || y == 11 || y == 17 || y == 18 || y == 24 || y ==25));
    assign four = ((x <= 50 && x >= 49) && (y <= 17 && y >= 10)) || ((x <= 57 && x >= 56) && (y <= 25 && y >= 10)) 
                || ((x <= 57 && x >= 49) && (y == 17 || y == 18));
    assign five = ((x <= 50 && x >= 49) && (y <= 17 && y >= 10)) || ((x <= 57 && x >= 56) && (y <= 25 && y >= 18)) 
                || ((x <= 57 && x >= 49) && (y == 10 || y == 11 || y == 17 || y == 18 || y == 24 || y ==25));
    assign six = ((x <= 50 && x >= 49) && (y <= 25 && y >= 10)) || ((x <= 57 && x >= 56) && (y <= 25 && y >= 18)) 
                || ((x <= 57 && x >= 49) && (y == 10 || y == 11 || y == 17 || y == 18 || y == 24 || y ==25));
    assign seven = ((x <= 57 && x >= 56) && (y <= 25 && y >= 10)) || ((x <= 57 && x >= 49) && (y == 10 || y == 11));
    assign eight = ((x <= 50 && x >= 49) && (y <= 25 && y >= 10)) || ((x <= 57 && x >= 56) && (y <= 25 && y >= 10)) 
                || ((x <= 57 && x >= 49) && (y == 10 || y == 11 || y == 17 || y == 18 || y == 24 || y ==25));
    assign nine = ((x <= 50 && x >= 49) && (y <= 17 && y >= 10)) || ((x <= 57 && x >= 56) && (y <= 25 && y >= 10)) 
                || ((x <= 57 && x >= 49) && (y == 10 || y == 11 || y == 17 || y == 18 || y == 24 || y ==25));
    
    assign question1 = ((x <= 46 && x >= 38) && (y == 10 || y == 11)) || ((x <= 46 && x >= 42) && (y == 17 || y == 18)) 
                || ((x <= 46 && x >= 45) && (y <= 17 && y >= 10)) || ((x <= 42 && x >= 41) && (y <= 25 && y >= 18)) || ((x <= 42 && x >= 41) && (y == 27 || y == 28));
    assign question2 = ((x <= 57 && x >= 49) && (y == 10 || y == 11)) || ((x <= 57 && x >= 53) && (y == 17 || y == 18)) 
                || ((x <= 57 && x >= 56) && (y <= 17 && y >= 10)) || ((x <= 53 && x >= 52) && (y <= 25 && y >= 18)) || ((x <= 53 && x >= 52) && (y == 27 || y == 28));
                
                
    always @ (posedge clk)
    begin
        if (~game_over)
            begin
                if (count_four == 0)
                    begin
                        if (randNum == 19)
                            oled_data <= (one || nine) ? `RED : `BLUE;
                        else if (randNum == 18)
                            oled_data <= (one || eight) ? `RED : `BLUE;
                        else if (randNum == 17)
                            oled_data <= (one || seven) ? `RED : `BLUE;
                        else if (randNum == 16)
                            oled_data <= (one || six) ? `RED : `BLUE;
                        else if (randNum == 15)
                            oled_data <= (one || five) ? `RED : `BLUE;
                    end
                else if (count_four == 1)
                    begin
                        if (randNum == 19)
                            oled_data <= (one || eight) ? `BLUE : `RED;
                        else if (randNum == 18)
                            oled_data <= (one || seven) ? `BLUE : `RED;
                        else if (randNum == 17)
                            oled_data <= (one || six) ? `BLUE : `RED;
                        else if (randNum == 16)
                            oled_data <= (one || five) ? `BLUE : `RED;
                        else if (randNum == 15)
                            oled_data <= (one || four) ? `BLUE : `RED;
                    end
                else if (count_four == 2)
                    begin
                        if (randNum == 19)
                            oled_data <= (one || seven) ? `RED : `BLUE;
                        else if (randNum == 18)
                            oled_data <= (one || six) ? `RED : `BLUE;
                        else if (randNum == 17)
                            oled_data <= (one || five) ? `RED : `BLUE;
                        else if (randNum == 16)
                            oled_data <= (one || four) ? `RED : `BLUE;
                        else if (randNum == 15)
                            oled_data <= (one || three) ? `RED : `BLUE;
                    end
                else if (count_four == 3)
                    begin
                        if (randNum == 19)
                            oled_data <= (one || six) ? `BLUE : `RED;
                        else if (randNum == 18)
                            oled_data <= (one || five) ? `BLUE : `RED;
                        else if (randNum == 17)
                            oled_data <= (one || four) ? `BLUE : `RED;
                        else if (randNum == 16)
                            oled_data <= (one || three) ? `BLUE : `RED;
                        else if (randNum == 15)
                            oled_data <= (one || two) ? `BLUE : `RED;
                    end
                else
                    begin
                        oled_data <= (left_side) ? ((question1) ? `WHITE : `BLUE) : ((question2) ? `WHITE : `RED);
                    end
            end
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
