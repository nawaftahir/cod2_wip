// 1004edd0 size=622 FUN_1004edd0

undefined4 FUN_1004edd0(byte *param_1)

{
  byte bVar1;
  int iVar2;
  undefined4 *puVar3;
  int *piVar4;
  int iVar5;
  int *piVar6;
  char cVar7;
  undefined4 *puVar8;
  byte *pbVar9;
  byte *pbVar10;
  uint uVar11;
  int iVar12;
  uint local_10;
  byte *local_4;
  
  piVar6 = (int *)param_1;
  iVar2 = *(int *)((int)param_1 + 0x19c);
  puVar3 = *(undefined4 **)((int)param_1 + 0x20);
  puVar8 = *(undefined4 **)(iVar2 + 0xa0);
  pbVar10 = (byte *)*puVar3;
  iVar12 = puVar3[1];
  if (puVar8 == (undefined4 *)0x0) {
    if (iVar12 == 0) {
      cVar7 = (*(code *)puVar3[3])(param_1);
      if (cVar7 == '\0') {
        return 0;
      }
      pbVar10 = (byte *)*puVar3;
      iVar12 = puVar3[1];
    }
    bVar1 = *pbVar10;
    iVar12 = iVar12 + -1;
    pbVar9 = pbVar10 + 1;
    if (iVar12 == 0) {
      cVar7 = (*(code *)puVar3[3])(param_1);
      if (cVar7 == '\0') {
        return 0;
      }
      pbVar9 = (byte *)*puVar3;
      iVar12 = puVar3[1];
    }
    iVar12 = iVar12 + -1;
    pbVar10 = pbVar9 + 1;
    uVar11 = ((uint)bVar1 * 0x100 + (uint)*pbVar9) - 2;
    if ((int)uVar11 < 0) {
      local_10 = 0;
      param_1 = pbVar10;
      goto LAB_1004efb9;
    }
    if (*(int *)((int)param_1 + 0x184) == 0xfe) {
      local_10 = *(uint *)(iVar2 + 0x5c);
    }
    else {
      local_10 = *(uint *)(iVar2 + -800 + *(int *)((int)param_1 + 0x184) * 4);
    }
    if (uVar11 < local_10) {
      local_10 = uVar11;
    }
    puVar8 = (undefined4 *)(**(code **)(*(int *)((int)param_1 + 4) + 4))(param_1,1,local_10 + 0x14);
    *puVar8 = 0;
    *(char *)(puVar8 + 1) = (char)*(int *)((int)param_1 + 0x184);
    pbVar9 = (byte *)(puVar8 + 5);
    puVar8[2] = uVar11;
    puVar8[3] = local_10;
    puVar8[4] = pbVar9;
    *(undefined4 **)(iVar2 + 0xa0) = puVar8;
    *(undefined4 *)(iVar2 + 0xa4) = 0;
    uVar11 = 0;
  }
  else {
    uVar11 = *(uint *)(iVar2 + 0xa4);
    local_10 = puVar8[3];
    pbVar9 = (byte *)(puVar8[4] + uVar11);
  }
  param_1 = pbVar10;
  local_4 = pbVar9;
  if (uVar11 < local_10) {
    do {
      *puVar3 = pbVar10;
      puVar3[1] = iVar12;
      *(uint *)(iVar2 + 0xa4) = uVar11;
      if (iVar12 == 0) {
        cVar7 = (*(code *)puVar3[3])(piVar6);
        if (cVar7 == '\0') {
          return 0;
        }
        pbVar10 = (byte *)*puVar3;
        iVar12 = puVar3[1];
        pbVar9 = local_4;
        param_1 = pbVar10;
      }
      while (iVar12 != 0) {
        local_4 = pbVar9 + 1;
        *pbVar9 = *pbVar10;
        pbVar10 = pbVar10 + 1;
        iVar12 = iVar12 + -1;
        uVar11 = uVar11 + 1;
        pbVar9 = local_4;
        param_1 = pbVar10;
        if (local_10 <= uVar11) goto LAB_1004ef7d;
      }
    } while (uVar11 < local_10);
    iVar12 = 0;
  }
LAB_1004ef7d:
  piVar4 = (int *)piVar6[0x45];
  if (piVar4 == (int *)0x0) {
    piVar6[0x45] = (int)puVar8;
  }
  else {
    iVar5 = *piVar4;
    while (iVar5 != 0) {
      piVar4 = (int *)*piVar4;
      iVar5 = *piVar4;
    }
    *piVar4 = (int)puVar8;
  }
  uVar11 = puVar8[2] - local_10;
LAB_1004efb9:
  *(undefined4 *)(iVar2 + 0xa0) = 0;
  if (piVar6[0x61] == 0xe0) {
    FUN_1004e980();
  }
  else if (piVar6[0x61] == 0xee) {
    FUN_1004ebd0(uVar11);
  }
  else {
    *(undefined4 *)(*piVar6 + 0x14) = 0x5b;
    *(int *)(*piVar6 + 0x18) = piVar6[0x61];
    *(uint *)(*piVar6 + 0x1c) = local_10 + uVar11;
    (**(code **)(*piVar6 + 4))(piVar6,1);
  }
  *puVar3 = param_1;
  puVar3[1] = iVar12;
  if (0 < (int)uVar11) {
    (**(code **)(piVar6[8] + 0x10))(piVar6,uVar11);
  }
  return 1;
}


