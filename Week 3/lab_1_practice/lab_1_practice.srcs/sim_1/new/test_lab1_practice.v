`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 16:02:49
// Design Name: 
// Module Name: my_control_module_simulation
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


module my_control_module_simulation(

    );
    
    reg A, B, C;
    wire LED1, LED2, LED3;
    
    my_control_module dut(A, B, C, LED1, LED2, LED3);
    
    initial
    begin
        A = 0; B = 0; C = 0;
        #30 A = 0; B = 1; C = 0;
        #30 A = 1; B = 0; C = 0;
        #30 A = 1; B = 1; C = 0;
        #30 A = 0; B = 0; C = 1;
        #30 A = 0; B = 1; C = 1;
        #30 A = 1; B = 0; C = 1;
        #30 A = 1; B = 1; C = 1;
    end
        
endmodule
