// 10006da0 size=595 FUN_10006da0

void FUN_10006da0(int param_1,undefined4 *param_2)

{
  float fVar1;
  int iVar2;
  float *pfVar3;
  int in_EDX;
  float *pfVar4;
  int iVar5;
  float *unaff_ESI;
  float *unaff_EDI;
  float afStack_444 [7];
  float local_420 [264];
  
  *unaff_ESI = 1.0;
  unaff_ESI[1] = 1.0;
  iVar5 = 0;
  *unaff_EDI = -1.0;
  unaff_EDI[1] = -1.0;
  if (0 < param_1) {
    pfVar4 = (float *)(in_EDX + 4);
    pfVar3 = DAT_101ce5b8;
    do {
      fVar1 = pfVar3[7] * *pfVar4 + pfVar3[0xb] * pfVar4[1] + pfVar3[3] * pfVar4[-1] + pfVar3[0xf];
      if (fVar1 < 0.125) {
        *unaff_ESI = -1.0;
        unaff_ESI[1] = -1.0;
        *unaff_EDI = 1.0;
        unaff_EDI[1] = 1.0;
        *param_2 = 1;
        return;
      }
      fVar1 = 1.0 / fVar1;
      local_420[iVar5 * 2] =
           (pfVar4[-1] * *pfVar3 + pfVar3[4] * *pfVar4 + pfVar3[8] * pfVar4[1] + pfVar3[0xc]) *
           fVar1;
      local_420[iVar5 * 2 + 1] =
           (pfVar3[5] * *pfVar4 + pfVar3[9] * pfVar4[1] + pfVar3[1] * pfVar4[-1] + pfVar3[0xd]) *
           fVar1;
      if (local_420[iVar5 * 2] < *unaff_ESI) {
        *unaff_ESI = local_420[iVar5 * 2];
        pfVar3 = DAT_101ce5b8;
      }
      if (*unaff_EDI < local_420[iVar5 * 2]) {
        *unaff_EDI = local_420[iVar5 * 2];
        pfVar3 = DAT_101ce5b8;
      }
      if (local_420[iVar5 * 2 + 1] < unaff_ESI[1]) {
        unaff_ESI[1] = local_420[iVar5 * 2 + 1];
        pfVar3 = DAT_101ce5b8;
      }
      if (unaff_EDI[1] < local_420[iVar5 * 2 + 1]) {
        unaff_EDI[1] = local_420[iVar5 * 2 + 1];
        pfVar3 = DAT_101ce5b8;
      }
      iVar5 = iVar5 + 1;
      pfVar4 = pfVar4 + 3;
    } while (iVar5 < param_1);
  }
  if ((*unaff_EDI - *unaff_ESI) * (unaff_EDI[1] - unaff_ESI[1]) * 0.25 <
      *(float *)(DAT_101ce788 + 8)) {
    *param_2 = 0;
    return;
  }
  fVar1 = 0.0;
  local_420[param_1 * 2] = local_420[0];
  local_420[param_1 * 2 + 1] = local_420[1];
  local_420[param_1 * 2 + 2] = local_420[2];
  local_420[param_1 * 2 + 3] = local_420[3];
  iVar5 = 1;
  if (3 < param_1) {
    do {
      iVar2 = iVar5 * 2;
      iVar5 = iVar5 + 4;
      fVar1 = (local_420[iVar5 * 2 + 1] - afStack_444[iVar5 * 2 + 6]) *
              *(float *)(&stack0xfffffbd8 + iVar5 * 8) +
              (*(float *)(&stack0xfffffbdc + iVar5 * 8) - afStack_444[iVar5 * 2 + 4]) *
              afStack_444[iVar5 * 2 + 5] +
              (afStack_444[iVar5 * 2 + 6] - afStack_444[iVar5 * 2 + 2]) * afStack_444[iVar5 * 2 + 3]
              + (local_420[iVar2 + 3] - afStack_444[iVar5 * 2]) * afStack_444[iVar5 * 2 + 1] + fVar1
      ;
    } while (iVar5 <= param_1 + -3);
  }
  while (iVar5 <= param_1) {
    iVar2 = iVar5 * 2;
    iVar5 = iVar5 + 1;
    fVar1 = (local_420[iVar2 + 3] - afStack_444[iVar5 * 2 + 6]) *
            *(float *)(&stack0xfffffbd8 + iVar5 * 8) + fVar1;
  }
  if (fVar1 * 0.125 < *(float *)(DAT_101ce788 + 8)) {
    *param_2 = 0;
    return;
  }
  *param_2 = 1;
  return;
}


