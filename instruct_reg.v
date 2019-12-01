`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:02:39 11/28/2019 
// Design Name: 
// Module Name:    instruct_reg 
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
module instruct_reg(
    input clk_main, reset, IL,
    input [15:0] ins,
    output reg [3:0] opcode,
    output reg [3:0] DR, SA, SB
    );
	 
	 always @(posedge clk_main)
		begin
			if (reset)
				begin
					opcode <= 4'b0;
					DR <= 4'b0;
					SA <= 4'b0;
					SB <= 4'b0;
				end
			else
				begin
					if (IL)
						begin
							opcode <= ins[15:12];
							DR <= ins[11:8];
							SA <= ins[7:4];
							SB <= ins[3:0];
						end
					else
						begin
							opcode <= opcode;
							DR <= DR;
							SA <= SA;
							SB <= SB;
						end
				end
		end


endmodule
