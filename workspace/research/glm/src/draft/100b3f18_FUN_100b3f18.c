


unsigned int FUN_100b3f18(int *param_1,int param_2)

{
  unsigned int uVar1;
  
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


