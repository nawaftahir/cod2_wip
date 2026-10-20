
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

float10 FUN_004490a0(void)

{
  float fVar1;
  float fVar2;
  float fVar3;
  int iVar4;
  int *unaff_ESI;
  float *pfVar5;
  float10 fVar6;
  float local_8;
  
  iVar4 = 2;
  local_8 = 0.0;
  if (2 < *unaff_ESI) {
    pfVar5 = (float *)(unaff_ESI + 6);
    do {
      fVar1 = (pfVar5[3] - (float)unaff_ESI[3]) * (pfVar5[-1] - (float)unaff_ESI[2]) -
              (pfVar5[2] - (float)unaff_ESI[2]) * (*pfVar5 - (float)unaff_ESI[3]);
      fVar2 = (*pfVar5 - (float)unaff_ESI[3]) * (pfVar5[1] - (float)unaff_ESI[1]) -
              (pfVar5[3] - (float)unaff_ESI[3]) * (pfVar5[-2] - (float)unaff_ESI[1]);
      fVar3 = (pfVar5[2] - (float)unaff_ESI[2]) * (pfVar5[-2] - (float)unaff_ESI[1]) -
              (pfVar5[1] - (float)unaff_ESI[1]) * (pfVar5[-1] - (float)unaff_ESI[2]);
      fVar6 = (float10)FUN_004d98d4((double)(fVar1 * fVar1 + fVar2 * fVar2 + fVar3 * fVar3));
      local_8 = (float)fVar6 + local_8;
      iVar4 = iVar4 + 1;
      pfVar5 = pfVar5 + 3;
    } while (iVar4 < *unaff_ESI);
  }
  return (float10)local_8 * (float10)_DAT_00556b30;
}

