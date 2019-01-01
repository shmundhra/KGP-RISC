`timescale 1ns / 1ps
// Implementation of a simple D-flip flop
module DFF(
    input [31:0] D,
    input clk,
	 input clr,
    output reg [31:0] Q
    );

always @(posedge clk)
	begin
	if(clr) Q=0;
	else	Q=D;
	end
	

endmodule
