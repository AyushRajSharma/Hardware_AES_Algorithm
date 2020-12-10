`timescale 1ns / 1ps
`include "aesEncryption.v"
`include "rounds.v"
`include "roundlast.v"
`include "KeyGeneration.v"
`include "subbytes.v"
`include "shiftrow.v"
`include "mixcolumn.v"
`include "sbox.v"

module AES_TOP(clk,finalout);
    input clk;
    output [127:0] finalout;

wire [127:0] tempout;

aesEncryption u1(.clk(clk),.datain(128'h 54776f204f6e65204e696e652054776f),.key(128'h 5468617473206d79204b756e67204675),.dataout(tempout));

assign finalout = tempout;

endmodule

// tb

module AES_TB;

	// Inputs
	reg clk;

	// Outputs
	wire [127:0] finalout;

	// Instantiate the Unit Under Test (UUT)
	AES_TOP uut (
		.clk(clk), 
		.finalout(finalout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
        $display("cipher : %h ",finalout);
		// Add stimulus here

	end
      
endmodule
