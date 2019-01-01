`timescale 1ns / 1ps

//PC Incrementor TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module PC_incrementor_tb;

	// Inputs
	reg [9:0] pc_in;

	// Outputs
	wire [9:0] pc_out;

	// Instantiate the Unit Under Test (UUT)
	PC_incrementor uut (
		.pc_in(pc_in), 
		.pc_out(pc_out)
	);

	initial begin
		// Initialize Inputs
		pc_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		pc_in=10'd50;
		
		#10
		pc_in=32'd106;
		
		#10
		pc_in=0;
	end
      
endmodule

