`timescale 1ns / 1ps
module pipe_CONUNIT(Op,M_Op,Func,M_Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg,E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt,FwdA,FwdB,E_Reg2reg,stall);
    input [5:0]Op,Func,M_Op;
    input M_Z;
    input E_Wreg,M_Wreg,E_Reg2reg;
    input [4:0]E_Rd,M_Rd,Rs,Rt;
    output Regrt,Se,Wreg,Aluqb,Wmem,Reg2reg,stall;
    output [1:0]Pcsrc,Aluc;
    output reg [1:0]FwdA,FwdB;
    wire R_type=~|Op;
    wire I_add=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&~Func[1]&~Func[0];
    wire I_sub=R_type&Func[5]&~Func[4]&~Func[3]&~Func[2]&Func[1]&~Func[0];
    wire I_and=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&~Func[0];
    wire I_or=R_type&Func[5]&~Func[4]&~Func[3]&Func[2]&~Func[1]&Func[0];
    wire I_addi=~Op[5]&~Op[4]&Op[3]&~Op[2]&~Op[1]&~Op[0];
    wire I_andi=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&~Op[0];
    wire I_ori=~Op[5]&~Op[4]&Op[3]&Op[2]&~Op[1]&Op[0];
    wire I_lw=Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&Op[0];
    wire I_sw=Op[5]&~Op[4]&Op[3]&~Op[2]&Op[1]&Op[0];
    wire I_beq=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&~Op[0];
    wire I_bne=~Op[5]&~Op[4]&~Op[3]&Op[2]&~Op[1]&Op[0];
    wire M_beq=~M_Op[5]&~M_Op[4]&~M_Op[3]&M_Op[2]&~M_Op[1]&~M_Op[0];
    wire M_bne=~M_Op[5]&~M_Op[4]&~M_Op[3]&M_Op[2]&~M_Op[1]&M_Op[0];
    wire I_J=~Op[5]&~Op[4]&~Op[3]&~Op[2]&Op[1]&~Op[0];
    wire E_Inst = I_add|I_sub|I_and|I_or|I_sw|I_beq|I_bne;
    assign Regrt = I_addi|I_andi|I_ori|I_lw|I_sw|I_beq|I_bne|I_J;
    assign Se = I_addi|I_lw|I_sw|I_beq|I_bne;
    assign Wreg = I_add|I_sub|I_and|I_or|I_addi|I_andi|I_ori|I_lw;
    assign Aluqb = I_add|I_sub|I_and|I_or|I_beq|I_bne|I_J;
    assign Aluc[1] = I_and|I_or|I_andi|I_ori;
    assign Aluc[0] = I_sub|I_or|I_ori|I_beq|I_bne;
    assign Wmem = I_sw;
    assign Pcsrc[1] = (M_beq&M_Z)|(M_bne&~M_Z)|I_J;
    assign Pcsrc[0] = I_J;
    assign Reg2reg = I_add|I_sub|I_and|I_or|I_addi|I_andi|I_ori|I_sw|I_beq|I_bne|I_J;
    always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt)begin
        FwdA=2'b00;//默认的选择；
        if((Rs==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin
            FwdA=2'b10;//和EX级指令存在数据冒险；
        end else begin
            if((Rs==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin
                FwdA=2'b01;//和MEM级指令存在数据冒险；
            end
        end
        end
    always@(E_Rd,M_Rd,E_Wreg,M_Wreg,Rs,Rt)begin
        FwdB=2'b00;//默认的选择；
        if((Rt==E_Rd)&(E_Rd!=0)&(E_Wreg==1))begin
                   FwdB=2'b10;//和EX级指令存在数据冒险；
        end else begin
            if((Rt==M_Rd)&(M_Rd!=0)&(M_Wreg==1))begin
                FwdB=2'b01;//和MEM级指令存在数据冒险；
            end
        end
    end
    assign stall=((Rs==E_Rd)|(Rt==E_Rd))&(E_Reg2reg==0)&(E_Rd!=0)&(E_Wreg==1);
endmodule
