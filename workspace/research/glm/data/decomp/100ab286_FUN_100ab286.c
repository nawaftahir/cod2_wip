// 100ab286 size=1376 FUN_100ab286

uint FUN_100ab286(void)

{
  int iVar1;
  undefined4 uVar2;
  int iVar3;
  uint uVar4;
  int in_ECX;
  int iVar5;
  int extraout_ECX;
  int extraout_ECX_00;
  int extraout_ECX_01;
  int *piVar6;
  uint *puVar7;
  uint uVar8;
  undefined8 uVar9;
  uint local_34 [6];
  uint local_1c;
  uint local_18;
  uint local_14;
  int *local_10;
  int *local_c;
  uint *local_8;
  
  puVar7 = local_34;
  for (iVar5 = 6; iVar5 != 0; iVar5 = iVar5 + -1) {
    *puVar7 = 0;
    puVar7 = puVar7 + 1;
  }
  local_18 = *(uint *)(in_ECX + 0xc);
  if (local_18 != 0) {
    local_10 = *(int **)(in_ECX + 0x18);
    local_c = (int *)local_18;
    do {
      puVar7 = (uint *)*local_10;
      if ((puVar7 != (uint *)0x0) && (local_8 = (uint *)*puVar7, local_8 != (uint *)0x0)) {
        local_1c = puVar7[1];
        local_14 = 0;
        if (local_1c != 0) {
          piVar6 = (int *)puVar7[2];
          do {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar6 * 4);
            if (*(int *)(iVar5 + 4) == *(int *)(in_ECX + 0x80)) {
              if (5 < *(byte *)(iVar5 + 0x6d)) break;
              if (*(char *)(iVar5 + 0x6c) == '\x03') {
                uVar8 = (uint)local_8 & 0xfff00000;
                uVar9 = FUN_100a6e19();
                iVar5 = (int)((ulonglong)uVar9 >> 0x20);
                if (((int)uVar9 == 0) && (uVar8 != 0x11000000)) {
                  uVar8 = *(int *)(extraout_ECX + 0x10) + 1;
                  if (local_34[iVar5] < uVar8) {
                    local_34[iVar5] = uVar8;
                  }
                }
                else {
                  uVar8 = *(int *)(extraout_ECX + 0x10) + 1;
                  if ((local_34[iVar5] < uVar8) && (*(int *)(extraout_ECX + 0x3c) != 0)) {
                    local_34[iVar5] = uVar8;
                  }
                }
              }
            }
            local_14 = local_14 + 1;
            piVar6 = piVar6 + 1;
          } while (local_14 < local_1c);
        }
      }
      local_10 = local_10 + 1;
      local_c = (int *)((int)local_c - 1);
    } while (local_c != (int *)0x0);
  }
  local_c = (int *)0x0;
  local_8 = local_34;
  do {
    if (*local_8 != 0) {
      iVar5 = FUN_10085814();
      if (iVar5 == 0) {
        iVar5 = 0;
      }
      else {
        iVar5 = FUN_10085379();
      }
      if (iVar5 == 0) {
        return 0x8007000e;
      }
      uVar8 = *local_8;
      uVar8 = FUN_1008585f(uVar8 & 0xfffff | 0x72100000,uVar8,uVar8,0);
      if ((int)uVar8 < 0) {
        return uVar8;
      }
      uVar8 = 0;
      if (*local_8 != 0) {
        do {
          uVar2 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,uVar8,0);
          *(undefined4 *)(*(int *)(iVar5 + 0x10) + uVar8 * 4) = uVar2;
          if (*(int *)(*(int *)(iVar5 + 0x10) + uVar8 * 4) == -1) {
            FUN_1006c418();
            return 0x8007000e;
          }
          uVar8 = uVar8 + 1;
        } while (uVar8 < *local_8);
      }
      uVar8 = FUN_100a9f26(*(undefined4 *)(in_ECX + 0x18),*(undefined4 *)(in_ECX + 0xc),3,local_c,
                           *local_8,*(undefined4 *)(iVar5 + 0x10));
      if ((int)uVar8 < 0) {
        FUN_1006c418();
        return uVar8;
      }
      uVar8 = 0;
      if (*local_8 != 0) {
        do {
          iVar3 = FUN_10086139(*(undefined4 *)(in_ECX + 0x80),local_c,uVar8,0);
          if (iVar3 == -1) {
            FUN_1006c418();
            return 0x8007000e;
          }
          iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + iVar3 * 4);
          *(undefined4 *)(iVar1 + 0x3c) = 0;
          *(uint *)(iVar1 + 0x6c) = (int)local_c << 8 | 3;
          *(int *)(*(int *)(iVar5 + 8) + uVar8 * 4) = iVar3;
          uVar8 = uVar8 + 1;
        } while (uVar8 < *local_8);
      }
      local_14 = FUN_10086026();
      if ((int)local_14 < 0) {
        return local_14;
      }
    }
    local_c = (int *)((int)local_c + 1);
    local_8 = local_8 + 1;
  } while (local_c < (int *)0x6);
  local_8 = (uint *)0x0;
  if (local_18 != 0) {
    do {
      puVar7 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_8 * 4);
      local_10 = (int *)(*puVar7 & 0xfffff);
      uVar9 = FUN_100a6e19();
      iVar5 = (int)((ulonglong)uVar9 >> 0x20);
      if (((int)uVar9 != 0) || (iVar5 == 0x11000000)) {
        if (iVar5 == 0x11000000) {
          iVar5 = *(int *)puVar7[2];
        }
        else {
          iVar5 = ((int *)puVar7[2])[extraout_ECX_00];
        }
        iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar5 * 4);
        if (((*(byte *)(iVar5 + 0x3e) & 0x1f) != 0) &&
           (*(int *)(iVar5 + 4) == *(int *)(in_ECX + 0x88))) {
          iVar5 = FUN_10085814();
          if (iVar5 == 0) {
            iVar5 = 0;
          }
          else {
            iVar5 = FUN_10085379();
          }
          if (iVar5 == 0) {
            return 0x8007000e;
          }
          local_14 = FUN_1008585f((uint)local_10 & 0xfffff | 0x10000000,local_10,local_10,0);
          if ((int)local_14 < 0) {
            return local_14;
          }
          uVar8 = *puVar7 & 0xfffff;
          if ((*puVar7 & 0xfff00000) == 0x11000000) {
            uVar8 = 0;
          }
          local_c = (int *)0x0;
          if (local_10 != (int *)0x0) {
            local_14 = uVar8 << 2;
            do {
              local_1c = *(uint *)(*(int *)(in_ECX + 0x14) + *(int *)(local_14 + puVar7[2]) * 4);
              *(int *)(*(int *)(iVar5 + 8) + (int)local_c * 4) = *(int *)(local_14 + puVar7[2]);
              uVar2 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,*(undefined4 *)(local_1c + 0x10)
                                   ,0);
              piVar6 = (int *)((int)local_c + 1);
              *(undefined4 *)(*(int *)(iVar5 + 0x10) + (int)local_c * 4) = uVar2;
              uVar8 = local_14 + 4;
              *(undefined4 *)(local_14 + puVar7[2]) =
                   *(undefined4 *)(*(int *)(iVar5 + 0x10) + (int)local_c * 4);
              local_14 = uVar8;
              local_c = piVar6;
            } while (piVar6 < local_10);
          }
          local_14 = FUN_10086026();
          if ((int)local_14 < 0) {
            return local_14;
          }
        }
      }
      local_8 = (uint *)((int)local_8 + 1);
    } while (local_8 < local_18);
  }
  uVar8 = 0;
  if (local_18 != 0) {
    do {
      uVar4 = FUN_10086292();
      if ((int)uVar4 < 0) {
        return uVar4;
      }
      **(undefined4 **)(*(int *)(in_ECX + 0x18) + uVar8 * 4) = 0;
      uVar8 = uVar8 + 1;
    } while (uVar8 < local_18);
  }
  local_14 = *(uint *)(in_ECX + 0xc);
  local_18 = 0;
  if (local_14 != 0) {
    do {
      puVar7 = *(uint **)(*(int *)(in_ECX + 0x18) + local_18 * 4);
      if (*puVar7 != 0) {
        local_10 = (int *)(*puVar7 & 0xfffff);
        iVar5 = FUN_100a6e19();
        if ((iVar5 != 0) || (extraout_ECX_01 == 0x11000000)) {
          local_1c = (-(uint)(extraout_ECX_01 != 0x11000000) & (uint)local_10) * 4;
          iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_1c + puVar7[2]) * 4);
          uVar8 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4);
          if (((uVar8 & 0x200) != 0) ||
             (((uVar8 & 0x10) != 0 && (*(char *)(iVar5 + 0x6c) == '\x01')))) {
            iVar5 = FUN_10085814();
            if (iVar5 == 0) {
              local_8 = (uint *)0x0;
            }
            else {
              local_8 = (uint *)FUN_10085379();
            }
            if (local_8 == (uint *)0x0) {
              return 0x8007000e;
            }
            uVar8 = FUN_1008585f((uint)local_10 & 0xfffff | 0x10000000,local_10,local_10,0);
            if ((int)uVar8 < 0) {
              return uVar8;
            }
            uVar8 = FUN_100853b0();
            if ((int)uVar8 < 0) {
              return uVar8;
            }
            local_c = (int *)0x0;
            if (local_10 != (int *)0x0) {
              uVar8 = puVar7[2];
              uVar4 = local_1c;
              do {
                *(undefined4 *)(*(int *)((int)local_8 + 8) + (int)local_c * 4) =
                     *(undefined4 *)(uVar8 + uVar4);
                uVar2 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,local_c,0);
                *(undefined4 *)(*(int *)((int)local_8 + 0x10) + (int)local_c * 4) = uVar2;
                *(undefined4 *)(uVar4 + puVar7[2]) =
                     *(undefined4 *)(*(int *)((int)local_8 + 0x10) + (int)local_c * 4);
                uVar8 = puVar7[2];
                if (*(int *)(uVar8 + uVar4) == -1) {
                  return 0x8007000e;
                }
                local_c = (int *)((int)local_c + 1);
                uVar4 = uVar4 + 4;
              } while (local_c < local_10);
            }
            FUN_10086026();
          }
        }
        FUN_10086292();
        *puVar7 = 0;
      }
      local_18 = local_18 + 1;
    } while (local_18 < local_14);
  }
  uVar8 = FUN_10086eae();
  return uVar8;
}


