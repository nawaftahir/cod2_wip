
void FUN_00465580(int param_1)

{
  int iVar1;
  int iVar2;
  
  iVar1 = *(int *)(param_1 + 0x38);
  if (iVar1 != 0) {
    for (iVar2 = *(int *)(iVar1 + 0x10); iVar2 != iVar1 + 0xc; iVar2 = *(int *)(iVar2 + 4)) {
      FUN_0045af00();
    }
    iVar1 = *(int *)(param_1 + 0x38);
    for (iVar2 = *(int *)(iVar1 + 4); iVar2 != iVar1; iVar2 = *(int *)(iVar2 + 4)) {
      FUN_00465580(iVar2);
    }
  }
  if (*(int *)(param_1 + 0x34) != 0) {
    *(undefined4 *)(param_1 + 0x34) = 0;
  }
  *(short *)(param_1 + 0x3c) = *(short *)(*(int *)(param_1 + 8) + 0x68) + -1;
  return;
}

