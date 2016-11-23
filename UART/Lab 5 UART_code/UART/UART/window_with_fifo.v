`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:15:45 11/22/2016 
// Design Name: 
// Module Name:    window_with_fifo 
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
module window_with_fifo(input clk, input rst, input [7:0] pixIn, output reg [7:0] pixOut, output start_uart 
    );
	 
	 sys_array window(clk, rst, pixIn, enable, pixOut);
	 nFIFO #(.fifosize(97)) fifo1 (pixel[2][11:0], reset, clk, w[0][11:0]);
	 


endmodule
