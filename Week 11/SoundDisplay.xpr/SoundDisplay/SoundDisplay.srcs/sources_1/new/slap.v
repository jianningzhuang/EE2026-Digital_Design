`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 18:29:31
// Design Name: 
// Module Name: slap
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


module slap(
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
    reg [31:0] counter1 = 0;
    reg [31:0] counter2 = 0;
    reg game_over = 0;
    reg [3:0] player1 = 0;
    reg [3:0] player2 = 0;
    reg [1:0] chances = 0;
    reg attacker = 0;
    reg left_attack = 0;
    reg right_attack = 0;
    reg left_dodge = 0;
    reg right_dodge = 0;
    
    always @ (posedge clk_50hz)
    begin
        if (start == 1)
            begin
                counter <= 0;
                counter1 <= 0;
                counter2 <= 0;
                game_over <= 0;
                winner <= 0;
                return <= 0;
                player1 <= 0;
                player2 <= 0;
                chances <= 0;
                attacker <= (randNum % 2);
                left_attack <= 0;
                right_attack <= 0;
                left_dodge <= 0;
                right_dodge <= 0;
            end
        else if (~game_over)
            begin
                if (attacker == 0)
                    begin
                        if (left_dodge == 1)
                            begin
                                if (counter == 50)
                                    begin
                                        left_dodge <= 0;
                                        counter <= 0;
                                    end
                                else
                                    counter <= counter + 1;
                            end
                        else
                            begin
                                if (left_press == 1)
                                    begin
                                        left_attack <= 1;
                                        counter1 <= 0;
                                    end
                                if (right_press == 1)
                                    begin
                                        if (left_attack == 0)
                                            begin
                                                chances <= chances + 1;
                                            end
                                        else if (counter1 <= 15)
                                            begin
                                                right_dodge <= 1;
                                                attacker <= 1;
                                                left_attack <= 0;
                                                chances <= 0;
                                                counter1 <= 0;
                                            end
                                        else if (counter1 > 15)
                                            begin
                                                player1 <= player1 + 1;
                                                counter1 <= 0;
                                                left_attack <= 0;
                                                right_dodge <= 0;
                                                chances <= 0;
                                            end
                                    end
        
                                if (left_attack == 1)
                                    begin
                                        counter1 <= counter1 + 1;
                                    end
                                if (counter1 > 15)
                                    begin
                                        player1 <= player1 + 1;
                                        counter1 <= 0;
                                        left_attack <= 0;
                                        right_dodge <= 0;
                                        chances <= 0;
                                    end
                                if (chances == 3)
                                    begin
                                        chances <= 0;
                                        player1 <= player1 + 1;
                                    end
                            end
                    end
                else if (attacker == 1)
                    begin
                        if (right_dodge == 1)
                            begin
                                if (counter == 50)
                                    begin
                                        right_dodge <= 0;
                                        counter <= 0;
                                    end
                                else
                                    counter <= counter + 1;
                            end
                        else
                            begin
                                if (right_press == 1)
                                    begin
                                        right_attack <= 1;
                                        counter2 <= 0;
                                    end
                                if (left_press == 1)
                                    begin
                                        if (right_attack == 0)
                                            begin
                                                chances <= chances + 1;
                                            end
                                        else if (counter2 <= 15)
                                            begin
                                                left_dodge <= 1;
                                                attacker <= 0;
                                                right_attack <= 0;
                                                chances <= 0;
                                                counter2 <= 0;
                                            end
                                        else if (counter2 > 15)
                                            begin
                                                player2 <= player2 + 1;
                                                counter2 <= 0;
                                                right_attack <= 0;
                                                left_dodge <= 0;
                                                chances <= 0;
                                            end
                                    end
        
                                if (right_attack == 1)
                                    begin
                                        counter2 <= counter2 + 1;
                                    end
                                if (counter2 > 15)
                                    begin
                                        player2 <= player2 + 1;
                                        counter2 <= 0;
                                        right_attack <= 0;
                                        left_dodge <= 0;
                                        chances <= 0;
                                    end
                                if (chances == 3)
                                    begin
                                        chances <= 0;
                                        player2 <= player2 + 1;
                                    end
                            end
                    end
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
    
    wire left_hand;
    wire right_hand;
    wire left_hand_dodge;
    wire right_hand_dodge;
    wire left_attacker;
    wire right_attacker;
    wire left_side;
    
    assign left_side = (x <= 48);
    assign left_hand = ((x <= (40 + counter1) && x >= (16 + counter1)) && (y <= 42 && y >= 21));
    assign left_hand_dodge = ((x <= 30 && x >= 6) && (y <= 42 && y >= 21));
    assign right_hand = ((x <= (80 - counter2) && x >= (56 - counter2)) && (y <= 42 && y >= 21));
    assign right_hand_dodge = ((x <= 90 && x >= 66) && (y <= 42 && y >= 21));
    assign left_attacker = (x <= 3 && x >= 0);
    assign right_attacker = (x <= 95 && x >= 92);
    
    
    
    always @ (posedge clk)
    begin
        if (~game_over)
            begin
                if (attacker == 0)
                    begin
                        if (left_dodge == 1)
                            begin
                                oled_data <= (left_side) ? ((left_hand_dodge || left_attacker) ? `WHITE : `BLUE) : (right_hand ? `WHITE : `RED);
                            end
                        else
                            begin
                                oled_data <= (left_side) ? ((left_hand || left_attacker) ? `WHITE : `BLUE) : ((left_hand || right_hand) ? `WHITE : `RED);
                            end
                    end
                else if (attacker == 1)
                    begin
                        if (right_dodge == 1)
                            begin
                                oled_data <= (left_side) ? (left_hand ? `WHITE : `BLUE) : ((right_hand_dodge || right_attacker) ? `WHITE : `RED);
                            end
                        else
                            begin
                                oled_data <= (left_side) ? ((left_hand || right_hand) ? `WHITE : `BLUE) : ((right_hand || right_attacker) ? `WHITE : `RED);
                            end
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
