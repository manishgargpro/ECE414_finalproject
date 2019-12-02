`timescale 1ns / 1ps

module ALU(
	input [15:0] A, B,
	input [3:0] FS,
	output reg [15:0] num_out,
	output reg z
	);

always @(*) begin
	case (FS)
		4'b0000: num_out <= A + B;
		4'b0001: num_out <= A - B;
		4'b0010: num_out <= A && B;
		4'b0011: num_out <= A || B;
		4'b0100: num_out <= A ^ B;
		4'b0101: num_out <= ~A;
		4'b0110: num_out <= A<<0;
		4'b0111: num_out <= A>>0;
		4'b1000: num_out <= B;
		4'b1001: num_out <= num_out;
		4'b1010: num_out <= num_out;
		4'b1011: num_out <= A;
		4'b1100: num_out <= A;
		4'b1101: num_out <= num_out;
		4'b1110: num_out <= num_out;
		4'b1111: num_out <= A;
		default: num_out <= num_out;
	endcase

	if (num_out == 4'b0000)
		z <= 1;
	else
		z <= 0;
end
endmodule
