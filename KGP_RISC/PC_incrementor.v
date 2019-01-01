`timescale 1ns / 1ps

//To increment the program counter
//16CS10058 Lovish Chopra
//16CS10057 Himanshu Mundhra

module PC_incrementor(
    input [9:0] pc_in,
    output [9:0] pc_out
    );

assign pc_out=pc_in+10'b0000000001;  //simply add 1

endmodule
