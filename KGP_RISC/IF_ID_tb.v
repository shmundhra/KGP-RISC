`timescale 1ns / 1ps

//IF_ID TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module IF_ID_tb;

	// Inputs
	reg reset;
	reg clk;
	reg [31:0] instIn;
	reg [9:0] NPCIn;

	// Outputs
	wire [31:0] instOut;
	wire [9:0] NPCOut;

	// Instantiate the Unit Under Test (UUT)
	IF_ID uut (
		.reset(reset),
		.clk(clk), 
		.instIn(instIn), 
		.NPCIn(NPCIn), 
		.instOut(instOut), 
		.NPCOut(NPCOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		instIn = 0;
		NPCIn = 0;
		reset=0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		instIn=32'd50;
		NPCIn=10'd10;
		
		#10
		instIn=32'd10;
		NPCIn=10'd50;
		
	end
    always
		#10 clk=!clk;
endmodule

