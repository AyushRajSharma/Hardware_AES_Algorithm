`timescale 1ns / 1ps

module invMixcolumn(a,mxclm);
input [127:0] a;

output [127:0] mxclm;

// mixcolomn32 call intermid1 and intermid1 will call intermid

assign mxclm[127:120]= mixcolumn32(intermid1( intermid(a[127:120],a[119:112],a[111:104],a[103:96]), 9'b100011011));
assign mxclm[119:112]= mixcolumn32(intermid1( intermid(a[119:112],a[111:104],a[103:96],a[127:120]), 9'b100011011));
assign mxclm[111:104]= mixcolumn32(intermid1( intermid(a[111:104],a[103:96],a[127:120],a[119:112]), 9'b100011011));
assign mxclm[103:96]= mixcolumn32(intermid1( intermid(a[103:96],a[127:120],a[119:112],a[111:104]), 9'b100011011));

assign mxclm[95:88]= mixcolumn32(intermid1( intermid(a[95:88],a[87:80],a[79:72],a[71:64]), 9'b100011011));
assign mxclm[87:80]= mixcolumn32(intermid1( intermid(a[87:80],a[79:72],a[71:64],a[95:88]), 9'b100011011));
assign mxclm[79:72]= mixcolumn32(intermid1( intermid(a[79:72],a[71:64],a[95:88],a[87:80]), 9'b100011011));
assign mxclm[71:64]= mixcolumn32(intermid1( intermid(a[71:64],a[95:88],a[87:80],a[79:72]), 9'b100011011));

assign mxclm[63:56]= mixcolumn32(intermid1( intermid(a[63:56],a[55:48],a[47:40],a[39:32]), 9'b100011011));
assign mxclm[55:48]= mixcolumn32(intermid1( intermid(a[55:48],a[47:40],a[39:32],a[63:56]), 9'b100011011));
assign mxclm[47:40]= mixcolumn32(intermid1( intermid(a[47:40],a[39:32],a[63:56],a[55:48]), 9'b100011011));
assign mxclm[39:32]= mixcolumn32(intermid1( intermid(a[39:32],a[63:56],a[55:48],a[47:40]), 9'b100011011));

assign mxclm[31:24]= mixcolumn32(intermid1( intermid(a[31:24],a[23:16],a[15:8],a[7:0]), 9'b100011011));
assign mxclm[23:16]= mixcolumn32(intermid1( intermid(a[23:16],a[15:8],a[7:0],a[31:24]), 9'b100011011));
assign mxclm[15:8]= mixcolumn32(intermid1( intermid(a[15:8],a[7:0],a[31:24],a[23:16]), 9'b100011011));
assign mxclm[7:0]= mixcolumn32(intermid1( intermid(a[7:0],a[31:24],a[23:16],a[15:8]), 9'b100011011));



function [43:0] intermid;
input [7:0] i1,i2,i3,i4;

begin
    intermid[43] = i1[7];
    intermid[42] = i1[6] ^ i1[7];
    intermid[41] = i1[6] ^ i1[7] ^ i1[5];
    intermid[40] = i1[6] ^ i1[4] ^ i1[5];
    intermid[39] = i1[4] ^ i1[3] ^ i1[5];
    intermid[38] = i1[4] ^ i1[3] ^ i1[2];
    intermid[37] = i1[3] ^ i1[2] ^ i1[1];
    intermid[36] = i1[2] ^ i1[1] ^ i1[0];
    intermid[35] = i1[6] ^ i1[7] ^ i1[5];
    intermid[34] = i1[0];
    intermid[33] = 0;

    
    intermid[32] = i2[7];
    intermid[31] = i2[6];
    intermid[30] = i2[5] ^ i2[7];
    intermid[29] = i2[4] ^ i2[6] ^ i2[7];
    intermid[28] = i2[3] ^ i2[5] ^ i2[6];
    intermid[27] = i2[2] ^ i2[4] ^ i2[5];
    intermid[26] = i2[1] ^ i2[3] ^ i2[4];
    intermid[25] = i2[0] ^ i2[2] ^ i2[3];
    intermid[24] = i2[1] ^ i2[2];
    intermid[23] = i2[0] ^ i2[1];
    intermid[22] = i2[0] ;

    intermid[21] = i3[7];
    intermid[20] = i3[6] ^ i3[7];
    intermid[19] = i3[5] ^ i3[6];
    intermid[18] = i3[4] ^ i3[5] ^ i3[7];
    intermid[17] = i3[3] ^ i3[4] ^ i3[6];
    intermid[16] = i3[2] ^ i3[3] ^ i3[5];
    intermid[15] = i3[1] ^ i3[2] ^ i3[4];
    intermid[14] = i3[0] ^ i3[1] ^ i3[3];
    intermid[13] = i3[0] ^ i3[2];
    intermid[12] = i3[1];
    intermid[11] = i3[0] ;

    intermid[10] = i4[7];
    intermid[9] = i4[6];
    intermid[8] = i4[5];
    intermid[7] = i4[4] ^ i4[7] ;
    intermid[6] = i4[3] ^ i4[6];
    intermid[5] = i4[2] ^ i4[5];
    intermid[4] = i4[1] ^ i4[4];
    intermid[3] = i4[0] ^ i4[3];
    intermid[2] = i4[2];
    intermid[1] = i4[1];
    intermid[0] = i4[0] ;

end


endfunction

function [31:0] intermid1;
    input [43:0] i1 ;
    input  [7:0] a;
    begin
        intermid1[31:24] = i1[43:33] % a;
        intermid1[23:16] = i1[32:22] % a;
        intermid1[15:8] = i1[21:11] % a;
        intermid1[7:0] = i1[10:0] % a;
    end
endfunction

function [7:0] mixcolumn32;
    input [31:0] i1;
    begin
        mixcolumn32[7]=i1[7] ^ i1[15] ^ i1[23] ^ i1[31];
        mixcolumn32[6]=i1[6] ^ i1[14] ^ i1[22] ^ i1[30];
        mixcolumn32[5]=i1[5] ^ i1[13] ^ i1[21] ^ i1[29];
        mixcolumn32[4]=i1[4] ^ i1[12] ^ i1[20] ^ i1[28];
        mixcolumn32[3]=i1[3] ^ i1[11] ^ i1[19] ^ i1[27];
        mixcolumn32[2]=i1[2] ^ i1[10] ^ i1[18] ^ i1[26];
        mixcolumn32[1]=i1[1] ^ i1[9] ^ i1[17] ^ i1[25];
        mixcolumn32[0]=i1[0] ^ i1[8] ^ i1[16] ^ i1[24];
    end
    
endfunction


endmodule
