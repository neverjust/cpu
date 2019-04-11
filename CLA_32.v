`timescale 1ns / 1ps
module CLA_32(X,Y,Cin,S);
    input[31:0]X,Y;
    input Cin;
    output[31:0]S;
    //output Cout;
    assign S = X + Y + Cin;
endmodule
