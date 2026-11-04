// 100bfa06 size=2078 FUN_100bfa06

int FUN_100bfa06(void)

{
  int iVar1;
  int *piVar2;
  uint uVar3;
  float fVar4;
  uint uVar5;
  int iVar6;
  undefined4 uVar7;
  int iVar8;
  int in_ECX;
  uint uVar9;
  uint *puVar10;
  byte *pbVar11;
  uint *puVar12;
  undefined4 *puVar13;
  int *piVar14;
  undefined *puVar15;
  int local_218 [4];
  int local_208;
  int local_178 [4];
  uint local_168;
  uint local_158;
  undefined1 local_d8 [64];
  int local_98 [16];
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  uint *local_38;
  int *local_34;
  undefined4 *local_30;
  uint local_2c;
  uint *local_28;
  uint *local_24;
  uint local_20;
  byte *local_1c;
  uint local_18;
  int local_14;
  uint local_10;
  int local_c;
  int *local_8;
  
  local_44 = 0xffffffff;
  local_40 = 0xffffffff;
  local_3c = 0xffffffff;
  local_54 = 0xffffffff;
  local_50 = 0xffffffff;
  local_4c = 0xffffffff;
  puVar13 = (undefined4 *)0x0;
  puVar10 = (uint *)(**(uint **)(in_ECX + 0x100) & 0xfffff);
  local_48 = 0;
  local_58 = 0;
  if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) != 0x20900000) {
    return 1;
  }
  local_38 = puVar10;
  iVar6 = FUN_10085814();
  if (iVar6 != 0) {
    puVar13 = (undefined4 *)FUN_10085379();
  }
  if (puVar13 == (undefined4 *)0x0) {
    return -0x7ff8fff2;
  }
  local_30 = puVar13;
  local_c = FUN_10085abe();
  if (-1 < local_c) {
    local_24 = (uint *)0x0;
    puVar13[3] = 1;
    puVar13[1] = 2;
    *puVar13 = 0x20900001;
    if (puVar10 != (uint *)0x0) {
      local_2c = (int)local_38 << 2;
      do {
        puVar13 = local_30;
        *(undefined4 *)local_30[4] =
             *(undefined4 *)((int)local_24 * 4 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10));
        *(undefined4 *)local_30[2] =
             *(undefined4 *)((int)local_24 * 4 + *(int *)(*(int *)(in_ECX + 0x100) + 8));
        *(undefined4 *)(local_30[2] + 4) =
             *(undefined4 *)(local_2c + *(int *)(*(int *)(in_ECX + 0x100) + 8));
        piVar14 = local_178;
        for (iVar6 = 0x28; iVar6 != 0; iVar6 = iVar6 + -1) {
          *piVar14 = -1;
          piVar14 = piVar14 + 1;
        }
        local_8 = (int *)0x0;
        local_18 = 0;
        local_28 = (uint *)0x0;
        local_10 = 0;
        local_c = FUN_100b99af(puVar13,&DAT_101194b8,local_98,&local_8,local_178,&local_48,1,1);
        if (local_c != 0) {
          local_8 = (int *)0x0;
          local_c = FUN_100b99af(puVar13,&DAT_10119618,local_98,&local_8,local_178,&local_48,1,1);
          if (local_c == 0) {
            local_18 = 1;
            local_c = 0;
          }
          else {
            local_8 = (int *)0x0;
            local_c = FUN_100b99af(puVar13,&DAT_101197b8,local_98,&local_8,local_178,&local_48,1,1);
            if (local_c == 0) {
              local_28 = (uint *)0x1;
              local_c = 0;
            }
            else {
              local_8 = (int *)0x0;
              local_c = FUN_100b99af(puVar13,&DAT_10119958,local_98,&local_8,local_178,&local_48,1,1
                                    );
              if (local_c == 0) {
                local_10 = 1;
              }
            }
          }
        }
        if ((local_168 == local_158) && (local_c == 0)) {
          iVar6 = *(int *)(in_ECX + 0x14);
          iVar8 = *(int *)(*(int *)(iVar6 + **(int **)(local_98[0] + 0x10) * 4) + 0x14);
          if (iVar8 != -1) {
            piVar14 = *(int **)(*(int *)(in_ECX + 0x18) +
                               *(int *)(*(int *)(iVar6 + iVar8 * 4) + 0x48) * 4);
            local_8 = (int *)0x0;
            if (*piVar14 == 0x11100001) {
              iVar8 = *(int *)piVar14[4];
              iVar1 = *(int *)(iVar6 + iVar8 * 4);
              pbVar11 = *(byte **)(iVar1 + 0x54);
              local_1c = *(byte **)(iVar1 + 0x58);
              if (pbVar11 <= local_1c) {
                local_34 = (int *)(*(int *)(in_ECX + 0x18) + (int)pbVar11 * 4);
                do {
                  piVar14 = (int *)*local_34;
                  piVar2 = local_8;
                  if (((*(int *)(*(int *)(iVar6 + *(int *)piVar14[4] * 4) + 0x14) == iVar8) &&
                      (*piVar14 == 0x74700001)) && (piVar2 = piVar14, local_8 != (int *)0x0)) {
                    FUN_1008b0b5();
                    return -0x7fffbffb;
                  }
                  local_8 = piVar2;
                  piVar14 = local_8;
                  pbVar11 = pbVar11 + 1;
                  local_34 = local_34 + 1;
                } while (pbVar11 <= local_1c);
                if (local_8 != (int *)0x0) {
                  local_14 = 0;
                  if (local_10 == 0) {
                    if (local_28 == (uint *)0x0) {
                      if (local_18 == 0) {
                        puVar13 = &local_58;
                        puVar15 = &DAT_10119598;
                      }
                      else {
                        puVar13 = &local_48;
                        puVar15 = &DAT_10119718;
                      }
                    }
                    else {
                      puVar13 = &local_48;
                      puVar15 = &DAT_101198b8;
                    }
                  }
                  else {
                    puVar13 = &local_48;
                    puVar15 = &DAT_10119a78;
                  }
                  local_c = FUN_100b99af(local_30,puVar15,local_d8,&local_14,local_218,puVar13,1,1);
                  iVar6 = local_178[0];
                  if (local_218[0] == local_178[0]) {
                    iVar6 = local_208;
                  }
                  if (((iVar6 != -1) && (piVar2 = (int *)piVar14[2], *piVar2 == iVar6)) &&
                     (iVar6 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)piVar14[4] * 4) +
                                      0x14), iVar6 != -1)) {
                    local_34 = *(int **)(*(int *)(in_ECX + 0x18) +
                                        *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar6 * 4) +
                                                0x48) * 4);
                    iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_34[2] * 4);
                    if ((*local_34 == 0x11100001) &&
                       ((*(byte *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar6 + 4) * 4) + 5)
                        & 1) != 0)) {
                      fVar4 = (float)*(int *)(in_ECX + 0x68);
                      if (*(int *)(in_ECX + 0x68) < 0) {
                        fVar4 = fVar4 + 4.2949673e+09;
                      }
                      if ((float)*(double *)(iVar6 + 0x20) == fVar4) {
                        iVar6 = *(int *)(in_ECX + 0x14);
                        local_1c = *(byte **)(iVar6 + piVar2[1] * 4);
                        local_14 = *(int *)(iVar6 + local_178[0] * 4);
                        iVar6 = *(int *)(iVar6 + local_168 * 4);
                        iVar8 = *(int *)(iVar6 + 0x48);
                        local_10 = local_168;
                        if (iVar8 != -1) {
                          while ((*(int *)(iVar6 + 8) == -1 &&
                                 (puVar10 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar8 * 4),
                                 (*puVar10 & 0xfff00000) == 0x10000000))) {
                            local_20 = 0;
                            local_18 = *puVar10 & 0xfffff;
                            if (local_18 == 0) break;
                            puVar12 = (uint *)puVar10[4];
                            while (*puVar12 != local_10) {
                              local_20 = local_20 + 1;
                              puVar12 = puVar12 + 1;
                              local_28 = puVar12;
                              if (local_18 <= local_20) goto LAB_100bfe66;
                            }
                            local_10 = *(uint *)(puVar10[2] + local_20 * 4);
                            iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + local_10 * 4);
                            iVar8 = *(int *)(iVar6 + 0x48);
                            if (iVar8 == -1) break;
                          }
                        }
