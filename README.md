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

### Project Files Layout
Top
	- Main Work Branch -> ec551_fpga_licenseplate_reader - project folder of current progress including filtering, segmentation, and "ocr"
	- Clean No Segment Code - project folder of just the filter with no other operations
	- Edge Detection - a video of our edge detection filter at work
	- SegmentationOCRprogress - a video of our segmentation and "ocr" (before we implemented all 6 segments) 
	- TeamNSA_Fa16_EC551_Project.pptx - our presentation