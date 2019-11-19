`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:59 11/12/2019 
// Design Name: 
// Module Name:    register_file 
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
module regFile( D,

                DA, 

                A,

                AA, 

                B,

                BA, 

                RW, 

                rst,

                EN, 

                clk

              );      

input  [15:0]  D; 

input  [3:0]  DA,

              AA,

              BA; 

input  [1:0] RW;

       //WR; 

input  EN,

       clk,

       rst; 

output reg [15:0]  A,

               B; 

      

reg [15:0]  regFile [15:0]; 

integer i; 

wire  sen; 

assign sen = clk || rst; 

always @ (posedge sen) 

begin 

 if (EN == 1) 

 begin 

  if (rst == 1) //If at reset 

   begin 

   for (i = 0; i < 16; i = i + 1) begin
    regFile [i] = 16'b0; 

   end 

   A = 16'bx; 

   end 

  else if (rst == 0) //If not at reset 

   begin 
//{RD,WR}
   case (RW) 

    2'b00:  begin 

     end 

    2'b01:  begin //If Write only 

     regFile [DA] = D; 

     end 

    2'b10:  begin //If Read only 

     A = regFile [AA]; 

     B = regFile [BA]; 

     end 

    2'b11:  begin //If both active 

     A = regFile [AA]; 

     B = regFile [BA]; 

     regFile [DA] = D; 

     end 

    default: begin //If undefined 

      end 

   endcase 

   end 

  else; 

 end 

 else; 

end 

endmodule

