// 100566a0 size=991 FUN_100566a0

void FUN_100566a0(int *param_1)

{
  short sVar1;
  int iVar2;
  int iVar3;
  short *psVar4;
  short *psVar5;
  int in_ECX;
  int iVar6;
  int iVar7;
  int iVar8;
  int local_1c;
  int local_18;
  int local_14;
  int local_10;
  int local_c;
  int local_4;
  
  iVar2 = *(int *)(*(int *)(in_ECX + 0x1b0) + 0x18);
  local_10 = *param_1;
  local_14 = param_1[5];
  local_4 = param_1[3];
  local_18 = param_1[1];
  local_1c = param_1[2];
  iVar8 = param_1[4];
  iVar3 = local_10;
  if (local_10 < local_18) {
    do {
      if (local_1c <= local_4) {
        psVar4 = (short *)(*(int *)(iVar2 + iVar3 * 4) + (local_1c * 0x20 + iVar8) * 2);
        iVar7 = iVar8;
        iVar6 = local_1c;
        psVar5 = psVar4;
        do {
          for (; iVar7 <= local_14; iVar7 = iVar7 + 1) {
            sVar1 = *psVar4;
            psVar4 = psVar4 + 1;
            if (sVar1 != 0) {
              *param_1 = iVar3;
              local_10 = iVar3;
              goto LAB_10056755;
            }
          }
          iVar6 = iVar6 + 1;
          psVar4 = psVar5 + 0x20;
          iVar7 = iVar8;
          psVar5 = psVar4;
        } while (iVar6 <= local_4);
      }
      iVar3 = iVar3 + 1;
    } while (iVar3 <= local_18);
LAB_10056755:
    iVar3 = local_18;
    if (local_10 < local_18) {
      do {
        if (local_1c <= local_4) {
          psVar4 = (short *)(*(int *)(iVar2 + iVar3 * 4) + (local_1c * 0x20 + iVar8) * 2);
          iVar7 = iVar8;
          iVar6 = local_1c;
          psVar5 = psVar4;
          do {
            for (; iVar7 <= local_14; iVar7 = iVar7 + 1) {
              sVar1 = *psVar4;
              psVar4 = psVar4 + 1;
              if (sVar1 != 0) {
                param_1[1] = iVar3;
                local_18 = iVar3;
                goto LAB_100567da;
              }
            }
            iVar6 = iVar6 + 1;
            psVar4 = psVar5 + 0x20;
            iVar7 = iVar8;
            psVar5 = psVar4;
          } while (iVar6 <= local_4);
        }
        iVar3 = iVar3 + -1;
      } while (local_10 <= iVar3);
    }
  }
LAB_100567da:
  if (local_1c < local_4) {
    iVar7 = (local_1c * 0x20 + iVar8) * 2;
    iVar3 = local_10;
    local_c = local_1c;
    do {
      for (; iVar3 <= local_18; iVar3 = iVar3 + 1) {
        psVar4 = (short *)(*(int *)(iVar2 + iVar3 * 4) + iVar7);
        for (iVar6 = iVar8; iVar6 <= local_14; iVar6 = iVar6 + 1) {
          sVar1 = *psVar4;
          psVar4 = psVar4 + 1;
          if (sVar1 != 0) {
            param_1[2] = local_c;
            local_1c = local_c;
            goto LAB_1005685a;
          }
        }
      }
      local_c = local_c + 1;
      iVar7 = iVar7 + 0x40;
      iVar3 = local_10;
    } while (local_c <= local_4);
LAB_1005685a:
    if (local_1c < local_4) {
      iVar7 = (local_4 * 0x20 + iVar8) * 2;
      iVar3 = local_10;
      local_c = local_4;
      do {
        for (; iVar3 <= local_18; iVar3 = iVar3 + 1) {
          psVar4 = (short *)(*(int *)(iVar2 + iVar3 * 4) + iVar7);
          for (iVar6 = iVar8; iVar6 <= local_14; iVar6 = iVar6 + 1) {
            sVar1 = *psVar4;
            psVar4 = psVar4 + 1;
            if (sVar1 != 0) {
              param_1[3] = local_c;
              local_4 = local_c;
              goto LAB_100568da;
            }
          }
        }
        local_c = local_c + -1;
        iVar7 = iVar7 + -0x40;
        iVar3 = local_10;
      } while (local_1c <= local_c);
    }
  }
LAB_100568da:
  local_c = iVar8;
  if (iVar8 < local_14) {
    do {
      if (local_10 <= local_18) {
        iVar3 = local_10;
        do {
          psVar4 = (short *)(*(int *)(iVar2 + iVar3 * 4) + (local_1c * 0x20 + local_c) * 2);
          for (iVar7 = local_1c; iVar7 <= local_4; iVar7 = iVar7 + 1) {
            if (*psVar4 != 0) {
              param_1[4] = local_c;
              iVar8 = local_c;
              goto LAB_10056949;
            }
            psVar4 = psVar4 + 0x20;
          }
          iVar3 = iVar3 + 1;
        } while (iVar3 <= local_18);
      }
      local_c = local_c + 1;
    } while (local_c <= local_14);
LAB_10056949:
    local_c = local_14;
    if (iVar8 < local_14) {
      do {
        if (local_10 <= local_18) {
          iVar3 = local_10;
          do {
            psVar4 = (short *)(*(int *)(iVar2 + iVar3 * 4) + (local_1c * 0x20 + local_c) * 2);
            for (iVar7 = local_1c; iVar7 <= local_4; iVar7 = iVar7 + 1) {
              if (*psVar4 != 0) {
                param_1[5] = local_c;
                local_14 = local_c;
                goto LAB_100569bd;
              }
              psVar4 = psVar4 + 0x20;
            }
            iVar3 = iVar3 + 1;
          } while (iVar3 <= local_18);
        }
        local_c = local_c + -1;
      } while (iVar8 <= local_c);
    }
  }
LAB_100569bd:
  iVar6 = (local_14 - iVar8) * 0x10;
  iVar7 = (local_4 - local_1c) * 0xc;
  iVar3 = (local_18 - local_10) * 8;
  param_1[6] = iVar6 * iVar6 + iVar7 * iVar7 + iVar3 * iVar3;
  iVar3 = 0;
  local_c = local_10;
  if (local_10 <= local_18) {
    do {
      if (local_1c <= local_4) {
        local_10 = (local_4 - local_1c) + 1;
        psVar4 = (short *)(*(int *)(iVar2 + local_c * 4) + (local_1c * 0x20 + iVar8) * 2);
        do {
          if (iVar8 <= local_14) {
            iVar7 = (local_14 - iVar8) + 1;
            psVar5 = psVar4;
            do {
              if (*psVar5 != 0) {
                iVar3 = iVar3 + 1;
              }
              psVar5 = psVar5 + 1;
              iVar7 = iVar7 + -1;
            } while (iVar7 != 0);
          }
          psVar4 = psVar4 + 0x20;
          local_10 = local_10 + -1;
        } while (local_10 != 0);
      }
      local_c = local_c + 1;
    } while (local_c <= local_18);
    param_1[7] = iVar3;
    return;
  }
  param_1[7] = 0;
  return;
}


