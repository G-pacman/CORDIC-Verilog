`timescale 1ns / 1ps

module full_adder(
    output cout,
    output sum,
    input ain,
    input bin,
    input cin,
    input sign
    );
    
//assign sum = ain^bin^cin;
//assign cout= (ain&bin)|(ain&cin)|(bin&cin);

assign sum  = sign^cin^ain^bin;
assign cout = cin & (sign^bin) | ain & (sign^bin) | (cin & ain);

endmodule
