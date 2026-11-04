// 100c37fb size=603 FUN_100c37fb

uint * FUN_100c37fb(uint param_1,int param_2,uint *param_3,int *param_4,uint param_5)

{
  uint *puVar1;
  undefined4 uVar2;
  int in_ECX;
  int *piVar3;
  uint uVar4;
  undefined4 *puVar5;
  int iVar6;
  undefined4 *puVar7;
  uint uVar8;
  undefined4 *puVar9;
  bool bVar10;
  undefined4 local_24 [4];
  uint local_14;
  int *local_10;
  uint local_c;
  undefined4 *local_8;
  
  iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(param_2 + 0x10) * 4);
  local_14 = *(uint *)(iVar6 + 0x48);
  local_c = *(uint *)(iVar6 + 0x54);
  if (local_c != 0xffffffff) {
    local_8 = (undefined4 *)0x0;
    if (*(int *)(param_2 + 4) != 0) {
      piVar3 = *(int **)(param_2 + 8);
      do {
        iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar3 * 4);
        if (((*(int *)(in_ECX + 0x88) == *(int *)(iVar6 + 4)) &&
            (uVar8 = *(uint *)(iVar6 + 0x50), local_14 < uVar8)) && (uVar8 < local_c)) {
          return (uint *)0x0;
        }
        local_8 = (undefined4 *)((int)local_8 + 1);
        piVar3 = piVar3 + 1;
      } while (local_8 < *(uint *)(param_2 + 4));
    }
    puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
    if (param_1 == *puVar1) {
      local_8 = (undefined4 *)0x0;
      if (*(int *)(param_2 + 0xc) != 0) {
        local_10 = *(int **)(param_2 + 0x10);
        do {
          iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *local_10 * 4);
          if (*(uint *)(iVar6 + 0x54) != local_c) {
            return (uint *)0x0;
          }
          if (*(uint *)(iVar6 + 0x58) != local_c) {
            return (uint *)0x0;
          }
          if (*(int *)(param_2 + 0xc) == 1) {
            bVar10 = *(int *)(iVar6 + 0x5c) == (param_1 & 0xfffff) * param_5;
          }
          else {
            bVar10 = *(int *)(iVar6 + 0x5c) == param_5;
          }
          if (!bVar10) {
            return (uint *)0x0;
          }
          local_8 = (undefined4 *)((int)local_8 + 1);
          local_10 = local_10 + 1;
        } while (local_8 < *(uint *)(param_2 + 0xc));
      }
      uVar8 = *puVar1 & 0xfffff;
      if ((puVar1[3] == uVar8) && (puVar1[1] <= uVar8 * (int)param_4)) {
        local_8 = (undefined4 *)0x0;
        uVar4 = 0;
        if (puVar1[1] != 0) {
          piVar3 = (int *)puVar1[2];
          do {
            iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar3 * 4);
            if ((*(int *)(in_ECX + 0x88) == *(int *)(iVar6 + 4)) &&
               (local_14 < *(uint *)(iVar6 + 0x48))) {
              return (uint *)0x0;
            }
            local_8 = (undefined4 *)((int)local_8 + 1);
            uVar4 = puVar1[1];
            piVar3 = piVar3 + 1;
          } while (local_8 < uVar4);
        }
        local_8 = (undefined4 *)0x0;
        if (uVar4 != 0) {
          piVar3 = (int *)puVar1[2];
          do {
            if (*piVar3 == **(int **)(param_2 + 0x10)) break;
            local_8 = (undefined4 *)((int)local_8 + 1);
            piVar3 = piVar3 + 1;
          } while (local_8 < uVar4);
        }
        if (local_8 != (undefined4 *)uVar4) {
          if ((uVar8 <= local_8) && (uVar4 = 0, uVar8 != 0)) {
            iVar6 = uVar8 << 2;
            do {
              puVar5 = (undefined4 *)(puVar1[2] + uVar4 * 4);
              uVar2 = *puVar5;
              *puVar5 = *(undefined4 *)(iVar6 + puVar1[2]);
              *(undefined4 *)(iVar6 + puVar1[2]) = uVar2;
              uVar4 = uVar4 + 1;
              iVar6 = iVar6 + 4;
            } while (uVar4 < uVar8);
          }
          if (1 < *(uint *)(param_2 + 0xc)) {
            puVar5 = *(undefined4 **)(param_2 + 8);
            local_8 = puVar5 + *(int *)(param_2 + 4);
            if (puVar5 < puVar5 + *(int *)(param_2 + 4)) {
              do {
                if (uVar8 != 0) {
                  local_10 = *(int **)(param_2 + 0x10);
                  uVar4 = puVar1[2];
                  puVar7 = puVar5;
                  local_14 = uVar8;
                  do {
                    param_5 = 0;
                    param_4 = local_10;
                    do {
                      if (*param_4 == *(int *)((uVar4 - (int)puVar5) + (int)puVar7)) {
                        local_24[param_5] = *puVar7;
                        break;
                      }
                      param_5 = param_5 + 1;
                      param_4 = param_4 + 1;
                    } while (param_5 < uVar8);
                    puVar7 = puVar7 + 1;
                    local_14 = local_14 - 1;
                  } while (local_14 != 0);
                }
                puVar7 = local_24;
                puVar9 = puVar5;
                for (uVar4 = uVar8; uVar4 != 0; uVar4 = uVar4 - 1) {
                  *puVar9 = *puVar7;
                  puVar7 = puVar7 + 1;
                  puVar9 = puVar9 + 1;
                }
                for (iVar6 = 0; iVar6 != 0; iVar6 = iVar6 + -1) {
                  *(undefined1 *)puVar9 = *(undefined1 *)puVar7;
                  puVar7 = (undefined4 *)((int)puVar7 + 1);
                  puVar9 = (undefined4 *)((int)puVar9 + 1);
                }
                puVar5 = puVar5 + uVar8;
              } while (puVar5 < local_8);
            }
          }
          if (param_3 == (uint *)0x0) {
            return puVar1;
          }
          *param_3 = local_c;
          return puVar1;
        }
      }
    }
  }
  return (uint *)0x0;
}


