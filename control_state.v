`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:03:00 11/28/2019 
// Design Name: 
// Module Name:    control_state 
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
module control_state(
    input clk_main,
    input reset,
    input NS,
    output reg next_state
    );
	 
	 always @(posedge clk_main)
		begin
			if (reset)
				next_state = 1'b0;
			else
				next_state = NS;
		end


endmodule
