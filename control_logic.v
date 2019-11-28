`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:42 11/28/2019 
// Design Name: 
// Module Name:    control_logic 
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
module control_logic(
    input state, V, C, N, Z,
    input [3:0] opcode,
	 //input [3:0] DR, SA, SB,
    output [3:0] NS,
    output [1:0] PS,
    output IL,
    //output [3:0] DX, AX, BX,
    output MB,
    output [3:0] FS,
    output MD,
    output RW,
    output MM,
    output MW
    );
	 
	 assign NS = state;
	 
	 assign FS = opcode;


endmodule
