`timescale 1ns / 1ps

module tb_CPU;

	// Inputs
	reg clk_main;
	reg reset;
	reg [15:0] data_from_rom;
	reg [15:0] data_from_ram;

	// Outputs
	wire [5:0] address_to_rom;
	wire enable_to_rom;
	wire write_enable_to_ram;
	wire read_enable_to_ram;
	wire [5:0] address_to_ram;
	wire enable_ram_read;

	// Bidirs
	wire [15:0] data_to_ram;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk_main(clk_main), 
		.reset(reset), 
		.data_from_rom(data_from_rom), 
		.address_to_rom(address_to_rom), 
		.enable_to_rom(enable_to_rom), 
		.data_from_ram(data_from_ram), 
		.write_enable_to_ram(write_enable_to_ram), 
		.read_enable_to_ram(read_enable_to_ram), 
		.address_to_ram(address_to_ram),
		.data_to_ram(data_to_ram),
		.enable_ram_read(enable_ram_read)
	);

	initial begin
		// Initialize Inputs
		clk_main = 0;
		reset = 1;
		data_from_rom = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
		#100;
        
		// Add stimulus here
		data_from_rom = 16'b1000000000000110;
		#200;
		data_from_rom = 16'b1000001000010001;
		#200;
		data_from_rom = 16'b0000001100100000;
		#200;
		data_from_rom = 16'b1000000100000011;
		#200;
		data_from_rom = 16'b1010000000010011;
		#200;
		data_from_rom = 16'b1111111100000000;
		#200;

	end
	
	always #50 clk_main = ~clk_main;
      
endmodule

