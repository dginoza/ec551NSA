`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:31 12/01/2016 
// Design Name: 
// Module Name:    segment 
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
module segment(input [9:0] hcnt, input [9:0] vcnt, input [11:0] pixelIn, output [11:0] pixelOut
    );
	 
	 reg [11:0] pixOut;
	 
	 assign pixelOut = pixOut;
	 
	 always @ (hcnt or vcnt) begin
		 if(vcnt > 10'd100 && vcnt < 10'd200) begin
			if(hcnt > 10'd200 && hcnt < 10'd300) begin
				pixOut = pixelIn;
			end
			else begin
				pixOut = 12'b0000000000;
			end
		 end
		end
	 


endmodule
