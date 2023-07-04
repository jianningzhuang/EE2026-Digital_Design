`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2021 23:07:31
// Design Name: 
// Module Name: clk_12hz
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


module clk_12hz(
    input clock,
    output reg clk_12Hz
    );
    
    reg count = 0;
        
    always @ (posedge clock)
    begin
        count <= count + 1;
        clk_12Hz <= (count == 0) ? ~clk_12Hz : clk_12Hz;
    end
endmodule
