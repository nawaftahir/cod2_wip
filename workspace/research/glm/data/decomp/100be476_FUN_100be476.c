// 100be476 size=1014 FUN_100be476

int FUN_100be476(void)

{
  int iVar1;
  int iVar2;
  uint uVar3;
  int in_ECX;
  uint uVar4;
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
  int local_24 [5];
  int local_10;
  uint local_c;
  int local_8;
  
  local_10 = 0;
  local_24[0] = 0;
  uVar5 = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_24[1] = 1;
  local_24[2] = 2;
  local_24[3] = 3;
  local_24[4] = in_ECX;
  iVar2 = FUN_100b99af(*(uint **)(in_ECX + 0x100),&DAT_10118e78,local_114,&local_10,local_d4,
                       local_24,uVar5,1);
  if (iVar2 == 0) {
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      local_c = 0;
    }
    else {
      local_c = FUN_10085379();
    }
    if (local_c == 0) {
      return -0x7ff8fff2;
    }
    uVar3 = uVar5 | 0x73600000;
  }
  else {
    iVar2 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118ed8,local_114,&local_10,local_d4,
                         local_24,uVar5,1);
    if (iVar2 != 0) {
      iVar2 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),&DAT_10118f38,local_114,&local_10,
                           local_d4,local_24,uVar5,1);
      if (iVar2 != 0) {
        return iVar2;
      }
      iVar2 = *(int *)(in_ECX + 0x14);
      if (*(int *)(*(int *)(iVar2 + local_b4[0] * 4) + 0x3c) == 0x80000) {
        uVar3 = 0;
        if (uVar5 != 0) {
          piVar7 = local_a4;
          piVar9 = local_24;
          for (uVar4 = uVar5; uVar4 != 0; uVar4 = uVar4 - 1) {
            *piVar9 = *piVar7;
            piVar7 = piVar7 + 1;
            piVar9 = piVar9 + 1;
          }
          do {
            local_34[uVar3] = *(int *)(*(int *)(iVar2 + local_b4[uVar3] * 4) + 0x38);
            uVar3 = uVar3 + 1;
            in_ECX = local_24[4];
          } while (uVar3 < uVar5);
        }
      }
      else {
        if (*(int *)(*(int *)(iVar2 + local_a4[0] * 4) + 0x3c) != 0x80000) {
          return 1;
        }
        uVar3 = 0;
        if (uVar5 != 0) {
          piVar7 = local_b4;
          piVar9 = local_24;
          for (uVar4 = uVar5; uVar4 != 0; uVar4 = uVar4 - 1) {
            *piVar9 = *piVar7;
            piVar7 = piVar7 + 1;
            piVar9 = piVar9 + 1;
          }
          do {
            local_34[uVar3] = *(int *)(*(int *)(iVar2 + local_a4[uVar3] * 4) + 0x38);
            uVar3 = uVar3 + 1;
            in_ECX = local_24[4];
          } while (uVar3 < uVar5);
        }
      }
      local_c = 0;
      local_10 = 1;
      local_8 = 1;
      if (uVar5 != 0) {
        do {
          iVar1 = *(int *)(iVar2 + local_d4[local_c] * 4);
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) == 0)
          {
            local_8 = 0;
            local_10 = 0;
          }
          if (*(double *)(iVar1 + 0x20) != 0.0) {
            local_8 = 0;
          }
          if (*(double *)(iVar1 + 0x20) != 1.0) {
            local_10 = 0;
          }
          iVar1 = *(int *)(iVar2 + local_c4[local_c] * 4);
          if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) == 0)
          {
            local_8 = 0;
            local_10 = 0;
          }
          if (*(double *)(iVar1 + 0x20) != 1.0) {
            local_8 = 0;
          }
          if (*(double *)(iVar1 + 0x20) != 0.0) {
            local_10 = 0;
          }
          local_c = local_c + 1;
        } while (local_c < uVar5);
        if ((local_8 == 0) && (local_10 == 0)) {
          return 1;
        }
      }
      iVar2 = FUN_10085814(0x74);
      if (iVar2 == 0) {
        local_c = 0;
      }
      else {
        local_c = FUN_10085379();
      }
      uVar3 = local_c;
      if (local_c == 0) {
        return -0x7ff8fff2;
      }
      if (local_8 == 0) {
        uVar4 = uVar5 | 0x73500000;
      }
      else {
        uVar4 = uVar5 | 0x73600000;
      }
      local_8 = FUN_1008585f(uVar4,uVar5 * 2,uVar5,0);
      if (-1 < local_8) {
        local_8 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100));
        if (local_8 < 0) goto LAB_100be7ed;
        puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
        puVar8 = *(undefined4 **)(uVar3 + 0x10);
        for (uVar4 = uVar5; uVar4 != 0; uVar4 = uVar4 - 1) {
          *puVar8 = *puVar6;
          puVar6 = puVar6 + 1;
          puVar8 = puVar8 + 1;
        }
        for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
          *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
          puVar6 = (undefined4 *)((int)puVar6 + 1);
          puVar8 = (undefined4 *)((int)puVar8 + 1);
        }
        piVar7 = local_24;
        piVar9 = *(int **)(local_c + 8);
        for (uVar3 = uVar5; uVar3 != 0; uVar3 = uVar3 - 1) {
          *piVar9 = *piVar7;
          piVar7 = piVar7 + 1;
          piVar9 = piVar9 + 1;
        }
        for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
          *(char *)piVar9 = (char)*piVar7;
          piVar7 = (int *)((int)piVar7 + 1);
          piVar9 = (int *)((int)piVar9 + 1);
        }
        piVar7 = local_34;
        goto LAB_100be834;
      }
      goto LAB_100be7ed;
    }
    iVar2 = FUN_10085814(0x74);
    if (iVar2 == 0) {
      local_c = 0;
    }
    else {
      local_c = FUN_10085379();
    }
    if (local_c == 0) {
      return -0x7ff8fff2;
    }
    uVar3 = uVar5 | 0x73500000;
  }
  uVar4 = local_c;
  local_8 = FUN_1008585f(uVar3,uVar5 * 2,uVar5,0);
  if (-1 < local_8) {
    local_8 = FUN_100853b0(*(undefined4 *)(in_ECX + 0x100));
    if (-1 < local_8) {
      puVar6 = *(undefined4 **)(*(int *)(in_ECX + 0x100) + 0x10);
      puVar8 = *(undefined4 **)(uVar4 + 0x10);
      for (uVar3 = uVar5; uVar3 != 0; uVar3 = uVar3 - 1) {
        *puVar8 = *puVar6;
        puVar6 = puVar6 + 1;
        puVar8 = puVar8 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(undefined1 *)puVar8 = *(undefined1 *)puVar6;
        puVar6 = (undefined4 *)((int)puVar6 + 1);
        puVar8 = (undefined4 *)((int)puVar8 + 1);
      }
      piVar7 = local_d4;
      piVar9 = *(int **)(local_c + 8);
      for (uVar3 = uVar5; uVar3 != 0; uVar3 = uVar3 - 1) {
        *piVar9 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar9 = piVar9 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(char *)piVar9 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar9 = (int *)((int)piVar9 + 1);
      }
      piVar7 = local_c4;
LAB_100be834:
      piVar9 = (int *)(*(int *)(local_c + 8) + uVar5 * 4);
      for (; uVar5 != 0; uVar5 = uVar5 - 1) {
        *piVar9 = *piVar7;
        piVar7 = piVar7 + 1;
        piVar9 = piVar9 + 1;
      }
      for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
        *(char *)piVar9 = (char)*piVar7;
        piVar7 = (int *)((int)piVar7 + 1);
        piVar9 = (int *)((int)piVar9 + 1);
      }
      iVar2 = FUN_10085abe(local_c);
      FUN_1006c418(1);
      return iVar2;
    }
  }
LAB_100be7ed:
  FUN_1006c418(1);
  return local_8;
}


