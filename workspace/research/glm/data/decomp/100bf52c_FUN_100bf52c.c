// 100bf52c size=1242 FUN_100bf52c

int FUN_100bf52c(void)

{
  int iVar1;
  int iVar2;
  uint *puVar3;
  int iVar4;
  int iVar5;
  undefined4 uVar6;
  int iVar7;
  int in_ECX;
  undefined4 *puVar8;
  int *piVar9;
  undefined1 local_21c [64];
  undefined1 local_1dc [64];
  int local_19c [4];
  int local_18c;
  int local_fc [4];
  int local_ec;
  int local_dc;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  uint local_3c;
  uint local_38;
  uint local_34;
  int local_30;
  int local_2c;
  int local_28;
  undefined4 *local_24;
  int local_20;
  int local_1c;
  int *local_18;
  int local_14;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_58 = 0xffffffff;
  local_54 = 0xffffffff;
  local_50 = 0xffffffff;
  local_48 = 0xffffffff;
  local_44 = 0xffffffff;
  local_40 = 0xffffffff;
  local_3c = **(uint **)(in_ECX + 0x100) & 0xfffff;
  local_5c = 0;
  local_4c = 0;
  if ((**(uint **)(in_ECX + 0x100) & 0xfff00000) == 0x20900000) {
    iVar4 = FUN_10085814(0x74);
    if (iVar4 == 0) {
      local_24 = (undefined4 *)0x0;
    }
    else {
      local_24 = (undefined4 *)FUN_10085379();
    }
    puVar8 = local_24;
    if (local_24 == (undefined4 *)0x0) {
LAB_100bf5a1:
      iVar4 = -0x7ff8fff2;
    }
    else {
      iVar4 = FUN_10085abe();
      if (iVar4 < 0) {
        FUN_1006c418();
      }
      else {
        puVar8[3] = 1;
        puVar8[1] = 2;
        *puVar8 = 0x20900001;
        local_38 = 0;
        if (local_3c != 0) {
          local_2c = local_3c << 2;
          do {
            *(undefined4 *)puVar8[4] =
                 *(undefined4 *)(local_38 * 4 + *(int *)(*(int *)(in_ECX + 0x100) + 0x10));
            *(undefined4 *)puVar8[2] =
                 *(undefined4 *)(local_38 * 4 + *(int *)(*(int *)(in_ECX + 0x100) + 8));
            local_10 = 0;
            *(undefined4 *)(puVar8[2] + 4) =
                 *(undefined4 *)(local_2c + *(int *)(*(int *)(in_ECX + 0x100) + 8));
            piVar9 = local_fc;
            for (iVar4 = 0x28; iVar4 != 0; iVar4 = iVar4 + -1) {
              *piVar9 = -1;
              piVar9 = piVar9 + 1;
            }
            iVar5 = FUN_100b99af(puVar8,&DAT_10119b38,local_1dc,&local_10,local_fc,&local_5c,
                                 0x100000001);
            iVar4 = local_ec;
            if ((iVar5 == 0) && (local_ec == local_dc)) {
              local_10 = 0;
              FUN_100b99af(puVar8,&DAT_10119bf8,local_21c,&local_10,local_19c,&local_4c,1,1);
              if (local_19c[0] == local_fc[0]) {
                local_14 = local_18c;
              }
              else {
                local_14 = local_fc[0];
              }
              if ((((local_14 != -1) &&
                   (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)puVar8[4] * 4) + 0x14) != -1
                   )) && (iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                   *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                                    *(int *)puVar8[4] * 4) + 0x14) *
                                                   4) + 0x48), iVar5 != -1)) &&
                 (local_18 = *(int **)(*(int *)(in_ECX + 0x18) + iVar5 * 4), *local_18 == 0x11100001
                 )) {
                local_1c = *(int *)(*(int *)(in_ECX + 0x14) + local_fc[0] * 4);
                iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                while ((*(int *)(iVar5 + 0x48) != -1 && (*(int *)(iVar5 + 8) == -1))) {
                  puVar3 = *(uint **)(*(int *)(in_ECX + 0x18) + *(int *)(iVar5 + 0x48) * 4);
                  if ((*puVar3 & 0xfff00000) != 0x10000000) break;
                  local_8 = 0;
                  local_c = *puVar3 & 0xfffff;
                  if (local_c == 0) break;
                  piVar9 = (int *)puVar3[4];
                  while (*piVar9 != iVar4) {
                    local_8 = local_8 + 1;
                    piVar9 = piVar9 + 1;
                    if (local_c <= local_8) goto LAB_100bf78b;
                  }
                  iVar4 = *(int *)(puVar3[2] + local_8 * 4);
                  iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                }
LAB_100bf78b:
                if ((((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(local_1c + 4) * 4) + 4)
                      & 0x100) != 0) &&
                    ((*(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar5 + 4) * 4) + 4) &
                     0x100) != 0)) &&
                   ((*(double *)(local_1c + 0x20) == 1.0 && (*(double *)(iVar5 + 0x20) == 0.0)))) {
                  iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + local_14 * 4);
                  local_10 = *(uint *)(iVar4 + 0x54);
                  iVar5 = -1;
                  local_30 = -1;
                  local_1c = iVar4;
                  if (local_10 <= *(uint *)(iVar4 + 0x58)) {
                    do {
                      iVar7 = *(int *)(*(int *)(in_ECX + 0x18) + local_10 * 4);
                      local_28 = iVar7;
                      if ((*(int *)(iVar7 + 0xc) != 0) && (local_c = 0, *(int *)(iVar7 + 4) != 0)) {
                        do {
                          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) +
                                          *(int *)(*(int *)(iVar7 + 8) + local_c * 4) * 4);
                          iVar1 = *(int *)(iVar4 + 8);
                          local_20 = -1;
                          iVar2 = local_20;
                          if (iVar1 == -1) {
LAB_100bf89c:
                            local_20 = iVar2;
                            iVar7 = local_28;
                            iVar5 = local_30;
                            if (local_20 == local_14) {
                              if (local_30 == -1) {
                                uVar6 = FUN_100860e0(&DAT_1011a0c0,0x15,0xffffffff,4);
                                local_30 = FUN_10086139(uVar6,0,0,0);
                                *(int *)(iVar4 + 8) = local_30;
                              }
                              *(int *)(iVar4 + 8) = local_30;
                              iVar7 = local_28;
                              iVar5 = local_30;
                              if (*(int *)(iVar4 + 0x38) != -1) {
                                *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                                 *(int *)(iVar4 + 0x38) * 4) + 8) = local_30;
                              }
                            }
                          }
                          else {
                            iVar2 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + iVar1 * 4) + 0x48);
                            if (iVar2 != -1) {
                              puVar3 = *(uint **)(*(int *)(in_ECX + 0x18) + iVar2 * 4);
                              iVar2 = iVar1;
                              if ((*puVar3 & 0xfff00000) == 0x10000000) {
                                local_8 = 0;
                                local_34 = *puVar3 & 0xfffff;
                                iVar2 = local_20;
                                if (local_34 != 0) {
                                  piVar9 = (int *)puVar3[4];
                                  do {
                                    if (*piVar9 == iVar1) {
                                      iVar2 = *(int *)(puVar3[2] + local_8 * 4);
                                      break;
                                    }
                                    local_8 = local_8 + 1;
                                    piVar9 = piVar9 + 1;
                                  } while (local_8 < local_34);
                                }
                              }
                              goto LAB_100bf89c;
                            }
                          }
                          local_c = local_c + 1;
                          iVar4 = local_1c;
                        } while (local_c < *(uint *)(iVar7 + 4));
                      }
                      local_10 = local_10 + 1;
                    } while (local_10 <= *(uint *)(iVar4 + 0x58));
                    if (iVar5 != -1) {
                      iVar4 = FUN_10085814();
                      if (iVar4 == 0) {
                        iVar4 = 0;
                      }
                      else {
                        iVar4 = FUN_10085379();
                      }
                      if (iVar4 == 0) goto LAB_100bf5a1;
                      iVar5 = FUN_1008585f(0x74100001,3,1,0);
                      if ((iVar5 < 0) || (iVar5 = FUN_100853b0(), iVar5 < 0)) {
                        FUN_1006c418();
                        return iVar5;
                      }
                      **(undefined4 **)(iVar4 + 0x10) = *(undefined4 *)local_18[4];
                      **(undefined4 **)(iVar4 + 8) = *(undefined4 *)local_18[2];
                      iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)local_18[2] * 4);
                      uVar6 = FUN_10086139(*(undefined4 *)(iVar5 + 4),*(undefined4 *)(iVar5 + 0xc),2
                                           ,0);
                      *(undefined4 *)(*(int *)(iVar4 + 8) + 4) = uVar6;
                      uVar6 = FUN_10086139(*(undefined4 *)(iVar5 + 4),*(undefined4 *)(iVar5 + 0xc),2
                                           ,0x3ff0000000000000);
                      *(undefined4 *)(*(int *)(iVar4 + 8) + 8) = uVar6;
                      iVar4 = FUN_10085abe();
                      FUN_1006c418();
                      if (iVar4 < 0) {
                        return iVar4;
                      }
                    }
                  }
                }
              }
            }
            local_2c = local_2c + 4;
            local_38 = local_38 + 1;
            puVar8 = local_24;
          } while (local_38 < local_3c);
        }
        iVar4 = 0;
      }
    }
  }
  else {
    iVar4 = 1;
  }
  return iVar4;
}


