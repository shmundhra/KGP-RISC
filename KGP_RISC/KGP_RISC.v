`timescale 1ns / 1ps
//Implementation of a Processor: KGP_RISC 
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module KGP_RISC(
		input clk,
		input reset,
		output [15:0] rout
    );

wire PCSrcIn,PCSRc;        //to decide if we need to choose external NPC or incremented PC
wire [9:0] exNPCIn,exNPC;  //external NPC (coming from branch statements)
wire [9:0] npc,pc,npc_mux;  //Parts of instruction fetch

//Various Parameters of the instruction decoder
wire [2:0] opcode; 
wire [4:0] rsAddr,rtAddr,shamt,wrAddr;
wire [9:0] if_id_NPC;
wire [31:0] if_id_instr; 
wire [3:0] fcode;
wire [21:0] imm;
wire [24:0] label;
wire clk1,clk2;

//RegWrite: To decide if we need to write in register
wire RegWrite;

//Data corresponding to rsAddr, rtAddr
wire [31:0] rsData,rtData,wrData;

//dout: output of Instuction_Memory, ra: return address
wire [31:0] dout,ra;

//To decide if we need to write in memory
wire MemWrite;

//Various flags
wire carryFlag,overflowFlag,zFlag,signFlag;

//ALU parameters
wire [31:0] ALUOut,inp1,inp2;

//MemOut: Data loaded, MemAddr: Address in Memory
wire [31:0] MemOut;
wire [31:0] MemAddrFull;
wire [9:0] MemAddr;

clockDivide CD(clk,clk1,clk2);

//Instruction fetch module: Combination of 5 top modules
mux M(npc,exNPC,PCSrc,npc_mux);    //Choose out of npc and external npc
PC P1(clk1,npc_mux,pc);            //make it pc at clk
Instruction_Memory IMEM(           //extract instruction
  .clka(clk2), 
  .addra(pc), 
  .douta(dout)); 
IF_ID if_id(reset,clk1,dout,npc,if_id_instr,if_id_NPC);   //make it output at clk
PC_incrementor I(pc,npc);          //increment

//Instruction Decoder, input as instruction, output as various parameters of instruction
InstDecode I_D(
	 .inst(if_id_instr),
	 .opcode(opcode),
	 .rsAddr(rsAddr),
	 .rtAddr(rtAddr),
	 .shamt(shamt),
	 .func(fcode),
	 .imm(imm),
	 .label(label),
	 .MemWrite(MemWrite)
	 );

//Register File 32 x 32, can read from two registers and write into one register at a time
regFile32x32 RF (
	 .reset(reset),
    .clk(clk1), 
    .RegWrite(RegWrite), 
    .wrAddr(wrAddr), 
    .wrData(wrData), 
    .rdAddrA(rsAddr), 
    .rdDataA(rsData), 
    .rdAddrB(rtAddr), 
    .rdDataB(rtData),
	 .rout(rout)
    );

//Get the Address from Memory where we need to load/store
assign MemAddrFull=rsData+imm;	 
assign MemAddr=MemAddrFull[9:0];

//Assign inputs assigns values to the two inputs of the ALU based on the opcode and fcode
assignInputs a_i (
    .rs(rsData), 
    .rt(rtData), 
    .shamt(shamt), 
    .imm(imm), 
    .opcode(opcode), 
    .fcode(fcode), 
    .inp1(inp1), 
    .inp2(inp2)
    ); 

//given two inputs, opcode and fcode, ALU gives the output and updates flags	 
ALU alu(
    .inp1(inp1), 
    .inp2(inp2), 
    .opcode(opcode), 
    .fcode(fcode), 
    .out(ALUOut),
    .carryFlag(carryFlag), 
    .zFlag(zFlag), 
    .signFlag(signFlag), 
    .overflowFlag(overflowFlag)
    );

//given the opcode, fcode, labels and flags, branch gives the new exNPC where we need to jump and updates PCSrc
branch b (
    .opcode(opcode), 
    .fcode(fcode), 
    .label(label), 
    .carryFlag(carryFlag), 
    .zFlag(zFlag), 
    .overflowFlag(overflowFlag), 
    .signFlag(signFlag), 
    .PC(if_id_NPC), 
    .exNPC(exNPC), 
    .PCSrc(PCSrc), 
    .ra(ra)
    );

//WriteAddress decides if we need to write something
//if yes, what and where based on opcode and fcode
//there are multiple options to write like ALUOut (Arithmetic and shift op)
//ra (call a function case) and MemOut(load case)
writeAddress wa (
    .opcode(opcode), 
    .fcode(fcode), 
    .rsAddr(rsAddr), 
    .ALUOut(ALUOut), 
    .ra(ra), 
	 .MemOut(MemOut),
    .wrAddr(wrAddr), 
    .RegWrite(RegWrite), 
    .wrData(wrData)
    );

//Data Block RAM 
Data_Memory dm (
  .clka(clk2), 
  .wea(MemWrite), 
  .addra(MemAddr),
  .dina(rtData),
  .douta(MemOut) 
);

endmodule
