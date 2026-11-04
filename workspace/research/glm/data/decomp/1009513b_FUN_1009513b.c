// 1009513b size=6223 FUN_1009513b

uint FUN_1009513b(void)

{
  double dVar1;
  double dVar2;
  int iVar3;
  int iVar4;
  byte *pbVar5;
  double *pdVar6;
  uint uVar7;
  int iVar8;
  int *piVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  undefined4 uVar13;
  undefined4 *puVar14;
  uint *puVar15;
  double *pdVar16;
  int in_ECX;
  double *pdVar17;
  uint *puVar18;
  uint *puVar19;
  int iVar20;
  double *pdVar21;
  bool bVar22;
  int local_74 [4];
  int *local_64 [4];
  undefined1 local_54 [4];
  uint *local_50;
  int local_4c;
  int *local_48;
  double *local_44;
  uint *local_40;
  int local_3c;
  double *local_38;
  double *local_34;
  double *local_30;
  uint *local_2c;
  double *local_28;
  double *local_24;
  double *local_20;
  int local_1c;
  double *local_18;
  double *local_14;
  double *local_10;
  double *local_c;
  int local_8;
  
  local_3c = -1;
  local_1c = -1;
  local_14 = (double *)0x0;
  local_10 = (double *)0x0;
  local_24 = (double *)0x0;
  FUN_1008a979();
  uVar7 = 0;
  local_8 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      *(undefined4 *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4) + 0x40) = 0xffffffff;
      uVar7 = uVar7 + 1;
    } while (uVar7 < *(uint *)(in_ECX + 8));
  }
  local_28 = (double *)0x0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar19 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_28 * 4);
      uVar7 = *puVar19 & 0xfff00000;
      local_2c = puVar19;
      if ((((uVar7 != 0) &&
           ((pdVar21 = (double *)puVar19[3], pdVar21 == (double *)0x0 ||
            ((**(byte **)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) & 0x40) == 0)))) &&
          ((uVar7 == 0x20400000 || (uVar7 == 0x20500000)))) &&
         (local_18 = (double *)0x0, pdVar21 != (double *)0x0)) {
        do {
          local_c = (double *)0x0;
          local_64[0] = (int *)(puVar19[2] + (int)local_18 * 4);
          local_64[1] = (int *)(puVar19[2] + ((int)pdVar21 + (int)local_18) * 4);
          do {
            iVar8 = *(int *)(in_ECX + 0x14);
            local_74[0] = *(int *)(iVar8 + *local_64[0] * 4);
            iVar20 = 1 - (int)local_c;
            local_74[1] = *(undefined4 *)(iVar8 + *local_64[1] * 4);
            if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                    *(int *)(local_74[(int)local_c] + 4) * 4) + 4) & 2) != 0) &&
               (*(int *)(local_74[(int)local_c] + 8) == -1)) {
              local_44 = *(double **)
                          (*(int *)(in_ECX + 0x18) + *(int *)(local_74[(int)local_c] + 0x48) * 4);
              if (((*(uint *)local_44 ^ *puVar19) & 0xfff00000) == 0) {
                pdVar21 = *(double **)((int)local_44 + 0xc);
                pdVar17 = (double *)0x0;
                local_38 = pdVar21;
                if (pdVar21 != (double *)0x0) {
                  piVar9 = *(int **)(local_44 + 2);
                  do {
                    if (*piVar9 == *local_64[(int)local_c]) break;
                    pdVar17 = (double *)((int)pdVar17 + 1);
                    piVar9 = piVar9 + 1;
                  } while (pdVar17 < pdVar21);
                }
                local_30 = (double *)0x0;
                local_64[2] = (int *)(*(uint *)(local_44 + 1) + (int)pdVar17 * 4);
                local_38 = (double *)0xffffffff;
                iVar3 = *local_64[2];
                local_64[3] = (int *)(*(uint *)(local_44 + 1) + ((int)pdVar21 + (int)pdVar17) * 4);
                iVar4 = *local_64[3];
                local_74[3] = *(undefined4 *)(iVar8 + iVar4 * 4);
                local_74[2] = *(undefined4 *)(iVar8 + iVar3 * 4);
                local_40 = (uint *)local_74[(int)local_c];
                if ((((uint *)local_74[(int)local_c])[0x17] == 1) && (iVar3 != iVar4)) {
                  FUN_10087b3a(*local_64[iVar20],&local_38,local_54);
                  local_44 = local_38;
                  iVar8 = FUN_10087b3a(*local_64[(int)local_c],&local_44,local_54);
                  local_30 = (double *)(uint)(-1 < iVar8);
                }
                local_20 = (double *)0x2;
                local_20 = (double *)0x2;
                do {
                  puVar19 = local_2c;
                  local_34 = (double *)(5 - (int)local_20);
                  local_44 = (double *)
                             (*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                                *(int *)(local_74[(int)local_20] + 4) * 4) + 4) &
                             0x100);
                  if ((((local_44 != (double *)0x0) && (*(int *)(local_74[(int)local_20] + 8) == -1)
                       ) && ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                                *(int *)(local_74[iVar20] + 4) * 4) + 5) & 1) != 0))
                     && (*(int *)(local_74[iVar20] + 8) == -1)) {
                    dVar1 = 0.0;
                    if ((*local_2c & 0xfff00000) == 0x20400000) {
                      dVar1 = *(double *)(local_74[(int)local_20] + 0x20) +
                              *(double *)(local_74[iVar20] + 0x20);
                    }
                    else if ((*local_2c & 0xfff00000) == 0x20500000) {
                      dVar1 = *(double *)(local_74[(int)local_20] + 0x20) *
                              *(double *)(local_74[iVar20] + 0x20);
                    }
                    *local_64[(int)local_c] = *local_64[(int)local_34];
                    iVar8 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,dVar1);
                    *local_64[iVar20] = iVar8;
