`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// based on code from:  https://www.element14.com/community/thread/23394/l/draw-vga-color-bars-with-fpga-in-verilog?displayFullThread=true
//
//////////////////////////////////////////////////////////////////////////////////
module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	input wire [4:0] seg1countin,
	input wire [4:0] seg2countin,
	input wire [4:0] seg3countin,
	input wire [4:0] seg4countin,
	input wire [4:0] seg5countin,
	input wire [4:0] seg6countin,
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [3:0] red,	//red vga output
	output reg [3:0] green, //green vga output
	output reg [3:0] blue	//blue vga output
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(*)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// Segment 1 Area
		if (hc >= (hbp+50) && hc < (hbp+125) && vc >= (vbp+150) && vc < (vbp+300))
		begin
			if(seg1countin > 5'd5) begin
				// Draw a 4
				if (hc >= (hbp+50) && hc < (hbp+75) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50) && hc < (hbp+100) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+100) && hc < (hbp+125) && vc >= (vbp+150) && vc < (vbp+250)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
				
			end
			else begin
				// Draw a 2
				if (hc >= (hbp+50) && hc < (hbp+125) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+100) && hc < (hbp+125) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50) && hc < (hbp+125) && vc >= (vbp+200) && vc < (vbp+225)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50) && hc < (hbp+75) && vc >= (vbp+225) && vc < (vbp+250)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50) && hc < (hbp+125) && vc >= (vbp+250) && vc < (vbp+275)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
		end
		
		// Segment 2 Area
		else if (hc >= (hbp+140) && hc < (hbp+215) && vc >= (vbp+150) && vc < (vbp+300))
		begin
			if(seg2countin > 5'd5) begin
				// Draw a 4
				if (hc >= (hbp+50+90) && hc < (hbp+75+90) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50+90) && hc < (hbp+100+90) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+100+90) && hc < (hbp+125+90) && vc >= (vbp+150) && vc < (vbp+250)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
				
			end
			else begin
				// Draw a 2
				if (hc >= (hbp+50+90) && hc < (hbp+125+90) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+100+90) && hc < (hbp+125+90) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50+90) && hc < (hbp+125+90) && vc >= (vbp+200) && vc < (vbp+225)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50+90) && hc < (hbp+75+90) && vc >= (vbp+225) && vc < (vbp+250)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+50+90) && hc < (hbp+125+90) && vc >= (vbp+250) && vc < (vbp+275)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
		end
		
		// Segment 3 Area
		else if (hc >= (hbp+230) && hc < (hbp+305) && vc >= (vbp+150) && vc < (vbp+300))
		begin
			if(seg3countin > 5'd5) begin
			// Draw a 1
				if (hc >= (hbp+250) && hc < (hbp+275) && vc >= (vbp+150) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
				
			end
			else begin
				// Draw a 8
				if (hc >= (hbp+230) && hc < (hbp+305) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+230) && hc < (hbp+250) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+285) && hc < (hbp+305) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+230) && hc < (hbp+305) && vc >= (vbp+200) && vc < (vbp+220)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+230) && hc < (hbp+305) && vc >= (vbp+220) && vc < (vbp+240)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+230) && hc < (hbp+250) && vc >= (vbp+240) && vc < (vbp+280)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+285) && hc < (hbp+305) && vc >= (vbp+240) && vc < (vbp+280)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+230) && hc < (hbp+305) && vc >= (vbp+280) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
		end
		
		// Segment 4 Area
		else if (hc >= (hbp+335) && hc < (hbp+410) && vc >= (vbp+150) && vc < (vbp+300))
		begin
			if(seg4countin > 5'd5) begin
			// Draw an E
				if (hc >= (hbp+335) && hc < (hbp+410) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335) && hc < (hbp+360) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335) && hc < (hbp+360) && vc >= (vbp+210) && vc < (vbp+235)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335) && hc < (hbp+360) && vc >= (vbp+275) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
			else begin
				// Draw an M
				if (hc >= (hbp+335) && hc < (hbp+410) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335) && hc < (hbp+360) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+375) && hc < (hbp+385) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+395) && hc < (hbp+410) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
		end
		
		// Segment 5 Area
		else if (hc >= (hbp+425) && hc < (hbp+500) && vc >= (vbp+150) && vc < (vbp+300))
		begin
			if(seg5countin > 5'd5) begin
			// Draw an E
				if (hc >= (hbp+335+90) && hc < (hbp+410+90) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335+90) && hc < (hbp+360+90) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335+90) && hc < (hbp+360+90) && vc >= (vbp+210) && vc < (vbp+235)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335+90) && hc < (hbp+360+90) && vc >= (vbp+275) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
			else begin
				// Draw an M
				if (hc >= (hbp+335+90) && hc < (hbp+410+90) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+335+90) && hc < (hbp+360+90) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+375+90) && hc < (hbp+385+90) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+395+90) && hc < (hbp+410+90) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
		end
		
		// Segment 6 Area
		else if (hc >= (hbp+515) && hc < (hbp+590) && vc >= (vbp+150) && vc < (vbp+300))
		begin
			if(seg6countin > 5'd5) begin
			// Draw a 1
				if (hc >= (hbp+575) && hc < (hbp+590) && vc >= (vbp+150) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
				
			end
			else begin
				// Draw a 9
				if (hc >= (hbp+515) && hc < (hbp+590) && vc >= (vbp+150) && vc < (vbp+175)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+515) && hc < (hbp+535) && vc >= (vbp+175) && vc < (vbp+200)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+575) && hc < (hbp+590) && vc >= (vbp+175) && vc < (vbp+300)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else if (hc >= (hbp+515) && hc < (hbp+590) && vc >= (vbp+200) && vc < (vbp+225)) begin
					red = 4'b0000;
					green = 4'b1111;
					blue = 4'b0000;
				end
				else begin
					red = 4'b0000;
					green = 4'b0000;
					blue = 4'b0000;
				end
			end
		end
		
		// we're outside our range so display black
		else
		begin
			red = 4'd0;
			green = 4'd0;
			blue = 4'd0;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 4'd0;
		green = 4'd0;
		blue = 4'd0;
	end
end

endmodule
