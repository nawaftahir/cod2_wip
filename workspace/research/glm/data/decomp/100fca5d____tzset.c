// 100fca5d size=67 ___tzset

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    ___tzset
   
   Library: Visual Studio 2003 Release */

void __cdecl ___tzset(void)

{
  if (DAT_101adfdc == 0) {
    __lock(6);
    if (DAT_101adfdc == 0) {
      __tzset_lk();
      DAT_101adfdc = DAT_101adfdc + 1;
    }
    FUN_100fcaa0();
  }
  return;
}


