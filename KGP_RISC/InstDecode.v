`timescale 1ns / 1ps

//Instruction Decoder
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module InstDecode(   //Instruction is input and opcode,fcode,rs,rt,shamt,label,imm as output
    input [31:0] inst,
    output reg [2:0] opcode,
    output reg [4:0] rsAddr,
    output reg [4:0] rtAddr,
    output reg [4:0] shamt,
    output reg [3:0] func,
    output reg [21:0] imm,
    output reg [24:0] label,
	 output reg MemWrite
    );

always @(*)
	begin
	opcode=inst[31:29];       //Opcode is always the first 3 bits
	
	if(opcode==3'b000)        //Arithmetic and Shift Operations
		begin
		rsAddr<=inst[28:24];
		rtAddr<=inst[23:19];
		shamt<=inst[18:14];
		func<=inst[13:10];
		imm<=22'b0;
		label<=25'b0;
		end
	else if(opcode==3'b001)   //Immediate Operations
		begin
		rsAddr<=inst[28:24];
		rtAddr<=5'b0;
		shamt<=5'b0;
		func<={2'b0,inst[1:0]};
		imm<=inst[23:2];
		label<=25'b0;
		end
	else if(opcode==3'b010)   //Load Store Operations
		begin
		rsAddr<=inst[28:24];
		rtAddr<=inst[23:19];
		shamt<=5'b0;
		func<={3'b0,inst[0]};
		imm<={5'b0,inst[18:1]};
		label<=25'b0;
		end
	else if(opcode==3'b011)    //Branch/Jump Operations  
		begin
		rsAddr<=5'b0;
		rtAddr<=5'b0;
		shamt<=5'b0;
		func<=inst[3:0];
		imm<=22'b0;
		label<=inst[28:4];
		end
	else if(opcode==3'b100)    //br $rs jump operation
		begin
		rsAddr<=inst[28:24];
		rtAddr<=5'b0;
		shamt<=5'b0;
		func<=4'b0;
		imm<=22'b0;
		label<=25'b0;
		end
	else                 //invalid instruction/empty instruction: make everything 0
		begin
		rsAddr<=5'b0;
		rtAddr<=5'b0;
		shamt<=5'b0;
		func<=4'b0;
		imm<=22'b0;
		label<=25'b0;
		end
	end

always @(*)                 //Assign MemWrite
	begin
		if(opcode==3'd2 & func==4'd1)   //only in case of store word make it 1
			begin
			MemWrite<=1;
			end
		else
			MemWrite<=0;
	end
endmodule
