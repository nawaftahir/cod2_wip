// 100f5f6c size=49 __scprintf

/* Library Function - Single Match
    __scprintf
   
   Library: Visual Studio 2003 Release */

int __cdecl __scprintf(char *_Format,...)

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
  iVar1 = __output(&local_24,_Format,&stack0x00000008);
  return iVar1;
}


