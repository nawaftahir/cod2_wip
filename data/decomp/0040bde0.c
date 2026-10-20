
int FUN_0040bde0(undefined4 *param_1,undefined4 param_2,int param_3,int param_4,int param_5)

{
  FUN_00497700();
  *(undefined4 *)(param_3 * 0x10 + param_5 + 0xc) = *param_1;
  param_3 = param_3 + 1;
  if (param_3 == param_4) {
    (*DAT_0059c45c)(param_3,param_2,param_5);
    param_3 = 0;
  }
  return param_3;
}

