`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:04 11/06/2016 
// Design Name: 
// Module Name:    ImageFile 
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
module ImageFile
(		
		input							clk,
		input 	[10:0] 			HAddress,								// Horizontal Pixel Address
		input		[10:0]			VAddress,								// Vertical Pixel Address
		output reg 	[11:0]			PixelData								// 12 Bit Pixel Data Output 
);
		parameter MaxPixels = (640 * 60) - 1;
		
		wire 	[15:0]		ImageIndex;											// Index for image data
		reg 	[11:0]		ImageData [0:38400]; 								// Stores image data
		
		// Reading in Image matrix	
		initial begin
			$readmemb("sample.txt", ImageData);
		end
		
		assign ImageIndex = HAddress * VAddress;							// Index Calcultion
		
		always @ (posedge clk) begin
			if (ImageIndex < MaxPixels && ImageIndex > 0) begin
				PixelData <= ImageData[ImageIndex];
			end
			else begin
				PixelData <= 12'd0;
			end
		end

endmodule
