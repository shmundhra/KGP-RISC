`timescale 1ns / 1ps

//Instruction Memory TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module inst_mem_tb;

	// Inputs
	reg clka;
	reg [9:0] addra;
	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		@(posedge clka)
		addra=10'd5;
		
		#20
		addra=10'b0;
		
		#20;
		addra=10'd8;
		
				
	end
     
	 always
		#10 clka=!clka;
endmodule

