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
    input clk_main,
    input reset,
    input [2:0] DR,
    input [2:0] SA,
    input [2:0] SB,
    input [3:0] AX,
    input [3:0] BX,
    input [3:0] DX,
    input [3:0] FS,
    input MB,
    input MM,
    input MD,
	 input MW,
    input BusA,
    input [nbit-1:0] DataOut,
    output V,
    output C,
    output N,
    output Z
    );
	 
	 parameter nbit = 16;
	 
	 MUX_2to1 MUXB (
    .In0(In0), 
    .In1(In1), 
    .S(MB), 
    .Out(Out)
    );

	MUX_2to1 MUXM (
    .In0(In0), 
    .In1(In1), 
    .S(MM), 
    .Out(Out)
    );

	MUX_2to1 MUXD (
    .In0(In0), 
    .In1(In1), 
    .S(MD), 
    .Out(Out)
    );


endmodule
