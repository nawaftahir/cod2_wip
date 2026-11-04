// 1008d26d size=696 FUN_1008d26d

undefined4 FUN_1008d26d(void)

{
  uint *puVar1;
  uint uVar2;
  uint *puVar3;
  uint *puVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  bool bVar8;
  int iVar9;
  int *piVar10;
  uint uVar11;
  int iVar12;
  int iVar13;
  int in_ECX;
  uint uVar14;
  uint uVar15;
  int local_1c;
  int local_18;
  uint local_10;
  uint local_c;
  uint local_8;
  
  if ((*(byte *)(in_ECX + 0x6c) & 1) == 0) {
    bVar8 = false;
    FUN_1008a979();
    iVar9 = *(int *)(in_ECX + 0xc);
    if (iVar9 != 0) {
      do {
        iVar9 = iVar9 + -1;
        puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar9 * 4);
        if (((*puVar1 & 0xfff00000) == 0x10000000) || ((*puVar1 & 0xfff00000) == 0x20700000)) {
          local_c = 0;
          if (puVar1[3] != 0) {
            piVar10 = (int *)puVar1[4];
            do {
              if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                     *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar10 * 4) + 4)
                                     * 4) + 4) & 0x20) == 0) break;
              local_c = local_c + 1;
              piVar10 = piVar10 + 1;
            } while (local_c < puVar1[3]);
          }
          if (puVar1[3] <= local_c) {
            local_c = 0;
            if (puVar1[1] != 0) {
              piVar10 = (int *)puVar1[2];
              do {
                if ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                       *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar10 * 4) + 4
                                               ) * 4) + 4) & 2) == 0) break;
                local_c = local_c + 1;
                piVar10 = piVar10 + 1;
              } while (local_c < puVar1[1]);
            }
            if (puVar1[1] <= local_c) {
              uVar14 = *puVar1 & 0xfffff;
              uVar11 = puVar1[1] / uVar14;
              local_10 = 0;
              if (uVar11 != 0) {
                local_1c = 0;
                do {
                  local_c = 0;
                  if (uVar14 != 0) {
                    local_18 = local_1c;
                    do {
                      iVar13 = *(int *)(*(int *)(in_ECX + 0x18) +
                                       *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                        *(int *)(local_18 + puVar1[2]) * 4) + 0x48)
                                       * 4);
                      iVar12 = FUN_1008540c();
                      local_8 = 0;
                      uVar2 = *(uint *)(iVar13 + 0xc);
                      if (uVar2 != 0) {
                        piVar10 = *(int **)(iVar13 + 0x10);
                        do {
                          iVar13 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar10 * 4);
                          if (((1 < *(uint *)(iVar13 + 0x5c)) || (*(int *)(iVar13 + 0x54) != iVar9))
                             || ((iVar12 != 0 &&
                                 (local_8 !=
                                  *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                    *(int *)(puVar1[4] + local_c * 4) * 4) + 0x10)))
                                )) break;
                          local_8 = local_8 + 1;
                          piVar10 = piVar10 + 1;
                        } while (local_8 < uVar2);
                      }
                      if (local_8 < uVar2) break;
                      local_c = local_c + 1;
                      local_18 = local_18 + 4;
                    } while (local_c < uVar14);
                    if (local_c < uVar14) break;
                  }
                  local_10 = local_10 + 1;
                  local_1c = local_1c + uVar14 * 4;
                } while (local_10 < uVar11);
                if (local_10 < uVar11) goto LAB_1008d508;
              }
              local_10 = 0;
              if (puVar1[3] != 0) {
                do {
                  iVar13 = local_10 * 4;
                  puVar3 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar13 + puVar1[4]) * 4);
                  for (uVar2 = uVar11; uVar2 != 0; uVar2 = uVar2 - 1) {
                    puVar4 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar13 + puVar1[2]) * 4);
                    uVar5 = *puVar4;
                    uVar6 = *puVar3;
                    uVar7 = *puVar4;
                    *puVar4 = uVar7 & 0xf1ffffff;
                    uVar15 = uVar6 & 0xe000000;
                    if ((uVar6 & 0xe000000) <= (uVar5 & 0xe000000)) {
                      uVar15 = uVar5 & 0xe000000;
                    }
                    *puVar4 = uVar7 & 0xf1ffffff | uVar15;
                    puVar4[1] = puVar3[1];
                    puVar4[2] = puVar3[2];
                    puVar4[3] = puVar3[3];
                    puVar4[4] = puVar3[4];
                    if (puVar4[0x18] == 0) {
                      puVar4[0x18] = puVar3[0x18];
                      puVar4[0x19] = puVar3[0x19];
                    }
                    puVar4[0x1a] = puVar3[0x1a];
                    puVar4[0x1b] = puVar3[0x1b];
                    puVar4[0x1c] = puVar3[0x1c];
                    iVar13 = iVar13 + uVar14 * 4;
                  }
                  local_10 = local_10 + 1;
                  puVar3[1] = *(uint *)(in_ECX + 0x74);
                } while (local_10 < puVar1[3]);
              }
              bVar8 = true;
              *puVar1 = 0;
              puVar1[1] = 0;
              puVar1[3] = 0;
            }
          }
        }
LAB_1008d508:
      } while (iVar9 != 0);
      if (bVar8) {
        return 0;
      }
    }
  }
  return 1;
}


