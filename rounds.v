`timescale 1ns / 1ps

module rounds(clk,rc,data,keyin,keyout,rndout);
input clk;
input [3:0]rc;
input [127:0]data;
input [127:0]keyin;
output [127:0]keyout;
output [127:0]rndout;

wire [127:0] sb,sr,mxclm;

KeyGeneration t0(rc,keyin,keyout);
subbytes t1(data,sb);
shiftrow t2(sb,sr);
mixcolumn t3(sr,mxclm);
assign rndout= keyout^mxclm;

endmodule
