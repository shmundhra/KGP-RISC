`timescale 1ns / 1ps
//ALU: To perform arithmetic and shift operations
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module ALU(
    input [31:0] inp1,
    input [31:0] inp2,
	 input [2:0] opcode,
    input [3:0] fcode,
    output reg [31:0] out,
	 output reg carryFlag,
	 output reg zFlag,
	 output reg signFlag,
	 output reg overflowFlag
    );

reg c31,c32;

always @(*)
	begin
		case(opcode) 
			3'b000: begin              //R Type arithmetic and shift instructions
						case(fcode)
						4'b0000: begin     //xor
									out=inp1^inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end
						4'b0001:	begin 	//and
									out=inp1&inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end 
						4'b0010:	begin		//comp
									out=~inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end
						4'b0011:	begin		//add
									{c31,out[30:0]}=inp1[30:0]+inp2[30:0];
									{c32,out[31]}=inp1[31]+inp2[31]+c31;
									overflowFlag=c31^c32;
									carryFlag=c32;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end 
						4'b0100:	begin		//shll
									out=inp1<<inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end
						4'b0101:	begin		//shrl
									out=inp1>>inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end
						4'b0110:	begin		//shllv
									out=inp1<<inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end	
						4'b0111:	begin		//shrlv
									out=inp1>>inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end	
						4'b1000:	begin		//shra
									out=inp1>>>inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end	
						4'b1001:	begin		//shrav
									out=inp1>>>inp2;
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end	
						endcase
				end
				
			 3'b001:
				begin
					case(fcode)            //Immediate type instructions
						4'b0000:	begin
									out=~inp2;      //compi
									overflowFlag=1'b0;
									carryFlag=1'b0;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end
						4'b0001:	begin				//addi
									{c31,out[30:0]}=inp1[30:0]+inp2[30:0];
									{c32,out[31]}=inp1[31]+inp2[31]+c31;
									overflowFlag=c31^c32;
									carryFlag=c32;
									zFlag=(out==0)?1'b1:1'b0;
									signFlag=out[31];
									end 
					endcase
				end
			default:                //default: keep everything 0
						begin
						out=0;
						end
		endcase
	end
endmodule
