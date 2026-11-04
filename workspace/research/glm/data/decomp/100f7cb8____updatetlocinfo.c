// 100f7cb8 size=50 ___updatetlocinfo

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    ___updatetlocinfo
   
   Library: Visual Studio 2003 Release */

pthreadlocinfo __cdecl ___updatetlocinfo(void)

{
  pthreadlocinfo ptVar1;
  
  __lock(0xc);
  ptVar1 = (pthreadlocinfo)___updatetlocinfo_lk();
  FUN_100f7cea();
  return ptVar1;
}


