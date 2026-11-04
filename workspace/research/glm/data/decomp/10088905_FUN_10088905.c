// 10088905 size=1221 FUN_10088905

undefined4 FUN_10088905(uint *param_1)

{
  int iVar1;
  int iVar2;
  uint *puVar3;
  uint uVar4;
  int iVar5;
  undefined4 uVar6;
  int iVar7;
  int in_ECX;
  bool bVar8;
  uint uVar9;
  int local_50;
  int local_4c;
  int local_48;
  int local_44;
  int local_40;
  int local_3c;
  int local_38;
  int local_34;
  uint local_28;
  int local_24;
  uint local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  int local_10;
  uint local_8;
  
  puVar3 = param_1;
  uVar4 = *param_1 & 0xfffff;
  param_1 = (uint *)0x0;
  local_14 = uVar4;
  if (uVar4 != 0) {
    do {
      local_8 = 0;
      if (local_14 < 5) {
        local_8 = local_14;
      }
      else if (uVar4 != 0) {
        local_20 = 0;
        local_24 = uVar4 << 2;
        local_28 = 1;
        do {
          uVar9 = puVar3[2];
          if (*(int *)(uVar9 + local_20) != -1) {
            iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar9 + local_20) * 4);
            iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar9 + local_24) * 4);
            local_1c = 1;
            local_10 = local_24;
            for (uVar9 = local_28; uVar9 < uVar4; uVar9 = uVar9 + 1) {
              local_10 = local_10 + 4;
              if (*(int *)(puVar3[2] + local_10) != -1) {
                iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar3[2] + uVar9 * 4) * 4);
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar3[2] + local_10) * 4);
                if ((((((*(int *)(iVar5 + 4) == *(int *)(iVar1 + 4)) &&
                       (*(int *)(iVar5 + 8) == *(int *)(iVar1 + 8))) &&
                      (*(int *)(iVar5 + 0xc) == *(int *)(iVar1 + 0xc))) &&
                     ((*(int *)(iVar5 + 0x48) == *(int *)(iVar1 + 0x48) &&
                      (*(int *)(iVar7 + 4) == *(int *)(iVar2 + 4))))) &&
                    ((*(int *)(iVar7 + 8) == *(int *)(iVar2 + 8) &&
                     ((*(int *)(iVar7 + 0xc) == *(int *)(iVar2 + 0xc) &&
                      (*(int *)(iVar7 + 0x48) == *(int *)(iVar2 + 0x48))))))) &&
                   (local_1c = local_1c + 1, local_1c == 4)) break;
              }
            }
            if (local_8 < local_1c) {
              local_8 = local_1c;
              local_34 = *(int *)(iVar5 + 4);
              local_44 = *(int *)(iVar7 + 4);
              local_38 = *(int *)(iVar5 + 8);
              local_48 = *(int *)(iVar7 + 8);
              local_3c = *(int *)(iVar5 + 0xc);
              local_40 = *(int *)(iVar5 + 0x48);
              local_4c = *(int *)(iVar7 + 0xc);
              local_50 = *(int *)(iVar7 + 0x48);
            }
            if (local_8 == 4) break;
          }
          local_20 = local_20 + 4;
          local_24 = local_24 + 4;
          bVar8 = local_28 < uVar4;
          local_28 = local_28 + 1;
        } while (bVar8);
      }
      iVar5 = FUN_10086199(local_8 & 0xfffff | 0x50000000,0xffffffff,0xffffffff);
      if (iVar5 == -1) {
        return 0x8007000e;
      }
      iVar5 = *(int *)(*(int *)(in_ECX + 0x18) + iVar5 * 4);
      FUN_100853b0();
      local_28 = 0;
      local_20 = 0;
      if (uVar4 != 0) {
        local_10 = uVar4 << 2;
        local_24 = local_8 << 2;
        do {
          if (local_8 <= local_28) break;
          if (*(int *)(puVar3[2] + local_20 * 4) != -1) {
            iVar7 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar3[2] + local_20 * 4) * 4);
            iVar1 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar3[2] + local_10) * 4);
            if ((local_14 < 5) ||
               ((((local_34 == *(int *)(iVar7 + 4) && (local_38 == *(int *)(iVar7 + 8))) &&
                 (local_3c == *(int *)(iVar7 + 0xc))) &&
                (((local_40 == *(int *)(iVar7 + 0x48) && (local_44 == *(int *)(iVar1 + 4))) &&
                 ((local_48 == *(int *)(iVar1 + 8) &&
                  ((local_4c == *(int *)(iVar1 + 0xc) && (local_50 == *(int *)(iVar1 + 0x48)))))))))
               )) {
              *(undefined4 *)(*(int *)(iVar5 + 8) + local_28 * 4) =
                   *(undefined4 *)(puVar3[2] + local_20 * 4);
              *(undefined4 *)(local_24 + *(int *)(iVar5 + 8)) =
                   *(undefined4 *)(local_10 + puVar3[2]);
              *(undefined4 *)(puVar3[2] + local_20 * 4) = 0xffffffff;
              *(undefined4 *)(local_10 + puVar3[2]) = 0xffffffff;
              local_28 = local_28 + 1;
              local_24 = local_24 + 4;
            }
          }
          local_10 = local_10 + 4;
          local_20 = local_20 + 1;
        } while (local_20 < uVar4);
      }
      if (uVar4 < 5) {
        **(undefined4 **)(iVar5 + 0x10) = *(undefined4 *)puVar3[4];
      }
      else {
        uVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0xffffffff,0xffffffff,0);
        **(undefined4 **)(iVar5 + 0x10) = uVar6;
        if (**(int **)(iVar5 + 0x10) == -1) {
          return 0x8007000e;
        }
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar5 + 0x10) * 4) + 0x14) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4) + 0x14);
        *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar5 + 0x10) * 4) + 0x18) =
             *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4) + 0x18);
      }
      local_14 = local_14 - local_8;
      param_1 = (uint *)((int)param_1 + 1);
    } while (local_14 != 0);
    if (1 < param_1) {
      iVar5 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0xffffffff,0,0x3ff0000000000000);
      if (iVar5 == -1) {
        return 0x8007000e;
      }
      do {
        local_1c = *(int *)(in_ECX + 0xc) - (int)param_1;
        local_18 = 0;
        if (param_1 != (uint *)0x0) {
          local_28 = 0;
          do {
            uVar4 = (int)param_1 - local_28;
            if (4 < (int)param_1 - local_28) {
              uVar4 = 4;
            }
            if (uVar4 == 1) {
              uVar9 = 0x10000001;
            }
            else if (uVar4 == 2) {
              uVar9 = 0x20400001;
            }
            else {
              uVar9 = uVar4 & 0xfffff | 0x50000000;
            }
            iVar7 = FUN_10086199(uVar9,0xffffffff,0xffffffff);
            if (iVar7 == -1) {
              return 0x8007000e;
            }
            iVar7 = *(int *)(*(int *)(in_ECX + 0x18) + iVar7 * 4);
            FUN_100853b0();
            local_14 = 0;
            if (uVar4 != 0) {
              local_20 = uVar4 << 2;
              local_24 = local_1c << 2;
              do {
                *(undefined4 *)(*(int *)(iVar7 + 8) + local_14 * 4) =
                     **(undefined4 **)(*(int *)(local_24 + *(int *)(in_ECX + 0x18)) + 0x10);
                if (2 < uVar4) {
                  *(int *)(local_20 + *(int *)(iVar7 + 8)) = iVar5;
                }
                local_24 = local_24 + 4;
                local_20 = local_20 + 4;
                local_14 = local_14 + 1;
              } while (local_14 < uVar4);
            }
            if (param_1 < 5) {
              **(undefined4 **)(iVar7 + 0x10) = *(undefined4 *)puVar3[4];
            }
            else {
              uVar6 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0xffffffff,0xffffffff,0);
              **(undefined4 **)(iVar7 + 0x10) = uVar6;
              if (**(int **)(iVar7 + 0x10) == -1) {
                return 0x8007000e;
              }
              *(undefined4 *)
               (*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar7 + 0x10) * 4) + 0x14) =
                   *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4) + 0x14)
              ;
              *(undefined4 *)
               (*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(iVar7 + 0x10) * 4) + 0x18) =
                   *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar3[4] * 4) + 0x18)
              ;
            }
            local_1c = local_1c + uVar4;
            local_28 = local_28 + 4;
            local_18 = local_18 + 1;
          } while (local_28 < param_1);
        }
        param_1 = (uint *)local_18;
      } while (1 < local_18);
    }
  }
  return 0;
}


