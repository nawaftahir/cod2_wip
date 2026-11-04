// 100f6d05 size=84 _fprintf

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    _fprintf
   
   Library: Visual Studio 2003 Release */

int __cdecl _fprintf(FILE *_File,char *_Format,...)

{
  int _Flag;
  int iVar1;
  
  __lock_file(_File);
  _Flag = __stbuf(_File);
  iVar1 = __output(_File,_Format,&stack0x0000000c);
  __ftbuf(_Flag,_File);
  FUN_100f6d59();
  return iVar1;
}


