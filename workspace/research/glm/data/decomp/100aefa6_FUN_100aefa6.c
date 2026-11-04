// 100aefa6 size=1580 FUN_100aefa6

/* WARNING: Type propagation algorithm not settling */

int FUN_100aefa6(int *param_1,uint param_2,int param_3,uint param_4)

{
  uint *puVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int in_ECX;
  uint uVar5;
  uint uVar6;
  undefined4 uVar7;
  undefined8 uVar8;
  uint auStack_88 [6];
  uint auStack_70 [9];
  uint local_4c [4];
  uint auStack_3c [4];
  uint local_2c;
  uint *local_28;
  uint local_24;
  uint local_20;
  uint *local_1c;
  int *local_18;
  int *local_14;
  int *local_10;
  uint local_c;
  uint local_8;
  
  local_2c = 0;
  local_4c[0] = 0;
  local_4c[1] = 0;
  local_4c[2] = 0;
  if (param_2 != 0) {
    local_18 = param_1;
    do {
      puVar1 = (uint *)*local_18;
      if (puVar1 != (uint *)0x0) {
        uVar5 = *puVar1 & 0xfffff;
        uVar6 = uVar5;
        if ((*puVar1 & 0xfff00000) == 0x60000000) {
          uVar6 = 1;
        }
        if ((uVar6 == param_4) && ((*puVar1 & 0xfff00000) != 0x11000000)) {
          local_c = 0;
          local_8 = 0;
          if (param_4 != 0) {
            local_10 = (int *)(puVar1[2] + uVar5 * 4);
            do {
              piVar3 = (int *)FUN_100ae879(*(undefined4 *)(in_ECX + 0x22c),
                                           *(undefined4 *)(in_ECX + 0x220),local_10,1,0);
              uVar6 = local_8;
              local_14 = piVar3;
              auStack_70[local_8 + 6] = (uint)piVar3;
              if ((piVar3 == (int *)0x0) || (*piVar3 != 0x50000003)) {
                local_c = 1;
              }
              else {
                FUN_100ae971(*(undefined4 *)(in_ECX + 0x22c),*(undefined4 *)(in_ECX + 0x220),
                             local_14,auStack_70 + uVar6 + 0xd,auStack_70 + uVar6,auStack_88 + uVar6
                             ,0,0);
                local_1c = auStack_88 + uVar6 + 3;
                FUN_100ae971(param_3,4,local_14,local_1c,auStack_70 + uVar6 + 3,local_4c + 3,1,0);
                if (((auStack_88[uVar6] == 0) || (*local_1c != auStack_88[3])) || (local_4c[3] == 0)
                   ) {
                  local_c = 1;
                }
              }
              local_8 = local_8 + 1;
              local_10 = local_10 + 1;
            } while (local_8 < param_4);
            if (local_c != 0) goto LAB_100af51c;
          }
          local_8 = 0;
          if (param_4 != 0) {
            do {
              uVar6 = local_8;
              local_20 = *(uint *)(in_ECX + 0x4c);
              if (local_20 < *(uint *)(in_ECX + 0x224)) {
                local_14 = (int *)(*(int *)(in_ECX + 0x230) + local_20 * 4);
                do {
                  local_10 = (int *)*local_14;
                  if (((local_10 != (int *)0x0) &&
                      (puVar1 = (uint *)*local_18, puVar1 != (uint *)0x0)) && (*local_10 != 0)) {
                    local_c = *puVar1 & 0xfffff;
                    local_24 = puVar1[1];
                    if (*puVar1 == 0x72d00003) {
                      local_24 = 6;
                    }
                    if (local_c < local_24) {
                      local_1c = (uint *)local_10[1];
                      do {
                        local_28 = (uint *)0x0;
                        if (local_1c != (uint *)0x0) {
                          iVar4 = *(int *)(puVar1[2] + local_c * 4);
                          piVar3 = (int *)local_10[2];
                          do {
                            if ((*piVar3 == iVar4) ||
                               (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar3 * 4) + 0x38) ==
                                iVar4)) goto LAB_100af55e;
                            local_28 = (uint *)((int)local_28 + 1);
                            piVar3 = piVar3 + 1;
                            local_1c = (uint *)local_10[1];
                          } while (local_28 < (uint *)local_10[1]);
                        }
                        local_c = local_c + 1;
                      } while (local_c < local_24);
                    }
                  }
                  local_14 = local_14 + 1;
                  local_20 = local_20 + 1;
                } while (local_20 < *(uint *)(in_ECX + 0x224));
              }
              if ((local_8 != 0) &&
                 ((auStack_70[local_8 + 0xc] <= auStack_88[3] ||
                  (auStack_70[local_8 + 0xd] != auStack_70[local_8 + 0xc] + 1)))) goto LAB_100af5c7;
              if ((*(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                    *(int *)(*(int *)(auStack_70[local_8 + 6] + 8) +
                                            auStack_70[local_8] * 4) * 4) + 0x3c) != 0) ||
                 ((iVar4 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) +
                                            *(int *)(*(int *)(auStack_70[local_8 + 6] + 8) +
                                                    auStack_70[local_8 + 3] * 4) * 4) + 0x3c),
                  iVar4 != 0 && (iVar4 != 0x60000)))) goto LAB_100af55e;
              iVar4 = FUN_10085814();
              if (iVar4 == 0) {
                uVar5 = 0;
              }
              else {
                uVar5 = FUN_10085379();
              }
              auStack_70[uVar6 + 9] = uVar5;
              if (uVar5 == 0) {
                iVar4 = -0x7ff8fff2;
                goto LAB_100af531;
              }
              if (local_8 == param_4 - 1) {
                if (*(int *)*local_18 == 0x72d00003) {
                  if (param_4 != 3) {
LAB_100af5a7:
                    iVar4 = 1;
                    goto LAB_100af531;
                  }
                  uVar8 = 4;
                  uVar7 = 9;
                  iVar4 = 0x72a00003;
                }
                else if (*(int *)*local_18 == 0x72c00003) {
                  if (param_4 != 3) goto LAB_100af5a7;
                  uVar8 = 4;
                  uVar7 = 6;
                  iVar4 = 0x72900003;
                }
                else {
                  uVar8 = 4;
                  uVar7 = 6;
                  if (param_4 != 1) {
                    iVar4 = ((param_4 != 3) - 1 & 0x200000) + 0x72300003;
                    goto LAB_100af2e4;
                  }
                  iVar4 = 0x72b00003;
                }
              }
              else {
                uVar8 = 0;
                iVar4 = ((param_4 != 3) - 1 & 0x200000) + 0x72200003;
LAB_100af2e4:
                uVar7 = 6;
              }
              iVar4 = FUN_1008585f(iVar4,uVar7,uVar8);
              if (iVar4 < 0) goto LAB_100af531;
              local_8 = local_8 + 1;
            } while (local_8 < param_4);
          }
          local_8 = 0;
          if (param_4 != 0) {
            do {
              local_14 = (int *)0x0;
              uVar6 = auStack_70[local_8 + 9];
              local_1c = (uint *)auStack_70[local_8 + 6];
              local_10 = (int *)auStack_88[local_8];
              local_24 = auStack_70[local_8 + 3] << 2;
              local_20 = auStack_70[local_8] << 2;
              uVar5 = 0xc;
              do {
                *(undefined4 *)((uVar5 - 0xc) + *(int *)(uVar6 + 8)) =
                     *(undefined4 *)(local_20 + local_1c[2]);
                *(undefined4 *)(uVar5 + *(int *)(uVar6 + 8)) =
                     *(undefined4 *)(local_24 + local_1c[2]);
                local_c = *(uint *)(*(int *)(in_ECX + 0x14) +
                                   *(int *)(*(int *)(uVar6 + 8) + -0xc + uVar5) * 4);
                auStack_3c[3] =
                     *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(uVar5 + *(int *)(uVar6 + 8)) * 4);
                iVar4 = FUN_10086139(*(undefined4 *)(in_ECX + 0x80),0,0,0);
                local_28 = *(uint **)(*(int *)(in_ECX + 0x14) + iVar4 * 4);
                *(int *)(uVar5 + *(int *)(uVar6 + 8)) = iVar4;
                FUN_10085c65();
                auStack_3c[3] = *(uint *)(auStack_3c[3] + 0x3c);
                FUN_10085c65();
                local_28[4] = (uint)local_14;
                local_28[0xf] = auStack_3c[3];
                if ((*(int *)*local_18 == 0x72d00003) && (local_8 == param_4 - 1)) {
                  *(undefined4 *)(uVar5 + 0xc + *(int *)(uVar6 + 8)) =
                       *(undefined4 *)(uVar5 + 0xc + ((int *)*local_18)[2]);
                }
                local_14 = (int *)((int)local_14 + 1);
                local_20 = local_20 + 4;
                local_24 = local_24 + 4;
                uVar5 = uVar5 + 4;
              } while (uVar5 < 0x18);
              local_8 = local_8 + 1;
            } while (local_8 < param_4);
          }
          uVar6 = auStack_70[param_4 + 8];
          uVar5 = 0;
          do {
            *(undefined4 *)(uVar5 + *(int *)(uVar6 + 0x10)) =
                 *(undefined4 *)(uVar5 + *(int *)(*local_18 + 0x10));
            uVar5 = uVar5 + 4;
          } while (uVar5 < 0x10);
          uVar6 = 0;
          if (param_4 != 0) {
            do {
              if (*(int *)(param_3 + auStack_70[uVar6 + 0xd] * 4) != 0) goto LAB_100af567;
              uVar6 = uVar6 + 1;
            } while (uVar6 < param_4);
          }
          iVar4 = *(int *)(*(int *)(in_ECX + 0x14) + **(int **)(*local_18 + 8) * 4);
          uVar6 = *(uint *)(*(int *)(*(int *)(in_ECX + 0x10) + *(int *)(iVar4 + 4) * 4) + 4);
          if (-1 < (char)uVar6) {
LAB_100af55e:
            FUN_1008b0b5();
LAB_100af567:
            iVar4 = -0x7fffbffb;
            goto LAB_100af531;
          }
          if ((uVar6 & 0x840) == 0) {
            *(uint *)(iVar4 + 0xc) = auStack_70[param_4 + 0xc];
          }
          else if (auStack_70[param_4 + 0xc] != *(uint *)(iVar4 + 0xc)) {
LAB_100af5c7:
            FUN_1008b0b5();
            goto LAB_100af567;
          }
          local_8 = 0;
          if (param_4 != 0) {
            do {
              iVar2 = local_8 + 9;
              *(uint *)(param_3 + auStack_70[local_8 + 0xd] * 4) = auStack_70[iVar2];
              iVar4 = FUN_10086026();
              if (iVar4 < 0) goto LAB_100af531;
              *local_18 = 0;
              auStack_70[iVar2] = 0;
              local_8 = local_8 + 1;
            } while (local_8 < param_4);
          }
        }
      }
LAB_100af51c:
      local_2c = local_2c + 1;
      local_18 = local_18 + 1;
    } while (local_2c < param_2);
  }
  iVar4 = 0;
LAB_100af531:
  uVar6 = 0;
  do {
    if (auStack_70[uVar6 + 9] != 0) {
      FUN_1006c418();
    }
    uVar6 = uVar6 + 1;
  } while (uVar6 < 3);
  return iVar4;
}


