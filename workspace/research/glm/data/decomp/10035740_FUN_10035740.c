// 10035740 size=202 FUN_10035740

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10035740(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  float *unaff_EBX;
  
  if (*unaff_EBX != 0.0) {
    fVar3 = (float)_DAT_101d48e0;
    fVar2 = (float)_DAT_101d4854;
    fVar1 = (fVar3 / fVar2) * *unaff_EBX;
    *unaff_EBX = fVar1;
    unaff_EBX[1] = (fVar3 / fVar2) * unaff_EBX[1];
    iVar4 = FUN_10035620(fVar1);
    DAT_1072ded4 = (&DAT_101d4820)[iVar4 * 5];
    if (unaff_EBX[1] == 0.0) {
      DAT_1072ded0 = 1;
      return;
    }
    fVar1 = SQRT(unaff_EBX[1] * unaff_EBX[1] - *unaff_EBX * *unaff_EBX);
    unaff_EBX[1] = fVar1;
    iVar4 = FUN_10035620(fVar1);
    DAT_1072ded8 = (&DAT_101d4820)[iVar4 * 5];
    DAT_1072ded0 = 2;
  }
  return;
}


