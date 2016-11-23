`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:54:24 11/20/2016 
// Design Name: 
// Module Name:    sys_array 
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
module sys_array(input clk, input rst, input [7:0] pixIn, input enable, input num_pix_ok, output reg [7:0] pixOut 
    );
	 
	 reg [4:0] weights [8:0];
	 wire [7:0] prevPixels [8:0]; // pixel in as top left, pixel[0] as top center
	 reg [16:0] tempOut;
	 reg [16:0] tempOut0;
	 reg [16:0] tempOut1;
	 reg [16:0] tempOut2;
	 reg [16:0] tempOut3;
	 reg [16:0] tempOut4;
	 reg [16:0] tempOut5;
	 reg [16:0] tempOut6;
	 reg [16:0] tempOut7;
	 reg [16:0] tempOut8;
	 wire [7:0] queue1out;
	 wire [7:0] queue2out;
	 
	 // Setup our flip-flops to hold pixels in the window and fifo queues.
	 // inputs to each flip-flop used for matrix convolution operation. Inputs were used instead of outputs
	 // as there was a smaller delay when using inputs
	 Dff dff1(prevPixels[0], pixIn, clk, reset);
	 Dff dff2(prevPixels[1], prevPixels[0], clk, reset);
	 Dff dff3(prevPixels[2], prevPixels[1], clk, reset);
	 nFIFO #(.fifosize(96)) fifo1 (prevPixels[2], reset, clk, queue1out);
	 Dff dff4(prevPixels[3],queue1out, clk, reset);
	 Dff dff5(prevPixels[4], prevPixels[3], clk, reset);
	 Dff dff6(prevPixels[5], prevPixels[4], clk, reset);
	 nFIFO #(.fifosize(96)) fifo2(prevPixels[5], reset, clk, queue2out);
	 Dff dff7(prevPixels[6], queue2out, clk, reset);
	 Dff dff8(prevPixels[7],prevPixels[6], clk, reset);
	 Dff dff9(prevPixels[8], prevPixels[7], clk, reset);
	 
	 always @ (posedge clk) begin
	 
		 if (rst) begin
			tempOut0 <= 0;
			tempOut1 <= 0;
			tempOut2 <= 0;
			tempOut3 <= 0;
			tempOut4 <= 0;
			tempOut5 <= 0;
			tempOut6 <= 0;
			tempOut7 <= 0;
			tempOut8 <= 0;
			
			// uncomment below to test edge detection
			weights[0] <= $signed(-1);
			weights[1] <= $signed(-1);
			weights[2] <= $signed(-1);
			weights[3] <= $signed(-1);
			weights[4] <= $signed(8);
			weights[5] <= $signed(-1);
			weights[6] <= $signed(-1);
			weights[7] <= $signed(-1);
			weights[8] <= $signed(-1);
			
			//uncomment below to test identity matrix
			/*weights[0] <= $signed(0);
			weights[1] <= $signed(0);
			weights[2] <= $signed(0);
			weights[3] <= $signed(0);
			weights[4] <= $signed(1);
			weights[5] <= $signed(0);
			weights[6] <= $signed(0);
			weights[7] <= $signed(0);
			weights[8] <= $signed(0);*/
		end
		else begin

			// if pixel received over UART (MATLAB -> FPGA), enable the window operation
			if (enable) begin
				// multiply pixel by weight. Note 0 added to start of each pixel to prevent changes in sign
				// tempOut will be a 17 bit number
				tempOut0 <= $signed(weights[0])*$signed({1'b0,pixIn}); 
				tempOut1 <= $signed(weights[1])*$signed({1'b0,prevPixels[0]});
				tempOut2 <= $signed(weights[2])*$signed({1'b0,prevPixels[1]});
				tempOut3 <= $signed(weights[3])*$signed({1'b0,queue1out});
				tempOut4 <= $signed(weights[4])*$signed({1'b0,prevPixels[3]});
				tempOut5 <= $signed(weights[5])*$signed({1'b0,prevPixels[4]});
				tempOut6 <= $signed(weights[6])*$signed({1'b0,queue2out});
				tempOut7 <= $signed(weights[7])*$signed({1'b0,prevPixels[6]});
				tempOut8 <= $signed(weights[8])*$signed({1'b0,prevPixels[7]});
				tempOut <= tempOut0 + tempOut1 + tempOut2 + tempOut3 + tempOut4 + 
							  tempOut5 + tempOut6 + tempOut7 + tempOut8;
				
				// if we've received enough pixels to run the convolution
				if(num_pix_ok)begin
					// Saturation conditions: this code is taking in 8-bit pixels from MATLAB (can take values from 0-255)
					// tempOut is a 17 bit number. We need to return an 8 bit pixel to use in our processed image. 
					// if tempOut is less than 0 we return a black pixel
					if($signed(tempOut) < 0)begin
						pixOut <= 8'd0;
					end	
					// if tempOut is greater than 255 we return a white pixel	
					else if ($signed(tempOut) > 255) begin
						pixOut <= 8'd255;
					end	
					// otherwise (0 < pixel < 255) we return the value of the pixel	
					else begin 
						pixOut <= tempOut;
					end	
				end
				// otherwise output a black pixel (should result in black rows for first 2 and last 2 rows
				// of processed image
				else
					pixOut <= 8'b0;
			end
			
		 end
	
		
	 end


endmodule
