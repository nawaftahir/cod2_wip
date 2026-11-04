
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00429e20(void)

{
  float *pfVar1;
  int iVar2;
  float *unaff_EDI;
  
  iVar2 = 0;
  if (0 < DAT_01128d8c) {
    pfVar1 = (float *)&DAT_010f8d94;
    do {
      if ((pfVar1[-2] - *unaff_EDI) * (pfVar1[-2] - *unaff_EDI) +
          (pfVar1[-1] - unaff_EDI[1]) * (pfVar1[-1] - unaff_EDI[1]) +
          (*pfVar1 - unaff_EDI[2]) * (*pfVar1 - unaff_EDI[2]) < (float)_DAT_00556ba8) {
        return iVar2;
      }
      iVar2 = iVar2 + 1;
      pfVar1 = pfVar1 + 3;
    } while (iVar2 < DAT_01128d8c);
  }
  return -1;
}

