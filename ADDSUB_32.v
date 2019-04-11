`timescale 1ns / 1ps
module ADDSUB_32(X,Y,Sub,S);
    input[31:0]X,Y;
    input Sub;
    output[31:0]S;
    CLA_32 adder0(X,Y^{32{Sub}},Sub,S);
endmodule
