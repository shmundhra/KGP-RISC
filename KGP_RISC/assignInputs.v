`timescale 1ns / 1ps
//Assign Inputs for the ALU
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module assignInputs(
		input [31:0] rs,
		input [31:0] rt,
		input [4:0] shamt,
		input [21:0] imm,
		input [2:0] opcode,
		input [3:0] fcode,
		output reg [31:0] inp1,
		output reg [31:0] inp2
    );

always @(*)
	begin
		if(opcode==3'b0)
			begin     //for various arithmetic and shift operations involving 2 reg 
				if(fcode==4'd0 | fcode==4'd1 | fcode==4'd2 | fcode==4'd3 | fcode==4'd6 | fcode==4'd7 | fcode==4'd9)
					begin
					inp1<=rs;
					inp2<=rt;
					end
				else   //involving 1 reg and shamt
					begin
					inp1<=rs;
					inp2<={27'b0,shamt};
					end
			end
		else if(opcode==3'd1)     //immediate operations
			begin
				inp1<=rs;
				if(imm[21]==1'b1)
					inp2<={10'b1,imm};
				else inp2<={10'b0,imm};
			end
		else                 //Otherwise not a work of ALU
			begin
				inp1<=0;
				inp2<=0;
			end
	end

endmodule
