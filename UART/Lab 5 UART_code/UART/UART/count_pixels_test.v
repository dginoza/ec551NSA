`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:06:12 11/22/2016
// Design Name:   count_pixels
// Module Name:   X:/Desktop/UART/Lab 5 UART_code/UART/UART/count_pixels_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: count_pixels
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module count_pixels_test;

	// Inputs
	reg clk;
	reg pixel_received;
	reg reset;

	// Outputs
	wire num_pix_ok;

	integer i;
	// Instantiate the Unit Under Test (UUT)
	count_pixels uut (
		.clk(clk), 
		.pixel_received(pixel_received), 
		.reset(reset), 
		.num_pix_ok(num_pix_ok)
	);

	always begin
	#5 clk = ~clk;
	end
	
	initial begin
		// Initialize Inputs
		clk = 0;
		pixel_received = 0;
		reset = 1;
		#10;
		reset = 0;
		pixel_received = 1;
		for (i = 0; i <400; i = i+1) begin
			#10 ;
		end	
		pixel_received = 0;
		for (i = 0; i <400; i = i+1) begin
			#10 ;
	
		end
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

