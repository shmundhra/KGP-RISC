`timescale 1ns / 1ps
// Implementation of Instruction Memory
module InstMem(
	 input clk,
	 input [31:0] address,
	 output reg [31:0] inst
    );

reg [31:0] memoryAddr;
reg [31:0] memory [31:0];
initial
	$readmemb("instr.data", memory);

always @(posedge clk) begin
	#addressLatch	memAddr = address;
	#memDelay	inst = Imem[memoryAddr];
end


endmodule
