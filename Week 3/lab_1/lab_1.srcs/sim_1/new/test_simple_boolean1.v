`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.01.2021 15:17:17
// Design Name: 
// Module Name: my_control_module_simulation1
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


module my_control_module_simulation1(
    
    );
     //Simulation inputs
       reg A;
       reg B;
       
       //Simulation outputs
       wire LED1;
       wire LED2;
       wire LED3;
       
       //instantiation of module to be simulated
       my_control_module dut(A, B, LED1, LED2, LED3);
       
       //Stimuli
       
       initial 
       begin
           A = 0; B = 0;
           #30 A = 0; B = 1; 
           #30 A = 1; B = 0; 
           #30 A = 1; B = 1;
       end
endmodule
