// 100fb307 size=239 __mtinit

/* Library Function - Single Match
    __mtinit
   
   Library: Visual Studio 2003 Release */

int __cdecl __mtinit(void)

{
  int iVar1;
  HMODULE hModule;
  DWORD *pDVar2;
  DWORD DVar3;
  
  iVar1 = __mtinitlocks();
  if (iVar1 == 0) {
    __mtterm();
    return 0;
  }
  hModule = GetModuleHandleA("kernel32.dll");
  if (hModule != (HMODULE)0x0) {
    DAT_101addb8 = GetProcAddress(hModule,"FlsAlloc");
    DAT_101addbc = GetProcAddress(hModule,"FlsGetValue");
    DAT_101addc0 = GetProcAddress(hModule,"FlsSetValue");
    DAT_101addc4 = GetProcAddress(hModule,"FlsFree");
    if (DAT_101addbc == (FARPROC)0x0) {
      DAT_101addbc = TlsGetValue_exref;
      DAT_101addc0 = TlsSetValue_exref;
      DAT_101addb8 = FUN_100fb0db;
      DAT_101addc4 = TlsFree_exref;
    }
  }
  DAT_101a4898 = (*DAT_101addb8)(__freefls_4);
  if (((DAT_101a4898 != -1) && (pDVar2 = _calloc(1,0x8c), pDVar2 != (DWORD *)0x0)) &&
     (iVar1 = (*DAT_101addc0)(DAT_101a4898,pDVar2), iVar1 != 0)) {
    pDVar2[0x15] = (DWORD)&DAT_101a4e88;
    pDVar2[5] = 1;
    DVar3 = GetCurrentThreadId();
    pDVar2[1] = 0xffffffff;
    *pDVar2 = DVar3;
    return 1;
  }
  __mtterm();
  return 0;
}


