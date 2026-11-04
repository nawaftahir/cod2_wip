// 10015260 size=386 FUN_10015260

uint FUN_10015260(uint param_1,undefined4 *param_2,undefined4 *param_3,float param_4)

{
  float fVar1;
  float *in_EAX;
  int iVar2;
  int iVar3;
  int iVar4;
  float *pfVar5;
  undefined4 *puVar6;
  undefined4 *puVar7;
  uint local_64;
  int local_5c [13];
  float local_28 [10];
  
  iVar2 = 0;
  local_5c[0] = 0;
  local_5c[1] = 0;
  local_5c[2] = 0;
  if (0 < (int)param_1) {
    pfVar5 = (float *)(param_2 + 1);
    do {
      fVar1 = (*pfVar5 * in_EAX[1] + pfVar5[1] * in_EAX[2] + pfVar5[-1] * *in_EAX) - param_4;
      local_28[iVar2] = fVar1;
      if (fVar1 <= 0.5) {
        if (-0.5 <= fVar1) {
          local_5c[iVar2 + 3] = 2;
        }
        else {
          local_5c[iVar2 + 3] = 1;
        }
      }
      else {
        local_5c[iVar2 + 3] = 0;
      }
      local_5c[local_5c[iVar2 + 3]] = local_5c[local_5c[iVar2 + 3]] + 1;
      iVar2 = iVar2 + 1;
      pfVar5 = pfVar5 + 8;
    } while (iVar2 < (int)param_1);
  }
  local_5c[iVar2 + 3] = local_5c[3];
  local_28[iVar2] = local_28[0];
  if (local_5c[0] == 0) {
    return 0;
  }
  if (local_5c[1] == 0) {
    for (iVar2 = (param_1 & 0x7ffffff) << 3; iVar2 != 0; iVar2 = iVar2 + -1) {
      *param_3 = *param_2;
      param_2 = param_2 + 1;
      param_3 = param_3 + 1;
    }
    for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
      *(undefined1 *)param_3 = *(undefined1 *)param_2;
      param_2 = (undefined4 *)((int)param_2 + 1);
      param_3 = (undefined4 *)((int)param_3 + 1);
    }
    return param_1;
  }
  iVar2 = 0;
  local_64 = 0;
  if (0 < (int)param_1) {
    do {
      iVar3 = local_5c[iVar2 + 3];
      if (iVar3 == 2) {
        puVar6 = param_2;
        puVar7 = param_3;
        for (iVar3 = 8; iVar3 != 0; iVar3 = iVar3 + -1) {
          *puVar7 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar7 = puVar7 + 1;
        }
LAB_100153bb:
        local_64 = local_64 + 1;
        param_3 = param_3 + 8;
      }
      else {
        if (iVar3 == 0) {
          puVar6 = param_2;
          puVar7 = param_3;
          for (iVar4 = 8; iVar4 != 0; iVar4 = iVar4 + -1) {
            *puVar7 = *puVar6;
            puVar6 = puVar6 + 1;
            puVar7 = puVar7 + 1;
          }
          local_64 = local_64 + 1;
          param_3 = param_3 + 8;
        }
        if ((local_5c[iVar2 + 4] != 2) && (local_5c[iVar2 + 4] != iVar3)) {
          FUN_100151e0(local_28[iVar2] / (local_28[iVar2] - local_28[iVar2 + 1]));
          goto LAB_100153bb;
        }
      }
      iVar2 = iVar2 + 1;
      param_2 = param_2 + 8;
    } while (iVar2 < (int)param_1);
  }
  return local_64;
}


