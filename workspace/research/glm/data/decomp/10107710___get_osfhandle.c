// 10107710 size=65 __get_osfhandle

/* Library Function - Single Match
    __get_osfhandle
   
   Library: Visual Studio 2003 Release */

intptr_t __cdecl __get_osfhandle(int _FileHandle)

{
  intptr_t *piVar1;
  undefined4 *puVar2;
  
  if (((uint)_FileHandle < DAT_1076ac9c) &&
     (piVar1 = (intptr_t *)((&DAT_1076aca0)[_FileHandle >> 5] + (_FileHandle & 0x1fU) * 0x24),
     (*(byte *)(piVar1 + 1) & 1) != 0)) {
    return *piVar1;
  }
  puVar2 = (undefined4 *)FUN_100fc216();
  *puVar2 = 9;
  puVar2 = (undefined4 *)FUN_100fc21f();
  *puVar2 = 0;
  return -1;
}


