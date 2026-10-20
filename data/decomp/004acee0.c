
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

int FUN_004acee0(int param_1,float param_2)

{
  float fVar1;
  int iVar2;
  float *pfVar3;
  
  iVar2 = 0;
  pfVar3 = (float *)(param_1 + 4);
  if (0 < *(short *)(param_1 + 0x7c)) {
    do {
      if ((&DAT_01233440)[iVar2 * 8] == '\0') {
        fVar1 = *pfVar3;
      }
      else {
        fVar1 = *(float *)(&DAT_01233444 + iVar2 * 8);
      }
      if ((fVar1 == _DAT_00556a70) || (param_2 < fVar1)) {
        return iVar2;
      }
      iVar2 = iVar2 + 1;
      pfVar3 = pfVar3 + 5;
    } while (iVar2 < *(short *)(param_1 + 0x7c));
  }
  return -1;
}

