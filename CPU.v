`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:25:54 11/29/2019 
// Design Name: 
// Module Name:    risc_top 
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
module CPU(
    input clk_main,
    input reset,
    input [15:0] data_from_rom, //used
    output [5:0] address_to_rom,
    output enable_to_rom,
    inout [15:0] data_ram, //used
    output write_enable_to_ram, //used
    output read_enable_to_ram,
    output [5:0] address_to_ram, //used
    output enable_ram_read //special case, use only when opcode is 11111111
    );
	 
	 wire [15:0] BusA_w;
	 
	 wire [3:0] DR_w, SA_w, SB_w, FS_w;
	 
	 wire [5:0] PC_w;
	 
	 wire Z_w, MB_w, MM_w, MD_w, RW_w;
	 
	 control_path c_p (
    .clk_main(clk_main), 
    .reset(reset), 
    .Z(Z_w), 
    .InstructIn(data_from_rom), //needs outside connection to ram/rom, not sure which one
    .BusA(BusA_w), //same for this one
    .DR(DR_w), 
    .SA(SA_w), 
    .SB(SB_w), 
    .FS(FS_w), 
    .PC(PC_w), 
    .MB(MB_w), 
    .MM(MM_w), 
    .MD(MD_w), 
    .MW(write_enable_to_ram), //and this one (I think...)
    .RW(RW_w)
    );
	 
	 datapath d_p (
    .clk_main(clk_main), 
    .reset(reset), 
    .DR(DR_w), 
    .SA(SA_w), 
    .SB(SB_w), 
    .FS(FS_w), 
    .PC(PC_w), 
    .MB(MB_w), 
    .MM(MM_w), 
    .MD(MD_w), 
    .RW(RW_w), 
    .BusA(BusA_w), //and this one
    .AddrOut(address_to_ram), //and this one
    .DataOut(data_ram), //and this one
    .Z(Z_w)
	 );

endmodule
