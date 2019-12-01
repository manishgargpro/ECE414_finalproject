`timescale 1ns / 1ps

module mux2_16(
    input [15:0] in0,
    input [15:0] in1,
    input sel,
    output [15:0] out
    );

	assign out = sel ? in1 : in0;

endmodule
