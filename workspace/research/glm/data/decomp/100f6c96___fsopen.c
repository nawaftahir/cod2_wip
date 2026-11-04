// 100f6c96 size=82 __fsopen

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __fsopen
   
   Library: Visual Studio 2003 Release */

FILE * __cdecl __fsopen(char *_Filename,char *_Mode,int _ShFlag)

{
  FILE *pFVar1;
  undefined4 *puVar2;
  
  pFVar1 = __getstream();
  if (pFVar1 == (FILE *)0x0) {
    puVar2 = (undefined4 *)FUN_100fc216();
    *puVar2 = 0x18;
    pFVar1 = (FILE *)0x0;
  }
  else {
    pFVar1 = __openfile(_Filename,_Mode,_ShFlag,pFVar1);
    FUN_100f6ce8();
  }
  return pFVar1;
}


