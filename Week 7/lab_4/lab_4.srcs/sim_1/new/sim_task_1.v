`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2021 21:00:07
// Design Name: 
// Module Name: sim_task_1
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


module sim_task_1(

    );
    
    reg CLOCK;
    reg pushbutton;
    wire single_pulse;
    
    task_1 t1 (CLOCK, pushbutton, single_pulse);
    
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
        #12 pushbutton = 1; //can be inside initial also for just 1 button
        #31 pushbutton = 0;    
    end
    
    
endmodule
