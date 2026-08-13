# seng440
da readme
this is txt


## How to use this repo
Make sure there is a sample in /samples, currently we reference samples_1.wav
type '''make''' in the command line. 
the new file will be '''/build/(de)compressed.wav'''

You can also run these one at a time using -c -i \<input_file_path\> -o build/\<desired_output_file_name>

Using either -c or -d, you can compress or decompress your file

## Current state of TODOS
* make basic MVP - DONE
* add commandline handling for file names, and rename output to be \<file input name\>-output.wav
* Add commandline handling for compression or decompression so that we can demo various  - DONE (I think?)
* Add optimizations