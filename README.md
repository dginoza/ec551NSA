# EC551 Fall 2016 TeamNSA Final Project 
## FPGA License Plate Reader

### Summary
Our final project was to implement a license plate character recognition on an FPGA using real time video processing on the board. 

In the end, we were successful in getting an end to end system working, however we were not able to implement a working character recognition system in the time given.

The live camera frames are read in and passed to a frame buffer (thanks to code from http://hamsterworks.co.nz/mediawiki/index.php/Zedboard_OV7670). The output of the frame buffer then goes to a windowing operation, followed by the segmentation and placeholder OCR. (The placeholder OCR seperates each segment into 4 quadrants and sums the white pixels in that quadrant. We attempted to find a threshold that might be able to distinguish between two letters/numbers, but were unsuccessful).

There are two VGA outs controlled by a button on the zedboard. The first, default output, is the output of the image processing, while the second shows the output of the character recognition (currently only 2 letters/numbers for each segment).

### Hardware
- Zedboard
- OV7670: connected to A and B PMOD connectors on zedboard

### Installation
Projects made in ISE 14.7
Extract the project folder and open the .xise file
The bit file, when generated, will be in the /work folder.

Note: The IP core for the frame buffer may not generate without ISE 14.7 (such as on the computers in PHO115)

Connecting the camera:

- A PMOD connector

PWDN------JA1

RESET------JA5

D0------JA2

D1------JA6

D2------JA3

D3------JA7

D4------JA4

D5------JA8

- B PMOD connector

D6------JB1

D7------JB5

XCLK------JB2

PCLK------JB6

HREF------JB3

VSYNC------JB7

SIOD------JB4

SIOC------JB8


### Project Files Layout
- Main Work Branch -> ec551_fpga_licenseplate_reader - project folder of current progress including filtering, segmentation, and "ocr"
- Clean No Segment Code - project folder of just the filter with no other operations
- Edge Detection - a video of our edge detection filter at work
- SegmentationOCRprogress - a video of our segmentation and "ocr" (before we implemented all 6 segments) 
- TeamNSA_Fa16_EC551_Project.pptx - our presentation

### File Descriptions
vhd files are based on http://hamsterworks.co.nz/mediawiki/index.php/Zedboard_OV7670

- top_level.vhd: top level connections, connecting all other components and handling in and out signals
	- sys_array.v: implementation of our windowing operator
		- Dff.v
		- nFIFO.v
	- count_pixels_two.v: counter for the window to delay it until window is full
	- segment.v: Manual segmentation of six segments, converts to YUV and also does "ocr" calculations as segment is done in quadrants. 
	- vgatest.v: Our ocr output module, prints a specific letter/number based on counts from segment.v.
	- mux.v: Switches between the two vga modules (vgatest.v and vga.vhd)
	- vga.vhd: Main vga output - shows image processing output.
	- debounce.vhd: debouncer for buttons
	- ov7670_controller.vhd: ov7670 controller (sets camera registers)
		- i3c2.vhd: i2c logic
	- frame_buffer.vhd: handles framebuffer IP core
	- ov7670_capture: Captures pixels from camera, converts RGB565 to RGB444 in.
	- RGB.vhd: Output rgb pixel values to vga.vhd
	- Address_Generator.vhd: generates addresses to be pulled from framebuffer.
	- zedboard.ucf: All the pinouts/ins

IP Cores:
- inst_vga_pll: clock divider
- xilinx_frame_buffer: RAM block memory to store frame