// 10027f40 size=408 FUN_10027f40

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10027f40(undefined4 param_1,int param_2)

{
  float fVar1;
  int iVar2;
  float fVar3;
  float fVar4;
  undefined4 uVar5;
  int iVar6;
  int unaff_EDI;
  int local_10;
  float local_c;
  
  iVar2 = DAT_101ce76c;
  iVar6 = 0;
  *(undefined4 *)(unaff_EDI + 0xa20) = 0;
  uVar5 = DAT_10678ab8;
  fVar3 = (1.0 - *(float *)(iVar2 + 8)) * _DAT_10696bd0;
  local_10 = 0;
  fVar4 = _DAT_10696bd0 * *(float *)(iVar2 + 8);
  do {
    iVar2 = *(int *)(param_2 + iVar6 * 8);
    if (iVar2 == -1) goto LAB_10028045;
    fVar1 = *(float *)(param_2 + 4 + iVar6 * 8);
    if (_DAT_10696bd0 < fVar1) {
      if (*(int *)(DAT_101ce718 + 8) + *(int *)(DAT_101ce72c + 8) < iVar6) {
        local_10 = -1;
      }
      else if (iVar6 < *(int *)(DAT_101ce718 + 8) - *(int *)(DAT_101ce72c + 8)) {
        local_10 = 1;
      }
      goto LAB_10028045;
    }
    if ((fVar1 <= fVar3) || (fVar1 == 0.0)) {
      local_c = 1.0;
    }
    else {
      local_c = (_DAT_10696bd0 - fVar1) * (1.0 / fVar4);
    }
    FUN_100276d0(param_1,uVar5,iVar2,local_c);
    iVar6 = iVar6 + 1;
  } while (iVar6 != 0x18);
  local_10 = -1;
LAB_10028045:
  if ((DAT_10696bd4 == -1) || (fVar3 = (float)(DAT_10678504 - DAT_10696bd4) * 0.001, fVar3 < 0.0)) {
    fVar3 = 0.0;
  }
  DAT_10696bd4 = DAT_10678504;
  if (local_10 < 1) {
    if (local_10 < 0) {
      _DAT_10696bd0 = _DAT_10696bd0 - fVar3 * *(float *)(DAT_101ce620 + 8);
    }
  }
  else {
    _DAT_10696bd0 = fVar3 * *(float *)(DAT_101ce7d0 + 8) + _DAT_10696bd0;
  }
  if (_DAT_10696bd0 < 0.0001) {
    _DAT_10696bd0 = 0.0001;
  }
  return;
}


