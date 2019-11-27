`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:43 11/26/2019 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
    input clk_main, reset,
    input [2:0] DR, SA, SB,
    input [3:0] AX, BX, DX, FS,
    input MB, MM, MD, MW,
    output [nbit-1:0] BusA, DataOut,
    output V, C, N, Z
    );
	 
	 parameter nbit = 16;
	 
	 wire [3:0] DA_w, AA_w, BA_w;
	 
	 reg_addr_logic instance_name (
    .DR(DR), 
    .SA(SA), 
    .SB(SB), 
    .AX(AX), 
    .BX(BX), 
    .DX(DX), 
    .DA(DA_w), 
    .AA(AA_w), 
    .BA(BA_w)
    );
	 
	 register_file instance_name (
    .D(D), 
    .DA(DA_w), 
    .A(A), 
    .AA(AA_w), 
    .B(B), 
    .BA(BA_w), 
    .RW(RW), 
    .rst(reset), 
    .EN(EN), 
    .clk(clk_main)
    );
	 
	 
	ip_rom_input_code your_instance_name (
	  .clka(clk_main), // input clka
	  .ena(ena), // input ena
	  .addra(addra), // input [5 : 0] addra
	  .douta(douta) // output [15 : 0] douta
	);
	
	ip_ram_output_code your_instance_name (
	  .clka(clk_main), // input clka
	  .ena(ena), // input ena
	  .wea(MW), // input [0 : 0] wea
	  .addra(addra), // input [5 : 0] addra
	  .dina(dina), // input [15 : 0] dina
	  .douta(douta) // output [15 : 0] douta
	);

endmodule
