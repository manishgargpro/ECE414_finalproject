`timescale 1ns / 1ps

module register_file(
	input [15:0] D,
	input [3:0] DA, AA, BA, FS,
	input reset, clk, RW,
	output [15:0] A, B
	);

integer i;
reg [15:0] regFile [15:0];

assign A = (FS == 4'b1011 || FS == 4'b1100) ? regFile [DA] : regFile [AA];
assign B = regFile [BA];

always @ (posedge clk) begin
	if (reset) begin 
		for (i = 0; i < 16; i = i + 1)
			regFile [i] = 16'b0;
		/*A <= 16'bx;
		B <= 16'bx;*/
	end else begin
		/*A <= regFile [AA];
		B <= regFile [BA];*/
		if(RW) regFile [DA] = D;
	end/* else begin
		A <= 16'bx;
		B <= 16'bx;
	end*/
end
endmodule
