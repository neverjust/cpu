`timescale 1ns / 1ps
module pipewb(W_Reg2reg,W_ALUR,W_Dout,W_Din);
    input W_Reg2reg;
    input [31:0]W_ALUR,W_Dout;
    output [31:0]W_Din;
    MUX2X32 i0(W_Dout,W_ALUR,W_Reg2reg,W_Din);      
endmodule