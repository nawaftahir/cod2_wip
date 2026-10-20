
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00425840(void)

{
  float *pfVar1;
  int iVar2;
  int iVar3;
  int *unaff_EBX;
  int iVar4;
  int iVar5;
  int local_c;
  int local_8;
  
  iVar2 = *unaff_EBX;
  local_c = 0;
  if (0 < iVar2) {
    do {
      if (local_c == iVar2 + -1) {
        local_8 = 1;
      }
      else {
        local_8 = (local_c + 1) % iVar2;
      }
      iVar2 = iVar2 + -2;
      if (local_c != 0) {
        iVar2 = local_c + -1;
      }
      iVar5 = 0;
      if (0 < unaff_EBX[1]) {
        pfVar1 = (float *)(unaff_EBX + local_c * 0xe0 + 0xb);
        do {
          if (((uint)pfVar1[0xb] & 2) == 0) {
            iVar3 = local_8 * 0x10 + iVar5;
            iVar4 = iVar2 * 0x10 + iVar5;
            pfVar1[-2] = ((float)unaff_EBX[iVar3 * 0xe + 9] + (float)unaff_EBX[iVar4 * 0xe + 9]) *
                         _DAT_00556b30;
            pfVar1[-1] = ((float)unaff_EBX[iVar4 * 0xe + 10] + (float)unaff_EBX[iVar3 * 0xe + 10]) *
                         _DAT_00556b30;
            *pfVar1 = ((float)unaff_EBX[iVar4 * 0xe + 0xb] + (float)unaff_EBX[iVar3 * 0xe + 0xb]) *
                      _DAT_00556b30;
          }
          iVar5 = iVar5 + 1;
          pfVar1 = pfVar1 + 0xe;
        } while (iVar5 < unaff_EBX[1]);
      }
      iVar2 = *unaff_EBX;
      local_c = local_c + 2;
    } while (local_c < iVar2);
  }
  return;
}

