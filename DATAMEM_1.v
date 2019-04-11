`timescale 1ns / 1ps
module DATAMEM_1(Addr,Din,Clk,We,Dout);
    input [31:0]Addr,Din;
    input Clk,We;
    output [31:0]Dout;
    reg [31:0]ram[0:31];
    assign Dout=ram[Addr[6:2]];
    always @ (posedge Clk) begin
        if(We) ram[Addr[6:2]]<=Din;
    end
    integer i;
    initial begin
    for(i=0;i<32;i=i+1)
    ram[i]<=32'h0;
    end
endmodule
