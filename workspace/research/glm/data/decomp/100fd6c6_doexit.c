// 100fd6c6 size=181 doexit

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* WARNING: Removing unreachable block (ram,0x100fd77a) */
/* Library Function - Single Match
    _doexit
   
   Library: Visual Studio 2003 Release */

void __cdecl doexit(UINT param_1,int param_2,int param_3)

{
  HANDLE hProcess;
  UINT uExitCode;
  
  __lock(8);
  if (DAT_101ae04c == 1) {
    uExitCode = param_1;
    hProcess = GetCurrentProcess();
    TerminateProcess(hProcess,uExitCode);
  }
  DAT_101ae048 = 1;
  DAT_101ae044 = (undefined1)param_3;
  if (param_2 == 0) {
    if (DAT_1076ada8 != (undefined4 *)0x0) {
      while (DAT_1076ada4 = DAT_1076ada4 + -1, DAT_1076ada8 <= DAT_1076ada4) {
        if ((code *)*DAT_1076ada4 != (code *)0x0) {
          (*(code *)*DAT_1076ada4)();
        }
      }
    }
    __initterm(&DAT_1019e02c);
  }
  __initterm(&DAT_1019e034);
  FUN_100fd775();
  if (param_3 != 0) {
    return;
  }
  DAT_101ae04c = 1;
  ___crtExitProcess(param_1);
  return;
}


