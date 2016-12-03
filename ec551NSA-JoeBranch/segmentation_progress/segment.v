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
module segment(input [9:0] hcnt, input [9:0] vcnt, input [11:0] pixelIn, output [11:0] pixelOut, output [10:0] sumRowOut
    );
	 
	 reg [11:0] pixOut;
	 reg [10:0] sumRow [5:0] ;
	 
	 assign sumRowOut = sumRow[0];
	 
	 assign pixelOut = pixOut;
	 
	 always @ (hcnt or vcnt) begin
		 if (vcnt == 10'd0) begin
			sumRow[0] = 10'd0;
		 end
		 
		 if(vcnt > 10'd150 && vcnt < 10'd300) begin
			if(hcnt > 10'd50 && hcnt < 10'd125) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd140 && hcnt < 10'd215) begin
				if(vcnt == 10'd200) begin
					sumRow[0] = pixelIn[11:8] + sumRow[0];
				end
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd230 && hcnt < 10'd305) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd335 && hcnt < 10'd410) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd425 && hcnt < 10'd500) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd515 && hcnt < 10'd590) begin
				pixOut = pixelIn;
			end
			else begin
				pixOut = 12'b0000000000;
			end
		 end
	end
	 


endmodule
