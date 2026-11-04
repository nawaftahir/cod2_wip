// 1000c6a0 size=228 FUN_1000c6a0

int * FUN_1000c6a0(undefined4 param_1)

{
  uint uVar1;
  int *piVar2;
  int iVar3;
  undefined4 in_ECX;
  
  uVar1 = (*(code *)RI_FS_FreeFile)();
  if ((int)uVar1 < 0) {
    if (uVar1 == 0xfffffffe) {
      FUN_10061c80("^1ERROR: Couldn\'t find font in iwd files or localized directories \'%s\'\n");
      return (int *)0x0;
    }
    FUN_10061c80("^1ERROR: Couldn\'t find font \'%s\'\n");
    return (int *)0x0;
  }
  if (uVar1 < 0x10) {
    (*(code *)RI_FS_FOpenFileByMode)(in_ECX);
    FUN_10061c80("^1ERROR: Font file \'%s\' too small\n");
    return (int *)0x0;
  }
  piVar2 = (int *)(*(code *)RI_Hunk_AllocInternal)(uVar1 + 4);
  (*(code *)RI_FS_FCloseFile)(piVar2,0x10,in_ECX);
  (*(code *)RI_FS_FCloseFile)(piVar2 + 5,uVar1 - 0x10,in_ECX);
  (*(code *)RI_FS_FOpenFileByMode)(in_ECX);
  piVar2[4] = (int)(piVar2 + 5);
  *piVar2 = (int)piVar2 + *piVar2 + 4;
  if (*(char *)((int)piVar2 + piVar2[3] + 4) == '\0') {
    piVar2[3] = DAT_101d1b2c;
    return piVar2;
  }
  iVar3 = FUN_10017100(param_1);
  piVar2[3] = iVar3;
  return piVar2;
}


