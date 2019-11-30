`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:00 08/27/2019 
// Design Name: 
// Module Name:    MUX_2to1 
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
module MUX_2to1(
    input In0,
	 input In1,
    input S,
    output Out
    );
	 
	 wire	x, y, z;				//Wires are defined
	 
	 and(x, In1, S);		//AND gate #1
	 not(z, S);					//NOT gate
	 and(y, In0, z);		//AND gate #2
	 or(Out, x, y);			//OR gate


endmodule
