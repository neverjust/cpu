`timescale 1ns / 1ps
module pipeid(Clk,Clrn,D_pc4,D_Inst,E_Rd,M_Rd,M_Op,M_Z,E_Wreg,M_Wreg,E_Reg2reg,W_Wreg,Wreg,Aluqb,Wmem,Reg2reg,we_irid,Aluc,Pcsrc,FwdA,FwdB,jpc,immediate,W_Din,W_Rd,I_Rd,Op,qa,qb);
    input Clk,Clrn;
    input [31:0]D_pc4,D_Inst,W_Din;
    input [4:0]E_Rd,M_Rd,W_Rd;
    input [5:0]M_Op;
    input M_Z,E_Wreg,M_Wreg,E_Reg2reg,W_Wreg;
    output Wreg,Aluqb,Wmem,Reg2reg;
    output we_irid;
    output [1:0]Aluc,Pcsrc;
    output [4:0]I_Rd;
    output [1:0]FwdA,FwdB;
    output [31:0]jpc,immediate;
    output [5:0]Op;
    output [31:0]qa,qb;
    wire [5:0]Func;
    wire [4:0]rs,rt,rd;
    wire Regrt,stall,Se;
    wire e =Se&D_Inst[15];                          
    assign immediate ={{16{e}},D_Inst[15:0]};
    assign Op=D_Inst[31:26];
    assign Func=D_Inst[5:0];
    assign rs=D_Inst[25:21];
    assign rt=D_Inst[20:16];
    assign rd=D_Inst[15:11];
    assign we_irid=~stall;
    pipe_CONUNIT CONUNIT(Op,M_Op,Func,M_Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,E_Rd,M_Rd,E_Wreg,M_Wreg,rs,rt,FwdA,FwdB,E_Reg2reg,stall);
    REGFILE_1 i0(rs,rt,W_Din,W_Rd,W_Wreg,Clk,Clrn,qa,qb);
    MUX2X5 reg_wr(rd,rt,Regrt,I_Rd);
    assign jpc={D_pc4[31:28],D_Inst[25:0],2'b00};
endmodule
