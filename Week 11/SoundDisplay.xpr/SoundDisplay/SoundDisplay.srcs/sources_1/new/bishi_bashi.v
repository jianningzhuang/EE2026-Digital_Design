`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 12:41:33
// Design Name: 
// Module Name: bishi_bashi
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

module bishi_bashi(
    input clk,
    input clk_50hz,
    input clk_381hz,
    input up,
    input down,
    input left,
    input right,
    input centre,
    input btnL,
    input btnR,
    input [15:0] sw,
    input start,
    input [6:0] x,
    input [5:0] y,
    input [11:0] mic_in,
    output reg [15:0] oled_data,
    output [7:0] seg,
    output [3:0] an
    );
    
    reg [4:0] randNum = 0;
    reg [3:0] counter = 0;
    reg reset = 0;
    
    wire [2:0] player1;
    wire [2:0] player2;
    wire [15:0] bb_data;
    
    bishi_bashi_logic bbl (clk, clk_50hz, start, reset, up, down, left, right, btnL, btnR, sw, x, y, randNum, bb_data, player1, player2);
    bishi_bashi_seven_segment bbss (clk_381hz, player1, player2, seg, an);
    
    always @ (posedge clk)
    begin
        counter <= counter + 1;
        if (counter == 6)
            begin
                counter <= 0;
                randNum <= {randNum[4], randNum[2:0], ~(randNum[2] ^ randNum[3])};
            end
    end
    
    always @ (posedge clk_50hz)
    begin
        if (centre == 1)
            reset <= 1;
        else
            reset <= 0;
    end
        
        
    always @ (posedge clk)
    begin
        if (player1 == 3)
            oled_data <= `BLUE;
        else if (player2 == 3)
            oled_data <= `RED;
        else
            oled_data <= bb_data;
    end
    
    
    
    
endmodule
