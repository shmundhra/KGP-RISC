`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:28:12 10/03/2018 
// Design Name: 
// Module Name:    half_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module half_adder(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum,
    output cout
    );

assign {cout,sum}=a+b;

endmodule
