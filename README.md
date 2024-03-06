This project transposes a matrix stored in row-major order. The matrix is stored in the file `call_transpose` under `input`. It starts by pushing the matrix, then the number of rows, and finally the number of columns. 

To run, execute 
```
as --gstabs call_transpose.s -o transpose.o
ld transpose.o -o transpose
./transpose
```
