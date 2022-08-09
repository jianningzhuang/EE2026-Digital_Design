`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 14:48:35
// Design Name: 
// Module Name: clk_3hz
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


module clk_3hz(
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