LAB_1009549c:
                    *(undefined4 *)
                     (*(int *)(*(int *)(in_ECX + 0x14) +
                              *(int *)(puVar19[4] + (int)local_18 * 4) * 4) + 0x40) = 0xffffffff;
                    local_8 = 1;
                    break;
                  }
                  if (((local_40[0x17] == 1) &&
                      ((*(uint *)(local_74[iVar20] + 0x48) == 0xffffffff ||
                       (*(uint *)(local_74[iVar20] + 0x48) < local_40[0x12])))) &&
                     (*(int *)(local_74[iVar20] + 8) == -1)) {
                    if (((local_44 == (double *)0x0) ||
                        (*(int *)(local_74[(int)local_20] + 8) != -1)) ||
                       ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                           *(int *)(local_74[iVar20] + 4) * 4) + 5) & 1) != 0)) {
                      local_48 = local_64[(int)local_20];
                      iVar8 = *local_64[(int)local_20];
                      if (*local_64[(int)local_34] == iVar8) goto LAB_100953f2;
                      if (local_30 == (double *)0x0) {
                        local_44 = local_38;
                        iVar8 = FUN_10087b3a(iVar8,&local_44,local_54);
                        if (iVar8 < 0) goto LAB_100953e1;
                      }
                      else {
LAB_100953e1:
                        if (*local_64[iVar20] != *local_48) goto LAB_100953f2;
                      }
                      piVar9 = local_64[(int)local_34];
                    }
                    else {
                      piVar9 = local_64[(int)local_20];
                    }
                    iVar8 = *local_64[iVar20];
                    *local_64[iVar20] = *piVar9;
                    *piVar9 = iVar8;
                    iVar8 = local_74[(int)local_c];
                    *(undefined4 *)(iVar8 + 0x60) = 0;
                    *(undefined4 *)(iVar8 + 100) = 0;
                    *(undefined4 *)(iVar8 + 0x40) = 0xffffffff;
                    puVar19 = local_2c;
                    goto LAB_1009549c;
                  }