LAB_100bfe66:
                        iVar8 = *(int *)(in_ECX + 0x10);
                        if ((((((*(byte *)(*(int *)(iVar8 + *(int *)(local_14 + 4) * 4) + 5) & 1) !=
                                0) && ((*(byte *)(*(int *)(iVar8 + *(int *)(iVar6 + 4) * 4) + 5) & 1
                                       ) != 0)) && (*(double *)(local_14 + 0x20) == 1.0)) &&
                            ((*(double *)(iVar6 + 0x20) == 0.0 &&
                             ((*(byte *)(*(int *)(iVar8 + *(int *)(local_1c + 4) * 4) + 5) & 2) != 0
                             )))) && (((*local_1c & 2) != 0 &&
                                      ((*(int *)(local_1c + 0x10) == 0 &&
                                       (*(int *)(local_1c + 8) == -1)))))) {
                          local_18 = 0xffffffff;
                          *(undefined4 *)local_34[2] = *(undefined4 *)(local_8[2] + 4);
                          *local_8 = 0;
                          local_14 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_34[4] * 4);
                          local_1c = *(byte **)(local_14 + 0x54);
                          if (local_1c <= *(byte **)(local_14 + 0x58)) goto LAB_100bff35;
                          goto LAB_100c0181;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        local_24 = (uint *)((int)local_24 + 1);
        local_2c = local_2c + 4;
      } while (local_24 < local_38);
    }
  }
