# seng440

This project was developed remotely on a Raspberry Pi 4B with 4x Arm Cortex-A72 cores and 8GB memory
Each core has 31x 64-bit general purpose and 32x 128-bit SIMD registers

It has been tested to run on Raspberry Pi OS Lite (Debian based), and all assembly files were compiled with GCC 14.2.0. 

The folders in the asm directories correspond to the git tags, which are used to track optimization versions. The OX folders correspond to the code compiled with the -OX optimization flag (X=1,2,3). 

To run compression and decompression on one of the sample files, use ```make run```. 
