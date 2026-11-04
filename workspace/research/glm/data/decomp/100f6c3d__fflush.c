// 100f6c3d size=70 _fflush

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    _fflush
   
   Library: Visual Studio 2003 Release */

int __cdecl _fflush(FILE *_File)

{
  int iVar1;
  
  if (_File == (FILE *)0x0) {
    iVar1 = flsall(0);
  }
  else {
    __lock_file(_File);
    iVar1 = __fflush_lk(_File);
    FUN_100f6c83();
  }
  return iVar1;
}


