// 100c6e69 size=765 FUN_100c6e69

int FUN_100c6e69(void)

{
  byte *pbVar1;
  int iVar2;
  int iVar3;
  uint uVar4;
  int *piVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int in_ECX;
  int *piVar9;
  uint auStack_30 [4];
  int local_20 [4];
  int *local_10;
  uint local_c;
  int *local_8;
  
  uVar4 = **(uint **)(in_ECX + 0x100);
  if ((uVar4 & 0xfff00000) != 0x20400000) {
    return 1;
  }
  uVar4 = uVar4 & 0xfffff;
  piVar9 = (int *)(*(uint **)(in_ECX + 0x100))[2];
  local_8 = piVar9 + uVar4;
  iVar6 = *(int *)(in_ECX + 0x14);
  if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(*(int *)(iVar6 + *local_8 * 4) + 4) * 4
                         ) + 5) & 1) == 0) {
    if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                           *(int *)(*(int *)(iVar6 + *piVar9 * 4) + 4) * 4) + 5) & 1) == 0) {
      return 1;
    }
    local_20[3] = 1;
    piVar5 = piVar9;
  }
  else {
    local_20[3] = 0;
    piVar5 = local_8;
    local_8 = piVar9;
  }
  *(undefined4 *)(in_ECX + 0x15c) = 0;
  local_10 = (int *)0x0;
  if (uVar4 != 0) {
    piVar9 = local_8;
    do {
      if (*(double *)
           (*(int *)(iVar6 + *(int *)(((int)piVar5 - (int)local_8) + (int)piVar9) * 4) + 0x20) !=
          -0.5) {
        return 1;
      }
      pbVar1 = *(byte **)(iVar6 + *piVar9 * 4);
      if ((((pbVar1[0x3d] & 2) == 0) && ((*pbVar1 & 4) == 0)) &&
         ((*(byte *)(in_ECX + 0x6e) & 4) != 0)) {
        *(undefined4 *)(in_ECX + 0x15c) = 1;
      }
      local_10 = (int *)((int)local_10 + 1);
      piVar9 = piVar9 + 1;
    } while (local_10 < uVar4);
  }
  iVar7 = *(int *)(*(int *)(iVar6 + **(int **)(*(int *)(in_ECX + 0x100) + 0x10) * 4) + 4);
  local_c = uVar4;
  if (iVar7 == *(int *)(in_ECX + 0x88)) {
    iVar6 = FUN_100c5bcc(0x20000,0,local_8,0x20000,0,0);
    if (*(int *)(in_ECX + 0x15c) == 2) {
      FUN_1008b13a();
      return iVar6;
    }
    return iVar6;
  }
  if (iVar7 == *(int *)(in_ECX + 0x84)) {
    iVar7 = FUN_100c3a56(uVar4 | 0x20400000,*(int *)(in_ECX + 0x100),local_20,2);
    if (iVar7 != 0) {
      return iVar7;
    }
    local_10 = local_20 + local_20[3];
    if (*local_10 != 0) {
      local_8 = (int *)0x0;
      if (uVar4 != 0) {
        piVar9 = *(int **)(*local_10 + 8);
        do {
          pbVar1 = *(byte **)(iVar6 + *piVar9 * 4);
          if ((((pbVar1[0x3e] & 0x1f) != 0) ||
              (uVar4 = local_c,
              (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(pbVar1 + 4) * 4) + 4) & 0x200)
              != 0)) || (((*(uint *)(pbVar1 + 0x3c) & 0x200) == 0 && ((*pbVar1 & 4) == 0)))) break;
          local_20[3] = 0;
          local_8 = (int *)((int)local_8 + 1);
          piVar9 = piVar9 + 1;
        } while (local_8 < local_c);
      }
      uVar8 = local_20[3];
      if (local_8 != (int *)uVar4) {
        local_8 = (int *)0x0;
        uVar8 = uVar4;
        if (uVar4 != 0) {
          piVar9 = (int *)(*(int *)(*local_10 + 8) + uVar4 * 4);
          do {
            pbVar1 = *(byte **)(iVar6 + *piVar9 * 4);
            uVar8 = uVar4;
            if ((((pbVar1[0x3e] & 0x1f) != 0) ||
                (uVar8 = local_c,
                (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(pbVar1 + 4) * 4) + 4) & 0x200
                ) != 0)) || (((*(uint *)(pbVar1 + 0x3c) & 0x200) == 0 && ((*pbVar1 & 4) == 0))))
            break;
            local_8 = (int *)((int)local_8 + 1);
            piVar9 = piVar9 + 1;
            uVar4 = local_c;
          } while (local_8 < local_c);
        }
        uVar4 = uVar8;
        if (local_8 == (int *)uVar8) {
          return 1;
        }
      }
      local_8 = (int *)0x0;
      if (uVar4 != 0) {
        iVar6 = uVar8 << 2;
        do {
          iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar6 + *(int *)(*local_10 + 8)) * 4);
          uVar4 = FUN_10086139(*(undefined4 *)(iVar7 + 4),*(undefined4 *)(iVar7 + 0xc),
                               *(undefined4 *)(iVar7 + 0x10),*(undefined8 *)(iVar7 + 0x20));
          local_20[3] = uVar4;
          auStack_30[(int)local_8] = uVar4;
          if (uVar4 == 0xffffffff) {
            return -0x7ff8fff2;
          }
          iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + uVar4 * 4);
          iVar3 = *local_10;
          *(undefined4 *)(iVar2 + 0x38) = *(undefined4 *)(iVar6 + *(int *)(iVar3 + 8));
          *(undefined4 *)(iVar2 + 0x48) = *(undefined4 *)(iVar7 + 0x48);
          *(undefined4 *)(iVar2 + 0x50) = *(undefined4 *)(iVar7 + 0x50);
          *(undefined4 *)(iVar2 + 0x54) = *(undefined4 *)(iVar7 + 0x54);
          *(undefined4 *)(iVar2 + 0x58) = *(undefined4 *)(iVar7 + 0x54);
          *(uint *)(iVar2 + 0x3c) = *(uint *)(iVar7 + 0x3c) | 0x20000;
          *(int *)(iVar6 + *(int *)(iVar3 + 8)) = local_20[3];
          *(undefined4 *)(*(int *)(iVar3 + 0x10) + (int)local_8 * 4) =
               *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x100) + 0x10) + (int)local_8 * 4);
          local_8 = (int *)((int)local_8 + 1);
          iVar6 = iVar6 + 4;
        } while (local_8 < local_c);
      }
      **(undefined4 **)(in_ECX + 0x100) = 0;
      return 0;
    }
  }
  return 1;
}


