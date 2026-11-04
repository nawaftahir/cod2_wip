// 100f620f size=86 _printf

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    _printf
   
   Library: Visual Studio 2003 Release */

int __cdecl _printf(char *_Format,...)

{
  int _Flag;
  int iVar1;
  
  __lock_file2(1,&DAT_101a48c0);
  _Flag = __stbuf((FILE *)&DAT_101a48c0);
  iVar1 = __output(&DAT_101a48c0,_Format,&stack0x00000008);
  __ftbuf(_Flag,(FILE *)&DAT_101a48c0);
  FUN_100f626a();
  return iVar1;
}


