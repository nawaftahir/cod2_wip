extern int FUN_10044140();
extern int FUN_100442d0();


unsigned char FUN_100443a0(int *param_1,int param_2)

{
  unsigned int uVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int uVar4;
  unsigned int uVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  char cVar9;
  int iVar10;
  int local_14 [4];
  int local_4;
  
  iVar8 = (int)param_1;
  uVar1 = **(unsigned int **)((int)param_1 + 0x20);
  uVar2 = (*(unsigned int **)((int)param_1 + 0x20))[1];
  iVar3 = *(int *)((int)param_1 + 0x164);
  uVar4 = *(unsigned int *)(iVar3 + 0xc);
  uVar5 = *(unsigned int *)(iVar3 + 0x10);
  local_14[0] = *(int *)(iVar3 + 0x14);
  local_14[1] = *(unsigned int *)(iVar3 + 0x18);
  local_14[2] = *(unsigned int *)(iVar3 + 0x1c);
  local_14[3] = *(unsigned int *)(iVar3 + 0x20);
  local_4 = (int)param_1;
  if ((*(int *)((int)param_1 + 0xc4) != 0) && (*(int *)(iVar3 + 0x24) == 0)) {
    cVar9 = FUN_100442d0(*(unsigned int *)(iVar3 + 0x28));
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
      cVar9 = FUN_10044140(*(unsigned int *)(param_2 + iVar10 * 4),local_14[iVar6],
                           *(unsigned int *)(iVar3 + 0x2c + *(int *)(iVar7 + 0x14) * 4),
                           *(unsigned int *)(iVar3 + 0x3c + *(int *)(iVar7 + 0x18) * 4));
      if (cVar9 == '\0') {
        return 0;
      }
      local_14[iVar6] = (int)**(short **)(param_2 + iVar10 * 4);
      iVar10 = iVar10 + 1;
      param_1 = param_1 + 1;
    } while (iVar10 < *(int *)(iVar8 + 0x108));
  }
  **(unsigned int **)(iVar8 + 0x20) = uVar1;
  *(unsigned int *)(*(int *)(iVar8 + 0x20) + 4) = uVar2;
  *(unsigned int *)(iVar3 + 0xc) = uVar4;
  *(unsigned int *)(iVar3 + 0x10) = uVar5;
  *(int *)(iVar3 + 0x14) = local_14[0];
  *(int *)(iVar3 + 0x18) = local_14[1];
  *(int *)(iVar3 + 0x1c) = local_14[2];
  *(int *)(iVar3 + 0x20) = local_14[3];
  if (*(int *)(iVar8 + 0xc4) != 0) {
    if (*(int *)(iVar3 + 0x24) == 0) {
      *(int *)(iVar3 + 0x24) = *(int *)(iVar8 + 0xc4);
      *(unsigned int *)(iVar3 + 0x28) = *(int *)(iVar3 + 0x28) + 1U & 7;
    }
    *(int *)(iVar3 + 0x24) = *(int *)(iVar3 + 0x24) + -1;
  }
  return 1;
}


