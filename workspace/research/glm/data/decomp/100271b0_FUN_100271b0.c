// 100271b0 size=220 FUN_100271b0

void FUN_100271b0(void)

{
  float *pfVar1;
  int iVar2;
  float *unaff_EDI;
  
  iVar2 = DAT_101d1b9c;
  *unaff_EDI = -*(float *)(DAT_101d1b9c + 0xb8);
  unaff_EDI[1] = -*(float *)(iVar2 + 0xbc);
  unaff_EDI[2] = -*(float *)(iVar2 + 0xc0);
  if (0.1 <= unaff_EDI[1] * unaff_EDI[1] + *unaff_EDI * *unaff_EDI) {
    unaff_EDI[6] = 0.0;
    unaff_EDI[8] = 1.0;
  }
  else {
    unaff_EDI[6] = 1.0;
    unaff_EDI[8] = 0.0;
  }
  unaff_EDI[7] = 0.0;
  pfVar1 = unaff_EDI + 3;
  *pfVar1 = unaff_EDI[7] * unaff_EDI[2] - unaff_EDI[1] * unaff_EDI[8];
  unaff_EDI[4] = *unaff_EDI * unaff_EDI[8] - unaff_EDI[2] * unaff_EDI[6];
  unaff_EDI[5] = unaff_EDI[6] * unaff_EDI[1] - unaff_EDI[7] * *unaff_EDI;
  FUN_100590b0();
  unaff_EDI[6] = unaff_EDI[5] * unaff_EDI[1] - unaff_EDI[2] * unaff_EDI[4];
  unaff_EDI[7] = unaff_EDI[2] * *pfVar1 - unaff_EDI[5] * *unaff_EDI;
  unaff_EDI[8] = unaff_EDI[4] * *unaff_EDI - unaff_EDI[1] * *pfVar1;
  return;
}


