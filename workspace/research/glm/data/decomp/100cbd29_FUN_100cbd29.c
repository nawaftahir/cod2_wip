// 100cbd29 size=1170 FUN_100cbd29

undefined4 FUN_100cbd29(uint param_1)

{
  int iVar1;
  int iVar2;
  int *piVar3;
  int in_ECX;
  uint uVar4;
  uint uVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  undefined4 *puVar9;
  int iVar10;
  undefined4 *puVar11;
  uint local_54;
  int local_50;
  undefined4 *local_4c;
  int local_48;
  int local_44;
  uint local_40;
  uint local_3c;
  int local_38;
  uint local_34;
  uint local_30;
  int local_2c;
  int local_28;
  uint local_24;
  int local_20;
  uint local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  local_44 = 0;
  local_10 = param_1 + 1;
  iVar6 = *(int *)(*(int *)(in_ECX + 0x3c) + param_1 * 4);
  local_14 = param_1;
  iVar2 = iVar6 * 4;
  if (*(int *)(iVar2 + *(int *)(in_ECX + 0x34)) != 0) {
    return 1;
  }
  iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) +
                  **(int **)(*(int *)(iVar2 + *(int *)(*(int *)(in_ECX + 4) + 0x18)) + 0x10) * 4);
  local_28 = *(int *)(iVar1 + 0x14);
  local_38 = *(int *)(iVar1 + 0x18);
  local_18 = *(uint *)(iVar2 + *(int *)(in_ECX + 8));
  puVar9 = (undefined4 *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + *(int *)(in_ECX + 0xc)) * 4);
  puVar11 = *(undefined4 **)(in_ECX + 0x14);
  for (uVar4 = local_18; uVar4 != 0; uVar4 = uVar4 - 1) {
    *puVar11 = *puVar9;
    puVar9 = puVar9 + 1;
    puVar11 = puVar11 + 1;
  }
