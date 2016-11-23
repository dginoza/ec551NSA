`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:19:06 11/20/2016
// Design Name:   sys_array
// Module Name:   X:/My Documents/551/convolution/tb_sys_array.v
// Project Name:  convolution
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sys_array
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_sys_array;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] pixIn;
	reg enable;
	reg num_pix_ok;
	// Outputs
	wire [7:0] pixOut;
	reg [7:0] Ip;

	integer i;

	// Instantiate the Unit Under Test (UUT)
	sys_array SA (
		.clk(clk), 
		.rst(rst), 
		.pixIn(pixIn), 
		.enable(enable),
		.num_pix_ok(num_pix_ok),		
		.pixOut(pixOut)
	);
	
	initial begin 
	clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
	# 10000 $finish;
	end
	
		
	always begin
		#10 Ip = {$random % 255};
	end
	
	initial begin
		// Initialize Inputs
		//pixIn = 0;
		rst = 1;
		clk = 0;
		enable = 1;
		num_pix_ok = 0;
		#10; 
		rst = 0;
		
		for (i = 1; i <3000; i = i+1) begin
			if(i == 203)
				num_pix_ok = 1;
			   pixIn = Ip;
				#10;
			//#10 pixIn = i;
		
		end

	end

      
endmodule

