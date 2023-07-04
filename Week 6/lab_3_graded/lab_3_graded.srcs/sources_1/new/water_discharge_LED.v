`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 17:47:05
// Design Name: 
// Module Name: water_discharge_LED
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


module water_discharge_LED(
    input clk_fast,
    input [3:0] COUNT,
    output reg [15:0] LED
    );
    
    always @ (posedge clk_fast)
    begin
        case (COUNT)
            4'b0000:
                begin
                    LED <= 16'b0001111111111111;
                end
            4'b0001:
                begin
                    LED <= 16'b0000111111111111;
                end
            4'b0010:
                begin
                    LED <= 16'b0000011111111111;
                end
            4'b0011:
                begin
                    LED <= 16'b0000001111111111;
                end
            4'b0100:
                begin
                    LED <= 16'b0000000111111111;
                end
            4'b0101:
                begin
                    LED <= 16'b0000000011111111;
                end
            4'b0110:
                begin
                    LED <= 16'b0000000001111111;
                end
            4'b0111:
                begin
                    LED <= 16'b0000000000111111;
                end
            4'b1000:
                begin
                    LED <= 16'b0000000000011111;
                end
            4'b1001:
                begin
                    LED <= 16'b0000000000001111;
                end
            4'b1010:
                begin
                    LED <= 16'b0000000000000111;
                end
            4'b1011:
                begin
                    LED <= 16'b0000000000000011;
                end
            4'b1100:
                begin
                    LED <= 16'b0000000000000001;
                end
            4'b1101:
                begin
                    LED <= 16'b0000000000000000;
                end
            default: LED <= 16'b0000000000000000;
        endcase
    end
endmodule
