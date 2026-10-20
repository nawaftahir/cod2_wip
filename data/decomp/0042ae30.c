
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_0042ae30(int *param_1,float param_2)

{
  int iVar1;
  float *pfVar2;
  float *pfVar3;
  float10 fVar4;
  int local_c;
  
  local_c = 0;
  if (0 < *param_1) {
    pfVar2 = (float *)(param_1 + 0xb);
    do {
      iVar1 = 0;
      pfVar3 = pfVar2;
      if (0 < param_1[1]) {
        do {
          if (((uint)pfVar3[0xb] & 2) == 0) {
            fVar4 = (float10)FUN_0042ac60();
            if ((float)fVar4 != _DAT_00556a70) {
              *pfVar3 = (float)fVar4 * param_2 + *pfVar3;
            }
          }
          iVar1 = iVar1 + 1;
          pfVar3 = pfVar3 + 0xe;
        } while (iVar1 < param_1[1]);
      }
      local_c = local_c + 1;
      pfVar2 = pfVar2 + 0xe0;
    } while (local_c < *param_1);
  }
  FUN_004269d0();
  return;
}

