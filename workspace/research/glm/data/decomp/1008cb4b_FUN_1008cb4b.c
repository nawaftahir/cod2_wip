// 1008cb4b size=1826 FUN_1008cb4b

bool FUN_1008cb4b(void)

{
  uint *puVar1;
  int iVar2;
  int iVar3;
  byte *pbVar4;
  uint *puVar5;
  bool bVar6;
  undefined8 uVar7;
  bool bVar8;
  uint uVar9;
  int iVar10;
  uint uVar11;
  int iVar12;
  int in_ECX;
  int iVar13;
  int iVar14;
  int *piVar15;
  undefined4 *puVar16;
  uint uVar17;
  undefined4 *puVar18;
  bool bVar19;
  int local_34;
  uint local_30;
  int local_28;
  uint local_20;
  int *local_1c;
  uint local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  
  FUN_1008a979();
  local_30 = -1;
  local_34 = -1;
  bVar6 = false;
  local_18 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_18 * 4);
      uVar9 = *puVar1;
      if ((((uVar9 & 0xfff00000) != 0) && (0xfffffff < (uVar9 & 0xf0000000))) &&
         ((uVar9 & 0xf0000000) < 0x40000001)) {
        uVar9 = puVar1[1] / (uVar9 & 0xfffff);
        local_c = 0;
        if (uVar9 != 0) {
          do {
            uVar11 = puVar1[3];
            local_20 = 0;
            local_14 = 0;
            if (uVar11 != 0) {
              do {
                iVar14 = *(int *)(puVar1[2] + (uVar11 * local_c + local_14) * 4);
                iVar12 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + local_14 * 4) * 4);
                if ((**(byte **)(*(int *)(in_ECX + 0x14) + iVar14 * 4) & 1) != 0) {
                  local_28 = *(int *)(iVar12 + 0x18);
                  for (iVar13 = *(int *)(iVar12 + 0x14); iVar13 != -1;
                      iVar13 = *(int *)(iVar13 + 0x14)) {
                    local_10 = 0;
                    iVar10 = *(int *)(*(int *)(in_ECX + 0x18) +
                                     *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar13 * 4) + 0x48)
                                     * 4);
                    if (*(int *)(iVar10 + 0xc) != 0) {
                      local_1c = *(int **)(iVar10 + 0x10);
                      do {
                        if (*local_1c == iVar13) break;
                        local_10 = local_10 + 1;
                        local_1c = local_1c + 1;
                      } while (local_10 < *(uint *)(iVar10 + 0xc));
                    }
                    if (local_28 == 0) {
                      iVar10 = FUN_10087a5d(*(undefined4 *)(*(int *)(iVar10 + 8) + local_10 * 4),
                                            iVar14);
                      if (iVar10 != 0) {
                        *(undefined4 *)(iVar12 + 0x40) = 0;
                        goto LAB_1008cca9;
                      }
                    }
                    else {
                      iVar10 = FUN_10087a5d(iVar14,*(undefined4 *)
                                                    (*(int *)(iVar10 + 8) + local_10 * 4));
                      if (iVar10 != 0) {
                        *(undefined4 *)(iVar12 + 0x40) = 1;
LAB_1008cca9:
                        local_20 = local_20 + 1;
                        break;
                      }
                    }
                    iVar13 = *(int *)(iVar13 * 4 + *(int *)(in_ECX + 0x14));
                    local_28 = *(int *)(iVar13 + 0x18);
                  }
                }
                local_14 = local_14 + 1;
                uVar11 = puVar1[3];
              } while (local_14 < uVar11);
            }
            uVar17 = 0;
            uVar11 = puVar1[3];
            if ((local_20 == uVar11) && (uVar11 != 0)) {
              do {
                iVar14 = *(int *)(*(int *)(in_ECX + 0x14) +
                                 *(int *)(puVar1[2] + (uVar11 * local_c + uVar17) * 4) * 4);
                iVar12 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar14 + 4) * 4);
                if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + uVar17 * 4) * 4
                                     ) + 0x40) == 0) {
                  if (((*(byte *)(iVar12 + 5) & 1) == 0) || (*(double *)(iVar14 + 0x20) != 0.0)) {
                    uVar11 = local_34;
                    if (local_34 == -1) {
                      uVar11 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0);
                      local_34 = uVar11;
                    }
                    goto LAB_1008cd6d;
                  }
                }
                else if (((*(byte *)(iVar12 + 5) & 1) == 0) || (*(double *)(iVar14 + 0x20) != 1.0))
                {
                  uVar11 = local_30;
                  if (local_30 == -1) {
                    uVar11 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0x3ff0000000000000);
                    local_30 = uVar11;
                  }
