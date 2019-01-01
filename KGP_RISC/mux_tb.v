`timescale 1ns / 1ps
//Mux TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module mux_tb;

	// Inputs
	reg [9:0] in0;
	reg [9:0] in1;
	reg sel;

	// Outputs
	wire [9:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux uut (
		.in0(in0), 
		.in1(in1), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in0 = 0;
		in1 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in0=10'd15;
		in1=10'd17;
		sel=1;
		
		#20 
		sel=0;
	end
      
endmodule

