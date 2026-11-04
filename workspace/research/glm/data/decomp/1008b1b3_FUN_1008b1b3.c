// 1008b1b3 size=415 FUN_1008b1b3

undefined4 FUN_1008b1b3(int *param_1,uint param_2)

{
  uint *puVar1;
  uint *puVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  uint uVar6;
  int iVar7;
  undefined4 uVar8;
  int *piVar9;
  int in_ECX;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  uint local_c;
  int *local_8;
  
  iVar5 = param_2;
  puVar1 = *(uint **)(*(int *)(param_2 + 0x18) + in_ECX * 4);
  puVar2 = *(uint **)(*(int *)(param_2 + 0x18) + (int)param_1 * 4);
  if (*puVar1 < *puVar2) {
LAB_1008b348:
    uVar8 = 0xffffffff;
  }
  else if (*puVar1 == *puVar2) {
    local_8 = (int *)0x0;
    if (puVar1[3] != 0) {
      param_1 = (int *)puVar2[4];
      iVar7 = puVar1[4] - (int)param_1;
      do {
        iVar3 = *(int *)(*(int *)(param_2 + 0x14) + *(int *)(iVar7 + (int)param_1) * 4);
        iVar4 = *(int *)(*(int *)(param_2 + 0x14) + *param_1 * 4);
        if (*(uint *)(iVar3 + 4) < *(uint *)(iVar4 + 4)) goto LAB_1008b348;
        if (*(uint *)(iVar3 + 4) != *(uint *)(iVar4 + 4)) goto LAB_1008b34d;
        if (*(uint *)(iVar3 + 0x14) < *(uint *)(iVar4 + 0x14)) goto LAB_1008b348;
        if (*(uint *)(iVar3 + 0x14) != *(uint *)(iVar4 + 0x14)) goto LAB_1008b34d;
        if (*(int *)(iVar3 + 0x18) < *(int *)(iVar4 + 0x18)) goto LAB_1008b348;
        if (*(int *)(iVar4 + 0x18) < *(int *)(iVar3 + 0x18)) goto LAB_1008b34d;
        local_8 = (int *)((int)local_8 + 1);
        param_1 = param_1 + 1;
      } while (local_8 < puVar1[3]);
    }
    iVar7 = FUN_10085469();
    if (iVar7 == 0) {
      param_2 = 0;
      if (puVar1[1] != 0) {
        piVar9 = (int *)puVar2[2];
        iVar7 = puVar1[2] - (int)piVar9;
        do {
          uVar10 = *(uint *)(*(int *)(*(int *)(iVar5 + 0x14) + *(int *)(iVar7 + (int)piVar9) * 4) +
                            0x30);
          uVar12 = *(uint *)(*(int *)(*(int *)(iVar5 + 0x14) + *piVar9 * 4) + 0x30);
          if (uVar10 < uVar12) goto LAB_1008b348;
          if (uVar10 != uVar12) goto LAB_1008b34d;
          param_2 = param_2 + 1;
          piVar9 = piVar9 + 1;
        } while (param_2 < puVar1[1]);
      }
    }
    else {
      uVar10 = *puVar1 & 0xfffff;
      local_c = 0;
      if (uVar10 != 0) {
        local_8 = (int *)puVar2[2];
        iVar5 = *(int *)(param_2 + 0x14);
        piVar9 = local_8 + uVar10;
        iVar7 = puVar1[2] - (int)local_8;
        do {
          param_1 = *(int **)(*(int *)(iVar5 + *(int *)(iVar7 + (int)local_8) * 4) + 0x30);
          uVar12 = *(uint *)(*(int *)(iVar5 + *local_8 * 4) + 0x30);
          uVar11 = *(uint *)(*(int *)(iVar5 + *(int *)(iVar7 + (int)piVar9) * 4) + 0x30);
          uVar6 = *(uint *)(*(int *)(iVar5 + *piVar9 * 4) + 0x30);
          param_2 = (uint)param_1;
          if ((param_1 < uVar11) || (param_2 = uVar11, param_1 == (int *)uVar11)) {
            param_1 = (int *)uVar11;
          }
          uVar11 = uVar12;
          if ((uVar12 < uVar6) || (uVar11 = uVar6, uVar12 == uVar6)) {
            uVar12 = uVar6;
          }
          if (param_2 < uVar11) goto LAB_1008b348;
          if (uVar11 < param_2) goto LAB_1008b34d;
          if (param_1 < uVar12) goto LAB_1008b348;
          if (uVar12 < param_1) goto LAB_1008b34d;
          local_c = local_c + 1;
          local_8 = local_8 + 1;
          piVar9 = piVar9 + 1;
        } while (local_c < uVar10);
      }
    }
    uVar8 = 0;
  }
  else {
LAB_1008b34d:
    uVar8 = 1;
  }
  return uVar8;
}


