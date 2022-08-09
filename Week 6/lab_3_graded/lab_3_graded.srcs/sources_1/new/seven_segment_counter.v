`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 17:14:17
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
    input clk_3Hz,
    input [1:0] TASK,
    output reg [5:0] COUNT
    );
    
    initial
    begin
        COUNT = 0;
    end
    
    always @ (posedge clk_3Hz)
    begin
        case (TASK)
            2'b01:
                begin
                    COUNT <= (COUNT == 6'b100111 || COUNT == 6'b101000) ? 0 : COUNT + 1;
                end
            2'b10:
                begin
                    COUNT <= (COUNT == 6'b100111 || COUNT == 6'b101000) ? 0 : COUNT + 1;
                end
            default: COUNT <= 6'b101000;
        endcase
    end
endmodule
