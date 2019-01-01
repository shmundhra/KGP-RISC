`timescale 1ns / 1ps
//Implementation of Instruction Fetch Module

module InstFetch(
	 input PCSrc,
	 input clk,
	 input [9:0] Ex_NPC,
	 output [31:0] if_id_instr,
	 output [9:0] if_id_NPC
    );

wire [9:0] npc,pc,npc_mux;
wire [31:0] dout;

mux M(npc,Ex_NPC,PCSrc,npc_mux);

PC P1(clk,npc_mux,pc);

Instruction_Memory IMEM(
  .clka(clk), 
  .addra(pc), 
  .douta(dout));
  
IF_ID if_id(clk,dout,npc,if_id_instr,if_id_NPC);
PC_incrementor I(pc,npc);

endmodule
