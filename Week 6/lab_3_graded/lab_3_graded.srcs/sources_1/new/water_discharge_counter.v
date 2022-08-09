`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 17:53:33
// Design Name: 
// Module Name: water_discharge_counter
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


module water_discharge_counter(
    input clk_3Hz,
    input [1:0] TASK,
    output reg [3:0] COUNT
    );
    
    initial
    begin
        COUNT = 0;
    end
        
    always @ (posedge clk_3Hz)
        begin
            COUNT <= (TASK == 2'b10) ? COUNT + 1 : 4'b1110;
        end
endmodule
