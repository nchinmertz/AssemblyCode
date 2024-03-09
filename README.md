This project transposes a matrix stored in row-major order. The matrix itself is stored in the file `call_transpose` under the `input`label. The file begins by pushing the matrix data, followed by the number of rows, and finally the number of columns. 

To run, execute the following steps:
1. Assemble the source file: ```as --gstabs call_transpose.s -o transpose.o```
2. Link the assembled object file: ```ld transpose.o -o transpose```
3. Run the compiled program: ```./transpose```
