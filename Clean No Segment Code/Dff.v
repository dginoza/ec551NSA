`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:31 11/02/2016 
// Design Name: 
// Module Name:    Dff 
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
module Dff(q, d, clk, reset
    );
	 
	 input [11:0] d;
	 input clk, reset;
	 output reg [11:0] q;
	 
	 always @(posedge clk) begin 
	 
		if (reset) begin
			q <= 0;
		end
		else begin
			q [11:0] <= d [11:0];
		end
	 
	 end


endmodule
