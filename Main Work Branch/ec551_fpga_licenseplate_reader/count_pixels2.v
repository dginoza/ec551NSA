`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:26 11/22/2016 
// Design Name: 
// Module Name:    count_pixels 
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
module count_pixels_two(input [18:0] addr, input reset, output reg num_pix_ok

    );

     reg [18:0] pixel_count;
	  reg pixel_received;
	  
	  initial begin
			pixel_count <= 19'd0;
			num_pix_ok <= 1'b0;
		end
     
     always @(addr)begin
	 
			// if reset, clear count and num_pix_ok enable
			if (reset)begin
				pixel_count <= 19'd0;
				num_pix_ok <= 1'b0;
			end
			else begin
				// if pixel received (MATLAB -> FPGA), increment the count
				/*if (pixel_received == 1'b1)begin
					pixel_count <= pixel_count + 1;
				end	*/
				//otherwise, hold the count	
/*				else begin
					pixel_count <= pixel_count;
				end	*/
				// num_pix_ok is an enable used in sys_array module. 
				// If we're past the first two rows of the image, but have not reached the last two, we can 
				// use our window operation.
				// values below for 100x100 image. 
				// had to use 205 instead of 203 due to 2 cycle delay in assigning outputs in sys_array module.
				pixel_count <= addr;
				
				if(pixel_count >= 19'd1285 && pixel_count <= 19'd305915) begin
					num_pix_ok <= 1'b1;
				end	
				// otherwise setting num_pix_ok to 0 will force a black pixel to be returned from sys_array module	
				else begin
					num_pix_ok <= 1'b0;
				end	
					
			end
			
		end


endmodule
