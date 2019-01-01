`timescale 1ns / 1ps

// Implementation of Program Counter TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module PC_tb;

	// Inputs
	reg clk;
	reg [9:0] pc_in;

	// Outputs
	wire [9:0] pc_out;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.pc_in(pc_in), 
		.pc_out(pc_out)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		pc_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		pc_in=10'd25;
		
		#10
		pc_in=10'd32;   //To depict that if pc_in changes before clock posedge, still pc_out will change only after the clock posedge
		
		
	end
   always
		#10 clk=!clk;
endmodule

