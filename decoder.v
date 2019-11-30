`timescale 1ns / 1ps

module decoder(
    input [15:0] in,
    input clk,
    output reg [3:0] opcode, dr, sa, sb,
	 output reg [7:0] immediate
    );
	 
	 always @(posedge clk) begin
		// ADD SUB AND OR XOR NOT SLA SRA LW SW
		if ((in[15:12] >= 4'b0000 && in[15:12] <= 4'b0111) || in[15:12] == 4'b1001 || in[15:12] == 4'b1010) begin
			opcode <= in[15:12];
			dr <= in[11:8];
			sa <= in[7:4];
			sb <= in[3:0];
			immediate <= 8'bXXXXXXXX;
		// LI JAL JMP
		end else if (in[15:12] == 4'b1000 || in[15:12] == 4'b1101 || in[15:12] == 4'b1110) begin
			opcode <= in[15:12];
			dr <= in[11:8];
			sa <= 4'bXXXX;
			sb <= 4'bXXXX;
			immediate <= in[7:0];
		// BIZ BNZ
		end else if (in[15:12] == 4'b1011 || in[15:12] == 4'b1100) begin
			opcode <= in[15:12];
			dr <= 4'bXXXX;
			sa <= in[11:8];
			sb <= 4'bXXXX;
			immediate <= in[7:0];
		// JR EOE
		end else if (in[15:12] == 4'b1111) begin
			opcode <= in[15:12];
			dr <= in[11:8];
			sa <= in[7:4];
			sb <= 3'bXXX;
		end
	 end
endmodule
