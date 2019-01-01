`timescale 1ns / 1ps

//Handles Branch Cases TestBench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module branch_tb;

	// Inputs
	reg [2:0] opcode;
	reg [3:0] fcode;
	reg [24:0] label;
	reg carryFlag;
	reg zFlag;
	reg overflowFlag;
	reg signFlag;
	reg [9:0] PC;

	// Outputs
	wire [9:0] exNPC;
	wire PCSrc;
	wire [31:0] ra;

	// Instantiate the Unit Under Test (UUT)
	branch uut (
		.opcode(opcode), 
		.fcode(fcode), 
		.label(label), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.overflowFlag(overflowFlag), 
		.signFlag(signFlag), 
		.PC(PC), 
		.exNPC(exNPC), 
		.PCSrc(PCSrc), 
		.ra(ra)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		fcode = 0;
		label = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		PC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#20
		opcode = 3'b011;
		fcode = 4'b1001;
		label = 31'd150;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 1;
		signFlag = 1;
		PC = 31'd120;
		
		#20
		opcode = 3'b011;
		fcode = 4'b0000;
		label = 31'd150;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 1;
		signFlag = 0;
		PC = 0;
		
		
		
		#20
		opcode = 3'b011;
		fcode = 4'b1010;
		label = 31'd150;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 1;
		signFlag = 1;
		PC = 31'd120;
		
	end
      
endmodule

