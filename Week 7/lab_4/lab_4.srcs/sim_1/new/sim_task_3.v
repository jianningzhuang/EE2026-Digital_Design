`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2021 23:19:29
// Design Name: 
// Module Name: sim_task_3
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


module sim_task_3(

    );
    
    reg CLOCK;
    reg pushbutton;
    wire [7:0] led;
    
    task_3 t3 (CLOCK, pushbutton, led);
    
    initial
    begin
        CLOCK = 0;
        pushbutton = 0;
    end
    
    always
    begin
        #5 CLOCK = ~CLOCK;
    end
    
    always
    begin
        #100 pushbutton = 1;
        #40000000 pushbutton = 0;    
    end
endmodule
