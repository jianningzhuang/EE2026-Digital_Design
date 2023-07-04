`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2021 12:47:37
// Design Name: 
// Module Name: slow_blinky_module
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


module slow_blinky_module(
    input CLOCK,
    input A,
    output reg LED
    );
    
    //reg [3:0] COUNT = 4'b0000;
    //reg [26:0] COUNT = 0;
    reg [25:0] COUNT = 0;
    //assign LED = A ? COUNT[25] : COUNT[26];
    
    //wire [2:0] N;
    
    //assign N = A ? 3'b100 : 3'b010;
    
    //reg [26:0] COUNT = 0;
    
//    parameter N = A ? 24 : 25;
//    reg [N:0] COUNT = 0;
    
    
//    initial
//    begin
//        LED = 0;
//    end
    
    always @ (posedge CLOCK)
    begin
        //COUNT <= COUNT + N;
        COUNT <= COUNT + 1;
        //LED <= (COUNT[26] == 1 ) ? ~LED : LED;
        LED <= (COUNT == 0) ? ~LED : LED;
        //LED <= A ? ((COUNT[25] == 1) ? ~LED : LED) : ((COUNT[26] == 1) ? ~LED : LED);
    end
    
endmodule
