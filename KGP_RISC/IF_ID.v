`timescale 1ns / 1ps
//IF_ID: At clock cycle, sends the fetched instruction to decoder
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module IF_ID(
		input reset,
		input clk,
		input [31:0] instIn,
		input [9:0] NPCIn,
		output reg [31:0] instOut,
		output reg [9:0] NPCOut
    );
	
initial begin
	NPCOut<=10'b0;
	instOut<=32'b0;
	end
	
always @(posedge clk)     //At every clock cycle, assign output=input
		begin
		if(reset)
			begin
			instOut<=0;
			NPCOut<=0;
			end
		else
			begin
			instOut<=instIn;
			NPCOut<=NPCIn;
			end
		end
endmodule
