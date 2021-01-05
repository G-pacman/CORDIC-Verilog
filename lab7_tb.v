`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2020 12:57:07 PM
// Design Name: 
// Module Name: lab7_tb
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


module lab7_tb(
    );
    reg clk = 0, resetbtn = 0, calcbtn = 0; // inputs
    reg [15:0] theta = 0; // inputs
    wire [15:0] xout, yout, zout; // outputs
    wire [2:0] st;
    
    parameter p = 50;

    lab7_fsm TEST(clk, theta, resetbtn, calcbtn, xout, yout, zout, st);
    
    always #1 clk = ~clk;
    
    // stimulus (inputs)
    initial begin
        //theta = 16'b0110_0100_1000_0111;    //pi/2 1.57079632679
        theta = 16'b0100001100000101;       //pi/3  1.0471975512 
        #5 resetbtn = 1; #5 resetbtn = 0;
        #5 calcbtn = 1; #5 calcbtn = 0; // first press
        #p calcbtn = 1; #5 calcbtn = 0; // second press
        #p calcbtn = 1; #5 calcbtn = 0; // 3rd
        #p calcbtn = 1; #5 calcbtn = 0; // 4th
        #p calcbtn = 1; #5 calcbtn = 0; // 5
        #p calcbtn = 1; #5 calcbtn = 0; // 6
        #p calcbtn = 1; #5 calcbtn = 0; // 7
        #p calcbtn = 1; #5 calcbtn = 0; // 8
        #p calcbtn = 1; #5 calcbtn = 0; // 9
        #p calcbtn = 1; #5 calcbtn = 0; // 10
        #p calcbtn = 1; #5 calcbtn = 0; // 11
        #p calcbtn = 1; #5 calcbtn = 0; // 12
        #p calcbtn = 1; #5 calcbtn = 0; // 13
        #p calcbtn = 1; #5 calcbtn = 0; // 14
        #p calcbtn = 1; #5 calcbtn = 0; // 15
        #p calcbtn = 1; #5 calcbtn = 0; // 16
        
        

        #150 $finish;
    end
    
endmodule