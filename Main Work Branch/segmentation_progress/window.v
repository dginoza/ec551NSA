`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:08 11/05/2016 
// Design Name: 
// Module Name:    window 
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
module window(datain, clk, reset, dataout
    );
		
	 input [11:0] datain;
	 input clk, reset;
	 output reg [11:0] dataout;
	 
	 initial begin
		MatFillEnableCount = 12'd0;
	 end
	 
	 wire [4:0] kernel [0:2][0:2];																			// Image Kernel Used for Kernel Convolution
	 
	 wire [11:0] pixel [0:8];																					// Wires passing pixel data to successive DFFs for kernel convolution
	 wire [11:0] w [0:1];																						// Wires passing pixel data from FIFO output
	 reg [9:0] r, b, g;																							// r,b,g store 10 bit convolution outputs for their respective colors
	 
	 reg [11 : 0] MatFillEnableCount;																		// If MatFillEnableCount == MaxCount, convolution is calculated
	 reg MatFillEnable;
	 parameter MaxCount = 12'h503;
	 //parameter MaxCount = 12'd3;
	 
	 
	 // Kernel Decleration
	 assign kernel[0][0] = 5'b11111;																			// -1
	 assign kernel[0][1] = 5'b11111;																			// -1
	 assign kernel[0][2] = 5'b11111;																			// -1
	 assign kernel[1][0] = 5'b11111;																			// -1
	 assign kernel[1][1] = 5'b01000;																			// 8
	 assign kernel[1][2] = 5'b11111;																			// -1
	 assign kernel[2][0] = 5'b11111;																			// -1
	 assign kernel[2][1] = 5'b11111;																			// -1
	 assign kernel[2][2] = 5'b11111;																			// -1
	 
	 
	 // Convlution Matrix Row 1 
	 Dff dff1(pixel[0][11:0], datain, clk, reset);
	 Dff dff2(pixel[1][11:0], pixel[0][11:0], clk, reset);
	 Dff dff3(pixel[2][11:0], pixel[1][11:0], clk, reset);
	 nFIFO 	#(.fifosize(637))	 fifo1(
													.datain(pixel[2][11:0]),
													.reset(reset),
													.clk(clk),
													.dataout(w[0][11:0])
												);
	 // Convolution Matrix Row 2
	 Dff dff4(pixel[3][11:0], w[0][11:0], clk, reset);
	 Dff dff5(pixel[4][11:0], pixel[3][11:0], clk, reset);
	 Dff dff6(pixel[5][11:0], pixel[4][11:0], clk, reset);
	 nFIFO 	#(.fifosize(637))	 fifo2(
													.datain(pixel[5][11:0]),
													.reset(reset),
													.clk(clk),
													.dataout(w[1][11:0])
												);
	 
	 // Convolution Matrix Row 3
	 Dff dff7(pixel[6][11:0], w[1][11:0], clk, reset);
	 Dff dff8(pixel[7][11:0], pixel[6][11:0], clk, reset);
	 Dff dff9(pixel[8][11:0], pixel[7][11:0], clk, reset);
	 
	 
	 
	 always @ (posedge clk) begin
		if (reset) begin
			MatFillEnableCount <= 1'b0;
		end
		else begin
			if (MatFillEnableCount < MaxCount) begin
				MatFillEnableCount <= MatFillEnableCount + 1'b1;
			end
			else begin
				MatFillEnableCount <= MatFillEnableCount;
			end
		end
	 end
	 
	 
	 always @ (posedge clk) begin
		if (MatFillEnableCount == MaxCount) begin
			MatFillEnable <= 1'b1;
		end
		else begin
			MatFillEnable <= 1'b0;
		end
	 end
	 
	 
	 always @(posedge clk) begin
		if (MatFillEnable) begin
			r = $signed({1'b0,pixel[0][11:8]}) * $signed(kernel[2][2]) + $signed({1'b0,pixel[1][11:8]}) * $signed(kernel[2][1]) + $signed({1'b0,pixel[2][11:8]}) * kernel[2][0] + 
			$signed({1'b0,pixel[3][11:8]}) * kernel[1][2] + $signed({1'b0,pixel[4][11:8]}) * kernel[1][1] + $signed({1'b0,pixel[5][11:8]}) * kernel[1][0] + 
			$signed({1'b0,pixel[6][11:8]}) * kernel[0][2] + $signed({1'b0, pixel[7][11:8]}) * kernel[0][1] + $signed({1'b0,pixel[8][11:8]}) * kernel[0][0];
			
			g = $signed({1'b0,pixel[0][7:4]}) * kernel[2][2] + $signed({1'b0,pixel[1][7:4]}) * kernel[2][1] + $signed({1'b0,pixel[2][7:4]}) * kernel[2][0] + 
			$signed({1'b0,pixel[3][7:4]}) * kernel[1][2] + $signed({1'b0,pixel[4][7:4]}) * kernel[1][1] + $signed({1'b0,pixel[5][7:4]}) * kernel[1][0] + 
			$signed({1'b0,pixel[6][7:4]}) * kernel[0][2] + $signed({1'b0,pixel[7][7:4]}) * kernel[0][1] + $signed({1'b0,pixel[8][7:4]}) * kernel[0][0];
			
			b = $signed({1'b0,pixel[0][3:0]}) * kernel[2][2] + $signed({1'b0,pixel[1][3:0]}) * kernel[2][1] + $signed({1'b0,pixel[2][3:0]}) * kernel[2][0] + 
			$signed({1'b0,pixel[3][3:0]}) * kernel[1][2] + $signed({1'b0,pixel[4][3:0]}) * kernel[1][1] + 
			$signed({1'b0,pixel[5][3:0]}) * kernel[1][0] + $signed({1'b0,pixel[6][3:0]}) * kernel[0][2] + $signed({1'b0,pixel[7][3:0]}) * kernel[0][1] + $signed({1'b0,pixel[8][3:0]}) * kernel[0][0];
		end
		else begin
			r = 10'hfff;
			g = 10'd0;
			b = 10'd0;
		end
		r = r >> 6;
		g = g >> 6;
		b = b >> 6;
		dataout = {r[3:0], g[3:0], b[3:0]};
	 end
	
endmodule
