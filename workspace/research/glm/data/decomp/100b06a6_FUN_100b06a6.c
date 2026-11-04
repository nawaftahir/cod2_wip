// 100b06a6 size=636 FUN_100b06a6

undefined4 FUN_100b06a6(int param_1,int *param_2,uint param_3,int *param_4)

{
  bool bVar1;
  bool bVar2;
  bool bVar3;
  int iVar4;
  uint uVar5;
  int *piVar6;
  int *in_ECX;
  uint uVar7;
  uint uVar8;
  uint *puVar9;
  uint *puVar10;
  uint *puVar11;
  uint local_18;
  uint local_14;
  int *local_c;
  
  if (param_4 != (int *)0x0) {
    *param_4 = 0;
  }
  if (param_3 != 0) {
    uVar7 = (uint)param_2;
    if (param_4 == (int *)0x0) {
      for (; uVar7 < param_3; uVar7 = uVar7 + 1) {
        iVar4 = *(int *)(param_1 + uVar7 * 4);
        if (iVar4 != 0) {
          *(undefined4 *)(iVar4 + 0x24) = 0;
        }
      }
    }
    uVar7 = (uint)param_2;
    if (param_2 < param_3 - 1) {
      do {
        puVar11 = *(uint **)(param_1 + uVar7 * 4);
        uVar8 = uVar7;
        if (puVar11 != (uint *)0x0) {
          puVar9 = (uint *)0x0;
          if (param_4 != (int *)0x0) {
            *param_4 = *param_4 + 1;
          }
          do {
            if (param_3 - 1 <= uVar7) break;
            uVar7 = uVar7 + 1;
            puVar9 = *(uint **)(param_1 + uVar7 * 4);
          } while (puVar9 == (uint *)0x0);
          bVar3 = false;
          uVar8 = uVar7 - 1;
          if (puVar9 != (uint *)0x0) {
            bVar1 = false;
            if (param_4 == (int *)0x0) {
              puVar11[9] = 0;
              puVar9[9] = 0;
            }
            if (((*puVar11 & 0xfffff) == 1) && ((*puVar9 & 0xfffff) < 4)) {
              bVar1 = true;
              puVar10 = puVar11;
              puVar11 = puVar9;
            }
            else if (((*puVar11 & 0xfffff) == 4) || (puVar10 = puVar9, (*puVar9 & 0xfffff) != 1))
            goto LAB_100b0900;
            if (((((((in_ECX[0x32] & 0xffffU) == 0x104) ||
                   (iVar4 = (**(code **)(*in_ECX + 0xa4))(puVar11,puVar10), iVar4 == 0)) &&
                  (uVar5 = *puVar11 & 0xfff00000, uVar5 != 0x72100000)) &&
                 (((uVar5 != 0x72000000 && (uVar5 != 0x60500000)) &&
                  ((uVar5 != 0x60a00000 && ((uVar5 != 0x60000000 && (uVar5 != 0x60f00000)))))))) &&
                (uVar5 != 0x11000000)) && (uVar5 != 0)) {
              bVar2 = false;
              if (puVar11[3] != 0) {
                local_c = (int *)puVar11[4];
                local_18 = puVar11[3];
                do {
                  iVar4 = *local_c;
                  if (*(int *)(*(int *)(in_ECX[5] + iVar4 * 4) + 0x10) == 3) {
                    bVar3 = true;
                  }
                  if (puVar10[1] != 0) {
                    param_2 = (int *)puVar10[2];
                    local_14 = puVar10[1];
                    do {
                      if ((*(int *)(*(int *)(in_ECX[5] + *param_2 * 4) + 0x38) == iVar4) ||
                         (*param_2 == iVar4)) {
                        bVar2 = true;
                      }
                      param_2 = param_2 + 1;
                      local_14 = local_14 - 1;
                    } while (local_14 != 0);
                  }
                  local_c = local_c + 1;
                  local_18 = local_18 - 1;
                } while (local_18 != 0);
              }
              param_2 = (int *)0x0;
              if (puVar10[3] != 0) {
                do {
                  if (puVar11[1] != 0) {
                    local_18 = puVar11[1];
                    iVar4 = *(int *)(puVar10[4] + (int)param_2 * 4);
                    piVar6 = (int *)puVar11[2];
                    do {
                      if ((*(int *)(*(int *)(in_ECX[5] + *piVar6 * 4) + 0x38) == iVar4) ||
                         (*piVar6 == iVar4)) {
                        bVar2 = true;
                      }
                      piVar6 = piVar6 + 1;
                      local_18 = local_18 - 1;
                    } while (local_18 != 0);
                  }
                  param_2 = (int *)((int)param_2 + 1);
                } while (param_2 < puVar10[3]);
              }
              if ((((!bVar2) && (!bVar3)) &&
                  (*(int *)(*(int *)(in_ECX[5] + *(int *)puVar10[4] * 4) + 0x10) == 3)) &&
                 (uVar8 = uVar7, param_4 == (int *)0x0)) {
                if (bVar1) {
                  puVar11[9] = 1;
                }
                else {
                  puVar10[9] = 1;
                }
              }
            }
          }
        }
LAB_100b0900:
        uVar7 = uVar8 + 1;
      } while (uVar7 < param_3 - 1);
    }
    if ((uVar7 != param_3) && (param_4 != (int *)0x0)) {
      *param_4 = *param_4 + 1;
    }
  }
  return 0;
}


