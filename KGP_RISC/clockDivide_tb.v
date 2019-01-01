`timescale 1ns / 1ps



module clockDivide_tb;

	// Inputs
	reg clk;

	// Outputs
	wire clk1;
	wire clk2;

	// Instantiate the Unit Under Test (UUT)
	clockDivide uut (
		.clk(clk), 
		.clk1(clk1), 
		.clk2(clk2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always
		#1 clk=!clk;
endmodule

