`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:21 11/11/2019 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(
    input [1:0] PS,
    input [3:0] A,
    input [3:0] offset,
	 input clk_main,
	 input reset,
	 output reg [5:0] PC
    );
	 
	 
	 
	 

	always @(posedge clk_main)
		begin
			if(reset)
				begin
					PC <= 16'b0;
				end
		
			else
				begin
				
					case(PS)
						2'b00: 
							begin
								PC <=  PC;
							end
						2'b01:  
							begin
								PC <= PC + 1'b1;
							end
						2'b10:  
							begin
								PC <= PC +(offset)+1'b1;
							end
						2'b11:  
							begin
								PC <= PC + A;
							end
					endcase
			end
		end
										
endmodule
