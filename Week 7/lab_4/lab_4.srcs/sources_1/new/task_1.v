`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2021 20:53:15
// Design Name: 
// Module Name: task_1
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


module task_1(
    input CLOCK,
    input pushbutton,
    output single_pulse_output
    );
    
    wire Q1;
    wire Q2;
    reg [7:0] led = 0;
    
    my_dff DFF1 (CLOCK, pushbutton, Q1);
    my_dff DFF2 (CLOCK, Q1, Q2);
    
    assign single_pulse_output = Q1 & ~Q2;
    
    always @ (posedge CLOCK)
    begin
        if (single_pulse_output == 1)
        begin
            led <= led + 1;
            //led <= led << 1;
        end
    end
endmodule
