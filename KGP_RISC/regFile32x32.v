`timescale 1ns / 1ps

//Register File
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module regFile32x32
  (
	input reset,
	input clk,
   input RegWrite,				//To decide if we need to write or not
   input [4:0] wrAddr,			//If Yes, at what address
   input [31:0] wrData,       //And what data
   input [4:0] rdAddrA,       //Read Addresses and Read Data
   output reg [31:0] rdDataA,
   input [4:0] rdAddrB,
   output reg [31:0] rdDataB,
	output [31:0] rout
  );

	reg [31:0] r[31:0]; 
	
	initial					//Initially make all registers 0
			begin
			r[0]=32'b0;	r[8]=32'b0;	r[16]=32'b0;	r[24]=32'b0;	
			r[1]=32'b0; r[9]=32'b0;	r[17]=32'b0;	r[25]=32'b0;	
			r[2]=32'b0; r[10]=32'b0;	r[18]=32'b0;	r[26]=32'b0;	
			r[3]=32'b0; r[11]=32'b0;	r[19]=32'b0;	r[27]=32'b0;	
			r[4]=32'b0; r[12]=32'b0;	r[20]=32'b0;	r[28]=32'b0;	
			r[5]=32'b0; r[13]=32'b0;	r[21]=32'b0;	r[29]=32'b0;	
			r[6]=32'b0; r[14]=32'b0;	r[22]=32'b0;	r[30]=32'b0;	
			r[7]=32'b0; r[15]=32'b0;	r[23]=32'b0;	r[31]=32'b0;	
			end
			
	assign rout=r[25][15:0];
	
   always @(*) 
		begin
			if(rdAddrB>=32) 
				rdDataB=32'hXXXXXXXX;       //Not possible, kept just to prevent latch
			else
				rdDataB=r[rdAddrB];          //Read Data
				
			if(rdAddrA>=32) 
				rdDataA=32'hXXXXXXXX;
			else
				rdDataA=r[rdAddrA];          //Read Data
			
		end
		
   always @(posedge clk)            //Write Operation
		begin
      if (RegWrite) 
				r[wrAddr]=wrData;
		end
		
endmodule