LAB_100cbd9b:
  local_8 = 0;
  *(int *)(in_ECX + 0x48) = *(int *)(in_ECX + 0x48) + 1;
  for (uVar4 = local_14; uVar4 < local_10; uVar4 = uVar4 + 1) {
    iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) +
                    *(int *)(*(int *)(in_ECX + 0x3c) + uVar4 * 4) * 4);
    uVar5 = 0;
    if (*(int *)(iVar2 + 0x14) != 0) {
      do {
        iVar1 = uVar5 * 4;
        uVar5 = uVar5 + 1;
        *(undefined4 *)
         (*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) +
                  *(int *)(*(int *)(iVar2 + 0x18) + iVar1) * 4) + 0x24) =
             *(undefined4 *)(in_ECX + 0x48);
      } while (uVar5 < *(uint *)(iVar2 + 0x14));
    }
    uVar5 = 0;
    if (*(int *)(iVar2 + 0x1c) != 0) {
      do {
        iVar1 = uVar5 * 4;
        uVar5 = uVar5 + 1;
        *(undefined4 *)
         (*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) +
                  *(int *)(*(int *)(iVar2 + 0x20) + iVar1) * 4) + 0x24) =
             *(undefined4 *)(in_ECX + 0x48);
      } while (uVar5 < *(uint *)(iVar2 + 0x1c));
    }
    local_8 = local_8 + *(int *)(*(int *)(in_ECX + 0x28) +
                                *(int *)(*(int *)(in_ECX + 0x3c) + uVar4 * 4) * 4);
  }
  uVar4 = 0;
  if (local_18 != 0) {
    do {
      iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + uVar4 * 4);
      *(undefined4 *)(iVar2 + 0x30) = *(undefined4 *)(in_ECX + 0x48);
      uVar4 = uVar4 + 1;
      *(uint *)(iVar2 + 0x54) = (uint)(iVar6 == *(int *)(iVar2 + 0x74));
    } while (uVar4 < local_18);
  }
  do {
    if (local_8 < 0) {
      local_2c = -1;
      local_c = local_14;
      local_3c = local_14;
    }
    else {
      if (local_8 < 1) goto LAB_100cc186;
      local_3c = local_10 - 1;
      local_c = local_10;
      local_2c = 1;
    }
    local_24 = 0;
    local_20 = 0;
    local_1c = 0;
    param_1 = local_c;
    do {
      local_3c = local_3c + local_2c;
      if (*(uint *)(in_ECX + 0x38) <= local_3c) break;
      local_48 = *(int *)(*(int *)(in_ECX + 0x3c) + local_3c * 4);
      iVar2 = local_48 * 4;
      if (*(int *)(iVar2 + *(int *)(in_ECX + 0x34)) == 0) {
        iVar1 = *(int *)(in_ECX + 4);
        local_50 = *(int *)(*(int *)(iVar1 + 0x14) +
                           **(int **)(*(int *)(*(int *)(iVar1 + 0x18) + iVar2) + 0x10) * 4);
        iVar10 = *(int *)(local_50 + 0x18);
        for (iVar7 = *(int *)(local_50 + 0x14); iVar7 != -1; iVar7 = *(int *)(iVar7 + 0x14)) {
          if (local_28 == iVar7) goto LAB_100cbecd;
          iVar7 = *(int *)(*(int *)(iVar1 + 0x14) + iVar7 * 4);
          iVar10 = *(int *)(iVar7 + 0x18);
        }
        if (local_28 != -1) goto LAB_100cc186;
LAB_100cbecd:
        if (local_38 != iVar10) goto LAB_100cc186;
      }
      if (local_3c < local_c) {
        local_c = local_3c;
      }
      if (param_1 <= local_3c) {
        param_1 = local_3c + 1;
      }
      local_4c = (undefined4 *)
                 (*(int *)(in_ECX + 0x10) + *(int *)(iVar2 + *(int *)(in_ECX + 0xc)) * 4);
      local_34 = *(uint *)(iVar2 + *(int *)(in_ECX + 8));
      puVar9 = local_4c;
      puVar11 = (undefined4 *)(*(int *)(in_ECX + 0x18) + local_24 * 4);
      for (uVar4 = local_34; uVar4 != 0; uVar4 = uVar4 - 1) {
        *puVar11 = *puVar9;
        puVar9 = puVar9 + 1;
        puVar11 = puVar11 + 1;
      }
      local_24 = local_24 + *(int *)(iVar2 + *(int *)(in_ECX + 8));
      local_20 = local_20 + *(int *)(*(int *)(in_ECX + 0x28) + iVar2);
      local_1c = local_1c |
                 *(int *)(in_ECX + 0x48) ==
                 *(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) + iVar2) + 0x24);
      local_30 = 0;
      if (local_34 != 0) {
        do {
          iVar1 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + local_4c[local_30] * 4);
          if ((*(int *)(iVar1 + 0x30) != *(int *)(in_ECX + 0x48)) ||
             (local_48 == *(int *)(iVar1 + 0x74))) {
            *(int *)(iVar1 + 0x30) = *(int *)(in_ECX + 0x48);
            *(uint *)(iVar1 + 0x54) = (local_48 != *(int *)(iVar1 + 0x74)) - 1;
          }
          local_30 = local_30 + 1;
        } while (local_30 < local_34);
      }
    } while (((*(int *)(iVar2 + *(int *)(in_ECX + 0x34)) != 0) ||
             (local_28 != *(int *)(local_50 + 0x14))) || (local_38 != *(int *)(local_50 + 0x18)));
    if (param_1 <= local_c) {
LAB_100cc186:
      if (local_44 == 0) {
        return 1;
      }
      puVar9 = *(undefined4 **)(in_ECX + 0x40);
      puVar11 = *(undefined4 **)(in_ECX + 0x3c);
      for (uVar4 = *(uint *)(in_ECX + 0x38) & 0x3fffffff; uVar4 != 0; uVar4 = uVar4 - 1) {
        *puVar11 = *puVar9;
        puVar9 = puVar9 + 1;
        puVar11 = puVar11 + 1;
      }
      for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
        *(undefined1 *)puVar11 = *(undefined1 *)puVar9;
        puVar9 = (undefined4 *)((int)puVar9 + 1);
        puVar11 = (undefined4 *)((int)puVar11 + 1);
      }
      FUN_100cbc0c(0,0);
      return 1;
    }
    if (local_c + 1 < param_1) {
      FUN_100cbbc6(*(undefined4 *)(in_ECX + 0x18),&local_24);
    }
    if (local_1c == 0) {
      if (local_8 < 0) {
        local_2c = local_20;
        if (local_24 != 0) {
          piVar3 = *(int **)(in_ECX + 0x18);
          uVar4 = local_24;
          do {
            if (*(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + *piVar3 * 4) + 0x54) == 1)
            {
              local_2c = local_2c + -1;
            }
            piVar3 = piVar3 + 1;
            uVar4 = uVar4 - 1;
          } while (uVar4 != 0);
        }
        if (local_2c < local_8) {
LAB_100cc039:
          local_1c = 1;
        }
      }
      else {
        local_2c = local_8;
        if (local_18 != 0) {
          piVar3 = *(int **)(in_ECX + 0x14);
          uVar4 = local_18;
          do {
            if (*(int *)(*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) + *piVar3 * 4) + 0x54) == -1
               ) {
              local_2c = local_2c + -1;
            }
            piVar3 = piVar3 + 1;
            uVar4 = uVar4 - 1;
          } while (uVar4 != 0);
        }
        if (local_2c < local_20) goto LAB_100cc039;
      }
    }
    uVar4 = local_14;
    if (local_c <= local_14) {
      uVar4 = local_c;
    }
    uVar5 = local_10;
    if (local_10 <= param_1) {
      uVar5 = param_1;
    }
    if (local_1c == 0) break;
    uVar8 = 0;
    if (local_24 != 0) {
      do {
        iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x14) +
                        *(int *)(*(int *)(in_ECX + 0x18) + uVar8 * 4) * 4);
        uVar8 = uVar8 + 1;
        *(uint *)(iVar2 + 0x54) = (uint)(*(int *)(iVar2 + 0x54) != 0);
      } while (uVar8 < local_24);
    }
    local_8 = local_8 + local_20;
    puVar9 = *(undefined4 **)(in_ECX + 0x18);
    puVar11 = (undefined4 *)(*(int *)(in_ECX + 0x14) + local_18 * 4);
    for (uVar8 = local_24; uVar8 != 0; uVar8 = uVar8 - 1) {
      *puVar11 = *puVar9;
      puVar9 = puVar9 + 1;
      puVar11 = puVar11 + 1;
    }
    local_18 = local_18 + local_24;
    local_14 = uVar4;
    local_10 = uVar5;
    FUN_100cbbc6(*(undefined4 *)(in_ECX + 0x14),&local_18);
    uVar4 = local_c;
    do {
      iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) +
                      *(int *)(*(int *)(in_ECX + 0x3c) + uVar4 * 4) * 4);
      uVar5 = 0;
      if (*(int *)(iVar2 + 0x14) != 0) {
        do {
          iVar1 = uVar5 * 4;
          uVar5 = uVar5 + 1;
          *(undefined4 *)
           (*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) +
                    *(int *)(*(int *)(iVar2 + 0x18) + iVar1) * 4) + 0x24) =
               *(undefined4 *)(in_ECX + 0x48);
        } while (uVar5 < *(uint *)(iVar2 + 0x14));
      }
      uVar5 = 0;
      if (*(int *)(iVar2 + 0x1c) != 0) {
        do {
          iVar1 = uVar5 * 4;
          uVar5 = uVar5 + 1;
          *(undefined4 *)
           (*(int *)(*(int *)(*(int *)(in_ECX + 4) + 0x18) +
                    *(int *)(*(int *)(iVar2 + 0x20) + iVar1) * 4) + 0x24) =
               *(undefined4 *)(in_ECX + 0x48);
        } while (uVar5 < *(uint *)(iVar2 + 0x1c));
      }
      uVar4 = uVar4 + 1;
    } while (uVar4 < param_1);
  } while( true );
  FUN_100cbb1b(local_14,local_10);
  FUN_100cbb1b(local_c,param_1);
  FUN_100cbb1b(uVar4,uVar5);
  FUN_100cbc0c(&local_40,&local_54);
  if (((local_40 < *(uint *)(in_ECX + 0x50)) && (local_54 <= *(uint *)(in_ECX + 0x4c))) ||
     ((local_40 <= *(uint *)(in_ECX + 0x50) && (local_54 < *(uint *)(in_ECX + 0x4c))))) {
    return 0;
  }
  if (local_8 < 0) {
    iVar2 = local_c - param_1;
  }
  else {
    iVar2 = param_1 - local_c;
  }
  local_14 = local_14 + iVar2;
  local_10 = local_10 + iVar2;
  local_44 = 1;
  goto LAB_100cbd9b;
}


