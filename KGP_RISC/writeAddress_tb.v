`timescale 1ns / 1ps

//Write Address/Data/Flag TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra


module writeAddress_tb;

	// Inputs
	reg [2:0] opcode;
	reg [3:0] fcode;
	reg [4:0] rsAddr;
	reg [31:0] ALUOut;
	reg [31:0] ra;
	reg [31:0] MemOut;

	// Outputs
	wire [4:0] wrAddr;
	wire RegWrite;
	wire [31:0] wrData;

	// Instantiate the Unit Under Test (UUT)
	writeAddress uut (
		.opcode(opcode), 
		.fcode(fcode), 
		.rsAddr(rsAddr), 
		.ALUOut(ALUOut), 
		.ra(ra), 
		.MemOut(MemOut), 
		.wrAddr(wrAddr), 
		.RegWrite(RegWrite), 
		.wrData(wrData)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		fcode = 0;
		rsAddr = 0;
		ALUOut = 0;
		ra = 0;
		MemOut = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		ALUOut=31'd10;
		ra=31'd11;
		MemOut=31'd12;
		rsAddr=5'd3;
		
		opcode=3'b0;
		fcode=4'b0;
		
		#20
		fcode=3'b1;
		
		#20
		opcode=3'b1;
		
		#20
		opcode=3'd3;
		fcode=4'd9;
		
		#20
		opcode=3'd2;
		fcode=4'b0;
		
	end
      
endmodule

