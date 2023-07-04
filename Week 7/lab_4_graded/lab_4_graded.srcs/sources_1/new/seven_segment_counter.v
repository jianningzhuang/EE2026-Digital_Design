`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 18:23:38
// Design Name: 
// Module Name: seven_segment_counter
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


module seven_segment_counter(
    input clk_381Hz,
    input [3:0] TASK,
    output reg [6:0] COUNT = 0
    );
    
    reg [8:0] count_1p342s = 0;
    reg [7:0] count_1p49hz = 0;
    
    always @ (posedge clk_381Hz)
    begin
        case (TASK)
            4'b0011:
                begin
                    if (count_1p342s == 0)
                        begin
                            COUNT <= COUNT + 1;
                        end
                    count_1p342s <= count_1p342s + 1;
                end
            4'b0100:
                begin
                    COUNT <= (COUNT == 7'b0001000) ? 7'b0000101 : COUNT + 1;
                end
            4'b0101:
                begin
                    COUNT <= (COUNT == 7'b0001100) ? 7'b0001001 : COUNT + 1;
                end
            4'b0110:
                begin
                    if ((COUNT > 7'b0010000) || (COUNT < 7'b0001101))
                        COUNT <= 7'b0001101;
                    else
                        COUNT <= (COUNT == 7'b0010000) ? 7'b0001101 : COUNT + 1;
                end
            4'b0111:
                begin
                    if ((COUNT > 7'b0010000) || (COUNT < 7'b0001101))
                        COUNT <= 7'b0001101;
                    else
                        COUNT <= (COUNT == 7'b0010000) ? 7'b0001101 : COUNT + 1;
                end
            4'b1000:
                begin
                    if ((COUNT > 7'b0010100) || (COUNT < 7'b0010001))
                        COUNT <= 7'b0010001;
                    else
                        COUNT <= (COUNT == 7'b0010100) ? 7'b0010001 : COUNT + 1;
                end
            4'b1001:
                begin
                    if ((COUNT > 7'b0010000) || (COUNT < 7'b0001101))
                        COUNT <= 7'b0001101;
                    else
                        COUNT <= (COUNT == 7'b0010000) ? 7'b0001101 : COUNT + 1;
                end
            4'b1010:
                begin
                    if ((COUNT > 7'b0010000) || (COUNT < 7'b0001101))
                        COUNT <= 7'b0001101;
                    else
                        COUNT <= (COUNT == 7'b0010000) ? 7'b0001101 : COUNT + 1;
                end
            4'b1011:
                begin
                    if ((COUNT > 7'b0010000) || (COUNT < 7'b0001101))
                        COUNT <= 7'b0001101;
                    else
                        COUNT <= (COUNT == 7'b0010000) ? 7'b0001101 : COUNT + 1;
                end
            default: COUNT <= COUNT;
        endcase
    end
endmodule
