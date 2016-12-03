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
	 
	 reg [2:0] d4_1count;
	 reg [2:0] d4_2count;
	 
	 reg [13:0] quad11; //max 2^14
	 reg [13:0] quad12;
	 reg [13:0] quad13;
	 reg [13:0] quad14;
	 
	 reg [13:0] quad21;
	 reg [13:0] quad22;
	 reg [13:0] quad23;
	 reg [13:0] quad24;
	 
	 reg quad31;
	 reg quad32;
	 reg quad33;
	 reg quad34;
	 
	 reg quad41;
	 reg quad42;
	 reg quad43;
	 reg quad44;
	 
	 reg quad51;
	 reg quad52;
	 reg quad53;
	 reg quad54;
	 
	 reg quad61;
	 reg quad62;
	 reg quad63;
	 reg quad64;
	 
	 parameter d4_q1 = 14'd10619;
	 parameter d4_q2 = 14'd9831;
	 parameter d4_q3 = 14'd10945;
	 parameter d4_q4 = 14'd10820;
	 
	 parameter d2_q1 = 14'd11345;
	 parameter d2_q2 = 14'd11468;
	 parameter d2_q3 = 14'd11331;
	 parameter d2_q4 = 14'd11179;
	 
	 parameter d4_q1R = 14'd107;
	 
	 
	 assign sumRowOut = d4_1count;
	 
	 assign pixelOut = pixOut;
	 
	 
	 always @ (hcnt or vcnt or quad11 or quad21 or quad12 or quad22 or quad13 or quad23 or quad14 or quad24) begin
		 if (vcnt == 10'd0) begin
			d4_1count = 3'd0;
		 end
		 
		 if ((quad11/quad12)*100 > d4_q1R) begin
			d4_1count = 1'd3;
		 end
		 
		 /*if (d4_q2-quad12 < d2_q1-quad12) begin
			d4_1count = 1'b1 + d4_1count;
		 end
		 
		 if (d4_q3-quad13 < d2_q1-quad13) begin
			d4_1count = 1'b1 + d4_1count;
		 end
		 
		 if (d4_q1-quad14 < d2_q1-quad14) begin
			d4_1count = 1'b1 + d4_1count;
		 end*/
		 
		 // Upper half of segments
		 if(vcnt > 10'd150 && vcnt <= 10'd225) begin
		 
			// segment 1, quad 1 (upper left)
			if(hcnt > 10'd50 && hcnt <= 10'd87) begin
				pixOut = pixelIn;
				quad11 = pixelIn[11:8] + quad11;
			end
			// segment 1, quad 2 (upper right)
			else if(hcnt > 10'd87 && hcnt < 10'd125) begin
				pixOut = pixelIn;
				quad12 = pixelIn[11:8] + quad12;
			end
			
			// segment 2, quad 1 (upper left)
			else if (hcnt > 10'd140 && hcnt <= 10'd177) begin
				pixOut = pixelIn;
				quad21 = pixelIn[11:8] + quad21;
			end
			// segment 2, quad 2 (upper right)
			else if (hcnt > 10'd177 && hcnt < 10'd215) begin
				pixOut = pixelIn;
				quad22 = pixelIn[11:8] + quad22;
			end
			
			else if (hcnt > 10'd230 && hcnt <= 10'd267) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd267 && hcnt < 10'd305) begin
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd335 && hcnt <= 10'd372) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd372 && hcnt <= 10'd410) begin
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd425 && hcnt <= 10'd462) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd462 && hcnt < 10'd500) begin
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd515 && hcnt <= 10'd552) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd552 && hcnt < 10'd590) begin
				pixOut = pixelIn;
			end
			
			else begin
				pixOut = 12'b0000000000;
			end
			
		 end
		 else if (vcnt > 10'd225 && vcnt <= 10'd300) begin
		 
			// segment 1, quad 3 (bottom left)
			if(hcnt > 10'd50 && hcnt <= 10'd87) begin
				pixOut = pixelIn;
				quad13 = pixelIn[11:8] + quad13;
			end
			// segment 1, quad 4 (bottom right)
			else if(hcnt > 10'd87 && hcnt < 10'd125) begin
				pixOut = pixelIn;
				quad14 = pixelIn[11:8] + quad14;
			end
			
			// segment 2, quad 3 (bottom left)
			else if (hcnt > 10'd140 && hcnt <= 10'd177) begin
				pixOut = pixelIn;
				quad23 = pixelIn[11:8] + quad23;
			end
			// segment 2, quad 4 (bottom right)
			else if (hcnt > 10'd177 && hcnt < 10'd215) begin
				pixOut = pixelIn;
				quad24 = pixelIn[11:8] + quad24;
			end
			
			else if (hcnt > 10'd230 && hcnt <= 10'd267) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd267 && hcnt < 10'd305) begin
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd335 && hcnt <= 10'd372) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd372 && hcnt <= 10'd410) begin
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd425 && hcnt < 10'd462) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd425 && hcnt < 10'd500) begin
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd515 && hcnt < 10'd552) begin
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd552 && hcnt < 10'd590) begin
				pixOut = pixelIn;
			end
			
			else begin
				pixOut = 12'b0000000000;
			end
		 end
	end
	 


endmodule
