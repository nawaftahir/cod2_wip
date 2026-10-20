
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined2 FUN_00448100(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int *unaff_ESI;
  
  iVar1 = *unaff_ESI;
  iVar5 = 0;
  iVar2 = 0;
  iVar4 = iVar1 + -1;
  if (0 < iVar1) {
    do {
      iVar3 = iVar2;
      if (((float)_DAT_00556be8 <
           ((float)unaff_ESI[iVar3 * 3 + 1] - (float)unaff_ESI[iVar4 * 3 + 1]) *
           ((float)unaff_ESI[iVar3 * 3 + 1] - (float)unaff_ESI[iVar4 * 3 + 1]) +
           ((float)unaff_ESI[iVar3 * 3 + 2] - (float)unaff_ESI[iVar4 * 3 + 2]) *
           ((float)unaff_ESI[iVar3 * 3 + 2] - (float)unaff_ESI[iVar4 * 3 + 2]) +
           ((float)unaff_ESI[iVar3 * 3 + 3] - (float)unaff_ESI[iVar4 * 3 + 3]) *
           ((float)unaff_ESI[iVar3 * 3 + 3] - (float)unaff_ESI[iVar4 * 3 + 3])) &&
         (iVar5 = iVar5 + 1, iVar5 == 3)) {
        return 0;
      }
      iVar2 = iVar3 + 1;
      iVar4 = iVar3;
    } while (iVar3 + 1 < iVar1);
  }
  return 1;
}

