
#from distutils.core import setup, Extension
from setuptools import setup, Extension

from Cython.Build import cythonize

ext = Extension("use_struct",
    sources=["use_struct.pyx", "struct_funcs.c"])

setup(
    name="struct_utils",
    ext_modules = cythonize([ext])
)
