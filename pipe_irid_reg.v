`timescale 1ns / 1ps
module pipe_irid_reg(pc4,Inst,we_irid,Clk,Clrn,D_pc4,D_Inst);
    input [31:0]pc4,Inst;
    input we_irid,Clk,Clrn;//we_irid就是控制信号里面的stall
    output [31:0]D_pc4,D_Inst;

    dffe32 ifid_pc4(pc4,Clk,Clrn,we_irid,D_pc4);
    dffe32 ifid_Inst(Inst,Clk,Clrn,we_irid,D_Inst);
endmodule
