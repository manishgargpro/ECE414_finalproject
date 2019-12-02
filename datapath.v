`timescale 1ns / 1ps

module datapath(
	input clk_main, reset, MB, MM, MD, RW,
	input [15:0] DataIn,
	input [5:0] PC,
	input [3:0] DR, SA, SB, FS,
	output [15:0] DataOut,
	output [5:0] AddrOut, BusA,
	output Z
	);
	
	wire [15:0] A_w, B1_w, B2_w, D_w, F_w;
	assign DataOut = D_w;
	
	register_file RF(
		.D(D_w),
		.DA(DR),
		.A(A_w),
		.AA(SA),
		.B(B1_w),
		.BA(SB),
		.RW(RW),
		.reset(reset),
		.clk(clk_main)
	);

	mux2_16 muxB(
		.in0(B1_w), 
		.in1({8'b0,SA,SB}), 
		.sel(MB), 
		.out(B2_w)
	);

	ALU alu(
		.A(A_w), 
		.B(B2_w), 
		.FS(FS),
		.num_out(F_w),
		.z(Z)
	);

	mux2_16 muxD(
		.in0(F_w), 
		.in1(DataIn), 
		.sel(MD), 
		.out(D_w)
	);
	
	mux2_16 muxM(
		.in0(A_w),
		.in1({10'b0,PC}),
		.sel(MM),
		.out(AddrOut)
	);
endmodule
