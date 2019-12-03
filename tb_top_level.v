`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:18:17 12/02/2019
// Design Name:   top_level
// Module Name:   C:/Users/Administrator/Desktop/Coding_stuff/NewGithubRepos/ECE414_finalproject/tb_top_level.v
// Project Name:  finalproject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top_level;

	// Inputs
	reg reset;
	//reg btn_press;
	reg clk;

	// Outputs
	wire UART_TX;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.reset(reset), 
		//.btn_press(btn_press), 
		.clk(clk), 
		.UART_TX(UART_TX)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		//btn_press = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#100;
        
		// Add stimulus here

	end
	
	always #50 clk = ~clk;
      
endmodule

