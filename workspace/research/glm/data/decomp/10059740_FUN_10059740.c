// 10059740 size=129 FUN_10059740

void FUN_10059740(float param_1)

{
  float *pfVar1;
  float *unaff_ESI;
  
  pfVar1 = unaff_ESI + 3;
  FUN_10059f50();
  if (param_1 != 0.0) {
    FUN_10059530(pfVar1,param_1);
  }
  unaff_ESI[6] = unaff_ESI[5] * unaff_ESI[1] - unaff_ESI[2] * unaff_ESI[4];
  unaff_ESI[7] = *pfVar1 * unaff_ESI[2] - unaff_ESI[5] * *unaff_ESI;
  unaff_ESI[8] = unaff_ESI[4] * *unaff_ESI - *pfVar1 * unaff_ESI[1];
  return;
}


