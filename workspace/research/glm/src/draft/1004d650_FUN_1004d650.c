


void FUN_1004d650(int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  int iVar4;
  unsigned int uVar5;
  int iVar6;
  unsigned int *puVar7;
  int *piVar8;
  unsigned int *puVar9;
  unsigned int *puVar10;
  int iVar11;
  int local_20;
  int *local_1c;
  int local_14;
  
  iVar1 = *(int *)(param_1 + 0x120);
  iVar2 = *(int *)(param_1 + 0x18c);
  local_20 = 0;
  if (0 < *(int *)(param_1 + 0x2c)) {
    piVar8 = (int *)(*(int *)(param_1 + 0xcc) + 0xc);
    local_1c = (int *)(iVar2 + 8);
    do {
      iVar6 = (piVar8[6] * *piVar8) / *(int *)(param_1 + 0x120);
      puVar3 = *(unsigned int **)(*(int *)(iVar2 + 0x38) + local_20 * 4);
      puVar7 = *(unsigned int **)(*(int *)(iVar2 + 0x3c) + local_20 * 4);
      iVar4 = *local_1c;
      local_14 = (iVar1 + 2) * iVar6;
      if (0 < local_14) {
        puVar9 = puVar7;
        do {
          uVar5 = *(unsigned int *)((int)puVar9 + (iVar4 - (int)puVar7));
          *puVar9 = uVar5;
          *(unsigned int *)(((int)puVar3 - (int)puVar7) + (int)puVar9) = uVar5;
          puVar9 = puVar9 + 1;
          local_14 = local_14 + -1;
        } while (local_14 != 0);
      }
      if (0 < iVar6 * 2) {
        puVar9 = puVar7 + iVar6 * iVar1;
        puVar10 = (unsigned int *)(iVar4 + (iVar1 + -2) * iVar6 * 4);
        iVar11 = iVar6 * 2;
        do {
          *(unsigned int *)(((int)puVar7 - iVar4) + (int)puVar10) =
               *(unsigned int *)((int)puVar9 + (iVar4 - (int)puVar7));
          *puVar9 = *puVar10;
          puVar10 = puVar10 + 1;
          puVar9 = puVar9 + 1;
          iVar11 = iVar11 + -1;
        } while (iVar11 != 0);
      }
      if (0 < iVar6) {
        puVar7 = puVar3 + -iVar6;
        do {
          *puVar7 = *puVar3;
          puVar7 = puVar7 + 1;
          iVar6 = iVar6 + -1;
        } while (iVar6 != 0);
      }
      local_20 = local_20 + 1;
      local_1c = local_1c + 1;
      piVar8 = piVar8 + 0x15;
    } while (local_20 < *(int *)(param_1 + 0x2c));
  }
  return;
}


