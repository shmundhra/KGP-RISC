`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:51 10/08/2018 
// Design Name: 
// Module Name:    signExtend 
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
module signExtend(
    input [15:0] in,
    output [31:0] out
    );

assign out[31:16]={16{in[15]}};
assign out[15:0]=in;

endmodule
