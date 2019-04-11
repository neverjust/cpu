`timescale 1ns / 1ps
module pipeexe(E_Aluqb,E_Aluc,E_pc4,E_qa,E_qb,E_immediate,W_Din,M_ALUR,E_FwdA,E_FwdB,E_bpc,E_ALUR,E_FwdB_out,E_Z);
    input E_Aluqb;
    input [1:0]E_Aluc;
    input [31:0]E_pc4,E_qa,E_qb,E_immediate,W_Din,M_ALUR;
    input [1:0]E_FwdA,E_FwdB;
    output [31:0]E_bpc,E_ALUR,E_FwdB_out;
    output E_Z;
    wire [31:0]E_beqbne_imm;
    wire [31:0]A3,ALU_X1,ALU_Y1;
    assign E_beqbne_imm=E_immediate<<2;//将立即数左移两位
    CLA_32 pc4_imm(E_pc4,E_beqbne_imm,1'b0,E_bpc);//再与PC+4相加
    MUX4X32 ALU_X(E_qa,W_Din,M_ALUR,A3,E_FwdA,ALU_X1);
    MUX4X32 ALU_Y(E_qb,W_Din,M_ALUR,A3,E_FwdB,E_FwdB_out);
    MUX2X32 alu_b(E_immediate,E_FwdB_out,E_Aluqb,ALU_Y1);
    ALU ii0(ALU_X1,ALU_Y1,E_Aluc,E_ALUR,E_Z);
endmodule
