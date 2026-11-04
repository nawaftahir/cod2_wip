// 100b4e8f size=392 FUN_100b4e8f

undefined4 FUN_100b4e8f(int *param_1,undefined4 *param_2,uint param_3,uint *param_4)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  uint uVar4;
  int iVar5;
  uint *puVar6;
  int in_ECX;
  uint uVar7;
  int iVar8;
  uint uVar9;
  bool bVar10;
  uint local_28 [4];
  int local_18 [4];
  int local_8;
  
  iVar5 = *param_1;
  iVar3 = *(int *)(in_ECX + 0x14);
  local_8 = *(int *)(iVar3 + iVar5 * 4);
  if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_8 + 4) * 4) + 4) & 0x80) != 0) {
    *param_4 = 0xe40000;
    return 0;
  }
  bVar10 = (param_3 & 0x10000) != 0;
  if (bVar10) {
    local_18[0] = 0;
  }
  uVar7 = (uint)bVar10;
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
    param_2 = (undefined4 *)uVar7;
  }
  iVar8 = *(int *)(in_ECX + 0x6c) << 0x1e;
  if (iVar8 < 0) {
    local_28[0] = 0xffffffff;
  }
  else {
    uVar7 = 0;
    if (param_2 != (undefined4 *)0x0) {
      do {
        if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4) + 0x10) !=
            *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_1[uVar7] * 4) + 0x10)) break;
        uVar7 = uVar7 + 1;
      } while (uVar7 < param_2);
      if (uVar7 < param_2) {
        uVar7 = 0;
        do {
          local_28[uVar7] = uVar7;
          uVar7 = uVar7 + 1;
        } while (uVar7 < 4);
        goto LAB_100b4f6e;
      }
    }
    local_28[0] = *(uint *)(local_8 + 0x10);
  }
  local_28[1] = local_28[0];
  local_28[2] = local_28[0];
  local_28[3] = local_28[0];
LAB_100b4f6e:
  uVar7 = 0;
  if (param_2 != (undefined4 *)0x0) {
    do {
      piVar2 = local_18 + uVar7;
      piVar1 = param_1 + uVar7;
      uVar7 = uVar7 + 1;
      local_28[*piVar2] = *(uint *)(*(int *)(iVar3 + *piVar1 * 4) + 0x10);
    } while (uVar7 < param_2);
  }
  uVar7 = 0;
  if (-1 < iVar8) {
    puVar6 = local_28;
LAB_100b4ff4:
    uVar9 = 0;
    uVar7 = 0x10;
    do {
      uVar4 = *puVar6;
      puVar6 = puVar6 + 1;
      uVar9 = uVar9 | uVar4 << ((byte)uVar7 & 0x1f);
      uVar7 = uVar7 + 2;
    } while (uVar7 < 0x18);
    *param_4 = uVar9;
    return 0;
  }
  param_2 = &DAT_101a4218;
  do {
    iVar5 = FUN_100b3f18(local_28,param_2);
    if (iVar5 != 0) {
      puVar6 = &DAT_101a4218 + uVar7 * 4;
      if (puVar6 != (uint *)0x0) goto LAB_100b4ff4;
      break;
    }
    param_2 = param_2 + 4;
    uVar7 = uVar7 + 1;
  } while (uVar7 < 8);
  FUN_1008b0b5();
  return 0x80004005;
}


