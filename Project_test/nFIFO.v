`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:13 11/02/2016 
// Design Name: 
// Module Name:    nFIFO 
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
module nFIFO(datain, reset, clk, dataout
    );
	 
	 parameter fifosize = 10; //
	 
	 input [11:0] datain;
	 input clk, reset;
	 output [11:0] dataout;
	 
	 // Wire Declerlations 
	 
	 wire [11:0] InternalQOut [0:fifosize - 1];
	 
	 genvar i;
	 
	 // Input Register Instantiation
	 Dff DffInputReg 	(
								.d(datain),
								.q(InternalQOut[0][11:0]),
								.clk(clk),
								.reset(reset)
							);
							
	 Dff DffOutputReg (
								.d(InternalQOut[fifosize - 1][11:0]),
								.q(dataout),
								.clk(clk),
								.reset(reset)
							);
	 generate 
	 for (i = 1; i < fifosize; i = i + 1) begin: dffgenerate
		Dff DffInternal (
									.d(InternalQOut[i-1][11:0]),
									.q(InternalQOut[i][11:0]),
									.clk(clk),
									.reset(reset)
							  );
	 
	 end
	 endgenerate
endmodule
