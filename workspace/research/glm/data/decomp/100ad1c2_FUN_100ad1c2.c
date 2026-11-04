// 100ad1c2 size=427 FUN_100ad1c2

undefined4 FUN_100ad1c2(uint param_1,int param_2,uint param_3,int param_4,uint param_5)

{
  uint *puVar1;
  int iVar2;
  uint *puVar3;
  int *piVar4;
  uint uVar5;
  int in_ECX;
  uint uVar6;
  int *piVar7;
  uint uVar8;
  uint local_18;
  uint local_10;
  uint local_c;
  uint local_8;
  
  local_8 = 0;
  if (param_3 != 0) {
    do {
      puVar1 = *(uint **)(param_2 + local_8 * 4);
      uVar8 = 0;
      if ((puVar1 != (uint *)0x0) && (uVar5 = *puVar1, uVar5 != 0)) {
        uVar6 = uVar5 & 0xfff00000;
        uVar5 = uVar5 & 0xfffff;
        if ((uVar6 == 0x60000000) ||
           (((uVar6 == 0x60500000 || (uVar6 == 0x60a00000)) || (uVar6 == 0x60f00000)))) {
          if (uVar6 == 0x72100000) goto LAB_100ad2b9;
        }
        else {
          if (uVar6 != 0x72100000) {
            if (param_5 != 0) {
              uVar5 = puVar1[1];
              do {
                local_c = 0;
                if (uVar5 != 0) {
                  iVar2 = *(int *)(param_4 + uVar8 * 4);
                  piVar7 = (int *)puVar1[2];
                  do {
                    if ((((*piVar7 == iVar2) ||
                         (*(int *)(*(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4) + 0x38) == iVar2)
                         ) && ((puVar3 = *(uint **)(param_2 + param_1 * 4), puVar3 != (uint *)0x0 &&
                               ((param_1 < local_8 && (uVar5 = *puVar3, uVar5 != 0)))))) &&
                       ((uVar5 & 0xfff00000) != 0x11000000)) {
                      return 1;
                    }
                    local_c = local_c + 1;
                    uVar5 = puVar1[1];
                    piVar7 = piVar7 + 1;
                  } while (local_c < uVar5);
                }
                uVar8 = uVar8 + 1;
              } while (uVar8 < param_5);
            }
            goto LAB_100ad331;
          }
LAB_100ad2b9:
          uVar5 = 0;
        }
        local_18 = 0;
        if (param_5 != 0) {
          uVar8 = puVar1[1];
          do {
            if (uVar5 < uVar8) {
              piVar7 = (int *)(puVar1[2] + uVar5 * 4);
              local_10 = uVar5;
              do {
                if ((((*piVar7 == *(int *)(param_4 + local_18 * 4)) &&
                     (piVar4 = *(int **)(param_2 + param_1 * 4), piVar4 != (int *)0x0)) &&
                    (param_1 < local_8)) && (*piVar4 != 0)) {
                  return 1;
                }
                iVar2 = *(int *)(*(int *)(in_ECX + 0x14) + *piVar7 * 4);
                if (((*(byte *)(iVar2 + 0x3e) & 0x1f) != 0) || (*(int *)(iVar2 + 0x38) != -1)) {
                  FUN_1008b0b5();
                  return 0x80004005;
                }
                local_10 = local_10 + 1;
                uVar8 = puVar1[1];
                piVar7 = piVar7 + 1;
              } while (local_10 < uVar8);
            }
            local_18 = local_18 + 1;
          } while (local_18 < param_5);
        }
      }
LAB_100ad331:
      local_8 = local_8 + 1;
    } while (local_8 < param_3);
  }
  return 0;
}


