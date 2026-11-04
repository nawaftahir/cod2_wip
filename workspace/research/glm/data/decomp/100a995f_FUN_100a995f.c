// 100a995f size=1479 FUN_100a995f

/* WARNING: Type propagation algorithm not settling */

int FUN_100a995f(void)

{
  int *piVar1;
  uint *puVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  uint *puVar6;
  float fVar7;
  uint uVar8;
  int iVar9;
  int in_ECX;
  int *piVar10;
  uint uVar11;
  undefined4 *puVar12;
  uint uVar13;
  uint *puVar14;
  undefined4 *puVar15;
  uint local_94 [16];
  uint local_54 [8];
  int *local_34;
  uint local_30;
  int *local_2c;
  float local_28;
  uint local_24;
  uint local_20;
  uint *local_1c;
  int *local_18;
  undefined4 local_14;
  uint *local_10;
  int *local_c;
  undefined4 *local_8;
  
  local_20 = 0;
  local_14 = 0;
  piVar3 = (int *)(*(uint **)(in_ECX + 0x100))[2];
  uVar11 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar3 * 4);
  piVar1 = piVar3 + uVar11;
  iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar1 * 4);
  local_10 = *(uint **)(*(int *)(in_ECX + 0x10) + *(int *)(iVar9 + 4) * 4);
  iVar5 = *(int *)(in_ECX + 0x88);
  if (((*(int *)(iVar9 + 4) == iVar5) &&
      ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 5) & 1) != 0)) &&
     ((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x20500000)) {
    local_18 = piVar3;
    local_2c = piVar1;
  }
  else {
    if (((*(int *)(iVar4 + 4) != iVar5) || ((*(byte *)((int)local_10 + 5) & 1) == 0)) ||
       ((**(uint **)(in_ECX + 0x100) & 0xfff00000) != 0x20500000)) {
      if (*(int *)(iVar9 + 4) != iVar5) {
        return 1;
      }
      if (*(int *)(iVar4 + 4) != iVar5) {
        return 1;
      }
      if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) != 0x20400000) {
        return 1;
      }
      local_14 = 1;
      if (uVar11 != 0) {
        piVar10 = piVar3;
        local_10 = (uint *)uVar11;
        do {
          if (*piVar10 != *(int *)(((int)piVar1 - (int)piVar3) + (int)piVar10)) {
            local_14 = 0;
          }
          piVar10 = piVar10 + 1;
          local_10 = (uint *)((int)local_10 - 1);
        } while (local_10 != (uint *)0x0);
      }
      uVar8 = *(uint *)(iVar9 + 0x3c);
      if (uVar8 != *(uint *)(iVar4 + 0x3c)) {
        return 1;
      }
      if (uVar8 == 0x80000) {
        local_28 = -1.0;
      }
      else {
        if ((uVar8 & 0x80000) != 0) {
          return 1;
        }
        local_28 = 1.0;
      }
      local_18 = piVar3;
      if (local_14 == 0) {
        return 1;
      }
      local_28 = local_28 + local_28;
      goto LAB_100a99ed;
    }
    local_18 = piVar1;
    local_2c = piVar3;
  }
  local_28 = (float)*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + *local_2c * 4) + 0x20);
