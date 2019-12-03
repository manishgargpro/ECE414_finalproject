`timescale 1ns / 1ps

module ALU(
	input [15:0] A, B,
	input [3:0] FS,
	output reg [15:0] num_out,
	output reg z
	);

always @(*) begin
	case (FS)
		4'b0000: begin num_out <= A + B; end
		4'b0001: begin num_out <= A - B; end
		4'b0010: begin num_out <= A & B; end
		4'b0011: begin num_out <= A | B; end
		4'b0100: begin num_out <= A ^ B; end
		4'b0101: begin num_out <= ~A; end
		4'b0110: begin num_out <= A << 1; end
		4'b0111: begin num_out <= A >> 1; end
		4'b1000: begin num_out <= B; end
		4'b1001: begin num_out <= num_out; end
		4'b1010: begin num_out <= num_out; end
		4'b1011: begin num_out <= A; end
		4'b1100: begin num_out <= A; end
		4'b1101: begin num_out <= num_out; end
		4'b1110: begin num_out <= num_out; end
		4'b1111: begin num_out <= A; end
		default: begin num_out <= num_out; end
	endcase

	if (num_out == 16'b0)
		z <= 1;
	else
		z <= 0;
end
endmodule
