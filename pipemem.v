`timescale 1ns / 1ps
module pipemem(Clk,Clrn,M_Wmem,M_ALUR,M_FwdB_out,M_Dout);
    input Clk,Clrn;
    input M_Wmem;
    input [31:0]M_ALUR,M_FwdB_out;
    output [31:0]M_Dout;
    DATAMEM_1 dmem(M_ALUR,M_FwdB_out,Clk,M_Wmem,M_Dout);
endmodule
