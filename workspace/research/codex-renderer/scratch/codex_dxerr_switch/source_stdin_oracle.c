#include <stdio.h>
#define __stdcall
#include "/home/nawaf/cod2/test/dev/codex/renderer/scratch/codex_dxerr_probe/j_100efe3c.c"
int main(void) { int n; unsigned char *p; while(scanf("%d",&n)==1) {printf("%d\t",n);p=(unsigned char*)Renderer_ErrorDescription(n);while(*p) {printf("%02x",*p);p++;}puts("");}return 0;}
