`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2021 14:52:30
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
    input btnC,
    input btnU,
    input btnL,
    input btnR,
    input [3:0] sw,
    output [15:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire clk_p336s;
    wire clk_1p342s;
    wire clk_381Hz;
    wire clk_50Hz;
    wire [6:0] COUNT1;
    wire [6:0] COUNT2;
    wire left_press;
    wire centre_press;
    wire right_press;
    wire up_press;
    
    reg [3:0] TASK = 4'b0000;
    reg [31:0] count_5p37s = 0;
    reg [31:0] count_3s = 0;
    reg [31:0] count_10p74s = 0;
    reg [2:0] n_chances = 7;
    reg [1:0] left_count = 0;
    reg [1:0] centre_count = 0;
    reg [1:0] right_count = 0;
    reg up_count = 0;
    reg left_flag = 0;
    reg centre_flag = 0;
    reg right_flag = 0;
    reg [1:0] previous = 0;
    reg [3:0] blink = 4'b0000;
    reg [31:0] count_1p49hz = 1;
    
    
    my_clock_divider clk3Hz (CLOCK, 16799999, clk_p336s);
    my_clock_divider clk0p75Hz (CLOCK, 67099999, clk_1p342s);
    my_clock_divider clk381Hz (CLOCK, 131233, clk_381Hz);
    my_clock_divider clk50Hz (CLOCK, 999999, clk_50Hz);
    led_counter count1 (clk_p336s, TASK, COUNT1);
    led_controller show1 (CLOCK, COUNT1, led);
    seven_segment_counter count2 (clk_381Hz, TASK, COUNT2);
    seven_segment_controller show2 (CLOCK, COUNT2, sw, n_chances, left_count, centre_count, right_count, blink, an, seg);
    button_press left (clk_50Hz, btnL, left_press);
    button_press centre (clk_50Hz, btnC, centre_press);
    button_press right (clk_50Hz, btnR, right_press);
    button_press up (clk_50Hz, btnU, up_press);
    
    
    always @ (posedge CLOCK)
    begin
        case (TASK)
            4'b0000:
                begin
                    TASK <= (btnC == 1) ? 4'b0001: 4'b0000;
                end
            4'b0001:
                begin
                    if (btnC == 0)
                        TASK <= 4'b0000;
                    if ((COUNT1 == 7'b0010000) && (btnC == 1))
                        TASK <= 4'b0010;
                end
            4'b0010:
                begin
                    if (btnC == 0)
                        TASK <= 4'b0011;
                end
            4'b0011:
                begin
                    if (COUNT2 == 7'b0000101)
                        TASK <= 4'b0100;
                end
            4'b0100:
                begin
                    if (count_5p37s == 536999999)
                        TASK <= 4'b0101;
                    count_5p37s <= count_5p37s + 1;
                end
            4'b0101:
                begin
                    if (sw == 4'b1111)
                        TASK <= 4'b110;
                end
            4'b0110:
                begin
                    count_3s <= 0;
                    count_10p74s <= 0;
                    n_chances <= 7;
                    if (up_count == 0)
                        TASK <= 4'b0111;
                end
            4'b0111:
                begin
                    if (up_count == 1)
                        TASK <= 4'b0110;
                    else if (left_flag == 1)
                        begin
                            n_chances <= n_chances - 1;
                            TASK <= (n_chances == 1) ? 4'b1000 : 4'b1001;
                        end
                    else if (centre_flag == 1)
                        begin
                            n_chances <= n_chances - 1;
                            TASK <= (n_chances == 1) ? 4'b1000 : 4'b1010;
                        end
                    else if (right_flag == 1)
                        begin
                            n_chances <= n_chances - 1;
                            TASK <= (n_chances == 1) ? 4'b1000 : 4'b1011;
                        end
                    else
                        begin
                            if (count_3s >= 300000000)
                                count_3s <= count_3s;
                            else if (count_3s == 299999999)
                                begin
                                    if ((left_count + centre_count + right_count) < 9)
                                        begin
                                            n_chances <= n_chances - 4;
                                        end
                                    count_3s <= count_3s + 1;
                                end
                            else
                                count_3s <= count_3s + 1;
                        end
                end
            4'b1000:
                begin
                    if (up_count == 1)
                        TASK <= 4'b0110;
                end
            4'b1001:
                begin
                    if (up_count == 1)
                        TASK <= 4'b0110;
                    else
                        begin
                            if (count_10p74s >= 1073999999)
                                begin
                                    count_10p74s <= 0;
                                    TASK <= 4'b0111;
                                end
                            else
                                count_10p74s <= count_10p74s + 1;
                        end
                    if (count_3s >= 300000000)
                        count_3s <= count_3s;
                    else if (count_3s == 299999999)
                        begin
                            if ((left_count + centre_count + right_count) < 9)
                                begin
                                    n_chances <= n_chances - 4;
                                end
                            count_3s <= count_3s + 1;
                        end
                    else
                        count_3s <= count_3s + 1;
                end
            4'b1010:
                begin
                    if (up_count == 1)
                        TASK <= 4'b0110;
                    else
                        begin
                            if (count_10p74s >= 1073999999)
                                begin
                                    count_10p74s <= 0;
                                    TASK <= 4'b0111;
                                end
                            else
                                count_10p74s <= count_10p74s + 1;
                        end
                    if (count_3s >= 300000000)
                        count_3s <= count_3s;
                    else if (count_3s == 299999999)
                        begin
                            if ((left_count + centre_count + right_count) < 9)
                                begin
                                    n_chances <= n_chances - 4;
                                end
                            count_3s <= count_3s + 1;
                        end
                    else
                        count_3s <= count_3s + 1;
                end
            4'b1011:
                begin
                    if (up_count == 1)
                        TASK <= 4'b0110;
                    else
                        begin
                            if (count_10p74s >= 1073999999)
                                begin
                                    count_10p74s <= 0;
                                    TASK <= 4'b0111;
                                end
                            else
                                count_10p74s <= count_10p74s + 1;
                        end
                    if (count_3s >= 300000000)
                        count_3s <= count_3s;
                    else if (count_3s == 299999999)
                        begin
                            if ((left_count + centre_count + right_count) < 9)
                                begin
                                    n_chances <= n_chances - 4;
                                end
                            count_3s <= count_3s + 1;
                        end
                    else
                        count_3s <= count_3s + 1;
                end
            default: TASK <= TASK;
        endcase
    end
    
    always @ (posedge clk_50Hz)
    begin
        case (TASK)
            4'b0110:
                begin
                    previous <= 0;
                    up_count <= 0;
                    left_flag <= 0;
                    centre_flag <= 0;
                    right_flag <= 0;
                end
            4'b0111:
                begin
                    if (left_press == 1)
                        begin
                            if (left_count == 3)
                                left_flag <= 1;
                            else if (((left_count - centre_count) == 1) || ((left_count - right_count) == 1))
                                left_flag <= 1;
                            else if (previous == 1)
                                left_flag <= 1;
                            else
                                begin
                                    left_count <= left_count + 1;
                                    previous <= 1;
                                end
                        end
                    else if (centre_press == 1)
                        begin
                            if (centre_count == 3)
                                centre_flag <= 1;
                            else if (((centre_count - left_count) == 1) || ((centre_count - right_count) == 1))
                                centre_flag <= 1;
                            else if (previous == 2)
                                centre_flag <= 1;
                            else
                                begin
                                    centre_count <= centre_count + 1;
                                    previous <= 2;
                                end
                        end
                    else if (right_press == 1)
                        begin
                            if (right_count == 3)
                                right_flag <= 1;
                            else if (((right_count - left_count) == 1) || ((right_count - centre_count) == 1))
                                right_flag <= 1;
                            else if (previous == 3)
                                right_flag <= 1;
                            else
                                begin
                                    right_count <= right_count + 1;
                                    previous <= 3;
                                end
                        end
                    else if (up_press == 1)
                        begin
                            left_count <= 0;
                            centre_count <= 0;
                            right_count <= 0;
                            up_count <= 1;
                        end
                end
            4'b1000:
                begin
                    if (up_press == 1)
                        begin
                            left_count <= 0;
                            centre_count <= 0;
                            right_count <= 0;
                            up_count <= 1;
                        end
                end
            4'b1001:
                begin
                    left_flag <= 0;
                    if (up_press == 1)
                        begin
                            left_count <= 0;
                            centre_count <= 0;
                            right_count <= 0;
                            up_count <= 1;
                        end
                end
            4'b1010:
                begin
                    centre_flag <= 0;
                    if (up_press == 1)
                        begin
                            left_count <= 0;
                            centre_count <= 0;
                            right_count <= 0;
                            up_count <= 1;
                        end
                end
            4'b1011:
                begin
                    right_flag <= 0;
                    if (up_press == 1)
                        begin
                            left_count <= 0;
                            centre_count <= 0;
                            right_count <= 0;
                            up_count <= 1;
                        end
                end
        endcase
    end
   
    
    always @ (posedge CLOCK)
    begin
        if (TASK == 4'b1001)
            begin
                count_1p49hz <= (count_1p49hz == 33557045) ? 0 : count_1p49hz + 1;
                blink[3] <= (count_1p49hz == 0) ? ~blink[3] : blink[3];
            end
        else if (TASK == 4'b1010)
            begin
                count_1p49hz <= (count_1p49hz == 33557045) ? 0 : count_1p49hz + 1;
                blink[2] <= (count_1p49hz == 0) ? ~blink[2] : blink[2];
            end
        else if (TASK == 4'b1011)
            begin
                count_1p49hz <= (count_1p49hz == 33557045) ? 0 : count_1p49hz + 1;
                blink[1] <= (count_1p49hz == 0) ? ~blink[1] : blink[1];
            end
        else
            begin
                count_1p49hz <= 1;
                blink <= 4'b0000;
            end

    end
    
    
endmodule
