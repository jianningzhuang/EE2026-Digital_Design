`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 15:14:11
// Design Name: 
// Module Name: clock_1p5Hz
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


module clock_1p5Hz(
    input basys_clk,
    output reg clk_1p5Hz
    );
    
    reg [24:0] count = 0;
    
    always @ (posedge basys_clk)
    begin
        count <= count + 1;
        clk_1p5Hz <= (count == 0) ? ~clk_1p5Hz : clk_1p5Hz;
    end
endmodule
