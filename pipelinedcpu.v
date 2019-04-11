`timescale 1ns / 1ps
module pipelinedcpu(Clk,Clrn,Inst,Addr,E_ALUR,M_ALUR,W_ALUR,FwdA,FwdB,E_FwdA,E_FwdB);
    input Clk,Clrn;
    output [31:0]Inst,Addr,E_ALUR,M_ALUR,W_ALUR;
    wire [31:0]M_FwdB_out,M_Dout,W_Din;
    output [1:0]FwdA,FwdB,E_FwdA,E_FwdB;
    wire [31:0]npc,M_bpc,jpc,pc4,D_pc4,D_Inst,immediate,qa,qb,E_pc4,E_qa,E_qb,E_immediate,E_bpc,E_ALUR,E_FwdB_out,W_ALUR,W_Dout;
    wire we_irid,M_Z,E_Wreg,M_Wreg,E_Reg2reg,W_Wreg,Wreg,Aluqb,Wmem,Reg2reg,E_Wmem,E_Aluqb,E_Z,M_Reg2reg,M_Wmem,W_Reg2reg;
    wire [1:0]Pcsrc,Aluc,E_Aluc;
    wire [4:0]E_Rd,M_Rd,W_Rd,I_Rd;
    wire [5:0]M_Op,Op,E_Op;
    
    pipepc i0(npc,we_irid,Clk,Clrn,Addr);
    pipeif i1(Pcsrc,Addr,M_bpc,jpc,npc,pc4,Inst);
    pipe_irid_reg i2(pc4,Inst,we_irid,Clk,Clrn,D_pc4,D_Inst);
    pipeid i3(Clk,Clrn,D_pc4,D_Inst,E_Rd,M_Rd,M_Op,M_Z,E_Wreg,M_Wreg,E_Reg2reg,W_Wreg,Wreg,Aluqb,Wmem,Reg2reg,we_irid,Aluc,Pcsrc,FwdA,FwdB,jpc,immediate,W_Din,W_Rd,I_Rd,Op,qa,qb);
    pipe_idexe_reg i4(~Clk,Clrn,Wreg,Reg2reg,Wmem,Aluqb,Aluc,FwdA,FwdB,Op,I_Rd,D_pc4,qa,qb,immediate,E_Wreg,E_Reg2reg,E_Wmem,E_Aluqb,E_Op,E_Aluc,E_Rd,E_pc4,E_qa,E_qb,E_immediate,E_FwdA,E_FwdB);
    pipeexe i5(E_Aluqb,E_Aluc,E_pc4,E_qa,E_qb,E_immediate,W_Din,M_ALUR,E_FwdA,E_FwdB,E_bpc,E_ALUR,E_FwdB_out,E_Z);
    pipe_exemem_reg i6(Clk,Clrn,E_Wreg,E_Reg2reg,E_Wmem,E_Z,E_Op,E_bpc,E_ALUR,E_FwdB_out,E_Rd,M_Wreg,M_Reg2reg,M_Wmem,M_Z,M_Op,M_bpc,M_ALUR,M_FwdB_out,M_Rd);
    pipemem i7(Clk,Clrn,M_Wmem,M_ALUR,M_FwdB_out,M_Dout);
    pipe_memwb_reg i8(Clk,Clrn,M_Wreg,M_Reg2reg,M_ALUR,M_Dout,M_Rd,W_Wreg,W_Reg2reg,W_ALUR,W_Dout,W_Rd);
    pipewb i9(W_Reg2reg,W_ALUR,W_Dout,W_Din);
endmodule
