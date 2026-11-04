// 10057a40 size=648 FUN_10057a40

void FUN_10057a40(int param_1,undefined4 *param_2)

{
  float fVar1;
  undefined4 uVar2;
  undefined4 uVar3;
  int in_ECX;
  float *pfVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int local_18;
  int local_14;
  int local_8;
  int local_4;
  
  iVar6 = 0;
  iVar7 = 1;
  local_18 = 0;
  local_14 = 1;
  iVar10 = 0;
  if (3 < param_1 + -1) {
    iVar5 = 0;
    iVar8 = 3;
    pfVar4 = (float *)(in_ECX + 0x14);
    iVar9 = 0;
    do {
      fVar1 = *(float *)(iVar5 + 4 + in_ECX);
      if (fVar1 < pfVar4[-2] == (fVar1 == pfVar4[-2])) {
        if (pfVar4[-2] < *(float *)(iVar9 + 4 + in_ECX)) {
          iVar9 = (-0xc - in_ECX) + (int)pfVar4;
          iVar6 = local_14;
        }
      }
      else {
        local_18 = local_14;
        iVar5 = (-0xc - in_ECX) + (int)pfVar4;
      }
      fVar1 = *(float *)(iVar5 + 4 + in_ECX);
      if (fVar1 < *pfVar4 == (fVar1 == *pfVar4)) {
        if (*pfVar4 < *(float *)(iVar9 + 4 + in_ECX)) {
          iVar6 = iVar8 + -1;
          iVar9 = (-4 - in_ECX) + (int)pfVar4;
        }
      }
      else {
        local_18 = iVar8 + -1;
        iVar5 = (-4 - in_ECX) + (int)pfVar4;
      }
      fVar1 = *(float *)(iVar5 + 4 + in_ECX);
      if (fVar1 < pfVar4[2] == (fVar1 == pfVar4[2])) {
        if (pfVar4[2] < *(float *)(iVar9 + 4 + in_ECX)) {
          iVar9 = (4 - in_ECX) + (int)pfVar4;
          iVar6 = iVar8;
        }
      }
      else {
        iVar5 = (4 - in_ECX) + (int)pfVar4;
        local_18 = iVar8;
      }
      fVar1 = *(float *)(iVar5 + 4 + in_ECX);
      if (fVar1 < pfVar4[4] == (fVar1 == pfVar4[4])) {
        if (pfVar4[4] < *(float *)(iVar9 + 4 + in_ECX)) {
          iVar6 = iVar8 + 1;
          iVar9 = (0xc - in_ECX) + (int)pfVar4;
        }
      }
      else {
        local_18 = iVar8 + 1;
        iVar5 = (0xc - in_ECX) + (int)pfVar4;
      }
      iVar7 = local_14 + 4;
      iVar8 = iVar8 + 4;
      pfVar4 = pfVar4 + 8;
      iVar10 = local_18;
      local_14 = iVar7;
    } while (iVar7 < param_1 + -3);
  }
  if (iVar7 < param_1) {
    local_8 = iVar6 * 8;
    iVar5 = iVar7 * 8;
    local_4 = iVar10 * 8;
    pfVar4 = (float *)(iVar5 + 4 + in_ECX);
    iVar9 = iVar10;
    do {
      fVar1 = *(float *)(local_4 + 4 + in_ECX);
      iVar10 = iVar7;
      iVar8 = iVar5;
      if ((fVar1 < *pfVar4 == (fVar1 == *pfVar4)) &&
         (iVar10 = iVar9, iVar8 = local_4, *pfVar4 < *(float *)(local_8 + 4 + in_ECX))) {
        iVar6 = iVar7;
        local_8 = iVar5;
      }
      local_4 = iVar8;
      iVar7 = iVar7 + 1;
      iVar5 = iVar5 + 8;
      pfVar4 = pfVar4 + 2;
      iVar9 = iVar10;
    } while (iVar7 < param_1);
  }
  *param_2 = *(undefined4 *)(in_ECX + iVar6 * 8);
  param_2[1] = *(undefined4 *)(in_ECX + 4 + iVar6 * 8);
  param_2[2] = *(undefined4 *)(in_ECX + iVar10 * 8);
  param_2[3] = *(undefined4 *)(in_ECX + 4 + iVar10 * 8);
  iVar7 = param_1 + -1;
  if (iVar10 < iVar6) {
    if (iVar6 != iVar7) {
      uVar2 = *(undefined4 *)(in_ECX + iVar6 * 8);
      uVar3 = *(undefined4 *)(in_ECX + 4 + iVar6 * 8);
      *(undefined4 *)(in_ECX + iVar6 * 8) = *(undefined4 *)(in_ECX + iVar7 * 8);
      *(undefined4 *)(in_ECX + 4 + iVar6 * 8) = *(undefined4 *)(in_ECX + 4 + iVar7 * 8);
      *(undefined4 *)(in_ECX + iVar7 * 8) = uVar2;
      *(undefined4 *)(in_ECX + 4 + iVar7 * 8) = uVar3;
    }
    param_1 = param_1 + -2;
    if (iVar10 != param_1) {
      uVar2 = *(undefined4 *)(in_ECX + iVar10 * 8);
      uVar3 = *(undefined4 *)(in_ECX + 4 + iVar10 * 8);
      *(undefined4 *)(in_ECX + iVar10 * 8) = *(undefined4 *)(in_ECX + param_1 * 8);
      *(undefined4 *)(in_ECX + 4 + iVar10 * 8) = *(undefined4 *)(in_ECX + 4 + param_1 * 8);
      *(undefined4 *)(in_ECX + param_1 * 8) = uVar2;
      *(undefined4 *)(in_ECX + 4 + param_1 * 8) = uVar3;
      return;
    }
  }
  else {
    if (iVar10 != iVar7) {
      uVar2 = *(undefined4 *)(in_ECX + iVar10 * 8);
      uVar3 = *(undefined4 *)(in_ECX + 4 + iVar10 * 8);
      *(undefined4 *)(in_ECX + iVar10 * 8) = *(undefined4 *)(in_ECX + iVar7 * 8);
      *(undefined4 *)(in_ECX + 4 + iVar10 * 8) = *(undefined4 *)(in_ECX + 4 + iVar7 * 8);
      *(undefined4 *)(in_ECX + iVar7 * 8) = uVar2;
      *(undefined4 *)(in_ECX + 4 + iVar7 * 8) = uVar3;
    }
    param_1 = param_1 + -2;
    if (iVar6 != param_1) {
      uVar2 = *(undefined4 *)(in_ECX + iVar6 * 8);
      uVar3 = *(undefined4 *)(in_ECX + 4 + iVar6 * 8);
      *(undefined4 *)(in_ECX + iVar6 * 8) = *(undefined4 *)(in_ECX + param_1 * 8);
      *(undefined4 *)(in_ECX + 4 + iVar6 * 8) = *(undefined4 *)(in_ECX + 4 + param_1 * 8);
      *(undefined4 *)(in_ECX + param_1 * 8) = uVar2;
      *(undefined4 *)(in_ECX + 4 + param_1 * 8) = uVar3;
    }
  }
  return;
}


