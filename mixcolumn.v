`timescale 1ns / 1ps

module mixcolumn(a,mxclm);
input [127:0] a;
output [127:0] mxclm;



assign mxclm[127:120]= mixcolumn32 (a[127:120],a[119:112],a[111:104],a[103:96]);
assign mxclm[119:112]= mixcolumn32 (a[119:112],a[111:104],a[103:96],a[127:120]);
assign mxclm[111:104]= mixcolumn32 (a[111:104],a[103:96],a[127:120],a[119:112]);
assign mxclm[103:96]= mixcolumn32 (a[103:96],a[127:120],a[119:112],a[111:104]);

assign mxclm[95:88]= mixcolumn32 (a[95:88],a[87:80],a[79:72],a[71:64]);
assign mxclm[87:80]= mixcolumn32 (a[87:80],a[79:72],a[71:64],a[95:88]);
assign mxclm[79:72]= mixcolumn32 (a[79:72],a[71:64],a[95:88],a[87:80]);
assign mxclm[71:64]= mixcolumn32 (a[71:64],a[95:88],a[87:80],a[79:72]);

assign mxclm[63:56]= mixcolumn32 (a[63:56],a[55:48],a[47:40],a[39:32]);
assign mxclm[55:48]= mixcolumn32 (a[55:48],a[47:40],a[39:32],a[63:56]);
assign mxclm[47:40]= mixcolumn32 (a[47:40],a[39:32],a[63:56],a[55:48]);
assign mxclm[39:32]= mixcolumn32 (a[39:32],a[63:56],a[55:48],a[47:40]);

assign mxclm[31:24]= mixcolumn32 (a[31:24],a[23:16],a[15:8],a[7:0]);
assign mxclm[23:16]= mixcolumn32 (a[23:16],a[15:8],a[7:0],a[31:24]);
assign mxclm[15:8]= mixcolumn32 (a[15:8],a[7:0],a[31:24],a[23:16]);
assign mxclm[7:0]= mixcolumn32 (a[7:0],a[31:24],a[23:16],a[15:8]);


function [7:0] mixcolumn32;
input [7:0] i1,i2,i3,i4;
begin
mixcolumn32[7]=i1[6] ^ i2[6] ^ i2[7] ^ i3[7] ^ i4[7];
mixcolumn32[6]=i1[5] ^ i2[5] ^ i2[6] ^ i3[6] ^ i4[6];
mixcolumn32[5]=i1[4] ^ i2[4] ^ i2[5] ^ i3[5] ^ i4[5];
mixcolumn32[4]=i1[3] ^ i1[7] ^ i2[3] ^ i2[4] ^ i2[7] ^ i3[4] ^ i4[4];
mixcolumn32[3]=i1[2] ^ i1[7] ^ i2[2] ^ i2[3] ^ i2[7] ^ i3[3] ^ i4[3];
mixcolumn32[2]=i1[1] ^ i2[1] ^ i2[2] ^ i3[2] ^ i4[2];
mixcolumn32[1]=i1[0] ^ i1[7] ^ i2[0] ^ i2[1] ^ i2[7] ^ i3[1] ^ i4[1];
mixcolumn32[0]=i1[7] ^ i2[7] ^ i2[0] ^ i3[0] ^ i4[0];
end
endfunction
endmodule
