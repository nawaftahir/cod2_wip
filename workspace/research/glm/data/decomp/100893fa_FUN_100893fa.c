// 100893fa size=360 FUN_100893fa

undefined4 FUN_100893fa(uint param_1)

{
  uint uVar1;
  int iVar2;
  int *piVar3;
  undefined4 uVar4;
  int in_ECX;
  int iVar5;
  undefined4 *puVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int local_14;
  uint local_10;
  int *local_8;
  
  iVar7 = param_1 * 4;
  piVar3 = (int *)(*(int *)(in_ECX + 0x18) + iVar7);
  iVar9 = *piVar3;
  uVar1 = *(uint *)(iVar9 + 0x2c);
  iVar2 = param_1;
  if ((uVar1 & 1) == 0) {
    return 0;
  }
  while ((iVar2 != 0 && (piVar3 = piVar3 + -1, uVar1 < *(uint *)(*piVar3 + 0x2c)))) {
    iVar2 = iVar2 + -1;
  }
  local_10 = param_1 - iVar2 >> 1;
  if (local_10 != 0) {
    iVar5 = iVar2 << 2;
    iVar8 = iVar7;
    do {
      puVar6 = (undefined4 *)(iVar5 + *(int *)(in_ECX + 0x18));
      uVar4 = *puVar6;
      *puVar6 = *(undefined4 *)(iVar8 + -4 + *(int *)(in_ECX + 0x18));
      *(undefined4 *)(iVar8 + -4 + *(int *)(in_ECX + 0x18)) = uVar4;
      iVar5 = iVar5 + 4;
      iVar8 = iVar8 + -4;
      local_10 = local_10 - 1;
    } while (local_10 != 0);
  }
  local_14 = iVar2;
  if (iVar2 != 0) {
    uVar1 = *(uint *)(iVar9 + 0x2c);
    local_8 = (int *)(*(int *)(in_ECX + 0x18) + -4 + iVar2 * 4);
    if (*(uint *)(*local_8 + 0x2c) < uVar1) {
      local_14 = iVar2 + -1;
      goto LAB_10089509;
    }
    do {
      if (uVar1 != *(uint *)(*local_8 + 0x2c)) break;
      local_8 = local_8 + -1;
      local_14 = local_14 + -1;
    } while (local_14 != 0);
  }
  local_8 = (int *)((uint)(iVar2 - local_14) >> 1);
  if (local_8 != (int *)0x0) {
    iVar8 = local_14 << 2;
    iVar9 = iVar2 << 2;
    do {
      puVar6 = (undefined4 *)(iVar8 + *(int *)(in_ECX + 0x18));
      uVar4 = *puVar6;
      *puVar6 = *(undefined4 *)(iVar9 + -4 + *(int *)(in_ECX + 0x18));
      *(undefined4 *)(iVar9 + -4 + *(int *)(in_ECX + 0x18)) = uVar4;
      iVar8 = iVar8 + 4;
      iVar9 = iVar9 + -4;
      local_8 = (int *)((int)local_8 - 1);
    } while (local_8 != (int *)0x0);
  }
LAB_10089509:
  if (local_14 == iVar2) {
    uVar4 = 0;
  }
  else {
    param_1 = param_1 - local_14 >> 1;
    if (param_1 != 0) {
      local_14 = local_14 << 2;
      iVar9 = iVar7;
      do {
        puVar6 = (undefined4 *)(local_14 + *(int *)(in_ECX + 0x18));
        uVar4 = *puVar6;
        *puVar6 = *(undefined4 *)(iVar9 + -4 + *(int *)(in_ECX + 0x18));
        *(undefined4 *)(iVar9 + -4 + *(int *)(in_ECX + 0x18)) = uVar4;
        local_14 = local_14 + 4;
        iVar9 = iVar9 + -4;
        param_1 = param_1 - 1;
      } while (param_1 != 0);
    }
    puVar6 = (undefined4 *)(*(int *)(in_ECX + 0x18) + iVar7);
    uVar4 = puVar6[-1];
    puVar6[-1] = *puVar6;
    *(undefined4 *)(iVar7 + *(int *)(in_ECX + 0x18)) = uVar4;
    uVar4 = 1;
  }
  return uVar4;
}


