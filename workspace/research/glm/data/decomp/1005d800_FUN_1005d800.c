// 1005d800 size=226 FUN_1005d800

undefined4 FUN_1005d800(int param_1,int param_2)

{
  int iVar1;
  int iVar2;
  float *pfVar3;
  float *pfVar4;
  int unaff_EDI;
  int local_1c;
  int local_18;
  int local_14;
  
  iVar1 = local_1c;
  FUN_10058fb0();
  local_18 = 0;
  if (0 < param_1) {
    local_1c = 0;
    pfVar3 = (float *)(unaff_EDI + iVar1 * 4);
    pfVar4 = (float *)(unaff_EDI + local_14 * 4);
    iVar2 = (param_1 * 3 + -3) * 4;
    do {
      if ((*(float *)(param_2 + iVar1 * 4) - *(float *)(unaff_EDI + iVar2 + iVar1 * 4)) *
          (*pfVar4 - *(float *)(unaff_EDI + iVar2 + local_14 * 4)) +
          (*(float *)(param_2 + local_14 * 4) - *(float *)(iVar2 + local_14 * 4 + unaff_EDI)) *
          (*(float *)(unaff_EDI + iVar2 + iVar1 * 4) - *pfVar3) < 0.0) {
        return 0;
      }
      local_18 = local_18 + 1;
      pfVar4 = pfVar4 + 3;
      pfVar3 = pfVar3 + 3;
      iVar2 = local_1c;
      local_1c = local_1c + 0xc;
    } while (local_18 < param_1);
  }
  return 1;
}


