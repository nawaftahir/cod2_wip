// 100c3a56 size=467 FUN_100c3a56

undefined4 FUN_100c3a56(uint param_1,uint *param_2,int *param_3,int param_4)

{
  uint uVar1;
  uint *puVar2;
  int iVar3;
  uint uVar4;
  uint uVar5;
  int in_ECX;
  int iVar6;
  int *piVar7;
  uint uVar8;
  uint uVar9;
  int *piVar10;
  uint local_18;
  int local_10;
  
  uVar8 = *param_2 & 0xfffff;
  if (uVar8 != 0) {
    uVar4 = param_2[1] / uVar8;
    if (uVar4 != 0) {
      local_10 = 0;
      piVar10 = param_3;
      local_18 = uVar4;
      do {
        iVar6 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(local_10 + param_2[2]) * 4);
        uVar5 = *(uint *)(iVar6 + 0x54);
        uVar9 = *(uint *)(iVar6 + 0x48);
        if (uVar9 == 0xffffffff) {
LAB_100c3bea:
          *piVar10 = 0;
        }
        else {
          puVar2 = *(uint **)(*(int *)(in_ECX + 0x18) + uVar9 * 4);
          *piVar10 = (int)puVar2;
          iVar6 = local_10;
          for (uVar1 = uVar8; uVar1 != 0; uVar1 = uVar1 - 1) {
            iVar3 = *(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar6 + param_2[2]) * 4);
            if (*(int *)(in_ECX + 0x88) != *(int *)(iVar3 + 4)) {
              *piVar10 = 0;
            }
            if (*(int *)(iVar3 + 0x3c) != 0) {
              *piVar10 = 0;
            }
            if ((uVar9 < *(uint *)(iVar3 + 0x50)) && (*(uint *)(iVar3 + 0x50) < uVar5)) {
              *piVar10 = 0;
            }
            if (*(int *)(iVar3 + 0x54) != *(int *)(iVar3 + 0x58)) {
              *piVar10 = 0;
            }
            iVar6 = iVar6 + 4;
          }
          if (*piVar10 != 0) {
            uVar5 = uVar8;
            iVar6 = local_10;
            if (param_1 == *puVar2) {
              for (; uVar5 != 0; uVar5 = uVar5 - 1) {
                if (*(uint *)(*(int *)(*(int *)(in_ECX + 0x14) + *(int *)(iVar6 + param_2[2]) * 4) +
                             0x48) != uVar9) {
                  *piVar10 = 0;
                }
                iVar6 = iVar6 + 4;
              }
              if (*piVar10 == 0) goto LAB_100c3bed;
              if ((puVar2[3] == (*puVar2 & 0xfffff)) && (puVar2[1] <= (*puVar2 & 0xfffff) * param_4)
                 ) {
                uVar5 = param_2[1];
                uVar9 = 0;
                if (uVar5 != 0) {
                  piVar7 = (int *)param_2[2];
                  do {
                    if (*piVar7 == *(int *)puVar2[4]) break;
                    uVar9 = uVar9 + 1;
                    piVar7 = piVar7 + 1;
                  } while (uVar9 < uVar5);
                }
                if (uVar9 != uVar5) {
                  if (1 < puVar2[3]) {
                    if ((puVar2[3] != uVar8) || (uVar5 < uVar9 + uVar8)) {
                      *piVar10 = 0;
                    }
                    uVar5 = 0;
                    if (uVar8 != 0) {
                      iVar6 = uVar9 << 2;
                      do {
                        if (*(int *)(puVar2[4] + uVar5 * 4) != *(int *)(iVar6 + param_2[2])) {
                          *piVar10 = 0;
                        }
                        uVar5 = uVar5 + 1;
                        iVar6 = iVar6 + 4;
                      } while (uVar5 < uVar8);
                    }
                  }
                  goto LAB_100c3bed;
                }
              }
            }
            goto LAB_100c3bea;
          }
        }
LAB_100c3bed:
        local_10 = local_10 + uVar8 * 4;
        piVar10 = piVar10 + 1;
        local_18 = local_18 - 1;
      } while (local_18 != 0);
    }
    uVar8 = 0;
    if (uVar4 != 0) {
      do {
        if (param_3[uVar8] != 0) {
          return 0;
        }
        uVar8 = uVar8 + 1;
      } while (uVar8 < uVar4);
    }
  }
  return 1;
}


