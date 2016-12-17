
#cython: language_level=3

#cimport use_struct
## not necessary because the .pxd file has the same name as this .pyx file

cpdef Struct1 s1a
# not able to make this struct itself visible to external Python code despite
# the `cpdef` declaration

s1a.x = 19

cdef Struct2 s20 = {'p':110, 'q':111} #, 'inner': {'m':2, 'n':3}}

cpdef Struct1 test1(int x, int y):
    modify_struct(&exposed1, x, y)
    return same_struct(&exposed1)[0]


cpdef Struct1 test2(int x, int y):
    print('before modification2', exposed1, exposed2)

    exposed2.x = exposed1.x

    modify_struct(&exposed1, x, y)

    print('after modification2', exposed1, exposed2)
    return exposed1


cpdef Struct1 test3(int x, int y):
    cdef extern Struct1 exposed2 # does this really refer to `exposed2` in "struct_funcs.c"?
    # global exposed2 # Also try this and see what happens
    print('before modification3', exposed1, exposed2)

    modify_struct(&exposed1, x, y)
    exposed2 = exposed1

    print('after modification3', exposed1, exposed2)
    return exposed1

#cdef dict _dct = {1: exposed1, 2: exposed2} # A pitfall!
_dct = {1: exposed1, 2: exposed2} # A pitfall!
def view1_exposed_struct(int x):
    return _dct[x]

def view2_exposed_struct(int x):
    if x==1:
        return exposed1
    elif x==2:
        return exposed2
    else:
        raise ValueError('wrong choice %s' % x)
