// 100423a0 size=518 FUN_100423a0

uint FUN_100423a0(int param_1)

{
  int iVar1;
  int iVar2;
  char cVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  int iVar9;
  int *piVar10;
  int iVar11;
  int *piVar12;
  int *local_2c;
  int *local_28;
  int iStack_24;
  int local_20;
  int aiStack_10 [4];
  
  iVar1 = *(int *)(param_1 + 0x150);
  iVar11 = 0;
  if (0 < *(int *)(param_1 + 0xec)) {
    local_2c = (int *)(param_1 + 0xf0);
    do {
      iVar4 = *(int *)(*local_2c + 0xc);
      iVar4 = (**(code **)(*(int *)(param_1 + 4) + 0x20))
                        (param_1,*(undefined4 *)(iVar1 + 0x40 + *(int *)(*local_2c + 4) * 4),
                         *(int *)(iVar1 + 8) * iVar4,iVar4,0);
      aiStack_10[iVar11] = iVar4;
      iVar11 = iVar11 + 1;
      local_2c = local_2c + 1;
    } while (iVar11 < *(int *)(param_1 + 0xec));
  }
  iVar11 = *(int *)(iVar1 + 0x10);
  if (iVar11 < *(int *)(iVar1 + 0x14)) {
    do {
      local_2c = *(int **)(iVar1 + 0xc);
      if (local_2c < *(uint *)(param_1 + 0x100)) {
        do {
          iVar4 = 0;
          local_20 = 0;
          if (0 < *(int *)(param_1 + 0xec)) {
            local_28 = (int *)(param_1 + 0xf0);
            do {
              iVar2 = *local_28;
              iVar8 = *(int *)(iVar2 + 0x34);
              iVar5 = iVar8 * (int)local_2c;
              iStack_24 = 0;
              if (0 < *(int *)(iVar2 + 0x38)) {
                piVar10 = (int *)(aiStack_10[local_20] + iVar11 * 4);
                do {
                  iVar6 = *piVar10 + iVar5 * 0x80;
                  iVar9 = 0;
                  if (0 < iVar8) {
                    piVar12 = (int *)(iVar1 + 0x18 + iVar4 * 4);
                    do {
                      *piVar12 = iVar6;
                      iVar8 = *(int *)(iVar2 + 0x34);
                      iVar4 = iVar4 + 1;
                      piVar12 = piVar12 + 1;
                      iVar6 = iVar6 + 0x80;
                      iVar9 = iVar9 + 1;
                    } while (iVar9 < iVar8);
                  }
                  iStack_24 = iStack_24 + 1;
                  piVar10 = piVar10 + 1;
                } while (iStack_24 < *(int *)(iVar2 + 0x38));
              }
              local_20 = local_20 + 1;
              local_28 = local_28 + 1;
            } while (local_20 < *(int *)(param_1 + 0xec));
          }
          cVar3 = (**(code **)(*(int *)(param_1 + 0x164) + 4))(param_1,iVar1 + 0x18);
          if (cVar3 == '\0') {
            *(int *)(iVar1 + 0x10) = iVar11;
            *(int **)(iVar1 + 0xc) = local_2c;
            return (uint)local_2c & 0xffffff00;
          }
          local_2c = (int *)((int)local_2c + 1);
        } while (local_2c < *(uint *)(param_1 + 0x100));
      }
      *(undefined4 *)(iVar1 + 0xc) = 0;
      iVar11 = iVar11 + 1;
    } while (iVar11 < *(int *)(iVar1 + 0x14));
  }
  *(int *)(iVar1 + 8) = *(int *)(iVar1 + 8) + 1;
  iVar1 = *(int *)(param_1 + 0x150);
  uVar7 = 1;
  if (1 < *(int *)(param_1 + 0xec)) {
    *(undefined4 *)(iVar1 + 0x14) = 1;
    *(undefined4 *)(iVar1 + 0xc) = 0;
    *(undefined4 *)(iVar1 + 0x10) = 0;
    return uVar7;
  }
  if (*(int *)(param_1 + 0xe8) - 1U <= *(uint *)(iVar1 + 8)) {
    *(undefined4 *)(iVar1 + 0x14) = *(undefined4 *)(*(int *)(param_1 + 0xf0) + 0x48);
    *(undefined4 *)(iVar1 + 0xc) = 0;
    *(undefined4 *)(iVar1 + 0x10) = 0;
    return uVar7;
  }
  *(undefined4 *)(iVar1 + 0x14) = *(undefined4 *)(*(int *)(param_1 + 0xf0) + 0xc);
  *(undefined4 *)(iVar1 + 0xc) = 0;
  *(undefined4 *)(iVar1 + 0x10) = 0;
  return uVar7;
}


