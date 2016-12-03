`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:04 03/24/2015 
// Design Name: 
// Module Name:    mux 
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
module mux(input sel,
			input [3:0] vgaR1,
			input [3:0] vgaG1,
			input [3:0] vgaB1,
			input vgaH1,
			input vgaV1,
			input [3:0] vgaR2,
			input [3:0] vgaG2,
			input [3:0] vgaB2,
			input vgaH2,
			input vgaV2,
			output reg [3:0] vgaRout,
			output reg [3:0] vgaGout,
			output reg [3:0] vgaBout,
			output reg vgaHout,
			output reg vgaVout
    );
	 
	 
	always @ (sel,vgaR1,vgaG1,vgaB1,vgaH1,vgaV1,vgaR2,vgaG2,vgaB2,vgaH2,vgaV2)
	begin
		vgaRout = sel ? vgaR2 : vgaR1;
		vgaGout = sel ? vgaG2 : vgaG1;
		vgaBout = sel ? vgaB2 : vgaB1;
		vgaHout = sel ? vgaH2 : vgaH1;
		vgaVout = sel ? vgaV2 : vgaV1;
	end


endmodule
