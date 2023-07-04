`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 16:05:38
// Design Name: 
// Module Name: fast_clock
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


module fast_clock(
    input basys_clk,
    output reg clk_fast
    );
    
    reg [1:0] count = 0;
        
    always @ (posedge basys_clk)
    begin
        count <= count + 1;
        clk_fast <= (count == 0) ? ~clk_fast : clk_fast;
    end
endmodule
