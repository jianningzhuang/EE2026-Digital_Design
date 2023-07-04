`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 18:30:57
// Design Name: 
// Module Name: seven_segment_controller
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


module seven_segment_controller(
    input CLOCK,
    input [6:0] COUNT,
    input [3:0] sw,
    input [2:0] n_chances,
    input [1:0] left_count,
    input [1:0] centre_count,
    input [1:0] right_count,
    input [3:0] blink,
    output reg [3:0] an,
    output reg [7:0] seg
    );
    
    
    always @ (posedge CLOCK)
    begin
        case (COUNT)
            7'b0000000:
                begin
                    an <= 4'b1111;
                    seg <= 8'b11111111;
                end
            7'b0000001:
                begin
                    an <= 4'b0111;
                    seg <= 8'b10010010;
                end
            7'b0000010:
                begin
                    an <= 4'b1011;
                    seg <= 8'b10001000;
                end
            7'b0000011:
                begin
                    an <= 4'b1101;
                    seg <= 8'b10001110;
                end
            7'b0000100:
                begin
                    an <= 4'b1110;
                    seg <= 8'b10000110;
                end
            7'b0000101:
                begin
                    an <= 4'b0111;
                    seg <= 8'b10010010;
                end
            7'b0000110:
                begin
                    an <= 4'b1011;
                    seg <= 8'b10001000;
                end
            7'b0000111:
                begin
                    an <= 4'b1101;
                    seg <= 8'b10001110;
                end
            7'b0001000:
                begin
                    an <= 4'b1110;
                    seg <= 8'b10000110;
                end
            7'b0001001:
                begin
                    an <= (4'b0111 | sw);
                    seg <= 8'b10011001;
                end
            7'b0001010:
                begin
                    an <= (4'b1011 | sw);
                    seg <= 8'b10010010;
                end
            7'b0001011:
                begin
                    an <= (4'b1101 | sw);
                    seg <= 8'b10000010;
                end
            7'b0001100:
                begin
                    an <= (4'b1110 | sw);
                    seg <= 8'b11111001;
                end
            7'b0001101:
                begin
                    an <= (4'b0111 | blink);
                    if (left_count == 0)
                        seg <= 8'b11111111;
                    if (left_count == 1)
                        seg <= 8'b11110111;
                    if (left_count == 2)
                        seg <= 8'b10110111;
                    if (left_count == 3)
                        seg <= 8'b10110110;
                end
            7'b0001110:
                begin
                    an <= (4'b1011 | blink);
                    if (centre_count == 0)
                        seg <= 8'b11111111;
                    if (centre_count == 1)
                        seg <= 8'b11110111;
                    if (centre_count == 2)
                        seg <= 8'b10110111;
                    if (centre_count == 3)
                        seg <= 8'b10110110;
                end
            7'b0001111:
                begin
                    an <= (4'b1101 | blink);
                    if (right_count == 0)
                        seg <= 8'b11111111;
                    if (right_count == 1)
                        seg <= 8'b11110111;
                    if (right_count == 2)
                        seg <= 8'b10110111;
                    if (right_count == 3)
                        seg <= 8'b10110110;
                end
            7'b0010000:
                begin
                    an <= 4'b1110;
                    if (n_chances == 0)
                        seg <= 8'b11000000;
                    if (n_chances == 1)
                        seg <= 8'b11111001;
                    if (n_chances == 2)
                        seg <= 8'b10100100;
                    if (n_chances == 3)
                        seg <= 8'b10110000;
                    if (n_chances == 4)
                        seg <= 8'b10011001;
                    if (n_chances == 5)
                        seg <= 8'b10010010;
                    if (n_chances == 6)
                        seg <= 8'b10000010;
                    if (n_chances == 7)
                        seg <= 8'b11111000;
                end
            7'b0010001:
                begin
                    an <= 4'b0111;
                    seg <= 8'b10001110;
                end
            7'b0010010:
                begin
                    an <= 4'b1011;
                    seg <= 8'b10001000;
                end
            7'b0010011:
                begin
                    an <= 4'b1101;
                    seg <= 8'b11001111;
                end
            7'b0010100:
                begin
                    an <= 4'b1110;
                    seg <= 8'b11000111;
                end
            default: 
                begin
                    an <= 4'b1111;
                    seg <= 8'b11111111;
                end
        endcase
    end
endmodule
