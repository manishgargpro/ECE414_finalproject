`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:57:59 11/26/2019 
// Design Name: 
// Module Name:    reg_addr_logic 
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
module reg_addr_logic(
    input [2:0] DR,
    input [2:0] SA,
    input [2:0] SB,
    input [3:0] AX,
    input [3:0] BX,
    input [3:0] DX,
    output [3:0] DA,
    output [3:0] AA,
    output [3:0] BA
    );
	 
	 assign DA = (DX[3]?{1'b0,DR}:DX);
	 
	 assign AA = (AX[3]?{1'b0,SA}:AX);
	 
	 assign BA = (BX[3]?{1'b0,SB}:BX);


endmodule
