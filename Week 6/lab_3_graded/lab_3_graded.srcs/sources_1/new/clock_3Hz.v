`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 15:08:30
// Design Name: 
// Module Name: clock_3Hz
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


module clock_3Hz(
    input basys_clk,
    output reg clk_3Hz
    );
    
    reg [23:0] count = 0;
    
    always @ (posedge basys_clk)
    begin
        count <= count + 1;
        clk_3Hz <= (count == 0) ? ~clk_3Hz : clk_3Hz;
    end
endmodule
