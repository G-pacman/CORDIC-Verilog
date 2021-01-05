`timescale 1ns / 1ps

module lab7_fsm(clk, theta, resetbtn, calcbtn, x, y, z, st);
input clk, resetbtn, calcbtn;
input [15:0] theta;
output reg [15:0] x, y, z;
output [2:0] st;

parameter initstate = 2'b00, waitstate = 2'b01, calcstate = 2'b11, downstate = 2'b10;

reg [15:0] tan_rom [15:0];
reg [1:0] state = initstate, nextstate = initstate;
//reg [15:0] x, y, z;
reg xsign, ysign, zsign, xcin, ycin, zcin;
wire xsum, ysum, zsum, xcout, ycout, zcout;
reg [4:0] count, i;
reg inc_count;

// output
assign st = state;

// adders
full_adder ADDX(xcout, xsum, x[0], ((count + i) > 15) ? ysign : y[count] , (i == 5'b0)? ~zsign: xcin , ~zsign);
full_adder ADDY(ycout, ysum, y[0], ((count + i) > 15) ? xsign : x[count], (i == 5'b0)? zsign : ycin, zsign);
full_adder ADDZ(zcout, zsum, z[0], tan_rom[count][i] , (i == 5'b0) ? ~zsign  : zcin , ~zsign);


initial begin
    // two points for number. 14 to represent fraction
    // number 0.607253 = 00.1001 1011 0111 01
    x <= 16'b0010_0110_1101_1101; // Kn val
    y <= 16'b0000_0000_0000_0000;
    z <= theta;

    tan_rom[0] = 16'b0011001001000011;
    tan_rom[1] = 16'b0001110110101100;
    tan_rom[2] = 16'b0000111110101101;
    tan_rom[3] = 16'b0000011111110101;
    tan_rom[4] = 16'b0000001111111110;
    tan_rom[5] = 16'b0000000111111111;
    tan_rom[6] = 16'b0000000011111111;
    tan_rom[7] = 16'b0000000001111111;
    tan_rom[8] = 16'b0000000000111111;
    tan_rom[9] = 16'b0000000000011111;
    tan_rom[10] = 16'b0000000000001111;
    tan_rom[11] = 16'b0000000000000111;
    tan_rom[12] = 16'b0000000000000011;
    tan_rom[13] = 16'b0000000000000001;
    tan_rom[14] = 16'b0000000000000000;
    tan_rom[15] = 16'b0000000000000000;
end


always @(posedge clk) begin

    if(resetbtn) begin
        state <= initstate;
    end else
        state <= nextstate;

  case(state)
    initstate: begin
      {xsign, ysign} <= 1'b0;
      {xcin, ycin, zcin} <= 1'b0;
      x <= 16'b0010011011011101;
      y <= 16'b0000000000000000;
      z <= theta;
      inc_count <= 1'b0;
      count <= 5'b0  ;
      i <= 5'b0  ;
    end
    
    waitstate: begin
      zsign <= z[15];
      xsign <= x[15];
      ysign <= y[15];
      i <= 5'b0;
        if(inc_count) begin
            count <= count + 5'b00001;
            inc_count <= 1'b0;
        end
    end

    calcstate: begin
      inc_count <= 1'b1;
      i <= i + 1'b1;
      z[15:0] <= {zsum,z[15:1] };
      x[15:0] <= {xsum,x[15:1] };
      y[15:0] <= {ysum,y[15:1] };
      xcin <= xcout;
      ycin <= ycout;
      zcin <= zcout;
    end
    
  endcase
end

always @* begin
  case(state)
    initstate: begin
      	nextstate = waitstate;
    end
    
    waitstate: begin
        if(calcbtn)
          nextstate = downstate;
        else
        	nextstate = waitstate;
      end
      
    calcstate: begin
        if(i < 15) 
          nextstate = calcstate;
        else
         nextstate = waitstate;
      end
      
      downstate: begin
        if(calcbtn)
            nextstate = downstate;
        else
          nextstate = calcstate;
      end
  endcase
end

endmodule
