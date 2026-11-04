// 10088517 size=1006 FUN_10088517

undefined4 FUN_10088517(uint *param_1)

{
  uint uVar1;
  undefined4 uVar2;
  bool bVar3;
  bool bVar4;
  uint uVar5;
  int iVar6;
  uint uVar7;
  uint uVar8;
  int iVar9;
  int in_ECX;
  int *piVar10;
  int iVar11;
  uint local_30;
  int local_2c;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_10;
  uint local_8;
  
  uVar1 = param_1[3];
  uVar5 = param_1[1] / uVar1;
  iVar6 = FUN_1008543f();
  if (iVar6 == 0) {
    local_1c = 0;
    local_10 = uVar1;
    if (uVar1 != 0) {
      do {
        uVar7 = param_1[4];
        iVar6 = *(int *)(uVar7 + local_1c * 4);
        if ((iVar6 != -1) &&
           ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                               *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) + 4) * 4) + 4)
            & 0x40) != 0)) {
          local_8 = 0;
          for (uVar8 = local_1c; uVar8 < uVar1; uVar8 = uVar8 + 1) {
            if ((*(int *)(uVar8 * 4 + uVar7) != -1) &&
               (iVar6 = FUN_100883d0(*(undefined4 *)(param_1[4] + local_1c * 4),
                                     *(undefined4 *)(param_1[4] + uVar8 * 4)), iVar6 != 0)) {
              local_8 = local_8 + 1;
            }
          }
          iVar6 = FUN_10086199((*param_1 ^ local_8) & 0xfffff ^ *param_1,0xffffffff,0xffffffff);
          if (iVar6 == -1) {
            return 0x8007000e;
          }
          iVar6 = *(int *)(*(int *)(in_ECX + 0x18) + iVar6 * 4);
          FUN_100853b0(param_1);
          local_30 = *(uint *)(param_1[4] + local_1c * 4);
          local_8 = 0;
          for (uVar7 = local_1c; uVar7 < uVar1; uVar7 = uVar7 + 1) {
            iVar9 = *(int *)(param_1[4] + uVar7 * 4);
            if ((iVar9 != -1) && (iVar9 = FUN_100883d0(local_30,iVar9), iVar9 != 0)) {
              local_18 = 0;
              if (uVar5 != 0) {
                do {
                  iVar9 = param_1[3] * local_18;
                  iVar11 = *(int *)(iVar6 + 0xc) * local_18;
                  local_18 = local_18 + 1;
                  *(undefined4 *)(*(int *)(iVar6 + 8) + (iVar11 + local_8) * 4) =
                       *(undefined4 *)(param_1[2] + (iVar9 + uVar7) * 4);
                } while (local_18 < uVar5);
              }
              *(undefined4 *)(*(int *)(iVar6 + 0x10) + local_8 * 4) =
                   *(undefined4 *)(param_1[4] + uVar7 * 4);
              *(undefined4 *)(param_1[4] + uVar7 * 4) = 0xffffffff;
              local_10 = local_10 - 1;
              local_8 = local_8 + 1;
            }
          }
        }
        local_1c = local_1c + 1;
      } while (local_1c < uVar1);
    }
    local_2c = FUN_10085604();
    bVar3 = true;
    bVar4 = true;
    if ((local_2c == 0) && (local_20 = 0, uVar1 != 0)) {
      piVar10 = (int *)param_1[4];
      do {
        if ((*piVar10 != -1) &&
           ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                               *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar10 * 4) + 4) * 4) +
                      5) & 0x10) != 0)) {
          local_2c = 1;
          break;
        }
        local_20 = local_20 + 1;
        piVar10 = piVar10 + 1;
      } while (local_20 < uVar1);
    }
