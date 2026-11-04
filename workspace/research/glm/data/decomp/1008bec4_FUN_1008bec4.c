// 1008bec4 size=1202 FUN_1008bec4

bool FUN_1008bec4(void)

{
  uint *puVar1;
  int iVar2;
  bool bVar3;
  uint uVar4;
  int *piVar5;
  int in_ECX;
  uint uVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  uint uVar10;
  bool bVar11;
  uint local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  bVar3 = false;
  FUN_1008a979();
  uVar6 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
      uVar6 = uVar6 + 1;
      *(uint *)(iVar8 + 0x54) =
           -(uint)((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 4) &
                   0x10020) != 0) & 2;
    } while (uVar6 < *(uint *)(in_ECX + 8));
  }
  iVar8 = *(int *)(in_ECX + 0xc);
  while (uVar6 = 0, iVar8 != 0) {
    iVar8 = iVar8 + -1;
    puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar8 * 4);
    if (((*puVar1 & 0xfff00000) == 0x20900000) && (puVar1[3] != 0)) {
      do {
        iVar9 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(puVar1[4] + uVar6 * 4) * 4);
        if (*(int *)(iVar9 + 0x54) != 2) {
          *(undefined4 *)(iVar9 + 0x54) = 1;
        }
        uVar6 = uVar6 + 1;
      } while (uVar6 < puVar1[3]);
    }
  }
  do {
    local_10 = *(int *)(in_ECX + 0xc);
    bVar11 = false;
    if (local_10 == 0) break;
    do {
      local_10 = local_10 + -1;
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_10 * 4);
      uVar6 = *puVar1;
      if ((uVar6 & 0xfff00000) != 0) {
        if (((uVar6 & 0xf0000000) < 0x10000000) || (0x40000000 < (uVar6 & 0xf0000000))) {
          uVar6 = puVar1[3];
          local_8 = 0;
          if (uVar6 != 0) {
            piVar5 = (int *)puVar1[4];
            local_1c = uVar6;
            do {
              uVar10 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4) + 0x54);
              if (local_8 < uVar10) {
                local_8 = uVar10;
              }
              piVar5 = piVar5 + 1;
              local_1c = local_1c - 1;
            } while (local_1c != 0);
            if (local_8 == 1) {
              bVar11 = true;
            }
          }
          uVar10 = 0;
          if (uVar6 != 0) {
            do {
              FUN_1008be66(*(undefined4 *)(puVar1[4] + uVar10 * 4),local_8);
              uVar10 = uVar10 + 1;
            } while (uVar10 < puVar1[3]);
          }
          uVar6 = 0;
          if (puVar1[1] != 0) {
            do {
              FUN_1008be66(*(undefined4 *)(puVar1[2] + uVar6 * 4),local_8);
              uVar6 = uVar6 + 1;
            } while (uVar6 < puVar1[1]);
          }
        }
        else {
          uVar6 = puVar1[1] / (uVar6 & 0xfffff);
          local_8 = 0;
          if (puVar1[3] != 0) {
            do {
              iVar8 = *(int *)(puVar1[4] + local_8 * 4);
              iVar9 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar8 * 4) + 0x54);
              if (iVar9 == 1) {
                bVar11 = true;
              }
              FUN_1008be66(iVar8,iVar9);
              local_c = 0;
              if (uVar6 != 0) {
                do {
                  FUN_1008be66(*(undefined4 *)(puVar1[2] + (puVar1[3] * local_c + local_8) * 4),
                               iVar9);
                  local_c = local_c + 1;
                } while (local_c < uVar6);
              }
              local_8 = local_8 + 1;
            } while (local_8 < puVar1[3]);
          }
        }
      }
    } while (local_10 != 0);
    if (!bVar11) break;
    bVar11 = false;
    local_c = 0;
    if (*(int *)(in_ECX + 0xc) == 0) break;
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_c * 4);
      if ((*puVar1 & 0xfff00000) == 0x20900000) {
        uVar6 = puVar1[3];
        local_8 = 0;
        if (uVar6 != 0) {
          do {
            iVar8 = *(int *)(in_ECX + 0x14);
            iVar9 = *(int *)(iVar8 + *(int *)(puVar1[4] + local_8 * 4) * 4);
            if (*(int *)(iVar9 + 0x54) == 1) {
              iVar7 = *(int *)(puVar1[2] + (uVar6 + local_8) * 4);
              if ((iVar7 != -1) &&
                 (iVar2 = *(int *)(*(int *)(iVar8 + iVar7 * 4) + 0x38), iVar2 != -1)) {
                iVar7 = iVar2;
              }
              local_10 = 0;
              iVar2 = *(int *)(*(int *)(in_ECX + 0x18) +
                              *(int *)(*(int *)(iVar8 + iVar7 * 4) + 0x48) * 4);
              if (*(int *)(iVar2 + 0xc) != 0) {
                piVar5 = *(int **)(iVar2 + 0x10);
                do {
                  if (*piVar5 == iVar7) break;
                  local_10 = local_10 + 1;
                  piVar5 = piVar5 + 1;
                } while (local_10 < *(uint *)(iVar2 + 0xc));
              }
              iVar7 = *(int *)(*(int *)(iVar2 + 8) + local_10 * 4);
              if ((iVar7 != -1) &&
                 (iVar2 = *(int *)(*(int *)(iVar8 + iVar7 * 4) + 0x38), iVar2 != -1)) {
                iVar7 = iVar2;
              }
              iVar8 = *(int *)(*(int *)(iVar8 + iVar7 * 4) + 0x54);
              if (iVar8 != 1) {
                *(int *)(iVar9 + 0x54) = iVar8;
                bVar11 = true;
              }
            }
            local_8 = local_8 + 1;
            uVar6 = puVar1[3];
          } while (local_8 < uVar6);
        }
      }
      local_c = local_c + 1;
    } while (local_c < *(uint *)(in_ECX + 0xc));
  } while (bVar11);
  local_14 = 0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar1 = *(uint **)(*(int *)(in_ECX + 0x18) + local_14 * 4);
      uVar6 = *puVar1;
      if ((uVar6 & 0xfff00000) != 0) {
        if (((uVar6 & 0xf0000000) < 0x10000000) || (0x40000000 < (uVar6 & 0xf0000000))) {
          uVar6 = 0;
          bVar11 = puVar1[3] == 0;
          if (puVar1[3] != 0) {
            piVar5 = (int *)puVar1[4];
            do {
              if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar5 * 4) + 0x54) == 2) break;
              uVar6 = uVar6 + 1;
              piVar5 = piVar5 + 1;
            } while (uVar6 < puVar1[3]);
            bVar11 = uVar6 == puVar1[3];
          }
          if (bVar11) {
            uVar6 = 0;
            *puVar1 = 0;
            puVar1[3] = 0;
            goto LAB_1008c2ec;
          }
        }
        else {
          uVar6 = puVar1[1] / (uVar6 & 0xfffff);
          uVar10 = 0;
          bVar11 = puVar1[3] == 0;
          local_8 = 0;
          if (puVar1[3] != 0) {
            do {
              iVar8 = *(int *)(puVar1[4] + local_8 * 4);
              if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar8 * 4) + 0x54) == 2) {
                local_10 = 0;
                *(int *)(puVar1[4] + uVar10 * 4) = iVar8;
                if (uVar6 != 0) {
                  do {
                    iVar8 = puVar1[3] * local_10;
                    local_10 = local_10 + 1;
                    *(undefined4 *)(puVar1[2] + (iVar8 + uVar10) * 4) =
                         *(undefined4 *)(puVar1[2] + (local_8 + iVar8) * 4);
                  } while (local_10 < uVar6);
                }
                uVar10 = uVar10 + 1;
              }
              local_8 = local_8 + 1;
            } while (local_8 < puVar1[3]);
            bVar11 = uVar10 == puVar1[3];
          }
          if (!bVar11) {
            if (uVar10 == 0) {
              uVar4 = 0;
            }
            else {
              uVar4 = (*puVar1 ^ uVar10) & 0xfffff ^ *puVar1;
            }
            *puVar1 = uVar4;
            local_8 = 1;
            if (1 < uVar6) {
              local_18 = uVar10 << 2;
              do {
                local_10 = 0;
                iVar8 = local_18;
                if (uVar10 != 0) {
                  do {
                    iVar9 = puVar1[3] * local_8 + local_10;
                    local_10 = local_10 + 1;
                    *(undefined4 *)(iVar8 + puVar1[2]) = *(undefined4 *)(puVar1[2] + iVar9 * 4);
                    iVar8 = iVar8 + 4;
                  } while (local_10 < uVar10);
                }
                local_8 = local_8 + 1;
                local_18 = local_18 + uVar10 * 4;
              } while (local_8 < uVar6);
            }
            uVar6 = uVar10 * uVar6;
            puVar1[3] = uVar10;
LAB_1008c2ec:
            puVar1[1] = uVar6;
            bVar3 = true;
          }
        }
      }
      local_14 = local_14 + 1;
    } while (local_14 < *(uint *)(in_ECX + 0xc));
  }
  uVar6 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar6 * 4);
      if ((uVar6 == 0xffffffff) ||
         (uVar10 = *(uint *)(iVar8 + 0x38), *(uint *)(iVar8 + 0x38) == 0xffffffff)) {
        uVar10 = uVar6;
      }
      if (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar10 * 4) + 0x54) != 2) {
        iVar9 = *(int *)(iVar8 + 4);
        if (((*(int *)(in_ECX + 0x74) != iVar9) &&
            ((*(int *)(iVar8 + 8) != -1 ||
             ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar9 * 4) + 5) & 4) == 0)))) &&
           ((uVar10 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + iVar9 * 4) + 4),
            (uVar10 & 0x100) == 0 || ((uVar10 & 0x800) == 0)))) {
          *(int *)(iVar8 + 4) = *(int *)(in_ECX + 0x74);
          bVar3 = true;
        }
      }
      uVar6 = uVar6 + 1;
    } while (uVar6 < *(uint *)(in_ECX + 8));
  }
  return !bVar3;
}


