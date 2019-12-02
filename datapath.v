`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:43 11/26/2019 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input clk_main, reset,
	 input [15:0] DataIn,
    input [3:0] DR, SA, SB,
	 input [3:0] FS,
	 input [5:0] PC,
    input MB, MM, MD, RW,
    output [15:0] BusA, DataOut,
	 output [5:0] AddrOut,
    output Z
    );
	 
	 wire [15:0] A_w, B1_w, B2_w, D_w, F_w;
	 
	 register_file RF (
    .D(D_w), 
    .DA(DR), 
    .A(A_w), 
    .AA(SA), 
    .B(B1_w), 
    .BA(SB), 
    .RW(RW), 
    .rst(reset), 
    .clk(clk_main)
    );
	 
	 mux2_16 muxB (
    .in0(B1_w), 
    .in1({8'b0,SA,SB}), 
    .sel(MB), 
    .out(B2_w)
    );
	 
	 ALU alu (
    .A(A_w), 
    .B(B2_w), 
    .FS(FS),
    .num_out(F_w),
    .z(Z)
    );
	 
	 mux2_16 muxD (
    .in0(F_w), 
    .in1(DataIn), 
    .sel(MD), 
    .out(D_w)
    );

endmodule
