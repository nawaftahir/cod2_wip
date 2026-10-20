
void __thiscall FUN_004bb770(int param_1,undefined4 param_2)

{
  int iVar1;
  
  *(int *)(param_1 + 0x20) = *(int *)(param_1 + 0x20) + 1;
  *(int *)(param_1 + 0x24) = *(int *)(param_1 + 0x24) + 1;
  iVar1 = FUN_004bae90(param_2);
  *(int *)(param_1 + 0x1c) = *(int *)(param_1 + 0x1c) + iVar1;
  *(int *)(param_1 + 0x18) = *(int *)(param_1 + 0x18) + iVar1;
  FUN_004bb240(1,*(undefined4 *)(*(int *)(param_1 + 4) + 4));
  return;
}

