// 100f61b9 size=86 __vsnprintf

/* Library Function - Single Match
    __vsnprintf
   
   Library: Visual Studio 2003 Release */

int __cdecl __vsnprintf(char *_Dest,size_t _Count,char *_Format,va_list _Args)

{
  int iVar1;
  FILE local_24;
  
  local_24._cnt = _Count;
  local_24._flag = 0x42;
  local_24._base = _Dest;
  local_24._ptr = _Dest;
  iVar1 = __output(&local_24,_Format,_Args);
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


