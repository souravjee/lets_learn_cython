
cdef extern from "struct_funcs.h":

    cdef struct Struct1:
        int x
        #int y # mention only the fields that need to be accessed in Cython code

    cdef struct Struct2:
        int p, q

    cdef void modify_struct(Struct1 *r, int x, int y)

    #cdef Struct1 const * same_struct(Struct1 const * const r) # valid C syntax but Cython compiler rejects it
    cdef const Struct1* same_struct(const Struct1 * const r) # OK 

    #cdef struct Struct1 exposed1 ## incorrect syntax
    cdef Struct1 exposed1
    cdef Struct1 exposed2
