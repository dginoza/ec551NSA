`timescale 1ns / 1ps

module segment(input [9:0] hcnt, input [9:0] vcnt, input [11:0] pixelIn, output [11:0] pixelOut, output reg [4:0] seg1Count,
			output reg [4:0] seg2Count, output reg [4:0] seg3Count, output reg [4:0] seg4Count, output reg [4:0] seg5Count,
			output reg [4:0] seg6Count
    );
	 
	 reg [11:0] pixOut;
	 
	 reg [3:0] s_1count;
	 reg [3:0] s_2count;
	 reg [3:0] s_3count;
	 reg [3:0] s_4count;
	 reg [3:0] s_5count;
	 reg [3:0] s_6count;
	 
	 reg [13:0] quad11; //max 2^14
	 reg [13:0] quad12;
	 reg [13:0] quad13;
	 reg [13:0] quad14;
	 
	 reg [13:0] quad21;
	 reg [13:0] quad22;
	 reg [13:0] quad23;
	 reg [13:0] quad24;
	 
	 reg [13:0] quad31;
	 reg [13:0] quad32;
	 reg [13:0] quad33;
	 reg [13:0] quad34;
	 
	 reg [13:0] quad41;
	 reg [13:0] quad42;
	 reg [13:0] quad43;
	 reg [13:0] quad44;
	 
	 reg [13:0] quad51;
	 reg [13:0] quad52;
	 reg [13:0] quad53;
	 reg [13:0] quad54;
	 
	 reg [13:0] quad61;
	 reg [13:0] quad62;
	 reg [13:0] quad63;
	 reg [13:0] quad64;
	 
	 // Thresholds
	 parameter d4_q1 = 14'd50; // closer to 50 than 100?
	 parameter d4_q2 = 14'd50;
	 parameter d4_q3 = 14'd50;
	 parameter d4_q4 = 14'd50;
	 
	 parameter d2_q1 = 14'd100;
	 parameter d2_q2 = 14'd100;
	 parameter d2_q3 = 14'd100;
	 parameter d2_q4 = 14'd100;
	 
	 parameter d9_q1 = 14'd100;
	 parameter d9_q2 = 14'd100;
	 parameter d9_q3 = 14'd100;
	 parameter d9_q4 = 14'd100;
	 
	 parameter d1_q1 = 14'd100;
	 parameter d1_q2 = 14'd100;
	 parameter d1_q3 = 14'd100;
	 parameter d1_q4 = 14'd100;
	 
	 parameter dE_q1 = 14'd100;
	 parameter dE_q2 = 14'd100;
	 parameter dE_q3 = 14'd100;
	 parameter dE_q4 = 14'd100;
	 
	 parameter dM_q1 = 14'd100;
	 parameter dM_q2 = 14'd100;
	 parameter dM_q3 = 14'd100;
	 parameter dM_q4 = 14'd100;
	 
	 
	 assign seg1Count = s_1count;
	 assign seg2Count = s_2count;
	 assign seg3Count = s_3count;
	 assign seg4Count = s_4count;
	 assign seg5Count = s_5count;
	 assign seg6Count = s_6count;
	 
	 assign pixelOut = pixOut;
	 
	 
	 always @ (hcnt or vcnt or quad11 or quad21 or quad12 or quad22 or quad13 or quad23 or quad14 or quad24) begin
		 if (vcnt == 10'd0) begin
			d4_1count = 4'd0;
			quad11 = 14'd0;
			quad12 = 14'd0;
			quad13 = 14'd0;
			quad14 = 14'd0;
			
			quad21 = 14'd0;
			quad22 = 14'd0;
			quad23 = 14'd0;
			quad24 = 14'd0;
			
			quad31 = 14'd0;
			quad32 = 14'd0;
			quad33 = 14'd0;
			quad34 = 14'd0;
			
			quad41 = 14'd0;
			quad42 = 14'd0;
			quad43 = 14'd0;
			quad44 = 14'd0;
			
			quad51 = 14'd0;
			quad52 = 14'd0;
			quad53 = 14'd0;
			quad54 = 14'd0;
			
			quad61 = 14'd0;
			quad62 = 14'd0;
			quad63 = 14'd0;
			quad64 = 14'd0;
		 end
		 
		 // ------ 4/2 Threshold of segment 1
		 if (d4_q1-quad11 < d2_q1-quad11) begin
			seg1Count = 4'b0011 + seg1Count;
		 end
		 
		 if (d4_q2-quad12 < d2_q2-quad12) begin
			seg1Count = 4'b0001 + seg1Count;
		 end
		 
		 if (d4_q3-quad13 < d2_q3-quad13) begin
			seg1Count = 4'b0101 + seg1Count;
		 end
		 
		 if (d4_q4-quad14 < d2_q4-quad14) begin
			seg1Count = 4'b0001 + seg1Count;
		 end
		 
		 // ------ 4/2 Threshold of segment 2
		 if (d4_q1-quad21 < d2_q1-quad21) begin
			seg2Count = 4'b0011 + seg2Count;
		 end
		 
		 if (d4_q2-quad22 < d2_q2-quad22) begin
			seg2Count = 4'b0001 + seg2Count;
		 end
		 
		 if (d4_q3-quad23 < d2_q3-quad23) begin
			seg2Count = 4'b0101 + seg2Count;
		 end
		 
		 if (d4_q4-quad24 < d2_q4-quad24) begin
			seg2Count = 4'b0001 + seg2Count;
		 end
		 
		 // ------ 8/1 Threshold of segment 3
		 if (d8_q1-quad31 < d1_q1-quad31) begin
			seg3Count = 4'b0011 + seg3Count;
		 end
		 
		 if (d8_q2-quad32 < d1_q2-quad32) begin
			seg3Count = 4'b0001 + seg3Count;
		 end
		 
		 if (d8_q3-quad33 < d1_q3-quad33) begin
			seg3Count = 4'b0101 + seg3Count;
		 end
		 
		 if (d8_q4-quad34 < d1_q4-quad34) begin
			seg3Count = 4'b0001 + seg3Count;
		 end
		 
		 // ------ E/M Threshold of segment 4
		 if (dE_q1-quad41 < dM_q1-quad41) begin
			seg4Count = 4'b0011 + seg4Count;
		 end
		 
		 if (dE_q2-quad42 < dM_q2-quad42) begin
			seg4Count = 4'b0001 + seg4Count;
		 end
		 
		 if (dE_q3-quad43 < dM_q3-quad43) begin
			seg4Count = 4'b0101 + seg4Count;
		 end
		 
		 if (dE_q4-quad44 < dM_q4-quad44) begin
			seg4Count = 4'b0001 + seg4Count;
		 end
		 
		 // ------ E/M Threshold of segment 5
		 if (dE_q1-quad51 < dM_q1-quad51) begin
			seg5Count = 4'b0011 + seg5Count;
		 end
		 
		 if (dE_q2-quad52 < dM_q2-quad52) begin
			seg5Count = 4'b0001 + seg5Count;
		 end
		 
		 if (dE_q3-quad53 < dM_q3-quad53) begin
			seg5Count = 4'b0101 + seg5Count;
		 end
		 
		 if (dE_q4-quad54 < dM_q4-quad54) begin
			seg5Count = 4'b0001 + seg5Count;
		 end
		 
		 // ------ 9/1 Threshold of segment 6
		 if (d9_q1-quad61 < d1_q1-quad61) begin
			seg6Count = 4'b0011 + seg6Count;
		 end
		 
		 if (d9_q2-quad62 < d1_q2-quad62) begin
			seg6Count = 4'b0001 + seg6Count;
		 end
		 
		 if (d9_q3-quad63 < d1_q3-quad63) begin
			seg6Count = 4'b0101 + seg6Count;
		 end
		 
		 if (d9_q4-quad64 < d1_q4-quad64) begin
			seg6Count = 4'b0001 + seg6Count;
		 end
		 
		 // Upper half of segments
		 if(vcnt > 10'd150 && vcnt <= 10'd225) begin
		 
			// segment 1, quad 1 (upper left)
			if(hcnt > 10'd50 && hcnt <= 10'd87) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad11 = pixelIn[11:8] + quad11;
					
				pixOut = pixelIn;
				
			end
			// segment 1, quad 2 (upper right)
			else if(hcnt > 10'd87 && hcnt < 10'd125) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad12 = pixelIn[11:8] + quad12;
					
				pixOut = pixelIn;
			end
			
			// segment 2, quad 1 (upper left)
			else if (hcnt > 10'd140 && hcnt <= 10'd177) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad21 = pixelIn[11:8] + quad21;
					
				pixOut = pixelIn;
			end
			// segment 2, quad 2 (upper right)
			else if (hcnt > 10'd177 && hcnt < 10'd215) begin
				
				if(pixelIn[11:8] == 4'b1010)
					quad22 = pixelIn[11:8] + quad22;
					
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd230 && hcnt <= 10'd267) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad31 = pixelIn[11:8] + quad31;
					
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd267 && hcnt < 10'd305) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad32 = pixelIn[11:8] + quad32;
					
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd335 && hcnt <= 10'd372) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad41 = pixelIn[11:8] + quad41;
					
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd372 && hcnt <= 10'd410) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad42 = pixelIn[11:8] + quad42;
					
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd425 && hcnt <= 10'd462) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad51 = pixelIn[11:8] + quad51;
					
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd462 && hcnt < 10'd500) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad52 = pixelIn[11:8] + quad52;
					
				pixOut = pixelIn;
			end
			
			else if (hcnt > 10'd515 && hcnt <= 10'd552) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad61 = pixelIn[11:8] + quad61;
					
				pixOut = pixelIn;
			end
			else if (hcnt > 10'd552 && hcnt < 10'd590) begin
			
				if(pixelIn[11:8] == 4'b1010)
					quad62 = pixelIn[11:8] + quad62;
					
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
				if(pixelIn[11:8] == 4'b1010)
					quad13 = pixelIn[11:8] + quad13;
			end
			// segment 1, quad 4 (bottom right)
			else if(hcnt > 10'd87 && hcnt < 10'd125) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad14 = pixelIn[11:8] + quad14;
			end
			
			// segment 2, quad 3 (bottom left)
			else if (hcnt > 10'd140 && hcnt <= 10'd177) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad23 = pixelIn[11:8] + quad23;
			end
			// segment 2, quad 4 (bottom right)
			else if (hcnt > 10'd177 && hcnt < 10'd215) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad24 = pixelIn[11:8] + quad24;
			end
			
			else if (hcnt > 10'd230 && hcnt <= 10'd267) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad33 = pixelIn[11:8] + quad33;
			end
			else if (hcnt > 10'd267 && hcnt < 10'd305) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad34 = pixelIn[11:8] + quad34;
			end
			
			else if (hcnt > 10'd335 && hcnt <= 10'd372) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad43 = pixelIn[11:8] + quad43;
			end
			else if (hcnt > 10'd372 && hcnt <= 10'd410) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad44 = pixelIn[11:8] + quad44;
			end
			
			else if (hcnt > 10'd425 && hcnt < 10'd462) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad53 = pixelIn[11:8] + quad53;
			end
			else if (hcnt > 10'd425 && hcnt < 10'd500) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad54 = pixelIn[11:8] + quad54;
			end
			
			else if (hcnt > 10'd515 && hcnt < 10'd552) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad63 = pixelIn[11:8] + quad63;
			end
			else if (hcnt > 10'd552 && hcnt < 10'd590) begin
				pixOut = pixelIn;
				if(pixelIn[11:8] == 4'b1010)
					quad64 = pixelIn[11:8] + quad64;
			end
			
			else begin
				pixOut = 12'b0000000000;
			end
		 end
	end
	 


endmodule
