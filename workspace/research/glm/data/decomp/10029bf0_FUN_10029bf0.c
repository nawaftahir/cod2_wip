// 10029bf0 size=1056 FUN_10029bf0

void FUN_10029bf0(int param_1,float *param_2)

{
  float *pfVar1;
  float fVar2;
  int iVar3;
  float *pfVar4;
  int *piVar5;
  float fVar6;
  int iVar7;
  void *_Base;
  float local_4c;
  float local_48;
  float local_44;
  float local_40;
  float local_3c;
  float local_38;
  float local_34;
  float local_30;
  float local_2c;
  float local_28;
  float local_24;
  float local_20;
  float local_1c;
  float local_18;
  int local_10 [4];
  
  _qsort((void *)param_2[9],(size_t)param_2[8],4,(_PtFuncCompare *)&LAB_10029be0);
  fVar2 = param_2[10];
  pfVar1 = param_2;
  while( true ) {
    if (fVar2 != 0.0) {
      iVar3 = 0;
      if ((int)pfVar1[10] < 1) {
        return;
      }
      iVar7 = 0;
      do {
        FUN_10029bf0(param_1,(int)pfVar1[0xb] + iVar7);
        iVar3 = iVar3 + 1;
        iVar7 = iVar7 + 0x30;
      } while (iVar3 < (int)pfVar1[10]);
      return;
    }
    fVar6 = pfVar1[8];
    fVar2 = -3.4028235e+38;
    local_38 = -3.4028235e+38;
    local_4c = 3.4028235e+38;
    local_48 = 3.4028235e+38;
    local_44 = 3.4028235e+38;
    local_40 = -3.4028235e+38;
    local_3c = -3.4028235e+38;
    if (0 < (int)fVar6) {
      piVar5 = (int *)pfVar1[9];
      do {
        iVar3 = *piVar5 * 0x60 + *(int *)(param_1 + 0xf8);
        if (*(float *)(*piVar5 * 0x60 + 0x14 + *(int *)(param_1 + 0xf8)) < local_4c) {
          local_4c = *(float *)(iVar3 + 0x14);
        }
        if (local_40 < *(float *)(iVar3 + 0x20)) {
          local_40 = *(float *)(iVar3 + 0x20);
        }
        if (*(float *)(iVar3 + 0x18) < local_48) {
          local_48 = *(float *)(iVar3 + 0x18);
        }
        if (local_3c < *(float *)(iVar3 + 0x24)) {
          local_3c = *(float *)(iVar3 + 0x24);
        }
        if (*(float *)(iVar3 + 0x1c) < local_44) {
          local_44 = *(float *)(iVar3 + 0x1c);
        }
        if (fVar2 < *(float *)(iVar3 + 0x28)) {
          fVar2 = *(float *)(iVar3 + 0x28);
        }
        piVar5 = piVar5 + 1;
        fVar6 = (float)((int)fVar6 + -1);
        local_38 = fVar2;
      } while (fVar6 != 0.0);
    }
    if (pfVar1[6] == 0.0) {
      *pfVar1 = local_4c;
      pfVar1[1] = local_48;
      pfVar1[2] = local_44;
      pfVar1[5] = local_38;
      pfVar1[3] = local_40;
      pfVar1[4] = local_3c;
    }
    fVar2 = pfVar1[8];
    if ((int)fVar2 < 8) break;
    local_28 = local_4c;
    local_34 = (local_40 + local_4c) * 0.5;
    local_24 = local_48;
    local_20 = local_44;
    local_18 = (local_3c + local_48) * 0.5;
    local_30 = local_3c;
    local_2c = local_38;
    local_1c = local_34;
    iVar3 = FUN_10029910(param_1,&local_28,&local_34,fVar2);
    local_24 = local_48;
    local_20 = local_44;
    local_34 = local_40;
    local_30 = local_3c;
    local_2c = local_38;
    local_28 = local_1c;
    local_10[0] = iVar3;
    local_10[1] = FUN_10029910(param_1,&local_28,&local_34,(int)fVar2 - iVar3);
    iVar7 = ((int)fVar2 - iVar3) - local_10[1];
    local_28 = local_4c;
    local_24 = local_48;
    local_20 = local_44;
    local_34 = local_40;
    local_2c = local_38;
    local_30 = local_18;
    local_10[2] = FUN_10029910(param_1,&local_28,&local_34,iVar7);
    iVar7 = iVar7 - local_10[2];
    local_28 = local_4c;
    local_20 = local_44;
    local_34 = local_40;
    local_30 = local_3c;
    local_2c = local_38;
    local_24 = local_18;
    local_10[3] = FUN_10029910(param_1,&local_28,&local_34,iVar7);
    iVar3 = (uint)(local_10[3] != 0) + (uint)(local_10[2] != 0) + (uint)(local_10[1] != 0) +
            (uint)(iVar3 != 0);
    if (iVar3 == 0) {
      return;
    }
    if (pfVar1[6] != 0.0) {
      iVar3 = iVar3 + 1;
    }
    if (iVar7 != local_10[3]) {
      iVar3 = iVar3 + 1;
    }
    fVar2 = (float)(*(code *)RI_Hunk_AllocAlignInternal)(iVar3 * 0x30,4);
    pfVar1[0xb] = fVar2;
    if (pfVar1[6] != 0.0) {
      pfVar4 = (float *)((int)pfVar1[10] * 0x30 + (int)fVar2);
      pfVar1[10] = (float)((int)pfVar1[10] + 1);
      *pfVar4 = *pfVar1;
      pfVar4[1] = pfVar1[1];
      pfVar4[2] = pfVar1[2];
      pfVar4[3] = pfVar1[3];
      pfVar4[4] = pfVar1[4];
      pfVar4[5] = pfVar1[5];
      pfVar4[7] = pfVar1[7];
      pfVar4[6] = pfVar1[6];
    }
    _Base = (void *)pfVar1[9];
    fVar2 = pfVar1[8];
    param_2 = (float *)0x0;
    do {
      iVar3 = local_10[(int)param_2];
      if (iVar3 != 0) {
        iVar7 = (int)pfVar1[10] * 0x30 + (int)pfVar1[0xb];
        pfVar1[10] = (float)((int)pfVar1[10] + 1);
        *(int *)(iVar7 + 0x20) = iVar3;
        *(void **)(iVar7 + 0x24) = _Base;
        FUN_10029bf0(param_1,iVar7);
        _Base = (void *)((int)_Base + iVar3 * 4);
        fVar2 = (float)((int)fVar2 - iVar3);
      }
      param_2 = (float *)((int)param_2 + 1);
    } while ((int)param_2 < 4);
    if (fVar2 == 0.0) {
      return;
    }
    pfVar4 = (float *)((int)pfVar1[10] * 0x30 + (int)pfVar1[0xb]);
    pfVar1[10] = (float)((int)pfVar1[10] + 1);
    pfVar4[8] = fVar2;
    pfVar4[9] = (float)_Base;
    _qsort(_Base,(size_t)fVar2,4,(_PtFuncCompare *)&LAB_10029be0);
    fVar2 = pfVar4[10];
    pfVar1 = pfVar4;
  }
  return;
}