LAB_100953f2:
                  local_20 = (double *)((int)local_20 + 1);
                  puVar19 = local_2c;
                } while (local_20 < (double *)0x4);
              }
            }
            local_c = (double *)((int)local_c + 1);
          } while (local_c < (byte *)0x2);
          pdVar21 = (double *)puVar19[3];
          local_18 = (double *)((int)local_18 + 1);
        } while (local_18 < pdVar21);
      }
      local_28 = (double *)((int)local_28 + 1);
    } while (local_28 < *(uint *)(in_ECX + 0xc));
    if (local_8 != 0) {
      local_8 = 0;
      local_24 = (double *)0x1;
      FUN_1008a979();
    }
  }
  local_28 = (double *)0x0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      local_20 = *(double **)(*(int *)(in_ECX + 0x18) + (int)local_28 * 4);
      uVar7 = *(uint *)local_20 & 0xfff00000;
      if (((uVar7 != 0) &&
          ((*(uint *)((int)local_20 + 0xc) == 0 ||
           ((**(byte **)(*(int *)(in_ECX + 0x14) + **(int **)(local_20 + 2) * 4) & 0x40) == 0)))) &&
         (((uVar7 == 0x30000000 || (uVar7 == 0x11000000)) &&
          (local_2c = (uint *)0x0, *(uint *)((int)local_20 + 0xc) != 0)))) {
        do {
          local_44 = (double *)(*(uint *)(local_20 + 1) + (int)local_2c * 4);
          local_18 = *(double **)local_44;
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4);
          iVar20 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4);
          while (((*(byte *)(iVar20 + 4) & 2) != 0 && (*(int *)(iVar8 + 8) == -1))) {
            uVar7 = *(uint *)((int)local_20 + 0xc);
            if (uVar7 < *(uint *)((int)local_20 + 4)) {
              piVar9 = (int *)(*(uint *)(local_20 + 1) + uVar7 * 4);
              do {
                if (local_18 == (double *)*piVar9) break;
                uVar7 = uVar7 + 1;
                piVar9 = piVar9 + 1;
                local_48 = piVar9;
              } while (uVar7 < *(uint *)((int)local_20 + 4));
              if (uVar7 < *(uint *)((int)local_20 + 4)) break;
            }
            puVar19 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar8 + 0x48) * 4);
            uVar7 = puVar19[3];
            uVar10 = 0;
            if (uVar7 != 0) {
              puVar14 = (undefined4 *)puVar19[4];
              do {
                if ((double *)*puVar14 == local_18) break;
                uVar10 = uVar10 + 1;
                puVar14 = puVar14 + 1;
              } while (uVar10 < uVar7);
            }
            if ((*puVar19 & 0xfff00000) == 0x20400000) {
              pdVar17 = *(double **)(puVar19[2] + uVar10 * 4);
              if (pdVar17 != *(double **)(puVar19[2] + (uVar7 + uVar10) * 4)) break;
            }
            else {
              if ((*puVar19 & 0xfff00000) != 0x20500000) break;
              pdVar21 = *(double **)(puVar19[2] + uVar10 * 4);
              local_38 = *(double **)(puVar19[2] + (uVar7 + uVar10) * 4);
              iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)pdVar21 * 4);
              if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 5) & 1)
                    == 0) || (pdVar17 = local_38, *(double *)(iVar8 + 0x20) <= 0.0)) &&
                 ((iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_38 * 4),
                  (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 5) & 1)
                  == 0 || (pdVar17 = pdVar21, *(double *)(iVar8 + 0x20) <= 0.0)))) break;
            }
            local_18 = pdVar17;
            iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4);
            iVar20 = *(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4);
          }
          if (*(double **)local_44 != local_18) {
            *(double **)local_44 = local_18;
            local_8 = 1;
          }
          local_2c = (uint *)((int)local_2c + 1);
        } while (local_2c < *(uint **)((int)local_20 + 0xc));
      }
      local_28 = (double *)((int)local_28 + 1);
    } while (local_28 < *(double **)(in_ECX + 0xc));
  }
  if (local_8 != 0) {
    local_8 = 0;
    local_24 = (double *)0x1;
    FUN_1008a979();
  }
  local_2c = (uint *)0x0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar19 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_2c * 4);
      if ((((*puVar19 & 0xfff00000) != 0) &&
          (((puVar19[3] == 0 ||
            ((**(byte **)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) & 0x40) == 0)) &&
           ((*puVar19 & 0xfff00000) == 0x30000000)))) && (local_40 = (uint *)0x0, puVar19[3] != 0))
      {
        do {
          local_48 = *(int **)(puVar19[2] + (int)local_40 * 4);
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_48 * 4);
          if (((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 4) & 2) != 0
              ) && (*(int *)(iVar8 + 8) == -1)) {
            puVar15 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar8 + 0x48) * 4);
            pdVar21 = (double *)puVar15[3];
            local_20 = (double *)0x0;
            if (pdVar21 != (double *)0x0) {
              local_38 = (double *)puVar15[4];
              do {
                if (*(int **)local_38 == local_48) break;
                local_20 = (double *)((int)local_20 + 1);
                local_38 = (double *)((int)local_38 + 4);
              } while (local_20 < pdVar21);
            }
            local_48 = (int *)(*puVar15 & 0xfff00000);
            if (local_48 == (int *)0x10100000) {
              local_28 = (double *)0x1;
            }
            else {
              if (local_48 != (int *)0x20500000) goto LAB_10095a42;
              local_28 = (double *)0x2;
            }
            local_30 = (double *)0x0;
            if (local_28 != (double *)0x0) {
              local_4c = (int)pdVar21 * 4;
              local_50 = (uint *)((int)pdVar21 * -4);
              local_38 = (double *)(puVar15[2] + (int)local_20 * 4);
              local_34 = (double *)(puVar15[2] + ((int)pdVar21 + (int)local_20) * 4);
              do {
                local_c = *(double **)local_38;
                local_20 = *(double **)(*(int *)(in_ECX + 0x14) + (int)local_c * 4);
                if ((local_48 != (int *)0x20500000) ||
                   (((local_44 = *(double **)(*(int *)(in_ECX + 0x14) + *(uint *)local_34 * 4),
                     (*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(uint *)((int)local_44 + 4) * 4)
                               + 5) & 1) != 0 && (*(uint *)(local_44 + 1) == 0xffffffff)) &&
                    (local_44[4] < 0.0)))) {
                  if (local_c ==
                      (double *)*(byte **)(puVar19[2] + ((int)local_40 + puVar19[3] * 2) * 4)) {
                    local_18 = *(double **)(puVar19[2] + (puVar19[3] + (int)local_40) * 4);
                    local_44 = *(double **)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4);
                    if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                             *(uint *)((int)local_44 + 4) * 4) + 5) & 1) == 0) ||
                        (*(uint *)(local_44 + 1) != 0xffffffff)) || (local_44[4] != 0.0))
                    goto LAB_10095893;
                    *(double **)(puVar19[2] + (int)local_40 * 4) = local_c;
                    *(double **)(puVar19[2] + (puVar19[3] + (int)local_40) * 4) = local_c;
                    *(double **)(puVar19[2] + ((int)local_40 + puVar19[3] * 2) * 4) = local_18;
                  }
                  else {
LAB_10095893:
                    if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                             *(uint *)((int)local_20 + 4) * 4) + 4) & 2) == 0) ||
                        (*(uint *)(local_20 + 1) != 0xffffffff)) ||
                       (puVar15 = *(uint **)(*(int *)(in_ECX + 0x18) + *(uint *)(local_20 + 9) * 4),
                       (*puVar15 & 0xfff00000) != 0x30000000)) goto LAB_10095997;
                    local_18 = (double *)0x0;
                    if (puVar15[3] != 0) {
                      pdVar17 = (double *)puVar15[4];
                      do {
                        if ((double *)*(byte **)pdVar17 == local_c) break;
                        local_18 = (double *)((int)local_18 + 1);
                        pdVar17 = (double *)((int)pdVar17 + 4);
                        local_44 = pdVar17;
                      } while (local_18 < (double *)puVar15[3]);
                    }
                    local_20 = *(double **)
                                (*(int *)(in_ECX + 0x14) +
                                *(int *)(puVar15[2] + ((int)local_18 + puVar15[3]) * 4) * 4);
                    local_c = *(double **)
                               (*(int *)(in_ECX + 0x14) +
                               *(int *)(puVar15[2] + ((int)local_18 + puVar15[3] * 2) * 4) * 4);
                    if (((ulonglong)*local_20 & 8) == 0) {
                      if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                               *(uint *)((int)local_20 + 4) * 4) + 5) & 1) == 0) ||
                          (*(uint *)(local_20 + 1) != 0xffffffff)) || (local_20[4] <= 0.0))
                      goto LAB_10095997;
                      local_20 = (double *)0x1;
                    }
                    else {
                      local_20 = (double *)0x0;
                    }
                    if ((*(byte *)local_c & 8) == 0) {
                      if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) +
                                               *(int *)((int)local_c + 4) * 4) + 5) & 1) == 0) ||
                          (*(int *)((int)local_c + 8) != -1)) ||
                         (*(double *)((int)local_c + 0x20) <= 0.0)) goto LAB_10095997;
                      local_38 = (double *)0x1;
                    }
                    else {
                      local_38 = (double *)0x0;
                    }
                    uVar7 = puVar19[2];
                    local_30 = *(double **)(uVar7 + ((int)local_40 + puVar19[3]) * 4);
                    local_34 = *(double **)(uVar7 + ((int)local_40 + puVar19[3] * 2) * 4);
                    *(undefined4 *)(uVar7 + (int)local_40 * 4) =
                         *(undefined4 *)(puVar15[2] + (int)local_18 * 4);
                    pdVar21 = local_34;
                    if (local_20 == (double *)0x0) {
                      pdVar21 = local_30;
                    }
                    *(double **)(puVar19[2] + (puVar19[3] + (int)local_40) * 4) = pdVar21;
                    pdVar21 = local_34;
                    if (local_38 == (double *)0x0) {
                      pdVar21 = local_30;
                    }
                    *(double **)(puVar19[2] + ((int)local_40 + puVar19[3] * 2) * 4) = pdVar21;
                  }
                  local_8 = 1;
                  break;
                }
LAB_10095997:
                local_38 = (double *)((int)local_38 + local_4c);
                local_30 = (double *)((int)local_30 + 1);
                local_34 = (double *)((int)local_34 + (int)pdVar21 * -4);
              } while (local_30 < local_28);
            }
          }
