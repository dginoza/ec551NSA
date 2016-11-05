`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:19:28 11/05/2016
// Design Name:   window
// Module Name:   X:/My Documents/EC551/Project_test/test_window.v
// Project Name:  Project_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: window
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_window;

	// Inputs
	reg [11:0] datain;
	reg clk;
	reg reset;
	integer i;

	// Outputs
	wire [11:0] out;


	reg [11 : 0] Ip;
	// Instantiate the Unit Under Test (UUT)
	window uut (
		.datain(datain), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

	always begin
	#5 clk = ~clk;
	end
	
	always begin
		#10 Ip = {$random % 15};
	end
	
	initial begin
		// Initialize Inputs
		datain = 0;
		reset = 1;
		clk = 0;
		#10 reset = 0;
		
		for (i = 0; i <3000; i = i+1) begin
			#10 datain = Ip;
		
		end

	end
      
endmodule

