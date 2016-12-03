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
module sys_array(input clk, input rst, input [11:0] datainRGB, input pixel_rdy, input num_pix_ok, output reg [11:0] pixOut
    );
	 
	 reg [4:0] weights [8:0];
	 wire [11:0] prevPixels [8:0]; // pixel in as top left, pixel[0] as top center
	 reg [17:0] tempOut;
	 reg [17:0] tempOut0;
	 reg [17:0] tempOut1;
	 reg [17:0] tempOut2;
	 reg [17:0] tempOut3;
	 reg [17:0] tempOut4;
	 reg [17:0] tempOut5;
	 reg [17:0] tempOut6;
	 reg [17:0] tempOut7;
	 reg [17:0] tempOut8;
	 wire [11:0] queue1out;
	 wire [11:0] queue2out;
	 wire [11:0] datain;
	 
	 reg [3:0] R;
	 reg [3:0] G;
	 reg [3:0] B;
	 
	 
	 wire [3:0] Y;
	 wire [3:0] Ur;
	 wire [3:0] Vr;
	 
	
 
	 assign Y = (datainRGB[11:8] + 4'd2*datainRGB[7:4] + datainRGB[3:0])/4'd4;
	 assign Ur = datainRGB[11:8] - datainRGB[7:4];
	 assign Vr = datainRGB[3:0] - datainRGB[7:4];
	 assign datain = {Y,Ur,Vr};
	 
/*	 always @ (Y) 
		case (Y) 
			12'b000000000000 : datain <= 12'b000000000000; 
			12'b000000000001 : datain <= 12'b000011111111; 
			12'b000000000010 : datain <= 12'b000111111110;
			12'b000000000011 : datain <= 12'b001011111101;
			12'b000000000100 : datain <= 12'b001111111100;
			12'b000000000101 : datain <= 12'b010011111011;
			12'b000000000110 : datain <= 12'b010111111010;
			12'b000000000111 : datain <= 12'b011011111001;
			12'b000000001000 : datain <= 12'b011111111000;
			12'b000000001001 : datain <= 12'b100011110111;
			12'b000000001010 : datain <= 12'b100111110110;
			12'b000000001011 : datain <= 12'b101100100010;
			12'b000000001100 : datain <= 12'b101111110100;
			12'b000000001101 : datain <= 12'b110011110011; 	
			12'b000000001110 : datain <= 12'b110111110010;
			12'b000000001111 : datain <= 12'b111011110001;			
    endcase*/
	 
	 
	 
	 
	 
	 // Setup our flip-flops to hold pixels in the window and fifo queues.
	 // inputs to each flip-flop used for matrix convolution operation. Inputs were used instead of outputs
	 // as there was a smaller delay when using inputs
	 Dff dff1(prevPixels[0], datain, clk, reset);
	 Dff dff2(prevPixels[1], prevPixels[0], clk, reset);
	 Dff dff3(prevPixels[2], prevPixels[1], clk, reset);
	 nFIFO #(.fifosize(636)) fifo1 (prevPixels[2], reset, clk, queue1out);
	 Dff dff4(prevPixels[3],queue1out, clk, reset);
	 Dff dff5(prevPixels[4], prevPixels[3], clk, reset);
	 Dff dff6(prevPixels[5], prevPixels[4], clk, reset);
	 nFIFO #(.fifosize(636)) fifo2(prevPixels[5], reset, clk, queue2out);
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
			
/*			weights[0] <= $signed(2);
			weights[1] <= $signed(2);
			weights[2] <= $signed(0);
			weights[3] <= $signed(2);
			weights[4] <= $signed(0);
			weights[5] <= $signed(-2);
			weights[6] <= $signed(0);
			weights[7] <= $signed(-2);
			weights[8] <= $signed(-2);*/
			
			//uncomment below to test identity matrix
/*			weights[0] <= $signed(0);
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
			if (pixel_rdy) begin
				// multiply pixel by weight. Note 0 added to start of each pixel to prevent changes in sign
				// tempOut will be a 17 bit number
				tempOut0 <= $signed(weights[0])*$signed({1'b0,datain[11:8]}); 
				tempOut1 <= $signed(weights[1])*$signed({1'b0,prevPixels[0][11:8]});
				tempOut2 <= $signed(weights[2])*$signed({1'b0,prevPixels[1][11:8]});
				tempOut3 <= $signed(weights[3])*$signed({1'b0,queue1out[11:8]});
				tempOut4 <= $signed(weights[4])*$signed({1'b0,prevPixels[3][11:8]});
				tempOut5 <= $signed(weights[5])*$signed({1'b0,prevPixels[4][11:8]});
				tempOut6 <= $signed(weights[6])*$signed({1'b0,queue2out[11:8]});
				tempOut7 <= $signed(weights[7])*$signed({1'b0,prevPixels[6][11:8]});
				tempOut8 <= $signed(weights[8])*$signed({1'b0,prevPixels[7][11:8]});
				tempOut <= tempOut0 + tempOut1 + tempOut2 + tempOut3 + tempOut4 + 
							  tempOut5 + tempOut6 + tempOut7 + tempOut8;
				
				// if we've received enough pixels to run the convolution
				if(num_pix_ok)begin
					// Saturation conditions: this code is taking in 8-bit pixels from MATLAB (can take values from 0-255)
					// tempOut is a 17 bit number. We need to return an 8 bit pixel to use in our processed image. 
					// if tempOut is less than 0 we return a black pixel
					if($signed(tempOut) < 0)begin
					
						//G <= 4'b0000 - ((prevPixels[3][7:4] + prevPixels[3][3:0])/4'd4);
						//R <= prevPixels[3][7:4] + G;
						//B <= prevPixels[3][3:0] + B;
					
						//pixOut <= {4'b0000,prevPixels[3][7:4],prevPixels[3][3:0]};
						pixOut <= {4'b0000,4'b0000,4'b0000};
					end	
					// if tempOut is greater than 255 we return a white pixel	(can change to <255 ..)
					else if ($signed(tempOut) > 255) begin
						//pixOut <= 12'd4095;
						//G <= 4'b1111 - ((prevPixels[3][7:4] + prevPixels[3][3:0])/4'd4);
						//R <= prevPixels[3][7:4] + G;
						//B <= prevPixels[3][3:0] + B;
						
						//pixOut <= {4'b1111,prevPixels[3][7:4],prevPixels[3][3:0]};
						pixOut <= {4'b1111,4'b1111,4'b1111};
					end	
					// otherwise (0 < pixel < 255) we return the value of the pixel	
					else begin 
						//pixOut <= tempOut;
						//G <= tempOut[3:0] - ((prevPixels[3][7:4] + prevPixels[3][3:0])/4'd4);
						//R <= prevPixels[3][7:4] + G;
						//B <= prevPixels[3][3:0] + B;
						//pixOut <= {tempOut[3:0],prevPixels[3][7:4],prevPixels[3][3:0]};
						pixOut <= {tempOut[3:0],tempOut[3:0],tempOut[3:0]};
					end	
				end
				// otherwise output a black pixel (should result in black rows for first 2 and last 2 rows
				// of processed image
				else
						//G <= 4'b0000 - ((prevPixels[3][7:4] + prevPixels[3][3:0])/4'd4);
						//R <= prevPixels[3][7:4] + G;
						//B <= prevPixels[3][3:0] + B;
						//pixOut <= {4'b0000,prevPixels[3][7:4],prevPixels[3][3:0]};
						pixOut <= {4'b0000,4'b0000,4'b0000};
			end
			
		 end
		 
	
		
	 end


endmodule
