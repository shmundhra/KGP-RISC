`timescale 1ns / 1ps

//Handles Branch Cases
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module branch(
    input [2:0] opcode,
    input [3:0] fcode,
	 input [24:0] label,
    input carryFlag,
    input zFlag,
    input overflowFlag,
    input signFlag,
	 input [9:0] PC,
    output reg [9:0] exNPC,
	 output reg PCSrc,
	 output reg [31:0] ra
    );
	
initial begin
	exNPC<=0;
	PCSrc<=0;
	ra<=0;
	end
always @(opcode or fcode or label or carryFlag or zFlag or overflowFlag or signFlag)
	begin
	ra<=0;    //ra is 0 by default
		if(opcode==3'b011)     //if we are branching
			begin
				if(fcode==4'b0)
							begin       //b
								exNPC<=label[9:0];
								PCSrc<=1;
							end
				else if(fcode==4'b0001)
						  begin       //bz
								if(zFlag==1) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd2)
						  begin		//bnz
								if(zFlag==0) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd3)
						  begin		//bcy
								if(carryFlag==1) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd4)
						  begin		//bncy
								if(carryFlag==0) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd5)
						  begin		//bs
								if(signFlag==1) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd6)
						  begin	//bns
								if(signFlag==0) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd7)
						  begin	//bv
								if(overflowFlag==1) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd8)
						  begin	//bnv
								if(overflowFlag==0) 
									begin
										exNPC<=label[9:0];
										PCSrc<=1;
									end
								else 
									begin
									PCSrc<=0;
									exNPC<=0;
									end
							end
				else if(fcode==4'd9)
						  begin		//call
								exNPC<=label[9:0];
								PCSrc<=1;
								ra<=PC;   //Store the PC 
							end
				else if(fcode==4'd10)
						  begin //return
								exNPC<=ra[9:0];
								PCSrc<=1;
							end
				else    
							begin //default case
								PCSrc<=0;
								exNPC<=0;
							end
			end
			
			else if(opcode==3'b100)
				begin
				exNPC<=label[9:0];
				PCSrc<=1;
				end
				
			else
				begin
					PCSrc<=0;
					exNPC<=0;
				end
		end
endmodule
