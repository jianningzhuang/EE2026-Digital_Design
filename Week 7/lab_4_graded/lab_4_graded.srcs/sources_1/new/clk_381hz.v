`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 18:42:56
// Design Name: 
// Module Name: clk_381hz
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


module clk_381hz(
    input basys_clk,
    output reg clk_381Hz
    );
    
    reg [16:0] count = 0;
        
    always @ (posedge basys_clk)
    begin
        count <= count + 1;
        clk_381Hz <= (count == 0) ? ~clk_381Hz : clk_381Hz;
    end
endmodule
