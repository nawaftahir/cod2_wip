// 100f7377 size=48 __vscprintf

/* Library Function - Single Match
    __vscprintf
   
   Library: Visual Studio 2003 Release */

int __cdecl __vscprintf(char *_Format,va_list _ArgList)

{
  int iVar1;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  
  local_1c = 0;
  local_24 = 0;
  local_20 = 0x7fffffff;
  local_18 = 0x42;
  iVar1 = __output(&local_24,_Format,_ArgList);
  return iVar1;
}


