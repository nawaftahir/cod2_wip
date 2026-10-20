
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00427160(int param_1)

{
  float fVar1;
  float fVar2;
  int iVar3;
  int *unaff_ESI;
  float *pfVar4;
  float10 fVar5;
  int local_14;
  float local_10;
  float local_c;
  float *local_8;
  
  local_10 = 0.0;
  fVar1 = _DAT_00556a58 / ((float)*(int *)(unaff_ESI[DAT_01128d90 + 6] + 0x14) * DAT_01128dc4);
  local_14 = 0;
  fVar2 = _DAT_00556a58 / ((float)*(int *)(unaff_ESI[DAT_01128d90 + 6] + 0x18) * DAT_01128dc4);
  if (0 < *unaff_ESI) {
    local_8 = (float *)(unaff_ESI + param_1 * 2 + 0xd);
    do {
      iVar3 = 0;
      local_c = 0.0;
      if (0 < unaff_ESI[1]) {
        pfVar4 = local_8;
        do {
          iVar3 = iVar3 + 1;
          pfVar4[-1] = local_10 * fVar1;
          *pfVar4 = local_c * fVar2;
          fVar5 = (float10)FUN_00426c10();
          local_c = (float)fVar5;
          pfVar4 = pfVar4 + 0xe;
        } while (iVar3 < unaff_ESI[1]);
      }
      local_14 = local_14 + 1;
      fVar5 = (float10)FUN_00426b80();
      local_10 = (float)fVar5;
      local_8 = local_8 + 0xe0;
    } while (local_14 < *unaff_ESI);
  }
  if (param_1 == 1) {
    *(undefined1 *)((int)unaff_ESI + 0x382f) = 0;
  }
  return;
}

