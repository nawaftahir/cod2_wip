// 1008661b size=573 FUN_1008661b

uint FUN_1008661b(uint param_1,uint param_2,uint param_3)

{
  uint uVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  uint local_10;
  uint local_c;
  uint local_8;
  
  iVar2 = param_3;
  iVar5 = *(int *)(*(int *)(param_3 + 0x18) + param_1 * 4);
  iVar8 = *(int *)(*(int *)(param_3 + 0x18) + param_2 * 4);
  iVar6 = *(int *)(iVar8 + 0x34);
  iVar7 = *(int *)(iVar5 + 0x34);
  local_c = 0;
  param_3 = 0;
  iVar4 = iVar6;
  uVar1 = param_3;
  if (iVar7 != -1) {
    iVar3 = iVar7;
    do {
      iVar3 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar3 * 4) + 0x14);
      local_c = local_c + 1;
    } while (iVar3 != -1);
  }
  for (; iVar4 != -1; iVar4 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar4 * 4) + 0x14)) {
    uVar1 = uVar1 + 1;
  }
  uVar9 = local_c;
  if (uVar1 < local_c) {
    iVar4 = local_c - uVar1;
    do {
      iVar7 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar7 * 4) + 0x14);
      uVar9 = uVar9 - 1;
      iVar4 = iVar4 + -1;
    } while (iVar4 != 0);
  }
  param_3 = uVar1;
  if (uVar9 < uVar1) {
    iVar4 = uVar1 - uVar9;
    do {
      param_3 = param_3 - 1;
      iVar4 = iVar4 + -1;
      iVar6 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar6 * 4) + 0x14);
    } while (iVar4 != 0);
  }
  if (iVar7 != iVar6) {
    do {
      iVar7 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar7 * 4) + 0x14);
      iVar6 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar6 * 4) + 0x14);
      uVar9 = uVar9 - 1;
      param_3 = param_3 - 1;
    } while (iVar7 != iVar6);
  }
  iVar7 = *(int *)(iVar5 + 0x34);
  iVar6 = *(int *)(iVar8 + 0x34);
  local_8 = param_1;
  local_10 = param_1;
  if (uVar9 < local_c) {
    local_c = local_c - uVar9;
    do {
      iVar7 = *(int *)(*(int *)(iVar2 + 0x14) + iVar7 * 4);
      if (*(uint *)(iVar7 + 0x48) < local_8) {
        local_8 = *(uint *)(iVar7 + 0x48);
      }
      if (local_10 < *(uint *)(iVar7 + 0x58)) {
        local_10 = *(uint *)(iVar7 + 0x58);
      }
      local_c = local_c + -1;
      iVar7 = *(int *)(iVar7 + 0x14);
    } while (local_c != 0);
  }
  local_c = param_2;
  uVar9 = param_2;
  if (param_3 < uVar1) {
    param_3 = uVar1 - param_3;
    do {
      iVar7 = *(int *)(*(int *)(iVar2 + 0x14) + iVar6 * 4);
      if (*(uint *)(iVar7 + 0x48) < uVar9) {
        uVar9 = *(uint *)(iVar7 + 0x48);
      }
      if (local_c < *(uint *)(iVar7 + 0x58)) {
        local_c = *(uint *)(iVar7 + 0x58);
      }
      param_3 = param_3 + -1;
      iVar6 = *(int *)(iVar7 + 0x14);
    } while (param_3 != 0);
  }
  if (((uVar9 <= param_1) && (param_1 <= local_c)) ||
     ((local_8 <= param_2 && (param_2 <= local_10)))) {
    if (local_8 < uVar9) {
      return 1;
    }
    if (uVar9 < local_8) {
      return 0xffffffff;
    }
  }
  iVar5 = *(int *)(*(int *)(iVar2 + 0x14) + **(int **)(iVar5 + 0x10) * 4);
  iVar8 = *(int *)(*(int *)(iVar2 + 0x14) + **(int **)(iVar8 + 0x10) * 4);
  iVar6 = *(int *)(iVar8 + 0x18);
  iVar7 = *(int *)(iVar5 + 0x18);
  iVar4 = *(int *)(iVar5 + 0x14);
  local_10 = 0;
  param_3 = 0;
  iVar8 = *(int *)(iVar8 + 0x14);
  for (iVar5 = iVar4; iVar3 = iVar8, iVar5 != -1;
      iVar5 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar5 * 4) + 0x14)) {
    local_10 = local_10 + 1;
  }
  for (; iVar3 != -1; iVar3 = *(int *)(*(int *)(*(int *)(iVar2 + 0x14) + iVar3 * 4) + 0x14)) {
    param_3 = param_3 + 1;
  }
  if (param_3 < local_10) {
    iVar5 = local_10 - param_3;
    do {
      iVar4 = *(int *)(*(int *)(iVar2 + 0x14) + iVar4 * 4);
      iVar7 = *(int *)(iVar4 + 0x18);
      iVar4 = *(int *)(iVar4 + 0x14);
      local_10 = local_10 - 1;
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
  }
  if (local_10 < param_3) {
    iVar5 = param_3 - local_10;
    do {
      iVar5 = iVar5 + -1;
      iVar8 = *(int *)(*(int *)(iVar2 + 0x14) + iVar8 * 4);
      iVar6 = *(int *)(iVar8 + 0x18);
      iVar8 = *(int *)(iVar8 + 0x14);
    } while (iVar5 != 0);
  }
  if (iVar4 != iVar8) {
    do {
      iVar5 = *(int *)(*(int *)(iVar2 + 0x14) + iVar4 * 4);
      iVar8 = *(int *)(*(int *)(iVar2 + 0x14) + iVar8 * 4);
      iVar7 = *(int *)(iVar5 + 0x18);
      iVar6 = *(int *)(iVar8 + 0x18);
      iVar4 = *(int *)(iVar5 + 0x14);
      iVar8 = *(int *)(iVar8 + 0x14);
    } while (iVar4 != iVar8);
  }
  if (iVar7 == 0) {
    if (iVar6 != 0) {
      return 1;
    }
  }
  else if (iVar6 == 0) {
    return 0xffffffff;
  }
  if (param_1 < param_2) {
    return 0xffffffff;
  }
  return (uint)(param_2 < param_1);
}


