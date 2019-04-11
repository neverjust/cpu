`timescale 1ns / 1ps
module pipepc(d,e,Clk,Clrn,q);
    input [31:0]d;
    input Clk,Clrn,e;
    output reg [31:0]q;
    always @(posedge Clk or negedge Clrn)    
        if(Clrn == 0)begin
              q <= 0 ;
        end else begin
        if(e)
             q<=d;
        end
endmodule