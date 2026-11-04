
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_00429f40(int param_1)

{
  float fVar1;
  float *pfVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  
  do {
    iVar5 = 0;
    if (DAT_010c4d84 < 1) {
      return;
    }
LAB_00429f60:
    pfVar2 = (float *)(&DAT_010c4d88)[iVar5];
    iVar3 = 0;
    iVar4 = param_1 - (int)pfVar2;
    do {
      fVar1 = *(float *)((int)pfVar2 + iVar4) - *pfVar2;
      if (_DAT_00556b20 < fVar1 * fVar1) goto LAB_00429fc6;
      iVar3 = iVar3 + 1;
      pfVar2 = pfVar2 + 1;
    } while (iVar3 < 3);
    if (iVar5 < 0) {
      return;
    }
    if (iVar5 < DAT_010c4d84 + -1) {
      do {
        (&DAT_010c4d88)[iVar5] = (&DAT_010c4d8c)[iVar5];
        iVar5 = iVar5 + 1;
      } while (iVar5 < DAT_010c4d84 + -1);
    }
    DAT_010c4d84 = DAT_010c4d84 + -1;
  } while( true );
LAB_00429fc6:
  iVar5 = iVar5 + 1;
  if (DAT_010c4d84 <= iVar5) {
    return;
  }
  goto LAB_00429f60;
}

