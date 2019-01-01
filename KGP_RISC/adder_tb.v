`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:22:31 10/03/2018
// Design Name:   adder
// Module Name:   C:/Users/student/Desktop/Group 56/KGP_RISC/adder_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg cin;

	// Outputs
	wire [31:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a=32'd205;
		b=32'd102;
		
		#10
		a=32'd1105;
		b=-11;
		
		#10
		a=-1105;
		b=-11;
	end
      
endmodule

