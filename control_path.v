`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:53:41 11/28/2019 
// Design Name: 
// Module Name:    control_path 
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
module control_path(
    input clk_main, reset, Z,
    input [15:0] InstructIn,
    input [3:0] BusA,
    output [3:0] DR, SA, SB, FS,
	 output [5:0] PC,
    output MB, MM, MD, MW, RW
    );
	 
	 wire [3:0] opcode_w;
	 
	 wire NS_w, state_w, IL_w, PS_w;
	 
	 program_counter PC (
    .PS(PS_w), 
    .A(BusA), 
    .offset(offset), 
    .clk_main(clk_main), 
    .reset(reset), 
    .PC(PC)
    );
	 
	 instruct_reg IR (
    .clk_main(clk_main), 
    .reset(reset), 
    .IL(IL_w), 
    .ins(InstructIn), 
    .opcode(opcode_w), 
    .DR(DR), 
    .SA(SA), 
    .SB(SB)
    );
	 
	 control_state CS (
    .clk_main(clk_main), 
    .reset(reset), 
    .NS(NS_w), 
    .next_state(state_w)
    );
	 
	 control_logic CL (
    .state(state_w), 
    .opcode(opcode_w), 
    .Z(Z),
    .NS(NS_w), 
    .PS(PS_w), 
    .IL(IL_w), 
    .MB(MB), 
    .FS(FS), 
    .MD(MD), 
    .RW(RW), 
    .MM(MM), 
    .MW(MW)
    );



endmodule
