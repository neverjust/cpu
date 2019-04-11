`timescale 1ns / 1ps
module pipe_idexe_reg(Clk,Clrn,Wreg,Reg2reg,Wmem,Aluqb,Aluc,FwdA,FwdB,Op,I_Rd,D_pc4,qa,qb,immediate,E_Wreg,E_Reg2reg,E_Wmem,E_Aluqb,E_Op,E_Aluc,E_Rd,E_pc4,E_qa,E_qb,E_immediate,E_FwdA,E_FwdB);
    input Clk,Clrn;
    input Wreg,Reg2reg,Wmem,Aluqb;
    input [1:0]Aluc,FwdA,FwdB;
    input [5:0]Op;
    input [4:0]I_Rd;
    input [31:0]D_pc4,qa,qb,immediate;
    output reg E_Wreg,E_Reg2reg,E_Wmem,E_Aluqb;
    output reg [5:0]E_Op;
    output reg [1:0]E_Aluc;
    output reg [4:0]E_Rd;
    output reg [31:0]E_pc4,E_qa,E_qb,E_immediate;
    output reg [1:0]E_FwdA,E_FwdB;
    always@ (posedge Clk or negedge Clrn)
        if(Clrn==0)begin
            E_Wreg<=0;     E_Reg2reg<=0;
            E_Wmem<=0;     E_Aluqb  <=0;
            E_Op  <=0;     E_Aluc   <=0;
            E_Rd  <=0;     E_pc4    <=0;
            E_qa  <=0;     E_qb     <=0;
            E_FwdA<=0;     E_FwdB   <=0;
            E_immediate<=0;
        end else begin
            E_Wreg<=Wreg;       E_Reg2reg<=Reg2reg;
            E_Wmem<=Wmem;       E_Aluqb<=Aluqb;
            E_Op<=Op;           E_Aluc<=Aluc;
            E_Rd<=I_Rd;         E_pc4<=D_pc4;
            E_qa<=qa;           E_qb<=qb;
            E_FwdA<=FwdA;       E_FwdB<=FwdB;
            E_immediate<=immediate;
        end
endmodule
