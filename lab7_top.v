`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2020 12:55:42 PM
// Design Name: 
// Module Name: lab7_top
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


module lab7_top(
    input clk,
    input [15:0] sw,
    input [1:0] btn,
    //output [15:0] q, // leds use if neededs
    output [7:0] seg,
    output [3:0] an
    );
    
    wire [15:0] _displaychar;
    wire cout2;
    
    clock_divider #(.timeconst(5)) CDIV2(clk, cout2);
    lab7_fsm FSM(.clk(clk), .theta(sw), .resetbtn(btn[0]), .calcbtn(btn[1]), .x(_displaychar), .y(), .z(), .st());
    lab7_sevseg SEVSEG(.clk(cout2), .displaychar(_displaychar), .seg(seg), .an(an));
    
    /*
    reg [7:0] displaychar1, displaychar2, displaychar3, displaychar4;
    
    assign displaychar[7:0] = displaychar1;
    assign displaychar[15:8] = displaychar2;
    assign displaychar[23:16] = displaychar3;
    assign displaychar[31:24] = displaychar4;
    */
    
endmodule
