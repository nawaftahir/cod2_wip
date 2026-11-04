// 1001d910 size=77 R_MarkFragments

void R_MarkFragments(undefined4 *param_1,undefined4 *param_2,undefined4 *param_3)

{
  if (param_1 != (undefined4 *)0x0) {
    *param_2 = *param_1;
    param_2[1] = param_1[1];
    param_2[2] = param_1[2];
    *param_3 = param_1[3];
    param_3[1] = param_1[4];
    param_3[2] = param_1[5];
    return;
  }
  *param_2 = 0;
  param_2[1] = 0;
  param_2[2] = 0;
  *param_3 = 0;
  param_3[1] = 0;
  param_3[2] = 0;
  return;
}


