// 100c48ff size=278 FUN_100c48ff

undefined4 FUN_100c48ff(int *param_1,uint param_2,uint param_3,uint *param_4)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  uint uVar5;
  uint *puVar6;
  int in_ECX;
  uint uVar7;
  uint uVar8;
  bool bVar9;
  uint local_28 [4];
  int local_18 [4];
  int local_8;
  
  iVar3 = *param_1;
  iVar4 = *(int *)(in_ECX + 0x14);
  local_8 = *(int *)(iVar4 + iVar3 * 4);
  if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_8 + 4) * 4) + 4) & 0x80) != 0) {
    *param_4 = 0xe40000;
    return 0;
  }
  bVar9 = (param_3 & 0x10000) != 0;
  if (bVar9) {
    local_18[0] = 0;
  }
  uVar7 = (uint)bVar9;
  if ((param_3 & 0x20000) != 0) {
    local_18[uVar7] = 1;
    uVar7 = uVar7 + 1;
  }
  if ((param_3 & 0x40000) != 0) {
    local_18[uVar7] = 2;
    uVar7 = uVar7 + 1;
  }
  if ((param_3 & 0x80000) != 0) {
    local_18[uVar7] = 3;
    uVar7 = uVar7 + 1;
  }
  if (uVar7 < param_2) {
    param_2 = uVar7;
  }
  uVar7 = 0;
  if (param_2 != 0) {
    do {
      if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4) + 0x10) !=
          *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1[uVar7] * 4) + 0x10)) break;
      uVar7 = uVar7 + 1;
    } while (uVar7 < param_2);
    if (uVar7 < param_2) {
      uVar7 = 0;
      do {
        local_28[uVar7] = uVar7;
        uVar7 = uVar7 + 1;
      } while (uVar7 < 4);
      goto LAB_100c49c7;
    }
  }
  local_28[0] = *(uint *)(local_8 + 0x10);
  local_28[1] = local_28[0];
  local_28[2] = local_28[0];
  local_28[3] = local_28[0];
LAB_100c49c7:
  uVar7 = 0;
  if (param_2 != 0) {
    do {
      piVar2 = local_18 + uVar7;
      piVar1 = param_1 + uVar7;
      uVar7 = uVar7 + 1;
      local_28[*piVar2] = *(uint *)(*(int *)(iVar4 + *piVar1 * 4) + 0x10);
    } while (uVar7 < param_2);
  }
  uVar8 = 0;
  uVar7 = 0x10;
  puVar6 = local_28;
  do {
    uVar5 = *puVar6;
    puVar6 = puVar6 + 1;
    uVar8 = uVar8 | uVar5 << ((byte)uVar7 & 0x1f);
    uVar7 = uVar7 + 2;
  } while (uVar7 < 0x18);
  *param_4 = uVar8;
  return 0;
}


