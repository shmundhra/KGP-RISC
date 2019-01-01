`timescale 1ns / 1ps

// ALU testbench
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module ALU_tb;

	// Inputs
	reg [31:0] inp1;
	reg [31:0] inp2;
	reg [2:0] opcode;
	reg [4:0] fcode;

	// Outputs
	wire [31:0] out;
	wire carryFlag;
	wire zFlag;
	wire signFlag;
	wire overflowFlag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.inp1(inp1), 
		.inp2(inp2), 
		.opcode(opcode), 
		.fcode(fcode), 
		.out(out), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.signFlag(signFlag), 
		.overflowFlag(overflowFlag)
	);

	initial begin
		// Initialize Inputs
		inp1 = 0;
		inp2 = 0;
		opcode = 0;
		fcode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0000;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0001;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0010;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0011;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0100;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0101;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0110;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b0111;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b1000;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b000;
		fcode=4'b1001;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b001;
		fcode=4'b0000;
		
		#10
		inp1=32'd105;
		inp2=32'd110;
		opcode=3'b001;
		fcode=4'b0001;
	end
      
endmodule