LAB_100c0215:
  FUN_1006c418();
  return local_c;
LAB_100bff35:
  do {
    uVar9 = *(uint *)(*(int *)(in_ECX + 0x18) + (int)local_1c * 4);
    local_20 = uVar9;
    if (((*(int *)(uVar9 + 0xc) != 0) &&
        (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + **(int **)(uVar9 + 0x10) * 4) + 0x14) ==
         *(int *)local_8[4])) && (local_2c = 0, *(int *)(uVar9 + 4) != 0)) {
      do {
        iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(*(int *)(uVar9 + 8) + local_2c * 4) * 4)
        ;
        uVar3 = *(uint *)(iVar6 + 8);
        local_10 = 0xffffffff;
        uVar5 = local_10;
        if (uVar3 == 0xffffffff) {
LAB_100bffef:
          local_10 = uVar5;
          if (local_10 == *(uint *)local_8[2]) {
            if (local_18 == 0xffffffff) {
              uVar7 = FUN_100860e0(&DAT_1011a0c0,0x15,0xffffffff,4);
              local_18 = FUN_10086139(uVar7,0,0,0);
              *(uint *)(iVar6 + 8) = local_18;
            }
            *(uint *)(iVar6 + 8) = local_18;
            if (*(int *)(iVar6 + 0x38) != -1) {
              *(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar6 + 0x38) * 4) + 8) =
                   local_18;
            }
          }
        }
        else {
          iVar8 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + uVar3 * 4) + 0x48);
          if (iVar8 != -1) {
            puVar10 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar8 * 4);
            uVar9 = local_20;
            uVar5 = uVar3;
            if ((*puVar10 & 0xfff00000) == 0x10000000) {
              local_24 = (uint *)0x0;
              local_28 = (uint *)(*puVar10 & 0xfffff);
              uVar5 = local_10;
              if (local_28 != (uint *)0x0) {
                puVar12 = (uint *)puVar10[4];
                do {
                  if (*puVar12 == uVar3) {
                    uVar5 = *(uint *)(puVar10[2] + (int)local_24 * 4);
                    break;
                  }
                  local_24 = (uint *)((int)local_24 + 1);
                  puVar12 = puVar12 + 1;
                } while (local_24 < local_28);
              }
            }
            goto LAB_100bffef;
          }
        }
        local_2c = local_2c + 1;
      } while (local_2c < *(uint *)(uVar9 + 4));
    }
    local_1c = local_1c + 1;
  } while (local_1c <= *(byte **)(local_14 + 0x58));
  if (local_18 != 0xffffffff) {
    iVar6 = FUN_10086139(0,0,0,0);
    iVar8 = FUN_10086139(0,0,0,0);
    if ((iVar6 == -1) || (iVar8 == -1)) {
      return -0x7ff8fff2;
    }
    iVar1 = *(int *)(in_ECX + 0x14);
    local_38 = *(uint **)(iVar1 + *(int *)local_34[2] * 4);
    iVar6 = *(int *)(iVar1 + iVar6 * 4);
    iVar8 = *(int *)(iVar1 + iVar8 * 4);
    FUN_10085c65();
    FUN_10085c65();
    *(undefined4 *)(iVar6 + 0x10) = 1;
    *(undefined4 *)(iVar8 + 0x10) = 2;
    iVar6 = FUN_10085814();
    if (iVar6 == 0) {
      iVar6 = 0;
    }
    else {
      iVar6 = FUN_10085379();
    }
    if (iVar6 == 0) {
      return -0x7ff8fff2;
    }
    iVar8 = FUN_1008585f(0x74100001,3,1,0);
    piVar14 = local_34;
    if (iVar8 < 0) {
      FUN_1006c418();
      return iVar8;
    }
    local_c = FUN_100853b0();
    if (local_c < 0) goto LAB_100c0215;
    **(undefined4 **)(iVar6 + 0x10) = *(undefined4 *)piVar14[4];
    **(undefined4 **)(iVar6 + 8) = *(undefined4 *)piVar14[2];
    *(undefined4 *)(*(int *)(iVar6 + 8) + 4) = *(undefined4 *)piVar14[2];
    *(undefined4 *)(*(int *)(iVar6 + 8) + 8) = *(undefined4 *)piVar14[2];
    local_c = FUN_10085abe();
    FUN_1006c418();
    if (local_c < 0) {
      return local_c;
    }
  }
LAB_100c0181:
  local_10 = *(uint *)(local_14 + 0x54);
  if (local_10 <= *(uint *)(local_14 + 0x58)) {
    do {
      puVar10 = *(uint **)(*(int *)(in_ECX + 0x18) + local_10 * 4);
      if (((*puVar10 & 0xfff00000) == 0x20800000) &&
         (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar10[2] * 4) + 0x14) ==
          *(int *)local_8[4])) {
        uVar9 = *puVar10 & 0xfffff;
        *puVar10 = uVar9 | 0x10000000;
        puVar10[3] = uVar9;
        puVar10[1] = uVar9;
      }
      local_10 = local_10 + 1;
    } while (local_10 <= *(uint *)(local_14 + 0x58));
  }
  uVar9 = 0;
  if (*(int *)(in_ECX + 8) != 0) {
    do {
      iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + uVar9 * 4);
      if (*(int *)(iVar6 + 0x14) == *(int *)local_8[4]) {
        *(undefined4 *)(iVar6 + 0x14) = *(undefined4 *)local_34[4];
      }
      uVar9 = uVar9 + 1;
    } while (uVar9 < *(uint *)(in_ECX + 8));
  }
  goto LAB_100c0215;
}


