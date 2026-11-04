// 100c74f0 size=413 FUN_100c74f0

int FUN_100c74f0(void)

{
  int iVar1;
  float fVar2;
  bool bVar3;
  uint *puVar4;
  int *piVar5;
  int iVar6;
  int in_ECX;
  uint uVar7;
  int *piVar8;
  uint *local_14;
  int *local_10;
  uint local_c;
  
  *(undefined4 *)(in_ECX + 0x15c) = 0;
  puVar4 = *(uint **)(in_ECX + 0x100);
  if ((*puVar4 & 0xfff00000) != 0x20400000) {
    return 1;
  }
  uVar7 = *puVar4 & 0xfffff;
  bVar3 = true;
  if (uVar7 != 0) {
    piVar5 = (int *)puVar4[2];
    piVar8 = piVar5 + uVar7;
    local_c = uVar7;
    do {
      if (*piVar5 != *piVar8) {
        bVar3 = false;
      }
      piVar8 = piVar8 + 1;
      piVar5 = piVar5 + 1;
      local_c = local_c - 1;
    } while (local_c != 0);
    if (!bVar3) {
      fVar2 = -0.5;
      goto LAB_100c7581;
    }
  }
  puVar4 = (uint *)FUN_100c37fb(uVar7 | 0x20400000,puVar4,0,2,1);
  fVar2 = -1.0;
  local_14 = puVar4;
  if (puVar4 == (uint *)0x0) {
    return 1;
  }
LAB_100c7581:
  local_10 = (int *)puVar4[2];
  iVar6 = *(int *)(in_ECX + 0x14);
  local_c = *puVar4 & 0xfffff;
  piVar8 = local_10 + local_c;
  piVar5 = piVar8;
  if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*(int *)(iVar6 + *piVar8 * 4) + 4) * 4
                          ) + 5) & 1) == 0) &&
     (iVar1 = *local_10, piVar5 = local_10, local_10 = piVar8,
     (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*(int *)(iVar6 + iVar1 * 4) + 4) * 4) +
               5) & 1) == 0)) {
    return 1;
  }
  uVar7 = 0;
  if (local_c != 0) {
    do {
      if ((float)*(double *)(*(int *)(iVar6 + piVar5[uVar7] * 4) + 0x20) != fVar2) {
        return 1;
      }
      uVar7 = uVar7 + 1;
    } while (uVar7 < local_c);
  }
  if (bVar3) {
    local_10 = *(int **)(*(int *)(in_ECX + 0x100) + 8);
  }
  else {
    local_14 = (uint *)FUN_100c37fb(**(uint **)(in_ECX + 0x100) & 0xfffff | 0x20400000,
                                    *(uint **)(in_ECX + 0x100),0,2,2);
    if (local_14 == (uint *)0x0) {
      return 1;
    }
    bVar3 = true;
    if (local_c != 0) {
      piVar5 = (int *)local_14[2];
      piVar8 = piVar5 + local_c;
      do {
        if (*piVar5 != *piVar8) {
          bVar3 = false;
        }
        piVar8 = piVar8 + 1;
        piVar5 = piVar5 + 1;
        local_c = local_c - 1;
      } while (local_c != 0);
      if (!bVar3) {
        return 1;
      }
    }
  }
  iVar6 = FUN_100c5bcc(0x60000,0,local_10,0x60000,local_14,0);
  if (iVar6 == 0) {
    *local_14 = 0;
    return 0;
  }
  return iVar6;
}


