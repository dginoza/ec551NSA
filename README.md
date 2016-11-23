# ec551NSA
license plate reader

UART folder contains code to transfer image over UART from MATLAB to Nexys3 board,
perform a kernel filtering operation, and return the output to MATLAB. To use,
synthesize top_direct_send_module.v to Nexys. Use MATLAB function 1 to transfer
image pixel by pixel. Detailed comments included in verilog code.
