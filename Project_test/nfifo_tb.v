`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:05 11/02/2016
// Design Name:   nFIFO
// Module Name:   /ad/eng/users/d/g/dginoza/My Documents/EC551/Project_test/nfifo_tb.v
// Project Name:  Project_test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nFIFO
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nfifo_tb;

	// Inputs
	reg [11:0] datain;
	reg clk, reset;

	// Outputs
	wire [11:0] dataout;
	integer i;

	// Instantiate the Unit Under Test (UUT)
	nFIFO uut (
		.datain(datain), 
		.clk(clk), 
		.dataout(dataout),
		.reset(reset)
	);
	
	always begin
	#5 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		datain = 0;
		reset = 1;
		clk = 0;
		#10 reset = 0;
		
		for (i = 0; i <50; i = i+1) begin
			#10 datain = datain + 1;
		
		end
		
		

		// Wait 100 ns for global reset to finish
		#100 $finish;
        
		// Add stimulus here

	end
      
endmodule