LAB_10095a42:
          local_40 = (uint *)((int)local_40 + 1);
        } while (local_40 < (uint *)puVar19[3]);
      }
      local_2c = (uint *)((int)local_2c + 1);
    } while (local_2c < *(uint **)(in_ECX + 0xc));
  }
  if (local_8 != 0) {
    local_8 = 0;
    local_24 = (double *)0x1;
    FUN_1008a979();
  }
  local_c = (double *)0x0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      puVar19 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_c * 4);
      if ((((undefined *)(*puVar19 & 0xfff00000) != (undefined *)0x0) &&
          ((puVar19[3] == 0 ||
           ((**(byte **)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) & 0x40) == 0)))) &&
         ((undefined *)(*puVar19 & 0xfff00000) == &DAT_10500000)) {
        local_30 = (double *)0xffffffff;
        local_44 = (double *)0xffffffff;
        local_18 = (double *)0x0;
        if (puVar19[1] != 0) {
          do {
            uVar7 = *(uint *)(puVar19[2] + (int)local_18 * 4);
            iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + uVar7 * 4);
            if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 4) & 2)
                  != 0) && (*(int *)(iVar8 + 8) == -1)) &&
               (local_28 = *(double **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar8 + 0x48) * 4),
               ((ulonglong)*local_28 & 0xfff00000) == 0x20500000)) {
              local_20 = (double *)0x0;
              if (*(double **)((int)local_28 + 0xc) != (double *)0x0) {
                local_38 = *(double **)(local_28 + 2);
                do {
                  if (*(uint *)local_38 == uVar7) break;
                  local_20 = (double *)((int)local_20 + 1);
                  local_38 = (double *)((int)local_38 + 4);
                } while (local_20 < *(double **)((int)local_28 + 0xc));
              }
              local_2c = (uint *)0x0;
              local_34 = (double *)0x1;
              do {
                local_50 = *(uint **)(*(uint *)(local_28 + 1) +
                                     (int)(*(uint *)((int)local_28 + 0xc) * (int)local_2c +
                                          (int)local_20) * 4);
                puVar15 = *(uint **)(*(int *)(in_ECX + 0x14) + (int)local_50 * 4);
                if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + puVar15[1] * 4) + 4) & 2) != 0)
                    && (puVar15[2] == 0xffffffff)) &&
                   (local_40 = *(uint **)(*(int *)(in_ECX + 0x18) + puVar15[0x12] * 4),
                   (undefined *)(*local_40 & 0xfff00000) == &DAT_10600000)) {
                  if (puVar15[0x17] == 1) {
                    uVar7 = *puVar15;
                    uVar11 = **(uint **)(*(int *)(in_ECX + 0x14) +
                                        *(int *)(puVar19[4] + (int)local_18 * 4) * 4) | uVar7;
                    uVar12 = uVar11 & 0xe000000;
                    uVar10 = 0x8000000;
                    if ((((uVar11 & 0x8000000) != 0) ||
                        (uVar10 = 0x4000000, (uVar11 & 0x4000000) != 0)) ||
                       (uVar10 = 0x2000000, (uVar11 & 0x2000000) != 0)) {
                      uVar12 = uVar10;
                    }
                    if ((uVar7 & 0xe000000) != uVar12) {
                      *puVar15 = uVar7 & 0xf1ffffff | uVar12;
                      local_8 = 1;
                    }
                  }
                  if ((((*(byte *)(in_ECX + 0x6c) & 0x40) != 0) && (puVar19[3] == 1)) &&
                     ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                         *(int *)(puVar19[4] + (int)local_18 * 4) * 4) + 3) & 2) !=
                      0)) {
                    uVar7 = 0;
                    if (local_40[3] != 0) {
                      local_38 = (double *)local_40[4];
                      do {
                        if (*(uint **)local_38 == local_50) break;
                        local_38 = (double *)((int)local_38 + 4);
                        uVar7 = uVar7 + 1;
                      } while (uVar7 < local_40[3]);
                    }
                    local_30 = *(double **)(local_40[2] + uVar7 * 4);
                    local_44 = *(double **)
                                (*(uint *)(local_28 + 1) +
                                (int)(*(uint *)((int)local_28 + 0xc) * (int)local_34 + (int)local_20
                                     ) * 4);
                  }
                }
                local_2c = (uint *)((int)local_2c + 1);
                local_34 = (double *)((int)local_34 + -1);
              } while (local_2c < (uint *)0x2);
            }
            local_18 = (double *)((int)local_18 + 1);
          } while (local_18 < (double *)puVar19[1]);
          if (local_30 != (double *)0xffffffff) {
            iVar8 = FUN_10086199(0x50100004,0xffffffff,0xffffffff);
            if ((iVar8 == -1) ||
               (iVar20 = FUN_10086199(0x10000001,0xffffffff,0xffffffff), iVar20 == -1)) {
              return 0x8007000e;
            }
            iVar8 = *(int *)(*(int *)(in_ECX + 0x18) + iVar8 * 4);
            local_38 = *(double **)(*(int *)(in_ECX + 0x18) + iVar20 * 4);
            FUN_100853b0();
            FUN_100853b0();
            local_18 = (double *)0x0;
            piVar9 = (int *)(iVar8 + 8);
            *(double **)(*piVar9 + 4) = local_30;
            *(double **)*piVar9 = local_30;
            *(double **)(*piVar9 + 0xc) = local_44;
            *(double **)(*piVar9 + 8) = local_44;
            do {
              uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,0,0);
              *(undefined4 *)((int)local_18 + *(int *)(iVar8 + 0x10)) = uVar13;
              if (*(int *)((int)local_18 + *(int *)(iVar8 + 0x10)) == -1) {
                return 0x8007000e;
              }
              *(undefined4 *)
               (*(int *)(*(int *)(in_ECX + 0x14) +
                        *(int *)((int)local_18 + *(int *)(iVar8 + 0x10)) * 4) + 0x14) =
                   *(undefined4 *)
                    (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) + 0x14);
              pdVar21 = (double *)((int)local_18 + 4);
              *(undefined4 *)
               (*(int *)(*(int *)(in_ECX + 0x14) +
                        *(int *)((int)local_18 + *(int *)(iVar8 + 0x10)) * 4) + 0x18) =
                   *(undefined4 *)
                    (*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) + 0x18);
              puVar15 = *(uint **)(*(int *)(in_ECX + 0x14) +
                                  *(int *)((int)local_18 + *(int *)(iVar8 + 0x10)) * 4);
              *puVar15 = *puVar15 |
                         **(uint **)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) & 0xe000000;
              local_18 = pdVar21;
            } while (pdVar21 < (double *)0x10);
            **(undefined4 **)(local_38 + 1) = *(undefined4 *)(*(int *)(iVar8 + 0x10) + 8);
            **(undefined4 **)(local_38 + 2) = *(undefined4 *)puVar19[4];
            FUN_1006c418();
            *(int *)(in_ECX + 0xc) = *(int *)(in_ECX + 0xc) + -1;
            pdVar21 = *(double **)(in_ECX + 0xc);
            while (pdVar21 = (double *)((int)pdVar21 + -1), local_c < pdVar21) {
              puVar14 = (undefined4 *)(*(int *)(in_ECX + 0x18) + (int)pdVar21 * 4);
              *puVar14 = puVar14[-1];
            }
            *(int *)(*(int *)(in_ECX + 0x18) + (int)local_c * 4) = iVar8;
            *(double **)(*(int *)(in_ECX + 0x18) + 4 + (int)local_c * 4) = local_38;
            FUN_1008a979();
            local_8 = 1;
          }
        }
      }
      local_c = (double *)((int)local_c + 1);
    } while (local_c < *(double **)(in_ECX + 0xc));
  }
  if (local_8 != 0) {
    local_8 = 0;
    local_24 = (double *)0x1;
    FUN_1008a979();
  }
  local_18 = (double *)0x0;
  if (*(int *)(in_ECX + 0xc) != 0) {
    do {
      local_40 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_18 * 4);
      if (((undefined *)(*local_40 & 0xfff00000) != (undefined *)0x0) &&
         ((((local_40[3] == 0 ||
            ((**(byte **)(*(int *)(in_ECX + 0x14) + *(int *)local_40[4] * 4) & 0x40) == 0)) &&
           ((undefined *)(*local_40 & 0xfff00000) == &DAT_10400000)) &&
          (local_28 = (double *)0x0, local_40[1] != 0)))) {
        do {
          local_50 = (uint *)(local_40[2] + (int)local_28 * 4);
          iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + *local_50 * 4);
          if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 4) & 2) !=
                0) && (*(int *)(iVar8 + 8) == -1)) &&
             (puVar19 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar8 + 0x48) * 4),
             (*puVar19 & 0xfff00000) == 0x20400000)) {
            local_44 = (double *)puVar19[3];
            local_20 = (double *)0x0;
            if (local_44 != (double *)0x0) {
              local_38 = (double *)puVar19[4];
              do {
                if (*(uint *)local_38 == *local_50) break;
                local_20 = (double *)((int)local_20 + 1);
                local_38 = (double *)((int)local_38 + 4);
              } while (local_20 < local_44);
            }
            local_2c = (uint *)0x0;
            piVar9 = (int *)(puVar19[2] + (int)local_20 * 4);
            do {
              pbVar5 = *(byte **)(*(int *)(in_ECX + 0x14) + *piVar9 * 4);
              if ((((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(pbVar5 + 4) * 4) + 5) & 1
                    ) != 0) && ((*pbVar5 & 2) != 0)) && (*(int *)(pbVar5 + 8) == -1)) {
                local_8 = 1;
                *local_50 = *(uint *)(puVar19[2] +
                                     (int)((1 - (int)local_2c) * (int)local_44 + (int)local_20) * 4)
                ;
                break;
              }
              local_2c = (uint *)((int)local_2c + 1);
              piVar9 = piVar9 + (int)local_44;
            } while (local_2c < (uint *)0x2);
          }
          local_28 = (double *)((int)local_28 + 1);
        } while (local_28 < (double *)local_40[1]);
      }
      local_18 = (double *)((int)local_18 + 1);
    } while (local_18 < *(double **)(in_ECX + 0xc));
  }
  uVar7 = 0;
  if ((local_8 != 0) || (local_24 != (double *)0x0)) goto LAB_1009696a;
  local_2c = *(uint **)(in_ECX + 0xc);
  local_24 = (double *)0x0;
  if (local_2c == (uint *)0x0) {
LAB_10096939:
    uVar7 = FUN_1008bec4();
    if ((((int)uVar7 < 0) || (uVar7 = FUN_10086eae(), (int)uVar7 < 0)) ||
       (uVar7 = FUN_1008d525(), (int)uVar7 < 0)) goto LAB_1009696a;
  }
  else {
    do {
      local_2c = (uint *)((int)local_2c + -1);
      puVar19 = *(uint **)(*(int *)(in_ECX + 0x18) + (int)local_2c * 4);
      pdVar21 = (double *)puVar19[3];
      local_34 = pdVar21;
      if ((pdVar21 == (double *)0x0) ||
         ((**(byte **)(*(int *)(in_ECX + 0x14) + *(int *)puVar19[4] * 4) & 0x40) == 0)) {
        if (((*puVar19 & 0xfff00000) == 0x20400000) || ((*puVar19 & 0xfff00000) == 0x20500000)) {
          if (pdVar21 <= local_24) {
LAB_1009602b:
            local_18 = (double *)0x0;
            if (pdVar21 != (double *)0x0) {
              local_28 = local_14;
              local_38 = local_10;
              do {
                *(uint *)local_28 = 0xffffffff;
                *local_38 = 1.0;
                iVar8 = FUN_10087b3a(*(undefined4 *)(puVar19[4] + (int)local_18 * 4),local_28,
                                     local_38);
                if ((iVar8 < 0) || (*(uint *)local_28 == *(uint *)(puVar19[4] + (int)local_18 * 4)))
                break;
                local_18 = (double *)((int)local_18 + 1);
                local_38 = local_38 + 1;
                local_28 = (double *)((int)local_28 + 4);
              } while (local_18 < pdVar21);
            }
            if (local_18 != pdVar21) goto LAB_100963c6;
            pdVar17 = (double *)0x0;
            local_40 = (uint *)0x1;
            local_44 = (double *)0x1;
            if (pdVar21 == (double *)0x0) {
LAB_100960e8:
              if (*local_10 == 2.0) {
                uVar7 = (uint)pdVar21 & 0xfffff | 0x20400000;
                if (*puVar19 != uVar7) {
                  *puVar19 = uVar7;
                  local_20 = (double *)((int)pdVar21 * 2);
                  local_8 = 1;
                  if ((double *)puVar19[1] < local_20) {
                    puVar14 = (undefined4 *)FUN_100857f7();
                    puVar19[2] = (uint)puVar14;
                    if (puVar14 == (undefined4 *)0x0) goto LAB_10096983;
                    puVar19[1] = (uint)local_20;
                    for (pdVar17 = local_20; pdVar21 = local_34, pdVar17 != (double *)0x0;
                        pdVar17 = (double *)((int)pdVar17 + -1)) {
                      *puVar14 = 0xffffffff;
                      puVar14 = puVar14 + 1;
                    }
                  }
                }
                local_28 = (double *)0x0;
                if (pdVar21 != (double *)0x0) {
                  local_38 = (double *)((int)pdVar21 << 2);
                  do {
                    puVar18 = (uint *)((int)local_14 + (int)local_28 * 4);
                    puVar15 = (uint *)(puVar19[2] + (int)local_28 * 4);
                    uVar7 = *puVar18;
                    if (*puVar15 != uVar7) {
                      *puVar15 = uVar7;
                      local_8 = 1;
                    }
                    uVar7 = *puVar18;
                    if (*(uint *)(puVar19[2] + (int)local_38) != uVar7) {
                      *(uint *)(puVar19[2] + (int)local_38) = uVar7;
                      local_8 = 1;
                    }
                    local_28 = (double *)((int)local_28 + 1);
                    local_38 = (double *)((int)local_38 + 4);
                  } while (local_28 < pdVar21);
                }
                goto LAB_100963c6;
              }
              if (*local_10 == 1.0) {
                local_28 = (double *)0x0;
                *puVar19 = (uint)pdVar21 & 0xfffff | 0x10000000;
                puVar19[1] = (uint)pdVar21;
                if (pdVar21 != (double *)0x0) {
                  do {
                    pdVar17 = (double *)((int)local_28 + 1);
                    *(uint *)((int)local_28 * 4 + puVar19[2]) =
                         *(uint *)((int)local_14 + (int)local_28 * 4);
                    local_28 = pdVar17;
                  } while (pdVar17 < pdVar21);
                }
              }
              else {
                if (*local_10 != 0.0) {
                  if (*local_10 == -1.0) {
                    uVar7 = (uint)pdVar21 & 0xfffff | 0x10100000;
                    if (*puVar19 != uVar7) {
                      *puVar19 = uVar7;
                      puVar19[1] = (uint)pdVar21;
                      local_8 = 1;
                    }
                    local_28 = (double *)0x0;
                    if (pdVar21 != (double *)0x0) {
                      do {
                        puVar15 = (uint *)(puVar19[2] + (int)local_28 * 4);
                        uVar7 = *(uint *)((int)local_14 + (int)local_28 * 4);
                        if (*puVar15 != uVar7) {
                          *puVar15 = uVar7;
                          local_8 = 1;
                        }
                        local_28 = (double *)((int)local_28 + 1);
                      } while (local_28 < pdVar21);
                    }
                    goto LAB_100963c6;
                  }
                  goto LAB_100962b0;
                }
                *puVar19 = (uint)pdVar21 & 0xfffff | 0x10000000;
                puVar19[1] = (uint)pdVar21;
                if ((local_1c == -1) &&
                   (local_1c = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0), local_1c == -1))
                goto LAB_10096983;
                pdVar17 = (double *)0x0;
                if (pdVar21 != (double *)0x0) {
                  do {
                    *(int *)(puVar19[2] + (int)pdVar17 * 4) = local_1c;
                    pdVar17 = (double *)((int)pdVar17 + 1);
                  } while (pdVar17 < pdVar21);
                }
              }
              local_8 = 1;
            }
            else {
              do {
                if ((pdVar17 != (double *)0x0) &&
                   (local_10[(int)pdVar17] != local_10[(int)pdVar17 + -1])) {
                  local_44 = (double *)0x0;
                }
                if ((local_10[(int)pdVar17] < -1.0) || (1.0 < local_10[(int)pdVar17])) {
                  local_40 = (uint *)0x0;
                }
                pdVar17 = (double *)((int)pdVar17 + 1);
              } while (pdVar17 < pdVar21);
              if (local_44 != (double *)0x0) goto LAB_100960e8;
LAB_100962b0:
              if (((*(byte *)(in_ECX + 0x6e) & 0x10) == 0) || (local_40 != (uint *)0x0)) {
                uVar7 = (uint)pdVar21 & 0xfffff | 0x20500000;
                if (*puVar19 != uVar7) {
                  *puVar19 = uVar7;
                  local_20 = (double *)((int)pdVar21 * 2);
                  local_8 = 1;
                  if ((double *)puVar19[1] < local_20) {
                    puVar14 = (undefined4 *)FUN_100857f7();
                    puVar19[2] = (uint)puVar14;
                    if (puVar14 == (undefined4 *)0x0) goto LAB_10096983;
                    puVar19[1] = (uint)local_20;
                    for (pdVar17 = local_20; pdVar21 = local_34, pdVar17 != (double *)0x0;
                        pdVar17 = (double *)((int)pdVar17 + -1)) {
                      *puVar14 = 0xffffffff;
                      puVar14 = puVar14 + 1;
                    }
                  }
                }
                local_18 = (double *)0x0;
                if (pdVar21 != (double *)0x0) {
                  local_28 = (double *)((int)pdVar21 << 2);
                  do {
                    puVar15 = (uint *)(puVar19[2] + (int)local_18 * 4);
                    uVar7 = *(uint *)((int)local_14 + (int)local_18 * 4);
                    if (*puVar15 != uVar7) {
                      *puVar15 = uVar7;
                      local_8 = 1;
                    }
                    if (*(int *)((int)local_28 + puVar19[2]) == -1) {
                      iVar8 = 0;
                    }
                    else {
                      iVar8 = *(int *)(*(int *)(in_ECX + 0x14) +
                                      *(int *)((int)local_28 + puVar19[2]) * 4);
                    }
                    if ((((iVar8 == 0) ||
                         ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar8 + 4) * 4) + 5
                                    ) & 1) == 0)) || (*(int *)(iVar8 + 8) != -1)) ||
                       (*(double *)(iVar8 + 0x20) != local_10[(int)local_18])) {
                      uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,
                                            local_10[(int)local_18]);
                      *(undefined4 *)((int)local_28 + puVar19[2]) = uVar13;
                      if (*(int *)((int)local_28 + puVar19[2]) == -1) goto LAB_10096983;
                      local_8 = 1;
                    }
                    local_18 = (double *)((int)local_18 + 1);
                    local_28 = (double *)((int)local_28 + 4);
                  } while (local_18 < pdVar21);
                }
              }
            }
            goto LAB_100963c6;
          }
          local_24 = pdVar21;
          if (pdVar21 < (double *)0x11) {
            local_24 = (double *)0x10;
          }
          _free(local_14);
          local_14 = operator_new((int)local_24 << 2);
          if (local_14 != (double *)0x0) {
            _free(local_10);
            local_10 = operator_new((int)local_24 << 3);
            if (local_10 != (double *)0x0) goto LAB_1009602b;
          }
          goto LAB_10096983;
        }
