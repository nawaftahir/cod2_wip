extern void Z_FreeInternal(void *ptr);
void zcfree(void *opaque, void *ptr) { Z_FreeInternal(ptr); }
void (*volatile zfree_fn)(void *, void *) = zcfree;
int main(int c, char **v) { zfree_fn(0, v[0]); return 0; }
#include <stdio.h>
extern int FS_FileSeek(FILE *f, int offset, int whence);
int seekend(FILE *f) { return FS_FileSeek(f, 0, SEEK_END); }
int (*volatile seek_fn)(FILE *) = seekend;
