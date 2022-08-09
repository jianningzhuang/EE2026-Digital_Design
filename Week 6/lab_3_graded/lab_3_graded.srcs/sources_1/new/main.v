`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2021 16:00:56
// Design Name: 
// Module Name: main
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


module main(
    input CLOCK,
    input [15:0] sw,
    output [15:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire clk_3Hz;
    wire clk_fast;
    wire [6:0] COUNT1;
    wire [5:0] COUNT2;
    
    reg [1:0] TASK = 2'b00;
    wire [15:0] activated;
    
    clock_3Hz clk1 (CLOCK, clk_3Hz);
    fast_clock clk2 (CLOCK, clk_fast);
    water_drop_counter fill (clk_3Hz, TASK, COUNT1);
    water_drop_LED show1 (clk_fast, COUNT1, led);
    password_check check (clk_fast, TASK, sw, activated);
    seven_segment_counter warning (clk_3Hz, TASK, COUNT2);
    seven_segment show2 (clk_fast, COUNT2, an, seg);
    
    always @ (posedge clk_fast)
    begin
        case (COUNT1)
            7'b0110100:
                begin
                    TASK <= 2'b01;
                end
            7'b1000101:
                begin
                    TASK <= 2'b11;
                end
            default: TASK <= (activated == 16'b0010000101110010) ? 2'b10 : TASK;
        endcase
    end
    
//    assign led[15] = TASK[1];
//    assign led[14] = TASK[0]; 
//    assign led[13:0] = activated[13:0];

    
endmodule
