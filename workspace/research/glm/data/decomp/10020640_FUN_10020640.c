// 10020640 size=329 FUN_10020640

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10020640(void)

{
  int iVar1;
  float *pfVar2;
  int in_EDX;
  int iVar3;
  int iVar4;
  
  DAT_101da980 = 131072.0;
  DAT_101da984 = 131072.0;
  _DAT_101da988 = 131072.0;
  DAT_101da98c = -131072.0;
  DAT_101da990 = -131072.0;
  _DAT_101da994 = -131072.0;
  iVar4 = 0;
  if (*(int *)(in_EDX + 0x10) != 0) {
    iVar3 = 0;
    do {
      if ((*(byte *)(*(int *)(*(int *)(in_EDX + 0x14) + iVar3) + 0xc) & 8) == 0) {
        iVar1 = *(int *)(*(int *)(in_EDX + 0x14) + iVar3 + 8);
        if (*(float *)(iVar1 + 4) < DAT_101da980) {
          DAT_101da980 = *(float *)(iVar1 + 4);
        }
        if (DAT_101da98c < *(float *)(iVar1 + 0x10)) {
          DAT_101da98c = *(float *)(iVar1 + 0x10);
        }
        if (*(float *)(iVar1 + 8) < DAT_101da984) {
          DAT_101da984 = *(float *)(iVar1 + 8);
        }
        if (DAT_101da990 < *(float *)(iVar1 + 0x14)) {
          DAT_101da990 = *(float *)(iVar1 + 0x14);
        }
        if (*(float *)(iVar1 + 0xc) < _DAT_101da988) {
          _DAT_101da988 = *(float *)(iVar1 + 0xc);
        }
        if (_DAT_101da994 < *(float *)(iVar1 + 0x18)) {
          _DAT_101da994 = *(float *)(iVar1 + 0x18);
        }
      }
      iVar4 = iVar4 + 1;
      iVar3 = iVar3 + 0xc;
    } while (iVar4 != *(int *)(in_EDX + 0x10));
  }
  pfVar2 = &DAT_101da980;
  do {
    if (*pfVar2 == 131072.0) {
      *pfVar2 = 0.0;
      pfVar2[3] = 0.0;
    }
    if (pfVar2[3] - *pfVar2 < 1.0) {
      *pfVar2 = *pfVar2 - 0.5;
      pfVar2[3] = pfVar2[3] + 0.5;
    }
    pfVar2 = pfVar2 + 1;
  } while (pfVar2 != &DAT_101da98c);
  return;
}


