`timescale 1ns / 1ps

module instruct_reg(
	input [15:0] ins,
	input clk_main, reset, IL,
	output reg [3:0] opcode, DR, SA, SB
	);

always @(negedge clk_main) begin
	if (reset) begin
		opcode <= 4'b0;
		DR <= 4'b0;
		SA <= 4'b0;
		SB <= 4'b0;
	end else begin
		if (IL) begin
			opcode <= ins[15:12];
			DR <= ins[11:8];
			SA <= ins[7:4];
			SB <= ins[3:0];
		end else begin
			opcode <= opcode;
			DR <= DR;
			SA <= SA;
			SB <= SB;
		end
	end
end
endmodule
