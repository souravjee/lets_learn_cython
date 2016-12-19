# Objective
To learn how to access in Cython and Python code structs defined in C code.

# Details

 * [struct_funcs.c](struct_funcs.c): Contains a few structure variable declarations. Also contains
   functions to access/modify/return C structures.

 * [struct_funcs.h](struct_funcs.h): Corresponding header file. Contains declarations of the functions
   defined in, and extern declarations of struct variables declared and initialized in the
   [struct_funcs.c](struct_funcs.c) C file.

 * [use_struct.pxd](use_struct.pxd) Cython definition file containing a `cdef extern` block
   to make certain C types and variables declared in [struct_funcs.h](struct_funcs.h) visible
   to Cython code.

 * [use_struct.pyx](use_struct.pyx) Cython implementation file containing code
   to access the above mentioned C functions and structs. Also became aware of a
   potential pitfall with using `cdef` variables in Python data structures like `dict`.

 * [test_extension.txt](test_extension.txt) Contains doctests. Some tests may give different results
   on Windows and Linux.

# Instructions
Run the command: 
```
python -m doctest test_extension.txt
```
