// 100a8ea3 size=1165 FUN_100a8ea3

/* WARNING: Type propagation algorithm not settling */

int FUN_100a8ea3(int param_1)

{
  int iVar1;
  int iVar2;
  int in_ECX;
  int iVar3;
  int *piVar4;
  int *piVar5;
  uint uVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  bool bVar9;
  undefined4 uVar10;
  undefined4 uVar11;
  undefined4 local_128 [16];
  undefined1 local_e8 [16];
  int aiStack_d8 [4];
  int aiStack_c8 [4];
  int aiStack_b8 [4];
  int aiStack_a8 [4];
  int aiStack_98 [4];
  int aiStack_88 [4];
  int aiStack_78 [12];
  undefined4 local_48;
  int local_44 [9];
  int local_20;
  uint local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  int *local_c;
  int local_8;
  
  if (0x103 < (*(uint *)(in_ECX + 200) & 0xffff)) {
    return 1;
  }
  uVar6 = 0;
  local_1c = 0;
  local_48 = 0;
  local_44[0] = 1;
  local_44[1] = 2;
  local_44[2] = 3;
  local_8 = in_ECX;
  if ((**(uint **)(in_ECX + 0x100) & 0xfffff) == 3) {
    do {
      iVar1 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),(&PTR_DAT_101a3fa0)[uVar6],local_128,
                           &local_1c,local_e8,&local_48,3,0);
      if (iVar1 == 0) break;
      uVar6 = uVar6 + 1;
    } while (uVar6 < 9);
    local_14 = 0;
    local_18 = 0;
    if (4 < uVar6) {
      local_18 = 1;
    }
    local_18 = (uint)(4 < uVar6);
    if (iVar1 != 0) {
      uVar6 = 0;
      do {
        iVar1 = FUN_100b99af(*(undefined4 *)(in_ECX + 0x100),(&PTR_DAT_101a3fc4)[uVar6],local_128,
                             &local_1c,local_e8,&local_48,3,0);
        if (iVar1 == 0) break;
        uVar6 = uVar6 + 1;
      } while (uVar6 < 3);
      local_18 = 0;
      if (1 < uVar6) {
        local_18 = 1;
      }
      local_18 = (uint)(1 < uVar6);
      local_14 = 1;
      if (iVar1 != 0) goto LAB_100a8f9c;
    }
    local_10 = 0;
    iVar1 = *(int *)(in_ECX + 0x14);
    local_20 = 0xc - (int)(local_44 + 3);
    do {
      iVar3 = aiStack_d8[local_10];
      iVar2 = *(int *)(iVar1 + iVar3 * 4);
      if (*(uint *)(iVar2 + 0x10) != local_10) {
        return 1;
      }
      if (param_1 == 0) {
        if (local_18 == 0) {
          if (*(int *)(iVar2 + 0x48) == -1) {
            return 1;
          }
          piVar5 = *(int **)(*(int *)(local_8 + 0x18) + *(int *)(iVar2 + 0x48) * 4);
          if (*piVar5 != 0x20500003) {
            return 1;
          }
          iVar3 = piVar5[2];
          local_c = *(int **)(local_10 * 4 + iVar3);
          iVar2 = *(int *)(iVar1 + (int)local_c * 4);
          if ((*(byte *)(*(int *)(*(int *)(local_8 + 0x10) + *(int *)(iVar2 + 4) * 4) + 5) & 2) == 0
             ) {
            return 1;
          }
          if (*(uint *)(iVar2 + 0x10) != local_10) {
            return 1;
          }
          piVar4 = local_44 + local_10 + 3;
          iVar1 = *(int *)(iVar1 + *(int *)((0xc - (int)(local_44 + 3)) + iVar3 + (int)piVar4) * 4);
          if ((*(byte *)(*(int *)(*(int *)(local_8 + 0x10) + *(int *)(iVar1 + 4) * 4) + 5) & 1) == 0
             ) {
            return 1;
          }
          if (*(double *)(iVar1 + 0x20) != -1.0) {
            return 1;
          }
          *piVar4 = (int)local_c;
        }
        else {
          if ((*(byte *)(*(int *)(*(int *)(local_8 + 0x10) + *(int *)(iVar2 + 4) * 4) + 5) & 2) == 0
             ) {
            return 1;
          }
          piVar4 = local_44 + local_10 + 3;
          *piVar4 = iVar3;
        }
        piVar5 = aiStack_b8 + local_10;
        local_c = (int *)*piVar4;
        if ((*piVar5 != *piVar4) || (iVar3 = aiStack_c8[local_10], aiStack_a8[local_10] != iVar3)) {
LAB_100a91a3:
          bVar9 = (int *)aiStack_a8[local_10] == local_c;
          goto LAB_100a91aa;
        }
        piVar4 = aiStack_98 + local_10;
        iVar1 = *piVar4;
        if ((iVar1 != aiStack_88[local_10]) || (aiStack_a8[local_10] != iVar1)) goto LAB_100a91a3;
      }
      else {
        if (*(int *)(iVar2 + 0x48) != -1) {
          return 1;
        }
        if (*(int *)(iVar2 + 4) != *(int *)(local_8 + 0x80)) {
          return 1;
        }
        if ((uint)*(byte *)(iVar2 + 0x6d) != local_10 + 1) {
          return 1;
        }
        if (*(char *)(iVar2 + 0x6c) != '\x05') {
          return 1;
        }
        local_44[local_10 + 3] = iVar3;
        if (local_18 == 0) {
          if (*(int *)(iVar2 + 0x3c) != 0x80000) {
            return 1;
          }
          piVar5 = aiStack_b8 + local_10;
          local_c = (int *)*(int *)(iVar2 + 0x38);
          if ((*piVar5 == *(int *)(iVar2 + 0x38)) &&
             (iVar3 = aiStack_c8[local_10], aiStack_a8[local_10] == iVar3)) {
            piVar4 = aiStack_98 + local_10;
            iVar1 = *piVar4;
            if ((iVar1 == aiStack_88[local_10]) && (aiStack_a8[local_10] == iVar1))
            goto LAB_100a91c7;
          }
          goto LAB_100a91a3;
        }
        if (*(int *)(iVar2 + 0x3c) != 0) {
          return 1;
        }
        piVar5 = aiStack_b8 + local_10;
        if (*piVar5 == iVar3) {
          iVar3 = aiStack_c8[local_10];
          if (aiStack_a8[local_10] == iVar3) {
            piVar4 = aiStack_98 + local_10;
            iVar1 = *piVar4;
            if ((iVar1 == aiStack_88[local_10]) && (aiStack_a8[local_10] == iVar1))
            goto LAB_100a91c7;
          }
        }
        bVar9 = aiStack_a8[local_10] == aiStack_d8[local_10];
LAB_100a91aa:
        if (!bVar9) {
          return 1;
        }
        iVar3 = piVar5[-4];
        if (*piVar5 != iVar3) {
          return 1;
        }
        piVar4 = aiStack_98 + local_10;
        iVar1 = *piVar4;
        if (iVar1 != piVar5[0xc]) {
          return 1;
        }
        if (*piVar5 != iVar1) {
          return 1;
        }
      }
LAB_100a91c7:
      local_44[local_10 + 6] = iVar3;
      if (((local_14 != 0) && (iVar1 != piVar4[8])) ||
         (iVar1 = *(int *)(local_8 + 0x14),
         *(uint *)(*(int *)(iVar1 + iVar3 * 4) + 0x10) != local_10)) {
        return 1;
      }
      local_10 = local_10 + 1;
    } while (local_10 < 3);
    uVar6 = 0;
    if (local_1c != 0) {
      do {
        puVar7 = local_128 + uVar6;
        uVar6 = uVar6 + 1;
        *(undefined4 *)*puVar7 = 0;
      } while (uVar6 < local_1c);
    }
    iVar1 = FUN_10085814(0x74);
    if (iVar1 == 0) {
      iVar1 = 0;
    }
    else {
      iVar1 = FUN_10085379();
    }
    iVar3 = local_8;
    if (iVar1 == 0) {
      local_14 = -0x7ff8fff2;
    }
    else {
      if (param_1 == 0) {
        uVar11 = 9;
        uVar10 = 0x72d00003;
      }
      else {
        uVar11 = 6;
        uVar10 = 0x72c00003;
      }
      iVar2 = FUN_1008585f(uVar10,uVar11,*(undefined4 *)(*(int *)(local_8 + 0x100) + 0xc),0);
      if (iVar2 < 0) {
        FUN_1006c418(1);
        local_14 = iVar2;
      }
      else {
        local_14 = FUN_100853b0(*(undefined4 *)(iVar3 + 0x100));
        if (local_14 < 0) {
          FUN_1006c418(1);
        }
        else {
          puVar7 = *(undefined4 **)(*(int *)(local_8 + 0x100) + 0x10);
          puVar8 = *(undefined4 **)(iVar1 + 0x10);
          for (uVar6 = *(uint *)(*(int *)(local_8 + 0x100) + 0xc) & 0x3fffffff; uVar6 != 0;
              uVar6 = uVar6 - 1) {
            *puVar8 = *puVar7;
            puVar7 = puVar7 + 1;
            puVar8 = puVar8 + 1;
          }
          for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
            *(undefined1 *)puVar8 = *(undefined1 *)puVar7;
            puVar7 = (undefined4 *)((int)puVar7 + 1);
            puVar8 = (undefined4 *)((int)puVar8 + 1);
          }
          uVar6 = 0xc;
          local_c = local_44;
          do {
            *(undefined4 *)((uVar6 - 0xc) + *(int *)(iVar1 + 8)) =
                 **(undefined4 **)(*(int *)(local_8 + 0x100) + 8);
            *(undefined4 *)(uVar6 + *(int *)(iVar1 + 8)) =
                 *(undefined4 *)((int)local_44 + uVar6 + 0xc);
            if (param_1 == 0) {
              *(undefined4 *)(uVar6 + 0xc + *(int *)(iVar1 + 8)) =
                   *(undefined4 *)((int)local_44 + uVar6);
            }
            uVar6 = uVar6 + 4;
          } while (uVar6 < 0x18);
          piVar5 = (int *)(local_8 + 0xfc);
          if (*(int *)(*(int *)(local_8 + 0x18) + *piVar5 * 4) != 0) {
            FUN_1006c418(1);
          }
          *(int *)(*(int *)(local_8 + 0x18) + *piVar5 * 4) = iVar1;
        }
      }
    }
  }
  else {
LAB_100a8f9c:
    local_14 = 1;
  }
  return local_14;
}


