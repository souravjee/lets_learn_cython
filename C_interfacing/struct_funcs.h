
struct Struct1 {
  int x;
  int y;
};

struct Struct2 {
  int p, q;
  struct {
    int m, n;
  } inner;
};

void modify_struct(struct Struct1 *r, int x, int y);

struct Struct1 const * same_struct(struct Struct1 const * const r);

extern struct Struct1 exposed1;
extern struct Struct1 exposed2;
