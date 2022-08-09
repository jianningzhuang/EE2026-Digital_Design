`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 18:28:15
// Design Name: 
// Module Name: clk_0p75hz
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


module clk_0p75hz(
    input basys_clk,
    output reg clk_0p75Hz
    );
    
    reg [25:0] count = 0;
        
    always @ (posedge basys_clk)
    begin
        count <= count + 1;
        clk_0p75Hz <= (count == 0) ? ~clk_0p75Hz : clk_0p75Hz;
    end
endmodule
