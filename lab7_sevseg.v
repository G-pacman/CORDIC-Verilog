`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2020 10:36:56 AM
// Design Name: 
// Module Name: lab7_sevseg
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


module lab7_sevseg(
    input clk,
    input [15:0] displaychar,
    output reg [7:0] seg,
    output reg [3:0] an
    );
    
reg [1:0] counter;
        
always @ (posedge clk) begin
    counter <= counter + 2'b01;
end

always @ (*) begin
  case(counter)
    2'b00: begin 
        an = 4'b1110;
        case(displaychar[3:0])
            4'b0000 : seg = 8'b100_00001; //0
            4'b0001 : seg = 8'b100_00001; //1
            4'b0010 : seg = 8'b010_01001; //2
            4'b0011 : seg = 8'b011_00001; //3
            4'b0100 : seg = 8'b001_10001; //4
            4'b0101 : seg = 8'b001_00101; //5
            4'b0110 : seg = 8'b000_00101; //6
            4'b0111 : seg = 8'b111_10001; //7
            4'b1000 : seg = 8'b000_00001; //8
            4'b1001 : seg = 8'b001_10001; //9
            4'b1010 : seg = 8'b000_10001; //A
            4'b1011 : seg = 8'b000_00111; //b
            4'b1100 : seg = 8'b010_01111; //c
            4'b1101 : seg = 8'b010_00011; //d
            4'b1110 : seg = 8'b000_01101; //E
            4'b1111 : seg = 8'b000_11101; //F
       endcase
    end
    2'b01: begin 
        an = 4'b1101;
        case(displaychar[7:4])
                    4'b0000 : seg = 8'b100_00001; //0
                    4'b0001 : seg = 8'b100_00001; //1
                    4'b0010 : seg = 8'b010_01001; //2
                    4'b0011 : seg = 8'b011_00001; //3
                    4'b0100 : seg = 8'b001_10001; //4
                    4'b0101 : seg = 8'b001_00101; //5
                    4'b0110 : seg = 8'b000_00101; //6
                    4'b0111 : seg = 8'b111_10001; //7
                    4'b1000 : seg = 8'b000_00001; //8
                    4'b1001 : seg = 8'b001_10001; //9
                    4'b1010 : seg = 8'b000_10001; //A
                    4'b1011 : seg = 8'b000_00111; //b
                    4'b1100 : seg = 8'b010_01111; //c
                    4'b1101 : seg = 8'b010_00011; //d
                    4'b1110 : seg = 8'b000_01101; //E
                    4'b1111 : seg = 8'b000_11101; //F
               endcase
    end
    2'b10: begin 
        an = 4'b1011;
        case(displaychar[11:8])
                    4'b0000 : seg = 8'b100_00001; //0
                    4'b0001 : seg = 8'b100_00001; //1
                    4'b0010 : seg = 8'b010_01001; //2
                    4'b0011 : seg = 8'b011_00001; //3
                    4'b0100 : seg = 8'b001_10001; //4
                    4'b0101 : seg = 8'b001_00101; //5
                    4'b0110 : seg = 8'b000_00101; //6
                    4'b0111 : seg = 8'b111_10001; //7
                    4'b1000 : seg = 8'b000_00001; //8
                    4'b1001 : seg = 8'b001_10001; //9
                    4'b1010 : seg = 8'b000_10001; //A
                    4'b1011 : seg = 8'b000_00111; //b
                    4'b1100 : seg = 8'b010_01111; //c
                    4'b1101 : seg = 8'b010_00011; //d
                    4'b1110 : seg = 8'b000_01101; //E
                    4'b1111 : seg = 8'b000_11101; //F
               endcase
    end
    2'b11: begin 
        an = 4'b0111;
        case(displaychar[15:12])
                    4'b0000 : seg = 8'b100_00001; //0
                    4'b0001 : seg = 8'b100_00001; //1
                    4'b0010 : seg = 8'b010_01001; //2
                    4'b0011 : seg = 8'b011_00001; //3
                    4'b0100 : seg = 8'b001_10001; //4
                    4'b0101 : seg = 8'b001_00101; //5
                    4'b0110 : seg = 8'b000_00101; //6
                    4'b0111 : seg = 8'b111_10001; //7
                    4'b1000 : seg = 8'b000_00001; //8
                    4'b1001 : seg = 8'b001_10001; //9
                    4'b1010 : seg = 8'b000_10001; //A
                    4'b1011 : seg = 8'b000_00111; //b
                    4'b1100 : seg = 8'b010_01111; //c
                    4'b1101 : seg = 8'b010_00011; //d
                    4'b1110 : seg = 8'b000_01101; //E
                    4'b1111 : seg = 8'b000_11101; //F
               endcase
    end
  endcase
end // always block

endmodule
