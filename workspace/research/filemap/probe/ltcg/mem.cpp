#include <stdlib.h>
extern "C" void Z_FreeInternal(void *ptr) { free(ptr); }
// retail reaches it through the refimport table
extern "C" void *refimport[] = { (void *)Z_FreeInternal };
#include <stdio.h>
// only called directly from another file, never through a pointer
extern "C" int FS_FileSeek(FILE *f, int offset, int whence) { return fseek(f, offset, whence); }
