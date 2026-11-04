// 100fb0e4 size=29 __mtterm

/* Library Function - Single Match
    __mtterm
   
   Library: Visual Studio 2003 Release */

void __cdecl __mtterm(void)

{
  if (DAT_101a4898 != -1) {
    (*DAT_101addc4)(DAT_101a4898);
    DAT_101a4898 = -1;
  }
  __mtdeletelocks();
  return;
}


