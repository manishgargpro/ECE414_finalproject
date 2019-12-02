`timescale 1ns / 1ps

module control_logic(
    input state, Z,
    input [3:0] opcode,
	 input [3:0] eoe,
    output reg NS,
    output reg [1:0] PS,
    output reg IL,
    output reg MB,
    output reg [3:0] FS,
    output reg MD,
    output reg RW,
    //output reg MM,
    output reg MW,
    output reg MP
    );
	
always @(*) begin
	NS <= state;
	FS <= opcode;
	if (state == 1'b0) begin
		PS <= 2'b00;
		IL <= 1'b1;
		MB <= 1'b0;
		MD <= 1'b0;
		RW <= 1'b0;
		//MM <= 1'b1;
		MW <= 1'b0;
		MP <= 1'b0;
	end else if (state == 1'b1) begin
		IL <= 1'b0;
		if (opcode[3] == 1'b0) begin
			PS <= 2'b01;
			MB <= 1'b0;
			MD <= 1'b0;
			RW <= 1'b1;
			//MM <= 1'b0;
			MW <= 1'b0;
			MP <= 1'b0;
		end else if (opcode[3] == 1'b1) begin
			case (opcode[2:0])
			3'b000:
				begin //load immediate
					PS <= 2'b01;
					MB <= 1'b1;
					MD <= 1'b0;
					RW <= 1'b1;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b0;
				end
			3'b001:
				begin //load word from memory
					PS <= 2'b01;
					MB <= 1'b0;
					MD <= 1'b1;
					RW <= 1'b1;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b0;
				end
			3'b010:
				begin //store word to memory
					PS <= 2'b01;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b0;
					//MM <= 1'b0;
					MW <= 1'b1;
					MP <= 1'b0;
				end
			3'b011:
				begin //branch if z
					PS <= Z?2'b10:2'b01;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b0;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b0;
				end
			3'b100:
				begin //branch if not z
					PS <= Z?2'b01:2'b10;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b0;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b0;
				end
			3'b101:
				begin //store current pc value and then jump to an offset
					PS <= 2'b01;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b1;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b1;
				end
			3'b110:
				begin //jump to offset without storing current pc value
					PS <= 2'b10;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b0;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b0;
				end
			3'b111 :
				begin
					if (eoe == 4'b0000)
						begin //restore pc value to before (go back to program)
							PS <= 2'b11;
							MB <= 1'b0;
							MD <= 1'b0;
							RW <= 1'b0;
							//MM <= 1'b0;
							MW <= 1'b0;
							MP <= 1'b0;
						end
					else if (eoe == 4'b1111)
						begin //end of execution
							PS <= 2'b00;
							MB <= 1'b0;
							MD <= 1'b0;
							RW <= 1'b0;
							//MM <= 1'b0;
							MW <= 1'b0;
							MP <= 1'b0;
						end
				end
			default:
				begin //not sure what kind of situation this is
					PS <= 2'b00;
					MB <= 1'b0;
					MD <= 1'b0;
					RW <= 1'b0;
					//MM <= 1'b0;
					MW <= 1'b0;
					MP <= 1'b0;
				end
			endcase
		end else begin // Removing warnings
			PS <= 2'b00;
			MB <= 1'b0;
			MD <= 1'b0;
			RW <= 1'b0;
			//MM <= 1'b0;
			MW <= 1'b0;
			MP <= 1'b0;
		end
	end else begin // Removing warnings
		PS <= 2'b00;
		MB <= 1'b0;
		MD <= 1'b0;
		RW <= 1'b0;
		//MM <= 1'b0;
		MW <= 1'b0;
		MP <= 1'b0;
	end
end


endmodule
