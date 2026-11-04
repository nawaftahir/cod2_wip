// 100a88e8 size=1467 FUN_100a88e8

/* WARNING: Type propagation algorithm not settling */

int FUN_100a88e8(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  int iVar7;
  int *in_ECX;
  uint uVar8;
  int *piVar9;
  int *piVar10;
  undefined4 uVar11;
  int local_ac [12];
  int local_7c [9];
  int iStack_58;
  int iStack_54;
  int iStack_50;
  int local_4c [9];
  int *local_28;
  int *local_24;
  int *local_20;
  int *local_1c;
  int *local_18;
  int *local_14;
  int *local_10;
  int *local_c;
  int *local_8;
  
  puVar1 = *(uint **)((int)in_ECX + 0x100);
  uVar8 = *puVar1;
  local_1c = (int *)(uVar8 & 0xfffff);
  if ((puVar1 == (uint *)0x0) || (uVar8 == 0)) {
    return 0;
  }
  local_c = (int *)(puVar1[1] / (uint)local_1c);
  local_18 = (int *)0x0;
  if (((uVar8 & 0xfff00000) == 0x50000000) || ((int *)puVar1[3] != local_1c)) {
    iVar6 = FUN_10086292(puVar1);
    if (-1 < iVar6) {
      **(undefined4 **)((int)in_ECX + 0x100) = 0;
      return 0;
    }
    return iVar6;
  }
  local_4c[8] = 0;
  local_20 = in_ECX;
  if ((((*(uint *)((int)in_ECX + 200) & 0xffff) != 0x104) &&
      (iVar6 = FUN_100a7f23(puVar1), iVar6 != 0)) && (uVar8 = puVar1[3], uVar8 != 0)) {
    piVar9 = (int *)puVar1[4];
    do {
      if (*(int *)(*(int *)(*(int *)((int)in_ECX + 0x14) + *piVar9 * 4) + 0x10) == 3) {
        local_18 = (int *)0x1;
        local_4c[8] = 1;
      }
      piVar9 = piVar9 + 1;
      uVar8 = uVar8 - 1;
    } while (uVar8 != 0);
  }
  local_14 = (int *)0x0;
  if (local_c != (int *)0x0) {
    local_24 = (int *)0x0;
    local_8 = local_ac;
    do {
      piVar10 = local_8;
      piVar9 = local_8 + 1;
      *local_8 = -1;
      local_10 = (int *)0x0;
      *piVar9 = -1;
      piVar10[2] = -1;
      piVar10[3] = -1;
      local_7c[0] = -1;
      local_7c[1] = -1;
      local_7c[2] = -1;
      local_7c[3] = -1;
      if (local_1c != (int *)0x0) {
        iVar6 = *(int *)((int)in_ECX + 0x100);
        iVar7 = *(int *)((int)in_ECX + 0x14);
        iVar2 = *(int *)((int)in_ECX + 0x10);
        local_28 = local_24;
        do {
          iVar3 = *(int *)(iVar7 + *(int *)((int)local_28 + *(int *)(iVar6 + 8)) * 4);
          iVar4 = *(int *)(*(int *)(iVar7 + *(int *)(*(int *)(iVar6 + 0x10) + (int)local_10 * 4) * 4
                                   ) + 0x10);
          if ((*(byte *)(*(int *)(iVar2 + *(int *)(iVar3 + 4) * 4) + 5) & 1) == 0) {
            local_ac[iVar4 + (int)local_14 * 4] = *(int *)(iVar3 + 0x10);
          }
          else {
            local_ac[iVar4 + (int)local_14 * 4] = iVar4;
          }
          local_7c[iVar4] = 0;
          local_10 = (int *)((int)local_10 + 1);
          local_28 = local_28 + 1;
          in_ECX = local_20;
        } while (local_10 < local_1c);
      }
      iVar6 = FUN_100a7ec8(local_8,local_7c,5);
      if (iVar6 == 0) {
        local_18 = (int *)0x1;
      }
      local_14 = (int *)((int)local_14 + 1);
      local_8 = local_8 + 4;
      local_24 = local_24 + (int)local_1c;
    } while (local_14 < local_c);
  }
  uVar8 = 0;
  if (local_18 == (int *)0x0) {
    iVar6 = FUN_10086292(*(undefined4 *)((int)in_ECX + 0x100));
LAB_100a8e77:
    if (iVar6 < 0) {
      return iVar6;
    }
    goto LAB_100a8e7b;
  }
  local_14 = (int *)0x0;
  local_20 = (int *)0x0;
  if (local_1c == (int *)0x4) {
    local_8 = (int *)0x1;
    do {
      if (local_8 == (int *)0x0) break;
      local_7c[0] = 0;
      local_7c[1] = 0;
      local_7c[2] = 0;
      local_7c[3] = 0;
      local_7c[4] = 0xffffffff;
      local_7c[5] = 0xffffffff;
      local_7c[6] = 0xffffffff;
      local_7c[7] = 0xffffffff;
      local_7c[uVar8] = -1;
      local_7c[uVar8 + 4] = 0;
      local_8 = (int *)0x0;
      if (local_c != (int *)0x0) {
        piVar9 = local_ac;
        local_18 = local_c;
        do {
          iVar6 = FUN_100a7ec8(piVar9,local_7c,5);
          if ((iVar6 == 0) || (iVar6 = FUN_100a7ec8(piVar9,local_7c,5), iVar6 == 0)) {
            local_8 = (int *)0x1;
          }
          piVar9 = piVar9 + 4;
          local_18 = (int *)((int)local_18 - 1);
        } while (local_18 != (int *)0x0);
      }
      if ((local_4c[8] != 0) && (uVar8 != 3)) {
        local_8 = (int *)0x1;
      }
      if (local_8 == (int *)0x0) {
        iVar6 = FUN_100c3c29(local_7c,local_c,4);
        if (iVar6 < 0) {
          return iVar6;
        }
        iVar6 = FUN_100c3c29(local_7c + 4,local_c,4);
        goto LAB_100a8e77;
      }
      uVar8 = uVar8 + 1;
    } while (uVar8 < 4);
    local_8 = (int *)0x1;
    local_10 = (int *)0x0;
    do {
      if (local_8 == (int *)0x0) break;
      local_18 = (int *)0x0;
      do {
        piVar10 = local_10;
        piVar9 = local_18;
        if (local_18 != local_10) {
          local_7c[0] = 0;
          local_7c[1] = 0;
          local_7c[2] = 0;
          local_7c[3] = 0;
          local_7c[4] = 0xffffffff;
          local_7c[5] = 0xffffffff;
          local_7c[6] = 0xffffffff;
          local_7c[7] = 0xffffffff;
          local_7c[(int)local_10] = -1;
          piVar5 = local_c;
          local_7c[(int)piVar9] = -1;
          local_7c[(int)(piVar10 + 1)] = 0;
          local_7c[(int)(piVar9 + 1)] = 0;
          local_8 = (int *)0x0;
          local_28 = (int *)0x0;
          if (piVar5 != (int *)0x0) {
            piVar9 = local_ac;
            local_24 = local_c;
            do {
              iVar6 = FUN_100a7ec8(piVar9,local_7c,5);
              iVar7 = FUN_100a7ec8(piVar9,local_7c + 4,5);
              if (iVar6 == 0) {
                local_28 = (int *)0x1;
LAB_100a8bdc:
                local_8 = (int *)0x1;
              }
              else if (iVar7 == 0) goto LAB_100a8bdc;
              piVar9 = piVar9 + 4;
              local_24 = (int *)((int)local_24 - 1);
            } while (local_24 != (int *)0x0);
          }
          if (local_4c[8] != 0) {
            local_8 = (int *)0x1;
          }
          if (local_8 == (int *)0x0) {
            local_14 = (int *)0x1;
            break;
          }
          if ((local_28 == (int *)0x0) && ((local_4c[8] == 0 || (local_7c[3] != 0)))) {
            local_7c[8] = local_7c[0];
            iStack_58 = local_7c[1];
            iStack_54 = local_7c[2];
            iStack_50 = local_7c[3];
            local_4c[0] = -1;
            local_4c[1] = 0xffffffff;
            local_4c[2] = 0xffffffff;
            local_4c[3] = 0xffffffff;
            local_4c[4] = 0xffffffff;
            local_4c[5] = 0xffffffff;
            local_4c[6] = 0xffffffff;
            local_4c[7] = 0xffffffff;
            local_4c[(int)local_10] = 0;
            local_4c[(int)(local_18 + 1)] = 0;
            local_20 = (int *)0x1;
          }
        }
        local_18 = (int *)((int)local_18 + 1);
      } while (local_18 < (int *)0x4);
      local_10 = (int *)((int)local_10 + 1);
    } while (local_10 < (int *)0x4);
    if (local_14 == (int *)0x0) {
      if (local_20 == (int *)0x0) goto LAB_100a8e22;
      local_14 = (int *)0x1;
      iVar6 = FUN_100c3c29(local_7c + 8,local_c,4);
      if (iVar6 < 0) {
        return iVar6;
      }
      iVar6 = FUN_100c3c29(local_4c,local_c,4);
      if (iVar6 < 0) {
        return iVar6;
      }
      uVar11 = 4;
      piVar9 = local_4c;
    }
    else {
      iVar6 = FUN_100c3c29(local_7c,local_c,4);
      if (iVar6 < 0) {
        return iVar6;
      }
      uVar11 = 4;
LAB_100a8e06:
      piVar9 = local_7c;
    }
    iVar6 = FUN_100c3c29(piVar9 + 4,local_c,uVar11);
    if (iVar6 < 0) {
      return iVar6;
    }
    if (local_14 != (int *)0x0) goto LAB_100a8e7b;
  }
  else if (local_1c == (int *)0x3) {
    local_20 = (int *)0xffffffff;
    piVar9 = (int *)0x0;
    do {
      if (local_ac[(int)piVar9] == -1) {
        local_20 = piVar9;
      }
      piVar9 = (int *)((int)piVar9 + 1);
    } while (piVar9 < (int *)0x4);
    local_10 = (int *)0x0;
    do {
      if (local_14 != (int *)0x0) goto LAB_100a8dec;
      piVar9 = (int *)0x0;
      do {
        piVar5 = local_10;
        piVar10 = local_20;
        if (local_14 != (int *)0x0) break;
        if (((piVar9 != local_10) && (piVar9 != local_20)) && (local_10 != local_20)) {
          local_7c[0] = -1;
          local_7c[1] = -1;
          local_7c[2] = -1;
          local_7c[3] = -1;
          local_7c[4] = 0;
          local_7c[5] = 0;
          local_7c[6] = 0;
          local_7c[7] = 0;
          local_7c[(int)local_10] = 0;
          local_7c[(int)piVar9] = 0;
          local_7c[(int)(piVar5 + 1)] = -1;
          local_7c[(int)(piVar9 + 1)] = -1;
          local_7c[(int)(piVar10 + 1)] = -1;
          piVar10 = (int *)0x0;
          local_8 = (int *)0x0;
          if (local_c != (int *)0x0) {
            local_18 = local_ac;
            do {
              if (local_8 != (int *)0x0) break;
              iVar6 = FUN_100a7ec8(local_18,local_7c,5);
              if (iVar6 == 0) {
                local_8 = (int *)0x1;
              }
              local_18 = local_18 + 4;
              piVar10 = (int *)((int)piVar10 + 1);
            } while (piVar10 < local_c);
          }
          if ((local_7c[3] == 0) &&
             ((((local_7c[0] == 0 || (local_7c[1] == 0)) || (local_7c[2] == 0)) &&
              (local_4c[8] != 0)))) {
            local_8 = (int *)0x1;
          }
          if (local_8 == (int *)0x0) {
            local_14 = (int *)0x1;
          }
        }
        piVar9 = (int *)((int)piVar9 + 1);
      } while (piVar9 < (int *)0x4);
      local_10 = (int *)((int)local_10 + 1);
    } while (local_10 < (int *)0x4);
    if (local_14 != (int *)0x0) {
LAB_100a8dec:
      iVar6 = FUN_100c3c29(local_7c,local_c,3);
      if (iVar6 < 0) {
        return iVar6;
      }
      uVar11 = 3;
      goto LAB_100a8e06;
    }
  }
LAB_100a8e22:
  piVar9 = (int *)0x0;
  if (local_1c != (int *)0x0) {
    do {
      piVar5 = local_c;
      piVar10 = local_1c;
      local_7c[0] = -1;
      local_7c[1] = 0xffffffff;
      local_7c[2] = 0xffffffff;
      local_7c[3] = 0xffffffff;
      local_7c[*(int *)(*(int *)(*(int *)((int)in_ECX + 0x14) +
                                *(int *)(*(int *)(*(int *)((int)in_ECX + 0x100) + 0x10) +
                                        (int)piVar9 * 4) * 4) + 0x10)] = 0;
      iVar6 = FUN_100c3c29(local_7c,piVar5,piVar10);
      if (iVar6 < 0) {
        return iVar6;
      }
      piVar9 = (int *)((int)piVar9 + 1);
    } while (piVar9 < local_1c);
  }
LAB_100a8e7b:
  **(undefined4 **)((int)in_ECX + 0x100) = 0;
  return 0;
}


