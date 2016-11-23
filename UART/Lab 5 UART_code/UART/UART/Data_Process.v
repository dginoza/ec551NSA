`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:48 11/02/2015 
// Design Name: 
// Module Name:    Data_Process 
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
module Data_Process(
	input clk,
	input rst,
	input data_collection_finish,
	input data_send_finish,
	output reg data_send_run
   );
	
	always@(posedge clk)
		begin
		if(rst)
			data_send_run <= 1'b0;
		else if(data_collection_finish)					// After 10000 data is received, send 10000 data back to PC
			data_send_run <= 1'b1;
		else if(data_send_finish)							// After sending is finish, clear the data_send signal
			data_send_run <= 1'b0;
		end

endmodule