LAB_100963c6:
        if ((*puVar19 & 0xfff00000) == 0x20500000) {
          local_c = (double *)puVar19[3];
          pdVar21 = (double *)0x0;
          local_28 = (double *)0x0;
          local_38 = (double *)0x0;
          if (local_c != (double *)0x0) {
            while( true ) {
              local_18 = (double *)0xffffffff;
              local_20 = (double *)0xffffffff;
              local_34 = (double *)0xffffffff;
              local_30 = (double *)0xffffffff;
              puVar15 = (uint *)((int)local_14 + (int)pdVar21 * 4);
              *puVar15 = 0xffffffff;
              iVar8 = FUN_10087dc4(*(undefined4 *)(puVar19[4] + (int)pdVar21 * 4),puVar15,&local_18,
                                   &local_20,&local_34,&local_30);
              if (iVar8 < 0) break;
              if ((local_18 != (double *)0xffffffff) && (local_20 != (double *)0xffffffff)) {
                if (*(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4) + 0x20) <
                    *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)local_20 * 4) + 0x20)) {
                  local_18 = (double *)0xffffffff;
                }
                else {
                  local_20 = (double *)0xffffffff;
                }
              }
              if (local_30 == (double *)0xffffffff) {
LAB_1009649d:
                if ((local_34 == (double *)0xffffffff) && (local_18 != (double *)0xffffffff)) {
                  iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_18 * 4);
                  pdVar17 = (double *)0x1;
                  goto LAB_1009650f;
                }
                if (((local_30 != (double *)0xffffffff) || (local_34 != (double *)0xffffffff)) ||
                   (local_20 == (double *)0xffffffff)) goto LAB_100964dc;
                local_10[(int)pdVar21] =
                     *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)local_20 * 4) + 0x20);
                pdVar16 = (double *)0x20300000;
                pdVar17 = (double *)0x0;
              }
              else {
                if (local_34 != (double *)0xffffffff) {
                  dVar1 = *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)local_30 * 4) + 0x20);
                  dVar2 = *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)local_34 * 4) + 0x20);
                  if (dVar1 < dVar2 == (dVar1 == dVar2)) {
                    local_30 = (double *)0xffffffff;
                  }
                  else {
                    local_34 = (double *)0xffffffff;
                  }
                }
                if (local_30 == (double *)0xffffffff) goto LAB_1009649d;
