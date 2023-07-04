`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 15:32:48
// Design Name: 
// Module Name: water_drop_LED
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


module water_drop_LED(
    input clk_fast,
    input [6:0] COUNT,
    output reg [15:0] LED
    );
    
    always @ (posedge clk_fast)
    begin
        case (COUNT)
            7'b0000001:
                begin
                    LED <= 16'b0010000000000000;
                end
            7'b0000010:
                begin
                    LED <= 16'b0001000000000000;
                end
            7'b0000011:
                begin
                    LED <= 16'b0000100000000000;
                end
            7'b0000100:
                begin
                    LED <= 16'b0000010000000000;
                end
            7'b0000101:
                begin
                    LED <= 16'b0010001000000000;
                end
            7'b0000110:
                begin
                    LED <= 16'b0001000100000000;
                end
            7'b0000111:
                begin
                    LED <= 16'b0000100010000000;
                end
            7'b0001000:
                begin
                    LED <= 16'b0000010001000000;
                end
            7'b0001001:
                begin
                    LED <= 16'b0010001000100000;
                end
            7'b0001010:
                begin
                    LED <= 16'b0001000100010000;
                end
            7'b0001011:
                begin
                    LED <= 16'b0000100010001000;
                end
            7'b0001100:
                begin
                    LED <= 16'b0000010001000100;
                end
            7'b0001101:
                begin
                    LED <= 16'b0010001000100010;
                end
            7'b0001110:
                begin
                    LED <= 16'b0001000100010001;
                end
            7'b0001111:
                begin
                    LED <= 16'b0000100010001001;
                end
            7'b0010000:
                begin
                    LED <= 16'b0000010001000101;
                end
            7'b0010001:
                begin
                    LED <= 16'b0010001000100011;
                end
            7'b0010010:
                begin
                    LED <= 16'b0001000100010011;
                end
            7'b0010011:
                begin
                    LED <= 16'b0000100010001011;
                end
            7'b0010100:
                begin
                    LED <= 16'b0000010001000111;
                end
            7'b0010101:
                begin
                    LED <= 16'b0010001000100111;
                end
            7'b0010110:
                begin
                    LED <= 16'b0001000100010111;
                end
            7'b0010111:
                begin
                    LED <= 16'b0000100010001111;
                end
            7'b0011000:
                begin
                    LED <= 16'b0000010001001111;
                end
            7'b0011001:
                begin
                    LED <= 16'b0010001000101111;
                end
            7'b0011010:
                begin
                    LED <= 16'b0001000100011111;
                end
            7'b0011011:
                begin
                    LED <= 16'b0000100010011111;
                end
            7'b0011100:
                begin
                    LED <= 16'b0000010001011111;
                end
            7'b0011101:
                begin
                    LED <= 16'b0010001000111111;
                end
            7'b0011110:
                begin
                    LED <= 16'b0001000100111111;
                end
            7'b0011111:
                begin
                    LED <= 16'b0000100010111111;
                end
            7'b0100000:
                begin
                    LED <= 16'b0000010001111111;
                end
            7'b0100001:
                begin
                    LED <= 16'b0010001001111111;
                end
            7'b0100010:
                begin
                    LED <= 16'b0001000101111111;
                end
            7'b0100011:
                begin
                    LED <= 16'b0000100011111111;
                end
            7'b0100100:
                begin
                    LED <= 16'b0000010011111111;
                end
            7'b0100101:
                begin
                    LED <= 16'b0010001011111111;
                end
            7'b0100110:
                begin
                    LED <= 16'b0001000111111111;
                end
            7'b0100111:
                begin
                    LED <= 16'b0000100111111111;
                end
            7'b0101000:
                begin
                    LED <= 16'b0000010111111111;
                end
            7'b0101001:
                begin
                    LED <= 16'b0010001111111111;
                end
            7'b0101010:
                begin
                    LED <= 16'b0001001111111111;
                end
            7'b0101011:
                begin
                    LED <= 16'b0000101111111111;
                end
            7'b0101100:
                begin
                    LED <= 16'b0000011111111111;
                end
            7'b0101101:
                begin
                    LED <= 16'b0010011111111111;
                end
            7'b0101110:
                begin
                    LED <= 16'b0001011111111111;
                end
            7'b0101111:
                begin
                    LED <= 16'b0000111111111111;
                end
            7'b0110000:
                begin
                    LED <= 16'b0000111111111111;
                end
            7'b0110001:
                begin
                    LED <= 16'b0010111111111111;
                end
            7'b0110010:
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0110011:
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0110100:
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0110101: //start blinking
                begin
                    LED <= 16'b0011111111111111;
                end
            7'b0110110:
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0110111:
                begin
                    LED <= 16'b0011111111111111;
                end
            7'b0111000:
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0111001: //start discharging
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0111010:
                begin
                    LED <= 16'b0000111111111111;
                end
            7'b0111011:
                begin
                    LED <= 16'b0000011111111111;
                end
            7'b0111100:
                begin
                    LED <= 16'b0000001111111111;
                end
            7'b0111101:
                begin
                    LED <= 16'b0000000111111111;
                end
            7'b0111110:
                begin
                    LED <= 16'b0000000011111111;
                end
            7'b0111111:
                begin
                    LED <= 16'b0000000001111111;
                end
            7'b1000000:
                begin
                    LED <= 16'b0000000000111111;
                end
            7'b1000001:
                begin
                    LED <= 16'b0000000000011111;
                end
            7'b1000010:
                begin
                    LED <= 16'b0000000000001111;
                end
            7'b1000011:
                begin
                    LED <= 16'b0000000000000111;
                end
            7'b1000100:
                begin
                    LED <= 16'b0000000000000011;
                end
            7'b1000101:
                begin
                    LED <= 16'b0000000000000001;
                end
            7'b1000110:
                begin
                    LED <= 16'b0000000000000000;
                end              
            default: LED <= 16'b0000000000000000;
        endcase        
    end
endmodule
