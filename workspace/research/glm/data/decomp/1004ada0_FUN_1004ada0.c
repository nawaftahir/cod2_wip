// 1004ada0 size=549 FUN_1004ada0

undefined4 FUN_1004ada0(int param_1)

{
  int iVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  uint uVar8;
  int iVar9;
  undefined4 uVar10;
  int *piVar11;
  int iVar12;
  int *piVar13;
  int *local_2c;
  int *local_28;
  int iStack_24;
  int local_20;
  int aiStack_10 [4];
  
  iVar1 = *(int *)(param_1 + 400);
  iVar12 = 0;
  if (0 < *(int *)(param_1 + 300)) {
    local_2c = (int *)(param_1 + 0x130);
    do {
      iVar4 = *(int *)(*local_2c + 0xc);
      iVar4 = (**(code **)(*(int *)(param_1 + 4) + 0x20))
                        (param_1,*(undefined4 *)(iVar1 + 0x48 + *(int *)(*local_2c + 4) * 4),
                         *(int *)(param_1 + 0x88) * iVar4,iVar4,1);
      aiStack_10[iVar12] = iVar4;
      iVar12 = iVar12 + 1;
      local_2c = local_2c + 1;
    } while (iVar12 < *(int *)(param_1 + 300));
  }
  iVar12 = *(int *)(iVar1 + 0x18);
  if (iVar12 < *(int *)(iVar1 + 0x1c)) {
    do {
      local_2c = *(int **)(iVar1 + 0x14);
      if (local_2c < *(uint *)(param_1 + 0x140)) {
        do {
          iVar4 = 0;
          local_20 = 0;
          if (0 < *(int *)(param_1 + 300)) {
            local_28 = (int *)(param_1 + 0x130);
            do {
              iVar2 = *local_28;
              iVar7 = *(int *)(iVar2 + 0x34);
              iVar5 = iVar7 * (int)local_2c;
              iStack_24 = 0;
              if (0 < *(int *)(iVar2 + 0x38)) {
                piVar11 = (int *)(aiStack_10[local_20] + iVar12 * 4);
                do {
                  iVar6 = *piVar11 + iVar5 * 0x80;
                  iVar9 = 0;
                  if (0 < iVar7) {
                    piVar13 = (int *)(iVar1 + 0x20 + iVar4 * 4);
                    do {
                      *piVar13 = iVar6;
                      iVar7 = *(int *)(iVar2 + 0x34);
                      iVar4 = iVar4 + 1;
                      piVar13 = piVar13 + 1;
                      iVar6 = iVar6 + 0x80;
                      iVar9 = iVar9 + 1;
                    } while (iVar9 < iVar7);
                  }
                  iStack_24 = iStack_24 + 1;
                  piVar11 = piVar11 + 1;
                } while (iStack_24 < *(int *)(iVar2 + 0x38));
              }
              local_20 = local_20 + 1;
              local_28 = local_28 + 1;
            } while (local_20 < *(int *)(param_1 + 300));
          }
          cVar3 = (**(code **)(*(int *)(param_1 + 0x1a0) + 4))(param_1,iVar1 + 0x20);
          if (cVar3 == '\0') {
            *(int *)(iVar1 + 0x18) = iVar12;
            *(int **)(iVar1 + 0x14) = local_2c;
            return 0;
          }
          local_2c = (int *)((int)local_2c + 1);
        } while (local_2c < *(uint *)(param_1 + 0x140));
      }
      *(undefined4 *)(iVar1 + 0x14) = 0;
      iVar12 = iVar12 + 1;
    } while (iVar12 < *(int *)(iVar1 + 0x1c));
  }
  uVar8 = *(int *)(param_1 + 0x88) + 1;
  *(uint *)(param_1 + 0x88) = uVar8;
  if (*(uint *)(param_1 + 0x124) <= uVar8) {
    (**(code **)(*(int *)(param_1 + 0x198) + 0xc))(param_1);
    return 4;
  }
  iVar1 = *(int *)(param_1 + 400);
  if (*(int *)(param_1 + 300) < 2) {
    if (uVar8 < *(uint *)(param_1 + 0x124) - 1) {
      uVar10 = *(undefined4 *)(*(int *)(param_1 + 0x130) + 0xc);
    }
    else {
      uVar10 = *(undefined4 *)(*(int *)(param_1 + 0x130) + 0x48);
    }
    *(undefined4 *)(iVar1 + 0x1c) = uVar10;
    *(undefined4 *)(iVar1 + 0x14) = 0;
    *(undefined4 *)(iVar1 + 0x18) = 0;
    return 3;
  }
  *(undefined4 *)(iVar1 + 0x1c) = 1;
  *(undefined4 *)(iVar1 + 0x14) = 0;
  *(undefined4 *)(iVar1 + 0x18) = 0;
  return 3;
}


