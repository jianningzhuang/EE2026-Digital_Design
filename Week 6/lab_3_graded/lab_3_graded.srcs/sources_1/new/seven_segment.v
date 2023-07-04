`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 16:55:07
// Design Name: 
// Module Name: seven_segment
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


module seven_segment(
    input clk_fast,
    input [5:0] COUNT,
    output [3:0] an,
    output reg [7:0] seg
    );
    
    assign an = 4'b0001;
    
    always @ (posedge clk_fast)
    begin
        case (COUNT)
            6'b000000:
                begin
                    seg <= 8'b01111111;
                end
            6'b000001:
                begin
                    seg <= 8'b01111111;
                end
            6'b000010:
                begin
                    seg <= 8'b11010101;
                end
            6'b000011:
                begin
                    seg <= 8'b11010101;
                end
            6'b000100:
                begin
                    seg <= 8'b10001000;
                end
            6'b000101:
                begin
                    seg <= 8'b10001000;
                end
            6'b000110:
                begin
                    seg <= 8'b10000111;
                end
            6'b000111:
                begin
                    seg <= 8'b10000111;
                end
            6'b001000:
                begin
                    seg <= 8'b10000110;
                end
            6'b001001:
                begin
                    seg <= 8'b10000110;
                end
            6'b001010:
                begin
                    seg <= 8'b10101111;
                end
            6'b001011:
                begin
                    seg <= 8'b10101111;
                end
            6'b001100:
                begin
                    seg <= 8'b10111111;
                end
            6'b001101:
                begin
                    seg <= 8'b10111111;
                end
            6'b001110:
                begin
                    seg <= 8'b11000111;
                end
            6'b001111:
                begin
                    seg <= 8'b11000111;
                end
            6'b010000:
                begin
                    seg <= 8'b10000110;
                end
            6'b010001:
                begin
                    seg <= 8'b10000110;
                end
            6'b010010:
                begin
                    seg <= 8'b11100011;
                end
            6'b010011:
                begin
                    seg <= 8'b11100011;
                end
            6'b010100:
                begin
                    seg <= 8'b10000110;
                end
            6'b010101:
                begin
                    seg <= 8'b10000110;
                end
            6'b010110:
                begin
                    seg <= 8'b11000111;
                end
            6'b010111:
                begin
                    seg <= 8'b11000111;
                end
            6'b011000:
                begin
                    seg <= 8'b10111111;
                end
            6'b011001:
                begin
                    seg <= 8'b10111111;
                end
            6'b011010:
                begin
                    seg <= 8'b11000110;
                end
            6'b011011:
                begin
                    seg <= 8'b11000110;
                end
            6'b011100:
                begin
                    seg <= 8'b10001000;
                end
            6'b011101:
                begin
                    seg <= 8'b10001000;
                end
            6'b011110:
                begin
                    seg <= 8'b11000001;
                end
            6'b011111:
                begin
                    seg <= 8'b11000001;
                end
            6'b100000:
                begin
                    seg <= 8'b10000111;
                end
            6'b100001:
                begin
                    seg <= 8'b10000111;
                end
            6'b100010:
                begin
                    seg <= 8'b11001111;
                end
            6'b100011:
                begin
                    seg <= 8'b11001111;
                end
            6'b100100:
                begin
                    seg <= 8'b11000000;
                end
            6'b100101:
                begin
                    seg <= 8'b11000000;
                end
            6'b100110:
                begin
                    seg <= 8'b10101011;
                end
            6'b100111:
                begin
                    seg <= 8'b10101011;
                end
            default: seg <= 8'b11111111;
                   
        endcase
    end
endmodule
