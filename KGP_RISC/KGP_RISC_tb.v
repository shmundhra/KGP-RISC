`timescale 1ns / 1ps

//KGP RISC TestBench
//Lovish Chopra 16CS10058
//Himanshu Mundhra 16CS10057

module KGP_RISC_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] rout;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.clk(clk), 
		.reset(reset), 
		.rout(rout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	always
		#1 clk=!clk;
endmodule

