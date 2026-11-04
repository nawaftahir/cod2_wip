
void __fastcall FUN_0042ea50(float *param_1)

{
  float *pfVar1;
  int iVar2;
  float *pfVar3;
  int *unaff_ESI;
  int iVar4;
  
  iVar4 = 0;
  if (0 < *unaff_ESI) {
    pfVar3 = (float *)(unaff_ESI + 0xb);
    do {
      iVar2 = 0;
      pfVar1 = pfVar3;
      if (0 < unaff_ESI[1]) {
        do {
          iVar2 = iVar2 + 1;
          pfVar1[-2] = pfVar1[-2] + *param_1;
          pfVar1[-1] = pfVar1[-1] + param_1[1];
          *pfVar1 = *pfVar1 + param_1[2];
          pfVar1 = pfVar1 + 0xe;
        } while (iVar2 < unaff_ESI[1]);
      }
      iVar4 = iVar4 + 1;
      pfVar3 = pfVar3 + 0xe0;
    } while (iVar4 < *unaff_ESI);
  }
  if ((void *)unaff_ESI[0xe09] != (void *)0x0) {
    _free((void *)unaff_ESI[0xe09]);
  }
  iVar4 = FUN_004267d0(DAT_01128d94,0,0);
  *(short *)(unaff_ESI + 0xe0b) = (short)unaff_ESI[0xe0b] + 1;
  unaff_ESI[0xe09] = iVar4;
  if (DAT_01234694 == 0) {
    return;
  }
  FUN_00424b10();
  return;
}

