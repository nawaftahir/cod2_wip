
void __fastcall FUN_004bbac0(int param_1)

{
  int iVar1;
  
  if (*(int *)(param_1 + 0x24) != 0) {
    iVar1 = FUN_004bae90("release2");
    *(int *)(param_1 + 0x18) = *(int *)(param_1 + 0x18) + iVar1;
    *(int *)(param_1 + 0x1c) = *(int *)(param_1 + 0x1c) + iVar1;
    FUN_004bb240(1,*(undefined4 *)(*(int *)(param_1 + 4) + 4));
    return;
  }
  FUN_004bae90("release2");
  return;
}

