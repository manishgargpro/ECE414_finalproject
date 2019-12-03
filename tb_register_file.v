`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:08:48 12/03/2019
// Design Name:   register_file
// Module Name:   C:/Users/Administrator/Desktop/Coding_stuff/NewGithubRepos/ECE414_finalproject/tb_register_file.v
// Project Name:  finalproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_register_file;

	// Inputs
	reg [15:0] D;
	reg [3:0] DA;
	reg [3:0] AA;
	reg [3:0] BA;
	reg reset;
	reg clk;
	reg RW;

	// Outputs
	wire [15:0] A;
	wire [15:0] B;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.D(D), 
		.DA(DA), 
		.AA(AA), 
		.BA(BA), 
		.reset(reset), 
		.clk(clk), 
		.RW(RW), 
		.A(A), 
		.B(B)
	);

	initial begin
		// Initialize Inputs
		D = 0;
		DA = 0;
		AA = 0;
		BA = 0;
		reset = 1;
		clk = 0;
		RW = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#100;
        
		// Add stimulus here
		RW = 1'b1;
		DA = 16'h0;
		D = 16'h5;
		#100;
		RW = 1'b1;
		DA = 16'h1;
		D = 16'h6;
		#100;
		RW = 1'b0;
		AA = 16'h0;
		BA = 16'h1;
		#100;
		

	end
	
	always #50 clk = ~clk;
      
endmodule

