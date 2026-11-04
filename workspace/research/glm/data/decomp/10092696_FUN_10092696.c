// 10092696 size=712 FUN_10092696

int FUN_10092696(int *param_1,uint param_2,undefined4 param_3,int param_4,uint param_5)

{
  undefined4 *puVar1;
  int iVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  uint uVar7;
  int iVar8;
  int *piVar9;
  int in_ECX;
  uint *puVar10;
  int local_40;
  undefined4 uStack_3c;
  undefined4 uStack_38;
  undefined4 uStack_34;
  int local_30 [4];
  int local_20;
  uint local_1c;
  int local_18;
  uint local_14;
  uint local_10;
  uint local_c;
  int local_8;
  
  piVar3 = param_1;
  iVar5 = *(int *)(*(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4) + 0x38);
  if (iVar5 != -1) {
    param_2 = iVar5;
  }
  iVar5 = *(int *)(*(int *)(in_ECX + 0x14) + param_2 * 4);
  local_18 = iVar5;
  if (((*param_1 == *(int *)(iVar5 + 4)) &&
      (iVar4 = *(int *)(iVar5 + 0xc) * 4, *(int *)(iVar4 + param_1[4]) == -1)) &&
     (((uint)param_1[1] <= *(uint *)(iVar4 + param_1[2]) ||
      ((uint)param_1[1] <= *(uint *)(iVar4 + param_1[3]))))) {
    local_10 = 0xffffffff;
    local_c = 0xffffffff;
    local_8 = in_ECX;
    if (param_5 == -1) {
      param_5 = 0;
      if (param_1[0xb] != 0) {
        do {
          uVar7 = *(uint *)(piVar3[8] + param_5 * 4);
          param_1 = (int *)0x0;
          iVar5 = *(int *)(local_18 + 0xc) * 4;
          local_1c = *(uint *)(piVar3[0xf] + iVar5);
          local_20 = piVar3[0x11] + *(int *)(piVar3[0x10] + iVar5) * 4;
          local_14 = uVar7;
          if (local_1c == 0) {
LAB_1009277b:
            if (param_4 != -1) {
              param_1 = (int *)0x0;
              iVar5 = *(int *)(*(int *)(*(int *)(local_8 + 0x14) + param_4 * 4) + 0xc) * 4;
              uVar6 = *(uint *)(iVar5 + piVar3[0xf]);
              if (uVar6 != 0) {
                do {
                  if (uVar7 == *(uint *)(piVar3[4] +
                                        *(int *)(piVar3[0x11] + *(int *)(iVar5 + piVar3[0x10]) * 4 +
                                                (int)param_1 * 4) * 4)) break;
                  param_1 = (int *)((int)param_1 + 1);
                } while (param_1 < uVar6);
                if (param_1 < uVar6) goto LAB_100927f1;
              }
            }
            uVar6 = FUN_1008a24d(piVar3,param_2,uVar7,param_3,&local_40,local_c);
            if (uVar6 < local_c) {
              local_30[0] = local_40;
              local_30[1] = uStack_3c;
              local_30[2] = uStack_38;
              local_30[3] = uStack_34;
              iVar5 = local_18;
              local_10 = uVar7;
              local_c = uVar6;
              if (uVar6 == 0) break;
            }
          }
          else {
            do {
              if (uVar7 == *(uint *)(piVar3[4] + *(int *)(local_20 + (int)param_1 * 4) * 4)) break;
              param_1 = (int *)((int)param_1 + 1);
            } while (param_1 < local_1c);
            if (local_1c <= param_1) goto LAB_1009277b;
          }
LAB_100927f1:
          param_5 = param_5 + 1;
          iVar5 = local_18;
        } while (param_5 < (uint)piVar3[0xb]);
        goto LAB_10092829;
      }
    }
    else {
      local_10 = *(uint *)(param_1[8] + param_5 * 4);
      local_c = FUN_1008a24d(param_1,param_2,local_10,param_3,local_30,0xffffffff);
LAB_10092829:
      if (local_c != 0xffffffff) {
        *(uint *)(piVar3[4] + *(int *)(iVar5 + 0xc) * 4) = local_10;
        if (((*(byte *)(local_8 + 0xcc) & 4) != 0) && (local_10 < (uint)piVar3[9])) {
          uVar7 = 0;
          for (puVar10 = (uint *)piVar3[8]; uVar7 = uVar7 + 1, *puVar10 != local_10;
              puVar10 = puVar10 + 1) {
          }
          if (uVar7 < (uint)piVar3[9]) {
            do {
              puVar1 = (undefined4 *)(piVar3[8] + uVar7 * 4);
              uVar7 = uVar7 + 1;
              puVar1[-1] = *puVar1;
            } while (uVar7 < (uint)piVar3[9]);
          }
          *(uint *)(piVar3[8] + -4 + piVar3[9] * 4) = local_10;
        }
        param_2 = 0;
        do {
          iVar8 = (param_2 + *(int *)(iVar5 + 0xc) * 4) * 4;
          iVar4 = *(int *)(iVar8 + piVar3[6]);
          if (iVar4 != -1) {
            iVar2 = local_30[param_2];
            *(int *)(iVar8 + piVar3[5]) = iVar2;
            piVar9 = (int *)(piVar3[7] + (iVar2 + local_10 * 4) * 4);
            if (*piVar9 != -1) {
              do {
                if (*(uint *)(*(int *)(*(int *)(local_8 + 0x14) + *piVar9 * 4) + 0x58) <=
                    *(uint *)(*(int *)(*(int *)(local_8 + 0x14) + iVar4 * 4) + 0x58)) break;
                piVar9 = (int *)(*(int *)(*piVar9 * 4 + *(int *)(local_8 + 0x14)) + 0x30);
              } while (*piVar9 != -1);
            }
            *(int *)(*(int *)(*(int *)(local_8 + 0x14) + iVar4 * 4) + 0x30) = *piVar9;
            *piVar9 = iVar4;
          }
          param_2 = param_2 + 1;
        } while (param_2 < 4);
        goto LAB_10092939;
      }
    }
    if ((*(byte *)(piVar3 + 0x18) & 2) != 0) {
      FUN_1008b0b5(local_8,*(undefined4 *)(piVar3[0x17] + 0x3c),0xfa4,
                   "program too complex; there are more active values than registers");
    }
    iVar5 = -0x7fffbffb;
  }
  else {
LAB_10092939:
    if ((*(int *)(iVar5 + 8) == -1) ||
       (iVar5 = FUN_10092696(piVar3,*(int *)(iVar5 + 8),0,0xffffffff,0xffffffff), -1 < iVar5)) {
      iVar5 = 0;
    }
  }
  return iVar5;
}


