`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:18:42 11/28/2019 
// Design Name: 
// Module Name:    control_logic 
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
module control_logic(
    input state, Z,
    input [3:0] opcode,
    output reg [3:0] NS,
    output reg [1:0] PS,
    output reg IL,
    output reg MB,
    output reg [3:0] FS,
    output reg MD,
    output reg RW,
    output reg MM,
    output reg MW
    );
	 
	 //THIS MODULE IS NOT FINISHED, I DON'T KNOW WHAT I'M DOING!!!
	 
	 always @(*)
		begin
			NS <= state;
			FS <= opcode;
			if (state == 1'b0)
				begin
					PS <= 2'b00;
					IL <= 1'b1;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b0;
					MM <= 1'b1;
					MW <= 1'b0;
				end
			else if (state == 1'b1)
				begin
					IL <= 1'b0;
					if (opcode[3] == 1'b0)
						begin
							PS <= 2'b01;
							MB <= 1'b0;
							MD <= 1'b0;
							RW <= 1'b1;
							MM <= 1'b0;
							MW <= 1'b0;
						end
					else if (opcode[3] == 1'b1)
						begin
							case (opcode[2:0])
								3'b000 :
									begin //load immediate
										PS <= 2'b01;
										MB <= 1'b1;
										MD <= 1'b0;
										RW <= 1'b1;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								3'b001 :
									begin //load word from memory
										PS <= 2'b01;
										MB <= 1'b0;
										MD <= 1'b1;
										RW <= 1'b1;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								3'b010 :
									begin //store word to memory
										PS <= 2'b01;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b1;
									end
								3'b011 :
									begin //branch if z
										PS <= Z?2'b10:2'b01;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								3'b100 :
									begin //branch if not z
										PS <= Z?2'b01:2'b10;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								3'b101 :
									begin //store current pc value and then jump to an offset
										PS <= 2'b01;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								3'b110 :
									begin //jump to offset without storing current pc value
										PS <= 2'b10;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								3'b111 :
									begin //restore pc value to before (go back to program)
										PS <= 2'b11;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b0;
									end
								default:
									begin //not sure what kind of situation this is
										PS <= 2'b00;
										MB <= 1'b0;
										MD <= 1'b0;
										RW <= 1'b0;
										MM <= 1'b0;
										MW <= 1'b0;
									end
							endcase
						end
				end
		end


endmodule
