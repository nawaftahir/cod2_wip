// 10107751 size=148 __lock_fhandle

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __lock_fhandle
   
   Library: Visual Studio 2003 Release */

int __cdecl __lock_fhandle(int _Filehandle)

{
  int iVar1;
  int iVar2;
  undefined1 local_14 [8];
  undefined4 uStack_c;
  undefined *local_8;
  
  local_8 = &DAT_10182210;
  uStack_c = 0x1010775d;
  iVar1 = (&DAT_1076aca0)[_Filehandle >> 5] + (_Filehandle & 0x1fU) * 0x24;
  if (*(int *)(iVar1 + 8) == 0) {
    __lock(10);
    local_8 = (undefined *)0x0;
    if (*(int *)(iVar1 + 8) == 0) {
      iVar2 = ___crtInitCritSecAndSpinCount(iVar1 + 0xc,4000);
      if (iVar2 == 0) {
        __local_unwind2(local_14,0xffffffff);
        return 0;
      }
      *(int *)(iVar1 + 8) = *(int *)(iVar1 + 8) + 1;
    }
    local_8 = (undefined *)0xffffffff;
    FUN_101077e8();
  }
  EnterCriticalSection
            ((LPCRITICAL_SECTION)
             ((&DAT_1076aca0)[_Filehandle >> 5] + 0xc + (_Filehandle & 0x1fU) * 0x24));
  return 1;
}


