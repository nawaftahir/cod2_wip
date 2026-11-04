// 100896fc size=78 FUN_100896fc

void FUN_100896fc(int param_1,int *param_2,int param_3)

{
  int in_ECX;
  uint uVar1;
  
  if (*(int *)(param_1 + 0x38) != param_3) {
    *(int *)(param_1 + 0x38) = param_3;
    *param_2 = *param_2 + 1;
    uVar1 = 0;
    if (*(int *)(param_1 + 0x14) != 0) {
      do {
        FUN_100896fc(*(undefined4 *)
                      (*(int *)(in_ECX + 0x18) + *(int *)(*(int *)(param_1 + 0x18) + uVar1 * 4) * 4)
                     ,param_2,param_3);
        uVar1 = uVar1 + 1;
      } while (uVar1 < *(uint *)(param_1 + 0x14));
    }
  }
  return;
}


