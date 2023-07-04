`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 14:59:56
// Design Name: 
// Module Name: led_controller
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


module led_controller(
    input CLOCK,
    input [6:0] COUNT,
    output reg [15:0] LED
    );
    
    always @ (posedge CLOCK)
    begin
        case (COUNT)
            7'b0000000:
                begin
                    LED <= 16'b0000000000000000;
                end
            7'b0000001:
                begin
                    LED <= 16'b0000000000000001;
                end
            7'b0000010:
                begin
                    LED <= 16'b0000000000000011;
                end
            7'b0000011:
                begin
                    LED <= 16'b0000000000000111;
                end
            7'b0000100:
                begin
                    LED <= 16'b0000000000001111;
                end
            7'b0000101:
                begin
                    LED <= 16'b0000000000011111;
                end
            7'b0000110:
                begin
                    LED <= 16'b0000000000111111;
                end
            7'b0000111:
                begin
                    LED <= 16'b0000000001111111;
                end
            7'b0001000:
                begin
                    LED <= 16'b0000000011111111;
                end
            7'b0001001:
                begin
                    LED <= 16'b0000000111111111;
                end
            7'b0001010:
                begin
                    LED <= 16'b0000001111111111;
                end
            7'b0001011:
                begin
                    LED <= 16'b0000011111111111;
                end
            7'b0001100:
                begin
                    LED <= 16'b0000111111111111;
                end
            7'b0001101:
                begin
                    LED <= 16'b0001111111111111;
                end
            7'b0001110:
                begin
                    LED <= 16'b0011111111111111;
                end
            7'b0001111:
                begin
                    LED <= 16'b0111111111111111;
                end
            7'b0010000:
                begin
                    LED <= 16'b1111111111111111;
                end
            default: LED <= 16'b1111111111111111;
        endcase
    end
endmodule
