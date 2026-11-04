// 100fdd01 size=162 __setargv

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    __setargv
   
   Library: Visual Studio 2003 Release */

int __cdecl __setargv(void)

{
  void *pvVar1;
  int iVar2;
  int in_ECX;
  int local_8;
  
  local_8 = in_ECX;
  if (DAT_1076adac == 0) {
    ___initmbctable();
  }
  DAT_101ae154 = 0;
  GetModuleFileNameA((HMODULE)0x0,&DAT_101ae050,0x104);
  _DAT_101ae03c = &DAT_101ae050;
  parse_cmdline(0,&local_8);
  pvVar1 = _malloc(in_ECX + local_8 * 4);
  if (pvVar1 == (void *)0x0) {
    iVar2 = -1;
  }
  else {
    parse_cmdline(pvVar1,&local_8);
    _DAT_101ae020 = local_8 + -1;
    iVar2 = 0;
    _DAT_101ae024 = pvVar1;
  }
  return iVar2;
}


