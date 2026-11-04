
void FUN_0046ae70(int param_1,int param_2,int param_3,int param_4)

{
  int iVar1;
  
  for (; param_1 != param_2; param_1 = *(int *)(param_1 + 4)) {
    iVar1 = *(int *)(param_1 + 8);
    if ((((*(byte *)(*(int *)(iVar1 + 0x50) + 0x160) & 0x10) != 0) && (*(int *)(iVar1 + 0x54) != 0))
       && (param_1 != param_3)) {
      if (*(int *)(iVar1 + 0x54) == param_4) {
        *(undefined4 *)(iVar1 + 0x54) = 0;
      }
      else {
        iVar1 = *(int *)(param_1 + 0x38);
        if (iVar1 != 0) {
          FUN_0046ae70(*(undefined4 *)(iVar1 + 4),iVar1,param_3,param_4);
        }
      }
    }
  }
  return;
}

