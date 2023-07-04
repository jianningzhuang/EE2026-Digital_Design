`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2021 21:43:11
// Design Name: 
// Module Name: task_3
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


module task_3(
    input CLOCK,
    input pushbutton,
    output reg [7:0] led = 8'b00000011
    );
    
    wire Q1;
    wire Q2;
    wire clk_3Hz;
    wire single_pulse;
    
    //clk_3hz slow (CLOCK, clk_3Hz);    
    clk_12hz slow1 (CLOCK, clk_3Hz);
    my_dff DFF1 (clk_3Hz, pushbutton, Q1);
    my_dff DFF2 (clk_3Hz, Q1, Q2);
    
    assign single_pulse = Q1 & ~Q2;
    
    always @ (posedge clk_3Hz)
    begin
        if (single_pulse == 1)
        begin
            led <= led + 1;
            //led <= led << 1;
        end
    end
endmodule
