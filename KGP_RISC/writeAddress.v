`timescale 1ns / 1ps
//Decides the write address, data and RegWrite flag
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module writeAddress(
		input [2:0] opcode,
		input [3:0] fcode,
		input [4:0] rsAddr,
		input [31:0] ALUOut,
		input [31:0] ra,
		input [31:0] MemOut,
		output reg [4:0] wrAddr,
		output reg RegWrite,
		output reg [31:0] wrData
    );

always @(*)
	begin
		if(opcode==3'b000 | opcode==3'b001)     //if Arithmetic or shift or immediate operation
			begin
			RegWrite<=1;
			wrAddr<=rsAddr;
			wrData<=ALUOut;     //ALUOut needs to be written in rsAddr
			end
		else if(opcode==3'd3)    //if branch instruction
			begin
			if(fcode==4'd9)        //ra needs to be written at raAddr
				begin
				RegWrite<=1;
				wrAddr<=5'b11111;
				wrData<=ra;
				end
			else
				begin              //otherwise nothing to be written
					RegWrite<=0;
					wrAddr<=0;
					wrData<=0;
				end
			end
		else if(opcode==3'd2)    //if load word
			begin
				if(fcode==4'd0)
					begin
					RegWrite<=1;
					wrAddr<=rsAddr;
					wrData<=MemOut;      //MemOut to be written at rsAddr
					end
				else 
					begin
						RegWrite<=0;    //otherwise nothing
						wrAddr<=0;
						wrData<=0;
					end
			end
		else 
		begin
			RegWrite<=0;        //otherwise nothing
			wrAddr<=0;
			wrData<=0;
		end
	end
endmodule
