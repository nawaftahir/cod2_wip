// 1009a568 size=72 FUN_1009a568

void FUN_1009a568(int param_1)

{
  int iVar1;
  undefined4 uVar2;
  
  if ((param_1 != 0) && (*(int *)(param_1 + 4) == 0xd)) {
    iVar1 = *(int *)(param_1 + 0x10);
    if (iVar1 == 0) {
      *(undefined4 *)(param_1 + 0x14) = 0;
      *(undefined4 *)(param_1 + 0x18) = 0;
    }
    else {
      if (*(int *)(iVar1 + 4) == 9) {
        *(undefined4 *)(param_1 + 0x14) = *(undefined4 *)(iVar1 + 0x18);
        uVar2 = *(undefined4 *)(iVar1 + 0x1c);
      }
      else {
        *(undefined4 *)(param_1 + 0x14) = 1;
        uVar2 = FUN_10099b4f(iVar1);
      }
      *(undefined4 *)(param_1 + 0x18) = uVar2;
    }
  }
  return;
}


