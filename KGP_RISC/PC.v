`timescale 1ns / 1ps
// Implementation of Program Counter
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module PC(
	 input clk,
    input [9:0] pc_in,
    output reg [9:0] pc_out
    );

initial begin
	pc_out<=0;
	end
	
always @(posedge clk)      //Assigns pc_out equal to pc_in at every clock cycle
	begin
	pc_out<=pc_in;          
	end

endmodule
