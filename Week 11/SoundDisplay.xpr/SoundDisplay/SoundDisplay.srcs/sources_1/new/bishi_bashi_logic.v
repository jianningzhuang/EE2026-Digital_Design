`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 12:47:17
// Design Name: 
// Module Name: bishi_bashi_logic
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


module bishi_bashi_logic(
    input clk,
    input clk_50hz,
    input start,
    input reset,
    input up,
    input down,
    input left,
    input right,
    input btnL,
    input btnR,
    input [15:0] sw,
    input [6:0] x,
    input [5:0] y,
    input [4:0] randNum,
    output reg [15:0] oled_data,
    output reg [2:0] player_1,
    output reg [2:0] player_2
    );
    
    reg [3:0] state = 0;
    reg start_tow = 0;
    wire return_tow;
    wire [1:0] winner_tow;
    reg start_cd = 0;
    wire return_cd;
    wire [1:0] winner_cd;
    reg [4:0] randStart = 0;
    reg start_wam = 0;
    wire return_wam;
    wire [1:0] winner_wam;
    reg start_slap = 0;
    wire return_slap;
    wire [1:0] winner_slap;
    
    
    wire [15:0] press_to_continue_data;
    wire [15:0] cd_data;
    wire [15:0] tug_of_war_data;
    wire [15:0] wam_data;
    wire [15:0] slap_data;
    
    press_to_continue ready_screen (clk, btnL, btnR, x, y, press_to_continue_data);
    tug_of_war tow (clk, clk_50hz, start_tow, left, right, x, y, tug_of_war_data, return_tow, winner_tow);
    countdown cd (clk, clk_50hz, start_cd, randStart, left, right, x, y, cd_data, return_cd, winner_cd);
    whack_a_mole wam (clk, clk_50hz, start_wam, randNum, sw[15:13], sw[2:0], x, y, wam_data, return_wam, winner_wam);
    slap sl (clk, clk_50hz, start_slap, randNum, left, right, x, y, slap_data, return_slap, winner_slap);
    
    always @ (posedge clk)
    begin
        if (state == 0)
            oled_data <= press_to_continue_data;
        else if (state == 1)
            oled_data <= tug_of_war_data;
        else if (state == 2)
            oled_data <= cd_data;
        else if (state == 3)
            oled_data <= wam_data;
        else if (state == 4)
            oled_data <= slap_data;
    end
    
    always @ (posedge clk_50hz)
    begin
        if (start || reset)
            begin
                player_1 <= 0;
                player_2 <= 0;
                state <= 0;
                start_tow <= 0;
                start_cd <= 0;
                start_wam <= 0;
                start_slap <= 0;
            end
        else if (state == 0)
            begin
                if (btnL == 1 && btnR == 1)
                    begin
                        if ((randNum % 4) == 0)
                            begin
                                state <= 1;
                                start_tow <= 1;
                            end
                        else if ((randNum % 4) == 1)
                            begin
                                state <= 2;
                                start_cd <= 1;
                                randStart <= (randNum%5) + 15;
                            end
                        else if ((randNum % 4) == 2)
                            begin
                                state <= 3;
                                start_wam <= 1;
                            end
                        else if ((randNum % 4) == 3)
                            begin
                                state <= 4;
                                start_slap <= 1;
                            end
                    end
            end
        else if (state == 1)
            begin
                start_tow <= 0;
                if (return_tow)
                    begin
                        state <= 0;
                        if (winner_tow == 1)
                            player_1 <= player_1 + 1;
                        else if (winner_tow == 2)
                            player_2 <= player_2 + 1;
                    end
            end
        else if (state == 2)
            begin
                start_cd <= 0;
                if (return_cd)
                    begin
                        state <= 0;
                        if (winner_cd == 1)
                            player_1 <= player_1 + 1;
                        else if (winner_cd == 2)
                            player_2 <= player_2 + 1;
                    end
            end
        else if (state == 3)
            begin
                start_wam <= 0;
                if (return_wam)
                    begin
                        state <= 0;
                        if (winner_wam == 1)
                            player_1 <= player_1 + 1;
                        else if (winner_wam == 2)
                            player_2 <= player_2 + 1;
                    end
            end
        else if (state == 4)
            begin
                start_slap <= 0;
                if (return_slap)
                    begin
                        state <= 0;
                        if (winner_slap == 1)
                            player_1 <= player_1 + 1;
                        else if (winner_slap == 2)
                            player_2 <= player_2 + 1;
                    end
            end
    end
    
    
    
endmodule
