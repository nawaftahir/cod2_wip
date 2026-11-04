// 10107eac size=27 __callnewh

/* Library Function - Single Match
    __callnewh
   
   Library: Visual Studio 2003 Release */

int __cdecl __callnewh(size_t _Size)

{
  int iVar1;
  
  if (DAT_101ae234 != (code *)0x0) {
    iVar1 = (*DAT_101ae234)(_Size);
    if (iVar1 != 0) {
      return 1;
    }
  }
  return 0;
}


