`timescale 1ns / 1ps

//Assign Inputs for the ALU test bench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module assignInputs_tb;

	// Inputs
	reg [31:0] rs;
	reg [31:0] rt;
	reg [4:0] shamt;
	reg [21:0] imm;
	reg [2:0] opcode;
	reg [3:0] fcode;

	// Outputs
	wire [31:0] inp1;
	wire [31:0] inp2;

	// Instantiate the Unit Under Test (UUT)
	assignInputs uut (
		.rs(rs), 
		.rt(rt), 
		.shamt(shamt), 
		.imm(imm), 
		.opcode(opcode), 
		.fcode(fcode), 
		.inp1(inp1), 
		.inp2(inp2)
	);

	initial begin
		// Initialize Inputs
		rs = 0;
		rt = 0;
		shamt = 0;
		imm = 0;
		opcode = 0;
		fcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rs=32'd10;
		rt=32'd15;
		shamt=5'd20;
		imm=22'd25;
		
		opcode=3'b0;
		fcode=4'b0;
		
		#10
		opcode=3'b0;
		fcode=4'b0100;
		
		#10
		opcode=3'b1;
		fcode=4'b0001;
		
		#10
		opcode=3'b10;
		fcode=4'b0001;
		
		#10
		opcode=3'b0;
		fcode=4'b1;
	end
      
endmodule

