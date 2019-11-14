`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:33 09/24/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [nbit - 1:0] A,
    input [nbit - 1:0] B,
    input [2:0] Sel,
	 input shin,
	 output reg [nbit - 1:0] num_out
    );
	 
	 parameter nbit = 16;
	 
	 //Put the logic for the ALU here
	 always @(*)
		begin
			case (Sel)
				3'b000 : num_out = A + B;
				3'b001 : num_out = A + ~B + 1;
				3'b010 : num_out = A && B;
				3'b011 : num_out = A || B;
				3'b100 : num_out = A ^ B;
				3'b101 : num_out = ~A;
				3'b110 : num_out = A<<shin;
				3'b111 : num_out = A>>shin;
				default : num_out = 0;
			endcase
		end

endmodule
