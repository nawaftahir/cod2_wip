// 1000bbc0 size=116 R_SetFog

void R_SetFog(int param_1,int param_2,int param_3)

{
  int iVar1;
  undefined4 *puVar2;
  undefined4 *puVar3;
  
  DAT_101d620c = param_1;
  puVar3 = &DAT_101d61cc;
  iVar1 = 8;
  if (DAT_101d61c8 == '\0') {
    puVar2 = &DAT_101d616c + param_1 * 8;
    param_3 = 0;
  }
  else {
    puVar2 = &DAT_101d61ac;
  }
  for (; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *puVar2;
    puVar2 = puVar2 + 1;
    puVar3 = puVar3 + 1;
  }
  puVar3 = &DAT_101d616c + param_1 * 8;
  puVar2 = &DAT_101d61ec;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar2 = puVar2 + 1;
  }
  if (param_3 == 0) {
    DAT_101d61f0 = param_3;
    DAT_101d61f4 = param_3;
    return;
  }
  DAT_101d61f0 = param_2;
  DAT_101d61f4 = param_2 + param_3;
  return;
}