LAB_100a99ed:
  local_8 = (undefined4 *)0x0;
  if (uVar11 != 0) {
    iVar9 = *(int *)(in_ECX + 0x14);
    local_c = local_2c;
    local_1c = (uint *)((int)local_18 - (int)local_2c);
    do {
      uVar8 = local_20;
      iVar4 = *(int *)(iVar9 + *(int *)((int)local_1c + (int)local_c) * 4);
      uVar13 = 0;
      if (local_14 == 0) {
        local_10 = (uint *)*(int *)(iVar9 + *local_c * 4);
      }
      else {
        local_10 = (uint *)0x0;
      }
      if (*(int *)(iVar4 + 0x58) != *(int *)(in_ECX + 0xfc)) {
        return 1;
      }
      if (*(int *)(iVar4 + 0x54) != *(int *)(in_ECX + 0xfc)) {
        return 1;
      }
      if ((*(uint *)(iVar4 + 0x3c) & 0x1ffe00) != 0) {
        return 1;
      }
      if (local_20 != 0) {
        do {
          if (*(uint *)(iVar4 + 0x48) == local_54[uVar13 + 4]) break;
          uVar13 = uVar13 + 1;
        } while (uVar13 < local_20);
      }
      if (uVar13 == local_20) {
        local_20 = local_20 + 1;
        local_54[uVar8 + 4] = *(uint *)(iVar4 + 0x48);
      }
      if ((local_14 == 0) && ((double)local_28 != *(double *)((int)local_10 + 0x20))) {
        return 1;
      }
      local_8 = (undefined4 *)((int)local_8 + 1);
      local_c = local_c + 1;
    } while (local_8 < uVar11);
  }
  fVar7 = ABS(local_28);
  if ((((ABS(fVar7) != 2.0) || (uVar8 = 0x400, (*(uint *)(in_ECX + 0x6c) & 0x400) == 0)) &&
      (((fVar7 != 4.0 || (uVar8 = 0x800, (*(uint *)(in_ECX + 0x6c) & 0x800) == 0)) &&
       ((fVar7 != 8.0 || (uVar8 = 0x1000, (*(uint *)(in_ECX + 0x6c) & 0x1000) == 0)))))) &&
     (((fVar7 != 0.5 || (uVar8 = 0x2000, (*(uint *)(in_ECX + 0x6c) & 0x2000) == 0)) &&
      (((fVar7 != 0.25 || (uVar8 = 0x4000, (*(uint *)(in_ECX + 0x6c) & 0x4000) == 0)) &&
       ((fVar7 != 0.125 || (uVar8 = 0x8000, (*(uint *)(in_ECX + 0x6c) & 0x8000) == 0)))))))) {
    return 1;
  }
  local_14 = uVar8;
  if (local_28 < 0.0) {
    local_14 = (uint)CONCAT12(8,(short)uVar8);
  }
  local_54[0] = 0;
  local_54[1] = 0;
  local_54[2] = 0;
  local_54[3] = 0;
  local_c = (int *)0x0;
  if (local_20 != 0) {
    local_1c = local_94;
    local_10 = (uint *)0x0;
    do {
      puVar14 = local_1c;
      puVar6 = *(uint **)(*(int *)(in_ECX + 0x18) + local_54[(int)local_c + 4] * 4);
      if ((*puVar6 & 0xf0000000) == 0x60000000) {
        return 1;
      }
      if ((*puVar6 & 0xff000000) == 0x72000000) {
        return 1;
      }
      local_24 = 0;
      local_8 = (undefined4 *)0x0;
      uVar8 = puVar6[3];
      puVar2 = local_1c + 1;
      *local_1c = 0xffffffff;
      *puVar2 = 0xffffffff;
      puVar14[2] = 0xffffffff;
      puVar14[3] = 0xffffffff;
      if (uVar11 != 0) {
        do {
          local_30 = 0;
          if (uVar8 != 0) {
            local_2c = (int *)local_18[(int)local_8];
            local_34 = (int *)puVar6[4];
            puVar14 = (uint *)((int)local_94 + (int)local_10);
            do {
              puVar12 = local_8;
              if ((int *)*local_34 == local_2c) {
                local_54[(int)local_c] = local_54[(int)local_c] + 1;
                iVar9 = *(int *)(*(int *)(in_ECX + 0x100) + 0x10);
                *puVar14 = (uint)puVar12;
                if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                        *(int *)(iVar9 + (int)puVar12 * 4) * 4) + 0x3d) & 2) != 0)
                   && (local_28 < 0.0)) {
                  return 1;
                }
                local_24 = local_24 + 1;
              }
              local_30 = local_30 + 1;
              uVar8 = puVar6[3];
              local_34 = local_34 + 1;
              puVar14 = puVar14 + 1;
            } while (local_30 < uVar8);
          }
          local_8 = (undefined4 *)((int)local_8 + 1);
        } while (local_8 < uVar11);
      }
      if (local_24 != uVar8) {
        return 1;
      }
      local_c = (int *)((int)local_c + 1);
      local_1c = local_1c + 4;
      local_10 = (uint *)((int)local_10 + 0x10);
    } while (local_c < local_20);
  }
  local_c = (int *)0x0;
  if (local_20 != 0) {
    local_1c = local_94;
    do {
      uVar11 = local_54[(int)local_c];
      puVar12 = *(undefined4 **)(local_54[(int)local_c + 4] * 4 + *(int *)(in_ECX + 0x18));
      local_2c = (int *)(local_54[(int)local_c + 4] * 4);
      local_10 = puVar12;
      local_24 = uVar11;
      if (uVar11 != puVar12[3]) {
        iVar9 = FUN_10085814(0x74);
        if (iVar9 == 0) {
          local_8 = (undefined4 *)0x0;
        }
        else {
          local_8 = (undefined4 *)FUN_10085379();
        }
        if (local_8 == (undefined4 *)0x0) {
          return -0x7ff8fff2;
        }
        iVar9 = FUN_1008585f(*puVar12,puVar12[1],uVar11,0);
        if ((iVar9 < 0) || (iVar9 = FUN_100853b0(puVar12), iVar9 < 0)) {
          FUN_1006c418(1);
          return iVar9;
        }
        puVar12 = (undefined4 *)local_10[2];
        puVar15 = (undefined4 *)local_8[2];
        for (uVar11 = local_10[1] & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
          *puVar15 = *puVar12;
          puVar12 = puVar12 + 1;
          puVar15 = puVar15 + 1;
        }
        for (iVar9 = 0; iVar9 != 0; iVar9 = iVar9 + -1) {
          *(undefined1 *)puVar15 = *(undefined1 *)puVar12;
          puVar12 = (undefined4 *)((int)puVar12 + 1);
          puVar15 = (undefined4 *)((int)puVar15 + 1);
        }
        FUN_1006c418(1);
        *(undefined4 **)((int)local_2c + *(int *)(in_ECX + 0x18)) = local_8;
        local_10 = local_8;
        puVar12 = local_8;
      }
      local_8 = (undefined4 *)0x0;
      if (local_24 != 0) {
        local_10 = local_1c;
        puVar6 = local_1c;
        puVar15 = local_8;
        do {
          for (; (puVar15 < 4 && (*puVar6 == 0xffffffff)); puVar6 = puVar6 + 1) {
            puVar15 = (undefined4 *)((int)puVar15 + 1);
          }
          local_18 = (int *)0x0;
          iVar9 = (int)puVar15 * 4;
          *(undefined4 *)(puVar12[4] + (int)local_8 * 4) =
               *(undefined4 *)(iVar9 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10));
          puVar6 = (uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(iVar9 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10)) * 4)
                           + 0x3c);
          *puVar6 = *puVar6 | local_14;
          if (*(int *)(in_ECX + 8) != 0) {
            do {
              iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4);
              if (*(int *)(iVar4 + 0x38) ==
                  *(int *)(iVar9 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10))) {
                *(uint *)(iVar4 + 0x3c) = *(uint *)(iVar4 + 0x3c) | local_14 & 0xfff7ffff;
                uVar11 = *(uint *)(iVar4 + 0x3c);
                if (local_28 < 0.0) {
                  if ((uVar11 & 0x80000) == 0) {
                    uVar11 = uVar11 | 0x80000;
                  }
                  else {
                    uVar11 = uVar11 & 0xfff7ffff;
                  }
                  *(uint *)(iVar4 + 0x3c) = uVar11;
                }
              }
              local_18 = (int *)((int)local_18 + 1);
            } while (local_18 < *(int **)(in_ECX + 8));
          }
          local_8 = (undefined4 *)((int)local_8 + 1);
          local_10 = local_10 + 1;
          puVar6 = local_10;
          puVar15 = local_8;
        } while (local_8 < local_24);
      }
      local_c = (int *)((int)local_c + 1);
      local_1c = local_1c + 4;
    } while (local_c < local_20);
  }
  **(undefined4 **)(in_ECX + 0x100) = 0;
  return 0;
}


