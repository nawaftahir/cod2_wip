// 10005ee0 size=740 FUN_10005ee0

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10005ee0(int param_1,int param_2)

{
  int in_EAX;
  float *pfVar1;
  float *pfVar2;
  float *pfVar3;
  int iVar4;
  int iVar5;
  int local_624;
  float local_60c [387];
  
  if (_DAT_101ce5dc == 0.0) {
    if (0 < param_1) {
      iVar5 = (param_1 * 3 + -3) * 4;
      pfVar2 = (float *)(in_EAX + 8);
      local_624 = param_1;
      do {
        local_60c[0] = pfVar2[-2] - *(float *)(iVar5 + in_EAX);
        pfVar3 = (float *)(iVar5 + param_2);
        local_60c[1] = pfVar2[-1] - *(float *)(iVar5 + 4 + in_EAX);
        local_60c[2] = *pfVar2 - *(float *)(iVar5 + 8 + in_EAX);
        *pfVar3 = _DAT_101ce5d4 * local_60c[2] - _DAT_101ce5d8 * local_60c[1];
        pfVar3[1] = _DAT_101ce5d8 * local_60c[0] - _DAT_101ce5d0 * local_60c[2];
        pfVar3[2] = _DAT_101ce5d0 * local_60c[1] - _DAT_101ce5d4 * local_60c[0];
        FUN_100590b0();
        iVar5 = (int)pfVar2 + (-8 - in_EAX);
        pfVar2 = pfVar2 + 3;
        local_624 = local_624 + -1;
      } while (local_624 != 0);
    }
  }
  else {
    iVar5 = 0;
    if (3 < param_1) {
      iVar4 = (param_1 - 4U >> 2) + 1;
      iVar5 = iVar4 * 4;
      pfVar2 = (float *)(in_EAX + 0x14);
      pfVar3 = local_60c + 2;
      do {
        pfVar1 = pfVar2 + 0xc;
        iVar4 = iVar4 + -1;
        pfVar3[-2] = pfVar2[-5] - _DAT_101ce5d0;
        pfVar3[-1] = pfVar2[-4] - _DAT_101ce5d4;
        *pfVar3 = pfVar2[-3] - _DAT_101ce5d8;
        pfVar3[1] = pfVar2[-2] - _DAT_101ce5d0;
        pfVar3[2] = pfVar2[-1] - _DAT_101ce5d4;
        *(float *)(&stack0xfffff9c4 + -in_EAX + (int)pfVar1) = *pfVar2 - _DAT_101ce5d8;
        *(float *)((int)pfVar2 + (int)local_60c + (4 - in_EAX)) = pfVar2[1] - _DAT_101ce5d0;
        *(float *)(&stack0xfffff9cc + -in_EAX + (int)pfVar1) = pfVar2[2] - _DAT_101ce5d4;
        *(float *)((int)pfVar2 + (int)local_60c + (0xc - in_EAX)) = pfVar2[3] - _DAT_101ce5d8;
        *(float *)((int)pfVar2 + (int)local_60c + (0x10 - in_EAX)) = pfVar2[4] - _DAT_101ce5d0;
        *(float *)((int)pfVar2 + (int)local_60c + (0x14 - in_EAX)) = pfVar2[5] - _DAT_101ce5d4;
        *(float *)((int)pfVar2 + (int)local_60c + (0x18 - in_EAX)) = pfVar2[6] - _DAT_101ce5d8;
        pfVar2 = pfVar1;
        pfVar3 = pfVar3 + 0xc;
      } while (iVar4 != 0);
    }
    if (iVar5 < param_1) {
      iVar4 = param_1 - iVar5;
      pfVar2 = local_60c + iVar5 * 3 + 2;
      pfVar3 = (float *)(iVar5 * 0xc + 8 + in_EAX);
      do {
        iVar4 = iVar4 + -1;
        pfVar2[-2] = pfVar3[-2] - _DAT_101ce5d0;
        pfVar2[-1] = pfVar3[-1] - _DAT_101ce5d4;
        *pfVar2 = *pfVar3 - _DAT_101ce5d8;
        pfVar2 = pfVar2 + 3;
        pfVar3 = pfVar3 + 3;
      } while (iVar4 != 0);
    }
    local_60c[param_1 * 3] = local_60c[0];
    local_60c[param_1 * 3 + 1] = local_60c[1];
    local_60c[param_1 * 3 + 2] = local_60c[2];
    if (0 < param_1) {
      pfVar3 = local_60c + 2;
      pfVar2 = (float *)(param_2 + 8);
      param_2 = param_2 - (int)pfVar3;
      local_624 = param_1;
      do {
        *(float *)((int)pfVar3 + param_2) = *pfVar3 * pfVar3[2] - pfVar3[3] * pfVar3[-1];
        pfVar2[-1] = pfVar3[3] * pfVar3[-2] - *pfVar3 * pfVar3[1];
        *pfVar2 = pfVar3[-1] * pfVar3[1] - pfVar3[2] * pfVar3[-2];
        FUN_100590b0();
        pfVar3 = pfVar3 + 3;
        pfVar2 = pfVar2 + 3;
        local_624 = local_624 + -1;
      } while (local_624 != 0);
      return;
    }
  }
  return;
}


