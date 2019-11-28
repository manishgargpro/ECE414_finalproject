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
    input [3:0] DR, SA, SB, FS,
    input MB, MM, MD, MW, RW,
    output [15:0] BusA, DataOut,
    output V, C, N, Z
    );
	 
	 register_file instance_name (
    .D(D), 
    .DA(DA_w), 
    .A(A), 
    .AA(AA_w), 
    .B(B), 
    .BA(BA_w), 
    .RW(RW), 
    .rst(reset), 
    .EN(EN), 
    .clk(clk_main)
    );

endmodule
