// 100bf075 size=1207 FUN_100bf075

int FUN_100bf075(void)

{
  int iVar1;
  uint *puVar2;
  int iVar3;
  uint uVar4;
  int in_ECX;
  uint uVar5;
  undefined4 *puVar6;
  int *piVar7;
  undefined4 *puVar8;
  int *piVar9;
  undefined1 local_114 [64];
  int local_d4 [4];
  int local_c4 [4];
  int local_b4 [4];
  int local_a4 [28];
  int local_34 [4];
  int local_24;
  int local_20 [7];
  
  local_20[5] = 0;
  local_20[0] = 0;
  uVar5 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_20[1] = 1;
  local_20[2] = 2;
  local_20[3] = 3;
  local_20[4] = uVar5;
  iVar3 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10119358,local_114,local_20 + 5,local_d4,
                       local_20,uVar5,1);
  if (iVar3 == 0) {
    iVar3 = FUN_10085814(0x74);
    if (iVar3 == 0) {
      local_20[6] = 0;
    }
    else {
      local_20[6] = FUN_10085379();
    }
    if (local_20[6] == 0) {
      return -0x7ff8fff2;
    }
    uVar4 = uVar5 | 0x74600000;
  }
  else {
    iVar3 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_101192f8,local_114,local_20 + 5,
                         local_d4,local_20,uVar5,1);
    if (iVar3 != 0) {
      iVar3 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_101193b8,local_114,local_20 + 5,
                           local_d4,local_20,uVar5,1);
      if (iVar3 != 0) {
        return iVar3;
      }
      iVar3 = *(int *)(in_ECX + 0x14);
      iVar1 = *(int *)(iVar3 + local_b4[0] * 4);
      local_20[5] = *(int *)(iVar1 + 0x3c);
      if (local_20[5] == 0x80000) {
        uVar4 = 0;
        if (uVar5 != 0) {
          piVar7 = local_a4;
          piVar9 = local_20;
          for (; uVar5 != 0; uVar5 = uVar5 - 1) {
            *piVar9 = *piVar7;
            piVar7 = piVar7 + 1;
            piVar9 = piVar9 + 1;
          }
          do {
            local_34[uVar4] = *(int *)(*(int *)(iVar3 + local_b4[uVar4] * 4) + 0x38);
            uVar4 = uVar4 + 1;
            uVar5 = local_20[4];
          } while (uVar4 < (uint)local_20[4]);
        }
      }
      else {
        local_20[6] = *(int *)(iVar3 + local_a4[0] * 4);
        local_24 = *(int *)(local_20[6] + 0x3c);
        if (local_24 == 0x80000) {
          uVar4 = 0;
          if (uVar5 != 0) {
            piVar7 = local_b4;
            piVar9 = local_20;
            for (; uVar5 != 0; uVar5 = uVar5 - 1) {
              *piVar9 = *piVar7;
              piVar7 = piVar7 + 1;
              piVar9 = piVar9 + 1;
            }
            do {
              local_34[uVar4] = *(int *)(*(int *)(iVar3 + local_a4[uVar4] * 4) + 0x38);
              uVar4 = uVar4 + 1;
              uVar5 = local_20[4];
            } while (uVar4 < (uint)local_20[4]);
          }
        }
        else {
          if (uVar5 != 1) {
            return 1;
          }
          iVar3 = *(int *)(iVar1 + 0x48);
          if (iVar3 == -1) {
LAB_100bf311:
            if (*(int *)(local_20[6] + 0x48) == -1) {
              return 1;
            }
            puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(local_20[6] + 0x48) * 4);
            uVar4 = *puVar2;
            if ((uVar4 & 0xfff00000) != 0x10100000) {
              return 1;
            }
            if ((uVar4 & 0xfffff) != 1) {
              return 1;
            }
            if (local_24 != 0) {
              return 1;
            }
            local_34[0] = *(int *)puVar2[2];
            local_a4[0] = local_b4[0];
          }
          else {
            puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar3 * 4);
            uVar4 = *puVar2;
            if ((((uVar4 & 0xfff00000) != 0x10100000) || ((uVar4 & 0xfffff) != 1)) ||
               (local_20[5] != 0)) goto LAB_100bf311;
            local_34[0] = *(int *)puVar2[2];
          }
          local_20[0] = local_a4[0];
        }
      }
      local_20[6] = 0;
      local_20[4] = 1;
      local_20[5] = 1;
      if (uVar5 != 0) {
        do {
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_d4[local_20[6]] * 4);
          if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 4) & 0x100)
              == 0) {
            local_20[5] = 0;
            local_20[4] = 0;
          }
          if (*(double *)(iVar3 + 0x20) != 1.0) {
            local_20[5] = 0;
          }
          if (*(double *)(iVar3 + 0x20) != 0.0) {
            local_20[4] = 0;
          }
          iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + local_c4[local_20[6]] * 4);
          if ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar3 + 4) * 4) + 4) & 0x100)
              == 0) {
            local_20[5] = 0;
            local_20[4] = 0;
          }
          if (*(double *)(iVar3 + 0x20) != 0.0) {
            local_20[5] = 0;
          }
          if (*(double *)(iVar3 + 0x20) != 1.0) {
            local_20[4] = 0;
          }
          local_20[6] = local_20[6] + 1;
        } while ((uint)local_20[6] < uVar5);
        if ((local_20[5] == 0) && (local_20[4] == 0)) {
          return 1;
        }
      }
      iVar3 = FUN_10085814(0x74);
      if (iVar3 == 0) {
        local_20[6] = 0;
      }
      else {
        local_20[6] = FUN_10085379();
      }
      iVar3 = local_20[6];
      if (local_20[6] == 0) {
        return -0x7ff8fff2;
      }
      if (local_20[5] == 0) {
        uVar4 = uVar5 & 0xfffff | 0x74700000;
      }
      else {
        uVar4 = uVar5 & 0xfffff | 0x74600000;
      }
      local_20[5] = FUN_1008585f(uVar4,uVar5 * 2,uVar5,0);
      if (-1 < local_20[5]) {
        local_20[5] = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100));
        if (local_20[5] < 0) goto LAB_100bf4a9;
        puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
        puVar8 = *(undefined4 **)(iVar3 + 0x10);
        for (uVar4 = uVar5 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
          *puVar8 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar8 = puVar8 + 1;
        }
        for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
          *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
          puVar6 = (undefined4 *)((int)puVar6 + 1);
          puVar8 = (undefined4 *)((int)puVar8 + 1);
        }
        piVar7 = local_20;
        piVar9 = *(int **)(local_20[6] + 8);
        for (uVar4 = uVar5 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
          *piVar9 = *piVar7;
          piVar7 = piVar7 + 1;
          piVar9 = piVar9 + 1;
        }
        for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
          *(char *)piVar9 = (char)*piVar7;
          piVar7 = (int *)((int)piVar7 + 1);
          piVar9 = (int *)((int)piVar9 + 1);
        }
        piVar7 = local_34;
        goto LAB_100bf4f2;
      }
      goto LAB_100bf4a9;
    }
    iVar3 = FUN_10085814(0x74);
    if (iVar3 == 0) {
      local_20[6] = 0;
    }
    else {
      local_20[6] = FUN_10085379();
    }
    if (local_20[6] == 0) {
      return -0x7ff8fff2;
    }
    uVar4 = uVar5 | 0x74700000;
  }
  iVar3 = local_20[6];
  local_20[5] = FUN_1008585f(uVar4,uVar5 * 2,uVar5,0);
  if (-1 < local_20[5]) {
    local_20[5] = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100));
    if (-1 < local_20[5]) {
      puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
      puVar8 = *(undefined4 **)(iVar3 + 0x10);
      for (uVar4 = uVar5; uVar4 != 0; uVar4 = uVar4 - 1) {
        *puVar8 = *puVar6;
        puVar6 = puVar6 + 1;
        puVar8 = puVar8 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
        puVar6 = (undefined4 *)((int)puVar6 + 1);
        puVar8 = (undefined4 *)((int)puVar8 + 1);
      }
      piVar7 = local_d4;
      piVar9 = *(int **)(local_20[6] + 8);
      for (uVar4 = uVar5; uVar4 != 0; uVar4 = uVar4 - 1) {
        *piVar9 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar9 = piVar9 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(char *)piVar9 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar9 = (int *)((int)piVar9 + 1);
      }
      piVar7 = local_c4;
LAB_100bf4f2:
      piVar9 = (int *)(*(int *)(local_20[6] + 8) + uVar5 * 4);
      for (uVar4 = uVar5 & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
        *piVar9 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar9 = piVar9 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(char *)piVar9 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar9 = (int *)((int)piVar9 + 1);
      }
      iVar3 = FUN_10085abe(local_20[6]);
      FUN_1006c418(1);
      return iVar3;
    }
  }
LAB_100bf4a9:
  FUN_1006c418(1);
  return local_20[5];
}


