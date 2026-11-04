// 100fbdab size=160 __write

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __write
   
   Library: Visual Studio 2003 Release */

int __cdecl __write(int _FileHandle,void *_Buf,uint _MaxCharCount)

{
  undefined4 *puVar1;
  int iVar2;
  int local_20;
  
  if ((uint)_FileHandle < DAT_1076ac9c) {
    iVar2 = (_FileHandle & 0x1fU) * 0x24;
    if ((*(byte *)((&DAT_1076aca0)[_FileHandle >> 5] + 4 + iVar2) & 1) != 0) {
      __lock_fhandle(_FileHandle);
      if ((*(byte *)((&DAT_1076aca0)[_FileHandle >> 5] + 4 + iVar2) & 1) == 0) {
        puVar1 = (undefined4 *)FUN_100fc216();
        *puVar1 = 9;
        puVar1 = (undefined4 *)FUN_100fc21f();
        *puVar1 = 0;
        local_20 = -1;
      }
      else {
        local_20 = __write_lk(_FileHandle,_Buf,_MaxCharCount);
      }
      FUN_100fbe32();
      return local_20;
    }
  }
  puVar1 = (undefined4 *)FUN_100fc216();
  *puVar1 = 9;
  puVar1 = (undefined4 *)FUN_100fc21f();
  *puVar1 = 0;
  return -1;
}


