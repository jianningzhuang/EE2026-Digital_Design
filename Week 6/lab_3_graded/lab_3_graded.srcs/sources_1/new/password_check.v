`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 17:38:48
// Design Name: 
// Module Name: password_check
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


module password_check(
    input clk_fast,
    input [1:0] TASK,
    input [15:0] sw,
    output reg [15:0] activated
    );
    
    
    initial
    begin
        activated = 16'b0000000000000000;
    end
    
    always @ (posedge clk_fast)
    begin
        case (TASK)
            2'b01:
                begin
                    activated[13] <= (sw[13] == 1) ? 1 : activated[13];
                    activated[8] <= (sw[8] == 1) ? 1 : activated[8];
                    activated[6] <= (sw[6] == 1) ? 1 : activated[6];
                    activated[5] <= (sw[5] == 1) ? 1 : activated[5];
                    activated[4] <= (sw[4] == 1) ? 1 : activated[4];
                    activated[1] <= (sw[1] == 1) ? 1 : activated[1];
                end
            default: activated <= 16'b0000000000000000;
        endcase
    end
    
endmodule
