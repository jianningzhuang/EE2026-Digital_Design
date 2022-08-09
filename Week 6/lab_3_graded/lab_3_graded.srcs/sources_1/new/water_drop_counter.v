`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 15:26:39
// Design Name: 
// Module Name: water_drop_counter
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


module water_drop_counter(
    input clk_3Hz,
    input [1:0] TASK,
    output reg [6:0] COUNT
    );
    
    initial
    begin
        COUNT = 0;
    end
    
    always @ (posedge clk_3Hz)
    begin
        case (TASK)
            2'b00:
                begin
                    COUNT <= COUNT + 1;
                end
            2'b01:
                begin
                    COUNT <= (COUNT == 7'b0111000) ? 7'b0110101 : COUNT + 1;
                end
            2'b10:
                begin
                    COUNT <= (COUNT < 7'b0111001) ? 7'b0111001 : COUNT + 1;
                end
            2'b11:
                begin
                    COUNT <= 7'b1000110;
                end
            default: COUNT <= 7'b1000110;
        endcase
    end
endmodule
