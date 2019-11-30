`timescale 1ns / 1ps

module register_file(
	input [15:0] D,
	input [3:0] DA, AA, BA,
	input [1:0] RW,
	input en, rst, clk,
	output reg[15:0] A, B
	);

integer i;
reg [15:0] regFile [15:0];

always @ (posedge clk, posedge rst) begin 
	if (en == 1) begin
		if (rst == 1) begin 
			for (i = 0; i < 16; i = i + 1)
				regFile [i] = 16'b0; 
			A = 16'bx;
		end
		else if (rst == 0) begin
			case (RW)
			2'b00: begin end
			2'b01: begin // write only
				regFile [DA] = D;
			end
			2'b10: begin // read only
				A = regFile [AA];
				B = regFile [BA];
			end 
			2'b11: begin // read & write
				A = regFile [AA];
				B = regFile [BA];
				regFile [DA] = D;
			end
			default: begin end
			endcase
		end
	end
end
endmodule