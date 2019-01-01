`timescale 1ns / 1ps

//Clock Divide
//Lovish Chopra 16CS10058
//Himanshu Mundhra 16CS10057

module clockDivide(
    input clk,
    output reg clk1,
    output reg clk2
    );

reg [3:0] counter1;

initial begin
	counter1=0;
	clk1=0;
	clk2=0;
	end
always @(clk)
	begin
	if(counter1!=4'd8)
		begin
		counter1=counter1+1'b1;
		end
	else
		begin
			counter1=0;
			clk1=!clk1;
		end
	end

always @(clk)
	begin
		clk2=!clk2;
	end
	
endmodule
