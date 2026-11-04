
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined4 FUN_004889f0(int param_1,int param_2)

{
  float *pfVar1;
  int iVar2;
  int iVar3;
  float *pfVar4;
  int unaff_EDI;
  int local_10;
  float *local_c;
  int local_8;
  
  iVar2 = local_8;
  pfVar1 = local_c;
  FUN_00483a50();
  local_10 = 0;
  if (0 < param_1) {
    local_8 = 0;
    local_c = (float *)(unaff_EDI + (int)local_c * 4);
    pfVar4 = (float *)(unaff_EDI + iVar2 * 4);
    iVar3 = (param_1 * 3 + -3) * 4;
    do {
      if ((*(float *)(param_2 + (int)pfVar1 * 4) - *(float *)(iVar3 + (int)pfVar1 * 4 + unaff_EDI))
          * (*pfVar4 - *(float *)(iVar3 + iVar2 * 4 + unaff_EDI)) +
          (*(float *)(param_2 + iVar2 * 4) - *(float *)(iVar3 + iVar2 * 4 + unaff_EDI)) *
          (*(float *)(iVar3 + (int)pfVar1 * 4 + unaff_EDI) - *local_c) < _DAT_00556a70) {
        return 0;
      }
      local_10 = local_10 + 1;
      local_c = local_c + 3;
      pfVar4 = pfVar4 + 3;
      iVar3 = local_8;
      local_8 = local_8 + 0xc;
    } while (local_10 < param_1);
  }
  return 1;
}

