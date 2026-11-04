// 100fcade size=53 __isindst

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __isindst
   
   Library: Visual Studio 2003 Release */

int __cdecl __isindst(tm *_Time)

{
  int iVar1;
  
  __lock(6);
  iVar1 = __isindst_lk();
  FUN_100fcb13();
  return iVar1;
}


