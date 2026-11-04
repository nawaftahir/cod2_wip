
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_00475190(void)

{
  undefined4 *unaff_EBX;
  int iVar1;
  float *pfVar2;
  double dVar3;
  int local_c;
  float *local_8;
  
  local_c = 0;
  if (0 < DAT_010c2d7c) {
    local_8 = (float *)&DAT_010bcd7c;
    do {
      iVar1 = 0;
      pfVar2 = local_8;
      do {
        dVar3 = _fabs((double)((float)unaff_EBX[iVar1] - *pfVar2));
        if ((float)_DAT_00556b98 < (float)dVar3) break;
        iVar1 = iVar1 + 1;
        pfVar2 = pfVar2 + 1;
      } while (iVar1 < 3);
      if (iVar1 == 3) {
        return local_c;
      }
      local_c = local_c + 1;
      local_8 = local_8 + 3;
    } while (local_c < DAT_010c2d7c);
  }
  iVar1 = DAT_010c2d7c;
  (&DAT_010bcd7c)[DAT_010c2d7c * 3] = *unaff_EBX;
  (&DAT_010bcd80)[iVar1 * 3] = unaff_EBX[1];
  (&DAT_010bcd84)[iVar1 * 3] = unaff_EBX[2];
  if (DAT_010c2d7c < 0x7ff) {
    DAT_010c2d7c = DAT_010c2d7c + 1;
  }
  return DAT_010c2d7c + -1;
}

