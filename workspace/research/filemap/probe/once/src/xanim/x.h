#pragma once
#include <assert.h>
inline int fa(int *p) { assert(p[0] != 7); return p[0] + 1; }
inline int fb(int *p) { assert(p[1] != 9); return p[1] * 3; }