joined_r0x1008875d:
    if (local_10 != 0) {
      if ((local_10 < 5) && (local_2c == 0)) {
        bVar3 = false;
        bVar4 = false;
      }
      local_8 = 0;
      local_18 = 0;
      if (uVar1 == 0) {
        return 0;
      }
      do {
        if (*(int *)(param_1[4] + local_18 * 4) != -1) {
          uVar7 = 0;
          local_1c = 0;
          do {
            if (3 < local_1c) break;
            uVar8 = param_1[4];
            if (((*(int *)(uVar8 + uVar7 * 4) != -1) &&
                ((!bVar3 ||
                 (iVar6 = FUN_10088445(*(undefined4 *)(uVar8 + local_18 * 4),
                                       *(undefined4 *)(uVar8 + uVar7 * 4)), iVar6 != 0)))) &&
               ((!bVar4 || (iVar6 = FUN_10088472(param_1,local_18,uVar7), iVar6 == 0)))) {
              local_1c = local_1c + 1;
            }
            uVar7 = uVar7 + 1;
          } while (uVar7 < uVar1);
          if (local_8 < local_1c) {
            local_8 = local_1c;
            local_30 = local_18;
          }
        }
        local_18 = local_18 + 1;
      } while (local_18 < uVar1);
      if (local_8 == 0) {
        return 0;
      }
      iVar6 = FUN_10086199((*param_1 ^ local_8) & 0xfffff ^ *param_1,0xffffffff,0xffffffff);
      if (iVar6 == -1) {
        return 0x8007000e;
      }
      iVar6 = *(int *)(*(int *)(in_ECX + 0x18) + iVar6 * 4);
      FUN_100853b0(param_1);
      uVar2 = *(undefined4 *)(param_1[4] + local_30 * 4);
      local_18 = 0;
      local_20 = 0;
      do {
        if (3 < local_18) break;
        iVar9 = *(int *)(param_1[4] + local_20 * 4);
        if (((iVar9 != -1) && ((!bVar3 || (iVar9 = FUN_10088445(uVar2,iVar9), iVar9 != 0)))) &&
           ((!bVar4 || (iVar9 = FUN_10088472(param_1,local_30,local_20), iVar9 == 0)))) {
          local_1c = 0;
          if (uVar5 != 0) {
            do {
              iVar9 = param_1[3] * local_1c;
              iVar11 = *(int *)(iVar6 + 0xc) * local_1c;
              local_1c = local_1c + 1;
              *(undefined4 *)(*(int *)(iVar6 + 8) + (iVar11 + local_18) * 4) =
                   *(undefined4 *)(param_1[2] + (iVar9 + local_20) * 4);
            } while (local_1c < uVar5);
          }
          *(undefined4 *)(*(int *)(iVar6 + 0x10) + local_18 * 4) =
               *(undefined4 *)(param_1[4] + local_20 * 4);
          *(undefined4 *)(param_1[4] + local_20 * 4) = 0xffffffff;
          local_10 = local_10 - 1;
          local_18 = local_18 + 1;
        }
        local_20 = local_20 + 1;
      } while (local_20 < uVar1);
      goto joined_r0x1008875d;
    }
  }
  else {
    local_1c = 0;
    if (uVar1 != 0) {
      do {
        iVar6 = FUN_10086199(*param_1 & 0xfff00001 | 1,0xffffffff,0xffffffff);
        if (iVar6 == -1) {
          return 0x8007000e;
        }
        iVar6 = *(int *)(*(int *)(in_ECX + 0x18) + iVar6 * 4);
        FUN_100853b0(param_1);
        uVar7 = 0;
        if (uVar5 != 0) {
          do {
            *(undefined4 *)(*(int *)(iVar6 + 8) + uVar7 * 4) =
                 *(undefined4 *)(param_1[2] + (param_1[3] * uVar7 + local_1c) * 4);
            uVar7 = uVar7 + 1;
          } while (uVar7 < uVar5);
        }
        iVar9 = local_1c * 4;
        local_1c = local_1c + 1;
        **(undefined4 **)(iVar6 + 0x10) = *(undefined4 *)(param_1[4] + iVar9);
      } while (local_1c < uVar1);
    }
  }
  return 0;
}


