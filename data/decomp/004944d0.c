
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_004944d0(void)

{
  int iVar1;
  int iVar2;
  
  iVar2 = 0;
  do {
    iVar1 = _rand();
    *(float *)((int)&DAT_0116f060 + iVar2) =
         ((float)iVar1 / _DAT_00556a7c + (float)iVar1 / _DAT_00556a7c) - (float)_DAT_00556a60;
    iVar1 = _rand();
    *(uint *)((int)&DAT_0116ec60 + iVar2) =
         (int)(iVar1 * 0x100 + (iVar1 * 0x100 >> 0x1f & 0x7fffU)) >> 0xf & 0xff;
    iVar2 = iVar2 + 4;
  } while (iVar2 < 0x400);
  return;
}