LAB_100964dc:
                if ((local_18 != (double *)0xffffffff) || (local_20 != (double *)0xffffffff)) break;
                if (local_34 == (double *)0xffffffff) {
                  if (local_30 == (double *)0xffffffff) break;
                  iVar8 = *(int *)(*(int *)(in_ECX + 0x14) + (int)local_30 * 4);
                  pdVar17 = (double *)0x0;
LAB_1009650f:
                  local_10[(int)pdVar21] = *(double *)(iVar8 + 0x20);
                  pdVar16 = (double *)0x20200000;
                }
                else {
                  local_10[(int)pdVar21] =
                       *(double *)(*(int *)(*(int *)(in_ECX + 0x14) + (int)local_34 * 4) + 0x20);
                  pdVar16 = (double *)0x20300000;
                  pdVar17 = (double *)0x1;
                }
              }
              pdVar6 = pdVar17;
              if (((pdVar21 != (double *)0x0) &&
                  ((pdVar16 != local_28 ||
                   (pdVar6 = local_38, pdVar16 = local_28, pdVar17 != local_38)))) ||
                 (local_28 = pdVar16, local_38 = pdVar6, pdVar21 = (double *)((int)pdVar21 + 1),
                 local_c <= pdVar21)) break;
            }
          }
          if (pdVar21 == local_c) {
            if ((*(byte *)(in_ECX + 0x6c) & 0x80) != 0) {
              uVar7 = (uint)local_c & 0xfffff;
              local_44 = (double *)FUN_10086199(uVar7 | 0x10100000,local_c,local_c);
              local_50 = (uint *)FUN_10086199(uVar7 | 0x20400000,(int)local_c * 2,local_c);
              iVar8 = FUN_10086199(uVar7 | 0x30000000,(int)local_c * 3,local_c);
              if (((local_44 != (double *)0xffffffff) && (local_50 != (uint *)0xffffffff)) &&
                 (iVar8 != -1)) {
                iVar20 = *(int *)(in_ECX + 0x18);
                local_20 = *(double **)(iVar20 + (int)local_44 * 4);
                local_18 = *(double **)(iVar20 + (int)local_50 * 4);
                local_8 = *(int *)(iVar20 + iVar8 * 4);
                FUN_100853b0();
                FUN_100853b0();
                FUN_100853b0();
                bVar22 = local_38 == (double *)0x0;
                local_38 = (double *)0x0;
                if (bVar22) {
                  if (local_c != (double *)0x0) {
                    do {
                      pdVar21 = local_38;
                      iVar8 = (int)local_38 * 4;
                      uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,
                                            local_10[(int)local_38]);
                      *(undefined4 *)(iVar8 + *(uint *)(local_20 + 1)) = uVar13;
                      *(uint *)(iVar8 + *(uint *)(local_18 + 1)) =
                           *(uint *)((int)local_14 + (int)pdVar21 * 4);
                      if (*(int *)(iVar8 + *(uint *)(local_20 + 1)) == -1) goto LAB_10096983;
                      local_38 = (double *)((int)local_38 + 1);
                    } while (local_38 < local_c);
                  }
                }
                else if (local_c != (double *)0x0) {
                  do {
                    iVar8 = (int)local_38 * 4;
                    *(uint *)(iVar8 + *(uint *)(local_20 + 1)) =
                         *(uint *)((int)local_14 + (int)local_38 * 4);
                    uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,local_10[(int)local_38]
                                         );
                    *(undefined4 *)(iVar8 + *(uint *)(local_18 + 1)) = uVar13;
                    if (*(int *)(iVar8 + *(uint *)(local_18 + 1)) == -1) goto LAB_10096983;
                    local_38 = (double *)((int)local_38 + 1);
                  } while (local_38 < local_c);
                }
                if (((local_3c != -1) ||
                    (local_3c = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0x3ff0000000000000),
                    local_3c != -1)) &&
                   ((local_1c != -1 ||
                    (local_1c = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,0), local_1c != -1))
                   )) {
                  if (local_28 == (double *)0x20300000) {
                    if (local_c != (double *)0x0) {
                      local_44 = local_c;
                      local_38 = (double *)((int)local_c << 2);
                      local_34 = (double *)((int)local_c << 3);
                      do {
                        *(int *)((int)local_38 + *(int *)(local_8 + 8)) = local_3c;
                        pdVar21 = (double *)((int)local_34 + 4);
                        local_44 = (double *)((int)local_44 + -1);
                        *(int *)((int)local_34 + *(int *)(local_8 + 8)) = local_1c;
                        local_38 = (double *)((int)local_38 + 4);
                        local_34 = pdVar21;
                      } while (local_44 != (double *)0x0);
                      local_44 = (double *)0x0;
                    }
                  }
                  else if (local_c != (double *)0x0) {
                    local_44 = local_c;
                    local_38 = (double *)((int)local_c << 2);
                    local_34 = (double *)((int)local_c << 3);
                    do {
                      *(int *)((int)local_38 + *(int *)(local_8 + 8)) = local_1c;
                      pdVar21 = (double *)((int)local_34 + 4);
                      local_44 = (double *)((int)local_44 + -1);
                      *(int *)((int)local_34 + *(int *)(local_8 + 8)) = local_3c;
                      local_38 = (double *)((int)local_38 + 4);
                      local_34 = pdVar21;
                    } while (local_44 != (double *)0x0);
                  }
                  local_38 = (double *)0x0;
                  if (local_c != (double *)0x0) {
                    local_34 = (double *)((int)local_c << 2);
                    do {
                      iVar8 = (int)local_38 * 4;
                      uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,0,0);
                      *(undefined4 *)(iVar8 + *(uint *)(local_20 + 2)) = uVar13;
                      uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x88),0,0,0);
                      *(undefined4 *)(iVar8 + *(uint *)(local_18 + 2)) = uVar13;
                      *(undefined4 *)(iVar8 + *(int *)(local_8 + 0x10)) =
                           *(undefined4 *)(iVar8 + puVar19[4]);
                      if ((*(int *)(iVar8 + *(uint *)(local_20 + 2)) == -1) ||
                         (*(int *)(iVar8 + *(uint *)(local_18 + 2)) == -1)) goto LAB_10096983;
                      local_38 = (double *)((int)local_38 + 1);
                      pdVar21 = (double *)((int)local_34 + 4);
                      *(int *)((int)local_34 + *(uint *)(local_18 + 1)) =
                           *(int *)(iVar8 + *(uint *)(local_20 + 2));
                      *(undefined4 *)(iVar8 + *(int *)(local_8 + 8)) =
                           *(undefined4 *)(iVar8 + *(uint *)(local_18 + 2));
                      local_34 = pdVar21;
                    } while (local_38 < local_c);
                  }
                  puVar15 = (uint *)(*(int *)(in_ECX + 0xc) + -3);
                  while (local_2c < puVar15) {
                    puVar15 = (uint *)((int)puVar15 + -1);
                    *(undefined4 *)(*(int *)(in_ECX + 0x18) + 0xc + (int)puVar15 * 4) =
                         *(undefined4 *)(*(int *)(in_ECX + 0x18) + (int)puVar15 * 4);
                    local_50 = puVar15;
                  }
                  *(double **)(*(int *)(in_ECX + 0x18) + 4 + (int)local_2c * 4) = local_20;
                  *(double **)(*(int *)(in_ECX + 0x18) + 8 + (int)local_2c * 4) = local_18;
                  *(int *)(*(int *)(in_ECX + 0x18) + 0xc + (int)local_2c * 4) = local_8;
                  *puVar19 = 0;
                  goto LAB_10096922;
                }
              }
