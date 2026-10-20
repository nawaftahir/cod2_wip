
int * __thiscall FUN_004bbcd0(int *param_1,undefined4 param_2)

{
  int iVar1;
  
  if (param_1[3] != 0) {
    FUN_004bbb40();
  }
  FUN_004bf2e0(param_2);
  iVar1 = param_1[1];
  param_1[1] = iVar1 + 5;
  if (param_1[2] < iVar1 + 5) {
    FUN_004bf1c0(iVar1);
  }
  *(undefined1 *)(iVar1 + *param_1) = 0;
  param_1[3] = param_1[1];
  return param_1;
}

