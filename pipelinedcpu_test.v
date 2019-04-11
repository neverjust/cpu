`timescale 1ns / 1ps
module pipelinedcpu_test;
    reg Clk,Clrn;
    wire [31:0]Inst,Addr,E_ALUR,M_ALUR,W_ALUR,FwdA,FwdB,E_FwdA,E_FwdB;
    pipelinedcpu uut(.Clk(Clk),.Clrn(Clrn),.Inst(Inst),.Addr(Addr),.E_ALUR(E_ALUR),.M_ALUR(M_ALUR),.W_ALUR(W_ALUR),.FwdA(FwdA),.FwdB(FwdB),.E_FwdA(E_FwdA),.E_FwdB(E_FwdB));
    initial begin
    Clk=0;
    Clrn=0;
    #10;
    Clrn=1;
    end
    always begin
    #20;
    Clk=~Clk;
    end
endmodule
