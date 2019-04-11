`timescale 1ns / 1ps
module pipe_exemem_reg(Clk,Clrn,E_Wreg,E_Reg2reg,E_Wmem,E_Z,E_Op,E_bpc,E_ALUR,E_FwdB_out,E_Rd,M_Wreg,M_Reg2reg,M_Wmem,M_Z,M_Op,M_bpc,M_ALUR,M_FwdB_out,M_Rd);
    input Clk,Clrn;
    input E_Wreg,E_Reg2reg,E_Wmem,E_Z;
    input [5:0]E_Op;
    input [31:0]E_bpc,E_ALUR,E_FwdB_out;
    input [4:0]E_Rd;
    output reg M_Wreg,M_Reg2reg,M_Wmem,M_Z;
    output reg [5:0]M_Op;
    output reg [31:0]M_bpc,M_ALUR,M_FwdB_out;
    output reg [4:0]M_Rd;
    always@ (posedge Clk or negedge Clrn)
        if(Clrn==0)begin
            M_Wreg<=0;          M_Reg2reg<=0;
            M_Wmem<=0;          M_Z<=0;
            M_Op<=0;            M_bpc<=0;
            M_ALUR<=0;          M_FwdB_out<=0;
            M_Rd<=0;
        end else begin
            M_Wreg<=E_Wreg;          M_Reg2reg<=E_Reg2reg;
            M_Wmem<=E_Wmem;          M_Z<=E_Z;
            M_Op<=E_Op;              M_bpc<=E_bpc;
            M_ALUR<=E_ALUR;          M_FwdB_out<=E_FwdB_out;
            M_Rd<=E_Rd;
        end
endmodule