LAB_10096983:
              uVar7 = 0x8007000e;
              goto LAB_1009696a;
            }
            *puVar19 = ((uint)local_28 ^ (uint)local_c) & 0xfffff ^ (uint)local_28;
            local_20 = (double *)0x0;
            if (local_c != (double *)0x0) {
              uVar7 = puVar19[2];
              iVar8 = (~-(uint)(local_38 != (double *)0x0) & (uint)local_c) << 2;
              local_38 = (double *)((-(uint)(local_38 != (double *)0x0) & (uint)local_c) << 2);
              do {
                *(uint *)((int)local_38 + uVar7) = *(uint *)((int)local_14 + (int)local_20 * 4);
                uVar13 = FUN_10086139(*(undefined4 *)(in_ECX + 0x78),0,0,local_10[(int)local_20]);
                *(undefined4 *)(iVar8 + puVar19[2]) = uVar13;
                uVar7 = puVar19[2];
                if (*(int *)(iVar8 + uVar7) == -1) goto LAB_10096983;
                local_20 = (double *)((int)local_20 + 1);
                local_38 = (double *)((int)local_38 + 4);
                iVar8 = iVar8 + 4;
              } while (local_20 < local_c);
            }
LAB_10096922:
            local_8 = 1;
          }
        }
      }
    } while (local_2c != (uint *)0x0);
    if (local_8 == 0) goto LAB_10096939;
  }
  uVar7 = (uint)(local_8 == 0);
LAB_1009696a:
  _free(local_14);
  _free(local_10);
  return uVar7;
}


