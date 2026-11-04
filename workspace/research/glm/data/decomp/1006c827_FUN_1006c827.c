// 1006c827 size=163 FUN_1006c827

void FUN_1006c827(double *param_1,double *param_2,double *param_3,byte param_4)

{
  double *pdVar1;
  int iVar2;
  int in_ECX;
  uint uVar3;
  double local_24 [4];
  
  local_24[0] = *param_2 * *param_3;
  uVar3 = 0;
  local_24[1] = *param_2 * param_3[1];
  local_24[2] = *param_3 * param_2[1];
  local_24[3] = param_2[1] * param_3[1];
  *param_1 = *(double *)(in_ECX + 0xa0);
  param_1[1] = *(double *)(in_ECX + 0xa8);
  do {
    pdVar1 = local_24 + uVar3;
    iVar2 = __isnan(*pdVar1);
    if (iVar2 != 0) {
      if ((param_4 & 0x40) != 0) {
        *param_1 = local_24[uVar3];
        param_1[1] = local_24[uVar3];
        return;
      }
      *pdVar1 = 0.0;
    }
    if (*pdVar1 < *param_1) {
      *param_1 = *pdVar1;
    }
    if (param_1[1] < *pdVar1) {
      param_1[1] = *pdVar1;
    }
    uVar3 = uVar3 + 1;
  } while (uVar3 < 4);
  return;
}


