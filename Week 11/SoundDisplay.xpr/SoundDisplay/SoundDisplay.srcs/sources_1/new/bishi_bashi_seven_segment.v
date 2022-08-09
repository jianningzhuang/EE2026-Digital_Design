`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2021 16:52:00
// Design Name: 
// Module Name: bishi_bashi_seven_segment
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


module bishi_bashi_seven_segment(
    input clk_381hz,
    input [2:0] player1,
    input [2:0] player2,
    output reg [7:0] seg,
    output reg [3:0] an
    );
    
    reg [1:0] count = 0;
    
    always @ (posedge clk_381hz)
    begin
        count <= count + 1;
        an <= ~(1 << count);
        if (count == 0)
            begin
                if (player2 == 0)
                    seg <= 8'b11000000;
                else if (player2 == 1)
                    seg <= 8'b11111001;
                else if (player2 == 2)
                    seg <= 8'b10100100;
                else if (player2 == 3)
                    seg <= 8'b10110000;
                else if (player2 == 4)
                    seg <= 8'b10011001;
                else if (player2 == 5)
                    seg <= 8'b10010010;  
            end
        else if (count == 1)
            begin
                seg <= 8'b11111111;
            end
        else if (count == 2)
            begin
                seg <= 8'b11111111;
            end
        else if (count == 3)
            begin
                if (player1 == 0)
                    seg <= 8'b11000000;
                else if (player1 == 1)
                    seg <= 8'b11111001;
                else if (player1 == 2)
                    seg <= 8'b10100100;
                else if (player1 == 3)
                    seg <= 8'b10110000;
                else if (player1 == 4)
                    seg <= 8'b10011001;
                else if (player1 == 5)
                    seg <= 8'b10010010;
            end
        
    end
endmodule
