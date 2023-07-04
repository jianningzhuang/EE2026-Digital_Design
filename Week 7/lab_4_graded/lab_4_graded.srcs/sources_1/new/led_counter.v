`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 14:58:39
// Design Name: 
// Module Name: led_counter
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


module led_counter(
    input clk_p336s,
    input [3:0] TASK,
    output reg [6:0] COUNT
    );
    
    initial
    begin
        COUNT = 7'b0000000;
    end
    
    always @ (posedge clk_p336s)
    begin
        case (TASK)
            4'b0000:
                begin
                    COUNT <= 7'b0000000;
                end
            4'b0001:
                begin
                    COUNT <= COUNT + 1;
                end
            default: COUNT <= 7'b0010001;
        endcase
    end
endmodule
