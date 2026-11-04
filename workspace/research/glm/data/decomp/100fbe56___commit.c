// 100fbe56 size=177 __commit

/* WARNING: Function: __SEH_prolog replaced with injection: SEH_prolog */
/* WARNING: Function: __SEH_epilog replaced with injection: EH_epilog3 */
/* Library Function - Single Match
    __commit
   
   Library: Visual Studio 2003 Release */

int __cdecl __commit(int _FileHandle)

{
  HANDLE hFile;
  BOOL BVar1;
  DWORD *pDVar2;
  undefined4 *puVar3;
  int iVar4;
  DWORD local_20;
  
  if (DAT_1076ac9c <= (uint)_FileHandle) {
LAB_100fbefe:
    puVar3 = (undefined4 *)FUN_100fc216();
    *puVar3 = 9;
    return -1;
  }
  iVar4 = (_FileHandle & 0x1fU) * 0x24;
  if ((*(byte *)((&DAT_1076aca0)[_FileHandle >> 5] + 4 + iVar4) & 1) == 0) goto LAB_100fbefe;
  __lock_fhandle(_FileHandle);
  if ((*(byte *)((&DAT_1076aca0)[_FileHandle >> 5] + 4 + iVar4) & 1) != 0) {
    hFile = (HANDLE)__get_osfhandle(_FileHandle);
    BVar1 = FlushFileBuffers(hFile);
    if (BVar1 == 0) {
      local_20 = GetLastError();
    }
    else {
      local_20 = 0;
    }
    if (local_20 == 0) goto LAB_100fbee5;
    pDVar2 = (DWORD *)FUN_100fc21f();
    *pDVar2 = local_20;
  }
  puVar3 = (undefined4 *)FUN_100fc216();
  *puVar3 = 9;
  local_20 = 0xffffffff;
LAB_100fbee5:
  FUN_100fbef6();
  return local_20;
}


