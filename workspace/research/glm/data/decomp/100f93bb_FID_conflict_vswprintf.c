// 100f93bb size=111 FID_conflict:vswprintf

/* Library Function - Multiple Matches With Different Base Names
    int __cdecl vswprintf(wchar_t *,unsigned int,wchar_t const *,char *)
    __vsnwprintf
   
   Library: Visual Studio 2003 Release */

int __cdecl FID_conflict_vswprintf(wchar_t *_Dest,size_t _Count,wchar_t *_Format,va_list _Args)

{
  int iVar1;
  FILE local_24;
  
  local_24._base = (char *)_Dest;
  local_24._ptr = (char *)_Dest;
  local_24._cnt = _Count * 2;
  local_24._flag = 0x42;
  iVar1 = __woutput(&local_24,_Format,_Args);
  local_24._cnt = local_24._cnt + -1;
  if (local_24._cnt < 0) {
    __flsbuf(0,&local_24);
  }
  else {
    *local_24._ptr = 0;
    local_24._ptr = (char *)((int)local_24._ptr + 1);
  }
  local_24._cnt = local_24._cnt + -1;
  if (local_24._cnt < 0) {
    __flsbuf(0,&local_24);
  }
  else {
    *local_24._ptr = 0;
  }
  return iVar1;
}


