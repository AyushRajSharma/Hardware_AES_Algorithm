

module invsubbytes(data,sb);

input [127:0] data;
output [127:0] sb;

     invsbox q0( .a(data[127:120]),.c(sb[127:120]) );
     invsbox q1( .a(data[119:112]),.c(sb[119:112]) );
     invsbox q2( .a(data[111:104]),.c(sb[111:104]) );
     invsbox q3( .a(data[103:96]),.c(sb[103:96]) );
     
     invsbox q4( .a(data[95:88]),.c(sb[95:88]) );
     invsbox q5( .a(data[87:80]),.c(sb[87:80]) );
     invsbox q6( .a(data[79:72]),.c(sb[79:72]) );
     invsbox q7( .a(data[71:64]),.c(sb[71:64]) );
     
     invsbox q8( .a(data[63:56]),.c(sb[63:56]) );
     invsbox q9( .a(data[55:48]),.c(sb[55:48]) );
     invsbox q10(.a(data[47:40]),.c(sb[47:40]) );
     invsbox q11(.a(data[39:32]),.c(sb[39:32]) );
     
     invsbox q12(.a(data[31:24]),.c(sb[31:24]) );
     invsbox q13(.a(data[23:16]),.c(sb[23:16]) );
     invsbox q14(.a(data[15:8]),.c(sb[15:8]) );
     invsbox q16(.a(data[7:0]),.c(sb[7:0]) );
	  
endmodule

