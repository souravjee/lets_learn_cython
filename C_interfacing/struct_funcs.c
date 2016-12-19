
#include "stdio.h"
#include "struct_funcs.h"


// http://stackoverflow.com/questions/2521927/initializing-a-global-struct-in-c
struct Struct1 exposed1 = {55, 65};
//struct Struct1 exposed2 = {.y=165, .x=155};  // Rejected by Microsoft compiler. (Some special flag required?)
struct Struct1 exposed2 = {155, 165}; 

void modify_struct(struct Struct1 *r, int x, int y){
  r->x = x;
  r->y = y;
  printf("inside modify_struct\n");
}

struct Struct1 const * same_struct(struct Struct1 const * const r){
  printf("inside same_struct\n");
  return r;
}
