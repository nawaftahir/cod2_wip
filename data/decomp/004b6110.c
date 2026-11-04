
int __fastcall FUN_004b6110(int param_1)

{
  int iVar1;
  int iVar2;
  
  if (*(int *)(param_1 + 0x120) != 0) {
    return param_1 + 0x11c;
  }
  iVar2 = FUN_004c0fe0("P4HOST");
  iVar1 = param_1 + 0x11c;
  if (iVar2 != 0) {
    *(undefined4 *)(param_1 + 0x120) = 0;
    FUN_004bf280(iVar2);
    return iVar1;
  }
  iVar2 = FUN_004c3a90(iVar1);
  if (iVar2 == 0) {
    iVar2 = FUN_004bad60(1);
    if (iVar2 != 0) {
      *(undefined4 *)(param_1 + 0x120) = 0;
      FUN_004bf2e0(iVar2);
      return iVar1;
    }
    *(undefined4 *)(param_1 + 0x120) = 0;
    FUN_004bf280("nohost");
  }
  return iVar1;
}

