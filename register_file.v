`timescale 1ns / 1ps

module register_file(
	input [15:0] D,
	input [3:0] DA, AA, BA,
	input [0:0] RW,
	input en, rst, clk,
	output reg[15:0] A, B
	);

integer i;
reg [15:0] regFile [15:0];

always @ (posedge clk) begin
	if (rst == 1) begin 
		for (i = 0; i < 16; i = i + 1)
			regFile [i] = 16'b0; 
		A = 16'bx;
	end
	else if (rst == 0) begin
		case (RW)
		//2'b00: begin end
		1'b0: begin // Read only
			
			A = regFile [AA];
			B = regFile [BA];
		end
		1'b1: begin // read and write
			A = regFile [AA];
			B = regFile [BA];
			regFile [DA] = D;
		end 
		
		default: begin end
		endcase
	end
end
endmodule
