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
    input [2:0] DR, SA, SB,
    input [3:0] AX, BX, DX, FS,
    input MB, MM, MD, MW,
    output [nbit-1:0] BusA, DataOut,
    output V, C, N, Z
    );
	 
	 parameter nbit = 16;


endmodule
