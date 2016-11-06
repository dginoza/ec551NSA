`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:05 11/06/2016 
// Design Name: 
// Module Name:    KernelTestTop 
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
module KernelTestTop
(
		input					 	clk,
		input 				 	reset,
		output 					HSync,												// Horizontal Sync for VGA Output
		output 					VSync,												// Vertical Sync for VGA Output
		output [7 : 0] 	 	PixelDataOut										// [7:5] = Red MSBs, [4:2] = Green MSBs, [1:0] Blue MSBs
);

		wire 							 Clk25MHz;										// 25 MHz => VGA Clk
		wire 	[10:0]				 HCount;											// Horizontal Pixel Address
		wire  [10:0] 				 VCount;										   // Vertical Pixel Address
		wire 	[11:0]				 WindowDataIn;									// Input data for convolution operation
		wire 	[11:0]				 WindowDataOut;								// Output data for convolution operation
		
		
		assign PixelDataOut[7:5]	= WindowDataOut[11:9];					// Red Value Assignment
		assign PixelDataOut[4:2]   = WindowDataOut[7:5];					// Green Value Assignment
		assign PixelDataOut[1:0]	= WindowDataOut[4:3];					// Blue Value Assignment
		
		
		NHzClkDivider	 #(.MaxCount(32'd4)) 	ClkDiv25MHz (
																					.InClk(clk),
																					.OutClk(Clk25MHz)
																			);
																			
		vga_controller_640_60						VGAControl  (
																					.pixel_clk(Clk25MHz),
																					.HS(HSync),
																					.VS(VSync),
																					.hcounter(HCount),
																					.vcounter(VCount)
																			);
																			
		ImageFile									   TestImage	(
																					.clk(Clk25MHz),
																					.HAddress(HCount),
																					.VAddress(VCount),
																					.PixelData(WindowDataIn)
																			);

		window											EdgeDet		(
																					.clk(Clk25MHz),
																					.reset(reset),
																					.datain(WindowDataIn),
																					.out(WindowDataOut)
																			);





endmodule
