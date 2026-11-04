
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00455950(int param_1)

{
  int iVar1;
  float *pfVar2;
  float *pfVar3;
  int iVar4;
  float10 fVar5;
  int local_c;
  int local_8;
  
  if ((*(int *)(DAT_01233b64 + 0x248) == 0) && (local_c = 0, 0 < *(int *)(param_1 + 0x38))) {
    local_8 = 0;
    do {
      pfVar2 = (float *)(*(int *)(param_1 + 0x3c) + local_8);
      iVar1 = 3;
      do {
        iVar4 = 3;
        pfVar3 = pfVar2;
        do {
          fVar5 = (float10)FUN_004d7630((double)(*pfVar3 + _DAT_00556b30));
          pfVar2 = pfVar3 + 1;
          iVar4 = iVar4 + -1;
          *pfVar3 = (float)fVar5;
          pfVar3 = pfVar2;
        } while (iVar4 != 0);
        iVar1 = iVar1 + -1;
      } while (iVar1 != 0);
      local_c = local_c + 1;
      local_8 = local_8 + 0xa8;
    } while (local_c < *(int *)(param_1 + 0x38));
  }
  return;
}

