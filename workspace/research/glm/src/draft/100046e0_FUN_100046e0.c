


void FUN_100046e0(int *param_1,int param_2)

{
  param_1[1] = param_2;
  if (*param_1 == -1) {
    FUN_100046e0(param_1[4],param_1);
    FUN_100046e0(param_1[5],param_1);
    param_1[2] = -2;
    if (*(int *)(param_1[4] + 8) == *(int *)(param_1[5] + 8)) {
      param_1[2] = *(int *)(param_1[4] + 8);
    }
  }
  return;
}


