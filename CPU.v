`timescale 1ns / 1ps

module CPU(
    input clk_main,
    input reset,
    input [15:0] data_from_rom, data_from_ram, //used
    output [5:0] address_to_rom, //used
    output enable_to_rom, //used
    output [15:0] data_to_ram, //used
    output write_enable_to_ram, //used
    output read_enable_to_ram, //used
    output [5:0] address_to_ram, //used
    output enable_ram_read //used
	 //output eoe
    );
	 
	 wire [15:0] Addr_w;
	 
	 wire [3:0] DR_w, SA_w, SB_w, FS_w;
	 
	 wire [5:0] PC_w;
	 
	 wire Z_w, MB_w, /*MM_w,*/ MD_w, RW_w, MP_w;
	 
	 assign address_to_rom = PC_w;
	 
	 assign enable_to_rom = 1'b1;
	 
	 assign read_enable_to_ram = (FS_w == 4'b1001)?1'b1:1'b0;
	 
	 assign enable_ram_read = ({FS_w,DR_w} == 8'b11111111)?1'b1:1'b0;
	 
	 assign address_to_ram = Addr_w[5:0];
	 
	 //assign eoe = ({FS_w,DR_w} == 8'b11111111)?1'b1:1'b0;
	 
	 control_path c_p (
    .clk_main(clk_main), 
    .reset(reset), 
    .Z(Z_w), 
    .InstructIn(data_from_rom), //needs outside connection to ram/rom, not sure which one
    .BusA(Addr_w), //same for this one
    .DR(DR_w), 
    .SA(SA_w), 
    .SB(SB_w), 
    .FS(FS_w), 
    .PC(PC_w), 
    .MB(MB_w), 
    //.MM(MM_w), 
    .MD(MD_w), 
	 .MP(MP_w),
    .MW(write_enable_to_ram), //and this one (I think...)
    .RW(RW_w)
    );
	 
	 datapath d_p (
    .clk_main(clk_main), 
    .reset(reset), 
	 .DataIn(data_from_ram),
    .DR(DR_w), 
    .SA(SA_w), 
    .SB(SB_w), 
    .FS(FS_w), 
    .PC(PC_w), 
    .MB(MB_w), 
    //.MM(MM_w), 
    .MD(MD_w), 
	 .MP(MP_w),
    .RW(RW_w),
    .AddrOut(Addr_w), //and this one
    .DataOut(data_to_ram), //and this one
    .Z(Z_w)
	 );

endmodule
