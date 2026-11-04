// 100f7878 size=87 __snprintf

/* Library Function - Single Match
    __snprintf
   
   Library: Visual Studio 2003 Release */

int __cdecl __snprintf(char *_Dest,size_t _Count,char *_Format,...)

{
  int iVar1;
  FILE local_24;
  
  local_24._cnt = _Count;
  local_24._flag = 0x42;
  local_24._base = _Dest;
  local_24._ptr = _Dest;
  iVar1 = __output(&local_24,_Format,&stack0x00000010);
  if (_Dest != (char *)0x0) {
    local_24._cnt = local_24._cnt - 1;
    if (local_24._cnt < 0) {
      __flsbuf(0,&local_24);
    }
    else {
      *local_24._ptr = '\0';
    }
  }
  return iVar1;
}


