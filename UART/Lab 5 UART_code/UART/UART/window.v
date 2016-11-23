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
module window(datain, clk, reset, out
    );
	 initial begin
		MatFillEnableCount = 12'd0;
	end
	 input [11:0] datain;
	 input clk, reset;
	 output reg [11:0] out;
	 
	 wire [3:0] kernel [0:2][0:2];
	 
	 wire [11:0] pixel [0:8];
	 wire [11:0] w [0:1];
	 reg [9:0] r, b, g;
	 
	 reg [11 : 0] MatFillEnableCount;
	 reg MatFillEnable;
	 parameter MaxCount = 12'd50;//12'h503;
	 
	 
	 // Kernel Decleration
	 assign kernel[0][0] = 5'b11111;
	 assign kernel[0][1] = 5'b11111;
	 assign kernel[0][2] = 5'b11111;
	 assign kernel[1][0] = 5'b11111;
	 assign kernel[1][1] = 5'b01000;
	 assign kernel[1][2] = 5'b11111;
	 assign kernel[2][0] = 5'b11111;
	 assign kernel[2][1] = 5'b11111;
	 assign kernel[2][2] = 5'b11111;
	 //create window
	 
	 Dff dff1(pixel[0][11:0], datain, clk, reset);
	 Dff dff2(pixel[1][11:0], pixel[0][11:0], clk, reset);
	 Dff dff3(pixel[2][11:0], pixel[1][11:0], clk, reset);
	 nFIFO #(.fifosize(10)) fifo1 (pixel[2][11:0], reset, clk, w[0][11:0]);
	 Dff dff4(pixel[3][11:0], w[0][11:0], clk, reset);
	 Dff dff5(pixel[4][11:0], pixel[3][11:0], clk, reset);
	 Dff dff6(pixel[5][11:0], pixel[4][11:0], clk, reset);
	 nFIFO #(.fifosize(10)) fifo2(pixel[5][11:0], reset, clk, w[1][11:0]);
	 Dff dff7(pixel[6][11:0], w[1][11:0], clk, reset);
	 Dff dff8(pixel[7][11:0], pixel[6][11:0], clk, reset);
	 Dff dff9(pixel[8][11:0], pixel[7][11:0], clk, reset);
	 
	 
	 
	 always @ (posedge clk) begin
		if (MatFillEnableCount < MaxCount) begin
			MatFillEnableCount <= MatFillEnableCount + 1'b1;
		end
		else begin
			MatFillEnableCount <= MatFillEnableCount;
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
			r = 4'h0;
			g = 4'h0;
			b = 4'h0;
		end
		out = {r>>6, g>>6, b>>6};
	 end
	
endmodule
