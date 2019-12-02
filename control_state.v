`timescale 1ns / 1ps

module control_state(
	input clk_main,
	input reset,
	input NS,
	output reg next_state
	);
	 
always @(posedge clk_main) begin
	if (reset)
		next_state <= 1'b0;
	else
		next_state <= ~NS;
end
endmodule