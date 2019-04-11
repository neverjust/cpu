`timescale 1ns / 1ps
module pipeif(Pcsrc,Addr,M_bpc,jpc,npc,pc4,Inst);
    input [1:0]Pcsrc;
    input [31:0]Addr,M_bpc,jpc;
    output [31:0]npc,pc4,Inst;
    wire COUT;
    MUX4X32 nextpc(pc4,0,M_bpc,jpc,Pcsrc,npc);    
    //CLA_32 pcplus4(Addr,32'h4,1'b0,pc4,COUT);  
    assign pc4=Addr+4;       
    INSTMEM imem(Addr,Inst);
endmodule
