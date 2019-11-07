`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:08 10/13/2019 
// Design Name: 
// Module Name:    nbit_sh_reg 
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
module nbit_sh_reg(
    input clk_main,
    input reset,
    input [nbit - 1:0] in,
    input shl,
    input shr,
    input load,
    input shin,
    output reg [nbit - 1:0] out
    );
	 
	 parameter nbit = 4;
	 
	 always @ (posedge clk_main)
		begin
			if(reset)
				begin
					out <= {nbit {1'b0}};
				end
			else
				begin
					if(load)
						out <= in;
					else if (shl)
						out <= {out[nbit - 2:0],shin};		//not sure if this should be "in[]" or "out[]"
					else if (shr)
						out <= {shin,out[nbit - 1:1]};
					else
						out <= out;
				end
		end


endmodule
