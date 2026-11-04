// 100443a0 size=370 FUN_100443a0

undefined1 FUN_100443a0(int *param_1,int param_2)

{
  undefined4 uVar1;
  undefined4 uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined4 uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  char cVar9;
  int iVar10;
  int local_14 [4];
  int local_4;
  
  iVar8 = (int)param_1;
  uVar1 = **(undefined4 **)((int)param_1 + 0x20);
  uVar2 = (*(undefined4 **)((int)param_1 + 0x20))[1];
  iVar3 = *(int *)((int)param_1 + 0x164);
  uVar4 = *(undefined4 *)(iVar3 + 0xc);
  uVar5 = *(undefined4 *)(iVar3 + 0x10);
  local_14[0] = *(int *)(iVar3 + 0x14);
  local_14[1] = *(undefined4 *)(iVar3 + 0x18);
  local_14[2] = *(undefined4 *)(iVar3 + 0x1c);
  local_14[3] = *(undefined4 *)(iVar3 + 0x20);
  local_4 = (int)param_1;
  if ((*(int *)((int)param_1 + 0xc4) != 0) && (*(int *)(iVar3 + 0x24) == 0)) {
    cVar9 = FUN_100442d0(*(undefined4 *)(iVar3 + 0x28));
    if (cVar9 == '\0') {
      return 0;
    }
  }
  iVar10 = 0;
  if (0 < *(int *)((int)param_1 + 0x108)) {
    param_1 = (int *)((int)param_1 + 0x10c);
    do {
      iVar6 = *param_1;
      iVar7 = *(int *)(iVar8 + 0xf0 + iVar6 * 4);
      cVar9 = FUN_10044140(*(undefined4 *)(param_2 + iVar10 * 4),local_14[iVar6],
                           *(undefined4 *)(iVar3 + 0x2c + *(int *)(iVar7 + 0x14) * 4),
                           *(undefined4 *)(iVar3 + 0x3c + *(int *)(iVar7 + 0x18) * 4));
      if (cVar9 == '\0') {
        return 0;
      }
      local_14[iVar6] = (int)**(short **)(param_2 + iVar10 * 4);
      iVar10 = iVar10 + 1;
      param_1 = param_1 + 1;
    } while (iVar10 < *(int *)(iVar8 + 0x108));
  }
  **(undefined4 **)(iVar8 + 0x20) = uVar1;
  *(undefined4 *)(*(int *)(iVar8 + 0x20) + 4) = uVar2;
  *(undefined4 *)(iVar3 + 0xc) = uVar4;
  *(undefined4 *)(iVar3 + 0x10) = uVar5;
  *(int *)(iVar3 + 0x14) = local_14[0];
  *(int *)(iVar3 + 0x18) = local_14[1];
  *(int *)(iVar3 + 0x1c) = local_14[2];
  *(int *)(iVar3 + 0x20) = local_14[3];
  if (*(int *)(iVar8 + 0xc4) != 0) {
    if (*(int *)(iVar3 + 0x24) == 0) {
      *(int *)(iVar3 + 0x24) = *(int *)(iVar8 + 0xc4);
      *(uint *)(iVar3 + 0x28) = *(int *)(iVar3 + 0x28) + 1U & 7;
    }
    *(int *)(iVar3 + 0x24) = *(int *)(iVar3 + 0x24) + -1;
  }
  return 1;
}


