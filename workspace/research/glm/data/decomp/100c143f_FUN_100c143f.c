// 100c143f size=306 FUN_100c143f

undefined4 FUN_100c143f(void)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int in_ECX;
  undefined4 *puVar9;
  undefined4 *puVar10;
  int *local_14;
  uint local_c;
  int local_8;
  
  uVar8 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_c = 0;
  if (uVar8 != 0) {
    iVar1 = *(int *)(in_ECX + 0x14);
    iVar2 = *(int *)(*(int *)(in_ECX + 0x100) + 8);
    local_8 = uVar8 << 3;
    local_14 = (int *)(iVar2 + uVar8 * 4);
    do {
      iVar3 = *(int *)(iVar2 + local_c * 4);
      iVar4 = *(int *)(iVar1 + iVar3 * 4);
      iVar5 = *(int *)(iVar1 + *local_14 * 4);
      iVar6 = *(int *)(iVar1 + *(int *)(local_8 + iVar2) * 4);
      if (iVar3 != *local_14) {
        return 1;
      }
      iVar3 = *(int *)(local_8 + *(int *)(*(int *)(in_ECX + 0x100) + 8));
      iVar7 = *(int *)(iVar5 + 0x38);
      if (iVar7 != iVar3) {
        if (iVar7 == -1) {
          return 1;
        }
        if (iVar7 != *(int *)(iVar6 + 0x38)) {
          return 1;
        }
      }
      if ((*(uint *)(iVar5 + 0x3c) ^ 0x80000) != *(uint *)(iVar6 + 0x3c)) {
        return 1;
      }
      iVar5 = *(int *)(iVar4 + 0x38);
      if (iVar5 != iVar3) {
        if (iVar5 == -1) {
          return 1;
        }
        if (iVar5 != *(int *)(iVar6 + 0x38)) {
          return 1;
        }
      }
      if ((*(uint *)(iVar4 + 0x3c) ^ 0x80000) != *(uint *)(iVar6 + 0x3c)) {
        return 1;
      }
      local_c = local_c + 1;
      local_14 = local_14 + 1;
      local_8 = local_8 + 4;
    } while (local_c < uVar8);
  }
  **(uint **)(in_ECX + 0x100) = uVar8 | 0x70000000;
  *(uint *)(*(int *)(in_ECX + 0x100) + 4) = uVar8;
  puVar10 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 8);
  puVar9 = puVar10 + uVar8 * 2;
  for (; uVar8 != 0; uVar8 = uVar8 - 1) {
    *puVar10 = *puVar9;
    puVar9 = puVar9 + 1;
    puVar10 = puVar10 + 1;
  }
  return 0;
}


