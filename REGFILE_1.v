`timescale 1ns / 1ps
module REGFILE_1(rna,rnb,d,wn,we,clk,Clrn,qa,qb);
    input [4:0]rna,rnb,wn;
    input [31:0]d;
    input we,clk,Clrn;
    output [31:0]qa,qb;
    reg [31:0]register [1:31];
    integer i;
    assign qa=(rna==0)?0:register[rna];
    assign qb=(rnb==0)?0:register[rnb];
    always @(posedge clk or negedge Clrn) begin       //将写入操作变成下降沿
        if(Clrn == 0) begin
            for(i=1;i<32;i=i+1)
                register[i]<=32'h0;
        end else if ((wn!=0)&&we)
            register[wn]<=d;
        end
endmodule
