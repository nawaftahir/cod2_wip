// 100a7dc4 size=49 FUN_100a7dc4

undefined4 FUN_100a7dc4(int *param_1,int param_2)

{
  uint uVar1;
  
  uVar1 = 0;
  param_2 = param_2 - (int)param_1;
  while ((*param_1 == -1 || (*param_1 == *(int *)(param_2 + (int)param_1)))) {
    uVar1 = uVar1 + 1;
    param_1 = param_1 + 1;
    if (3 < uVar1) {
      return 1;
    }
  }
  return 0;
}