LAB_1008cd6d:
                  *(uint *)(puVar1[2] + (puVar1[3] * local_c + uVar17) * 4) = uVar11;
                  bVar6 = true;
                }
                uVar11 = puVar1[3];
                uVar17 = uVar17 + 1;
              } while (uVar17 < uVar11);
            }
            local_c = local_c + 1;
          } while (local_c < uVar9);
        }
      }
      local_18 = local_18 + 1;
    } while (local_18 < *(uint *)(in_ECX + 0xc));
  }
  bVar8 = false;
  FUN_1008af0b();
  local_1c = (int *)0x0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4);
      if ((*puVar1 & 0xfff00000) != 0) {
        local_14 = 0;
        if (puVar1[3] != 0) {
          do {
            iVar14 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + local_14 * 4) * 4);
            local_18 = *(int *)(iVar14 + 0x18);
            iVar12 = *(int *)(iVar14 + 0x14);
            while (iVar12 != -1) {
              pbVar4 = *(byte **)(*(int *)(in_ECX + 0x14) + iVar12 * 4);
              if ((*pbVar4 & 0x80) == 0) break;
              bVar6 = *(double *)(pbVar4 + 0x20) == 0.0;
              if (local_18 == 0) {
                if (bVar6) goto LAB_1008cf8a;
LAB_1008ce2e:
                local_18 = 0;
                iVar12 = -1;
              }
              else {
                if (bVar6) goto LAB_1008ce2e;
LAB_1008cf8a:
                iVar12 = *(int *)(iVar12 * 4 + *(int *)(in_ECX + 0x14));
                local_18 = *(int *)(iVar12 + 0x18);
                iVar12 = *(int *)(iVar12 + 0x14);
              }
              bVar6 = true;
            }
            local_14 = local_14 + 1;
            *(int *)(iVar14 + 0x14) = iVar12;
            *(uint *)(iVar14 + 0x18) = local_18;
          } while (local_14 < puVar1[3]);
        }
        uVar9 = *puVar1;
        uVar11 = uVar9 & 0xfff00000;
        if ((uVar11 == 0x10f00000) || (uVar11 == 0x11400000)) {
          uVar9 = 0;
          bVar19 = puVar1[3] == 0;
          local_30 = 0;
          local_18 = 0;
          if (puVar1[3] != 0) {
            do {
              iVar14 = local_18 * 4;
              pbVar4 = *(byte **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar14 + puVar1[4]) * 4);
              puVar5 = *(uint **)(*(int *)(in_ECX + 0x14) + *(int *)(iVar14 + puVar1[2]) * 4);
              if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar5[1] * 4) + 5) & 1) == 0) ||
                 (puVar5[2] != 0xffffffff)) {
                if (((*puVar5 & 4) != 0) && ((*puVar5 & 8) != 0)) {
                  *pbVar4 = *pbVar4 | 0x80;
                  goto LAB_1008d1cb;
                }
                *pbVar4 = *pbVar4 & 0x7f;
              }
              else {
                *pbVar4 = *pbVar4 | 0x80;
                if (*(double *)(puVar5 + 8) == 0.0) {
LAB_1008d1cb:
                  uVar7 = 0;
                }
                else {
                  uVar7 = 0x3ff0000000000000;
                }
                *(undefined8 *)(pbVar4 + 0x20) = uVar7;
              }
              if ((*pbVar4 & 0x80) == 0) {
                *(undefined4 *)(uVar9 * 4 + puVar1[4]) = *(undefined4 *)(iVar14 + puVar1[4]);
                *(undefined4 *)(uVar9 * 4 + puVar1[2]) = *(undefined4 *)(iVar14 + puVar1[2]);
                uVar9 = local_30 + 1;
                local_30 = uVar9;
              }
              local_18 = local_18 + 1;
            } while (local_18 < puVar1[3]);
            bVar19 = uVar9 == puVar1[3];
          }
          if (!bVar19) {
            uVar11 = -(uint)(uVar9 != 0) & (uVar9 & 0xfffff | 0x10f00000);
            puVar1[1] = uVar9;
            puVar1[3] = uVar9;
LAB_1008d23b:
            *puVar1 = uVar11;
LAB_1008d23d:
            bVar6 = true;
          }
        }
        else if ((uVar11 == 0x20700000) || (uVar11 == 0x20800000)) {
          uVar9 = puVar1[1] / (uVar9 & 0xfffff);
          local_10 = 0;
          local_c = 0;
          if (puVar1[3] != 0) {
            do {
              iVar14 = *(int *)(in_ECX + 0x14);
              iVar12 = *(int *)(local_c * 4 + puVar1[4]);
              iVar13 = *(int *)(iVar14 + iVar12 * 4);
              if ((*(int *)(iVar13 + 0x14) != -1) || (*(int *)(iVar13 + 0x18) != 0)) {
                iVar10 = *(int *)(local_c * 4 + puVar1[2]);
                iVar2 = *(int *)(puVar1[2] + (puVar1[3] + local_c) * 4);
                iVar3 = *(int *)(iVar14 + iVar10 * 4);
                if ((*(int *)(iVar3 + 0x14) == -1) && (*(int *)(iVar3 + 0x18) == 0)) {
                  *(undefined4 *)(*(int *)(iVar14 + iVar2 * 4) + 4) = *(undefined4 *)(in_ECX + 0x88)
                  ;
                  *(int *)(iVar13 + 0x30) = iVar2;
                }
                else {
                  iVar14 = *(int *)(iVar14 + iVar2 * 4);
                  if ((*(int *)(iVar14 + 0x14) != -1) || (*(int *)(iVar14 + 0x18) != 0)) {
                    local_18 = 0;
                    *(int *)(puVar1[4] + local_10 * 4) = iVar12;
                    if (uVar9 != 0) {
                      do {
                        iVar14 = puVar1[3] * local_18;
                        local_18 = local_18 + 1;
                        *(undefined4 *)(puVar1[2] + (iVar14 + local_10) * 4) =
                             *(undefined4 *)(puVar1[2] + (local_c + iVar14) * 4);
                      } while (local_18 < uVar9);
                    }
                    local_10 = local_10 + 1;
                    goto LAB_1008d0e0;
                  }
                  *(undefined4 *)(iVar3 + 4) = *(undefined4 *)(in_ECX + 0x88);
                  *(int *)(iVar13 + 0x30) = iVar10;
                }
                bVar8 = true;
              }
LAB_1008d0e0:
              local_c = local_c + 1;
            } while (local_c < puVar1[3]);
          }
          if (local_10 != puVar1[3]) {
            local_18 = 0;
            if (uVar9 != 0) {
              local_20 = 0;
              do {
                puVar18 = (undefined4 *)(local_20 + puVar1[2]);
                local_20 = local_20 + local_10 * 4;
                puVar16 = (undefined4 *)(puVar1[2] + puVar1[3] * local_18 * 4);
                for (uVar11 = local_10 & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
                  *puVar18 = *puVar16;
                  puVar16 = puVar16 + 1;
                  puVar18 = puVar18 + 1;
                }
                local_18 = local_18 + 1;
                for (iVar14 = 0; iVar14 != 0; iVar14 = iVar14 + -1) {
                  *(undefined1 *)puVar18 = *(undefined1 *)puVar16;
                  puVar16 = (undefined4 *)((int)puVar16 + 1);
                  puVar18 = (undefined4 *)((int)puVar18 + 1);
                }
              } while (local_18 < uVar9);
            }
            if (local_10 == 0) {
              uVar11 = 0;
            }
            else {
              uVar11 = (*puVar1 ^ local_10) & 0xfffff ^ *puVar1;
            }
            puVar1[3] = local_10;
            puVar1[1] = uVar9 * local_10;
            goto LAB_1008d23b;
          }
        }
        else if (((uVar9 & 0xf0000000) < 0x10000000) || (0x40000000 < (uVar9 & 0xf0000000))) {
          uVar9 = puVar1[3];
          if (uVar9 != 0) {
            local_20 = 0;
            if (uVar9 != 0) {
              piVar15 = (int *)puVar1[4];
              do {
                iVar14 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar15 * 4);
                if ((*(int *)(iVar14 + 0x14) != -1) || (*(int *)(iVar14 + 0x18) != 0)) {
                  local_20 = local_20 + 1;
                }
                piVar15 = piVar15 + 1;
                uVar9 = uVar9 - 1;
              } while (uVar9 != 0);
              if (local_20 != 0) goto LAB_1008d244;
            }
            uVar11 = 0;
            puVar1[1] = 0;
            puVar1[3] = 0;
            goto LAB_1008d23b;
          }
        }
        else {
          uVar9 = puVar1[1] / (uVar9 & 0xfffff);
          local_c = 0;
          local_10 = 0;
          if (puVar1[3] != 0) {
            do {
              iVar14 = *(int *)(puVar1[4] + local_10 * 4);
              iVar12 = *(int *)(*(int *)(in_ECX + 0x14) + iVar14 * 4);
              if ((*(int *)(iVar12 + 0x14) != -1) || (*(int *)(iVar12 + 0x18) != 0)) {
                local_18 = 0;
                *(int *)(puVar1[4] + local_c * 4) = iVar14;
                if (uVar9 != 0) {
                  do {
                    iVar14 = puVar1[3] * local_18;
                    local_18 = local_18 + 1;
                    *(undefined4 *)(puVar1[2] + (iVar14 + local_c) * 4) =
                         *(undefined4 *)(puVar1[2] + (local_10 + iVar14) * 4);
                  } while (local_18 < uVar9);
                }
                local_c = local_c + 1;
              }
              local_10 = local_10 + 1;
            } while (local_10 < puVar1[3]);
          }
          if (local_c != puVar1[3]) {
            local_18 = 0;
            if (uVar9 != 0) {
              local_20 = 0;
              do {
                puVar16 = (undefined4 *)(puVar1[2] + puVar1[3] * local_18 * 4);
                puVar18 = (undefined4 *)(local_20 + puVar1[2]);
                for (uVar11 = local_c & 0x3fffffff; uVar11 != 0; uVar11 = uVar11 - 1) {
                  *puVar18 = *puVar16;
                  puVar16 = puVar16 + 1;
                  puVar18 = puVar18 + 1;
                }
                local_18 = local_18 + 1;
                for (iVar14 = 0; iVar14 != 0; iVar14 = iVar14 + -1) {
                  *(undefined1 *)puVar18 = *(undefined1 *)puVar16;
                  puVar16 = (undefined4 *)((int)puVar16 + 1);
                  puVar18 = (undefined4 *)((int)puVar18 + 1);
                }
                local_20 = local_20 + local_c * 4;
              } while (local_18 < uVar9);
            }
            if (local_c == 0) {
              uVar11 = 0;
            }
            else {
              uVar11 = (*puVar1 ^ local_c) & 0xfffff ^ *puVar1;
            }
            *puVar1 = uVar11;
            puVar1[3] = local_c;
            puVar1[1] = uVar9 * local_c;
            goto LAB_1008d23d;
          }
        }
      }
LAB_1008d244:
      local_1c = (int *)((int)local_1c + 1);
    } while (local_1c < *(uint *)(in_ECX + 0xc));
    if (bVar8) {
      FUN_1008af24();
    }
  }
  return !bVar6;
}


