`timescale 1ns / 1ps
//Implementation of a 2:1 MUX with 10 bits inputs
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module mux(
    input [9:0] in0,
    input [9:0] in1,
    input sel,
    output [9:0] out
    );

assign out=sel?in1:in0;   //if sel is 1, choose inp1 else choose inp2

endmodule
