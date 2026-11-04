// 10107a66 size=103 ___crtInitCritSecAndSpinCount

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    ___crtInitCritSecAndSpinCount
   
   Library: Visual Studio 2003 Release */

void ___crtInitCritSecAndSpinCount(undefined4 param_1,undefined4 param_2)

{
  HMODULE hModule;
  
  if (DAT_101ae22c == (code *)0x0) {
    if (DAT_101ae00c != 1) {
      hModule = GetModuleHandleA("kernel32.dll");
      if (hModule != (HMODULE)0x0) {
        DAT_101ae22c = GetProcAddress(hModule,"InitializeCriticalSectionAndSpinCount");
        if (DAT_101ae22c != (FARPROC)0x0) goto LAB_10107ab2;
      }
    }
    DAT_101ae22c = ___crtInitCritSecNoSpinCount_8;
  }
LAB_10107ab2:
  (*DAT_101ae22c)(param_1,param_2);
  return;
}


