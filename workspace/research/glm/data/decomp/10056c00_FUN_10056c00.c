// 10056c00 size=379 FUN_10056c00

void FUN_10056c00(int param_1,int param_2)

{
  int iVar1;
  int *in_EAX;
  uint uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  ushort *puVar8;
  ushort *puVar9;
  int iVar10;
  int iVar11;
  int local_38;
  int local_34;
  int local_30;
  int local_2c;
  
  iVar6 = in_EAX[4];
  iVar1 = in_EAX[2];
  iVar3 = *in_EAX;
  iVar11 = 0;
  local_34 = 0;
  local_30 = 0;
  local_2c = 0;
  if (iVar3 <= in_EAX[1]) {
    local_38 = iVar3 * 8 + 4;
    do {
      if (iVar1 <= in_EAX[3]) {
        puVar8 = (ushort *)
                 (*(int *)(*(int *)(*(int *)(param_1 + 0x1b0) + 0x18) + iVar3 * 4) +
                 (iVar1 * 0x20 + iVar6) * 2);
        iVar4 = (in_EAX[3] - iVar1) + 1;
        iVar7 = iVar1 * 4 + 2;
        do {
          if (iVar6 <= in_EAX[5]) {
            iVar5 = iVar6 * 8 + 4;
            iVar10 = (in_EAX[5] - iVar6) + 1;
            puVar9 = puVar8;
            do {
              uVar2 = (uint)*puVar9;
              puVar9 = puVar9 + 1;
              if (uVar2 != 0) {
                local_34 = local_34 + local_38 * uVar2;
                local_30 = local_30 + iVar7 * uVar2;
                iVar11 = iVar11 + uVar2;
                local_2c = local_2c + iVar5 * uVar2;
              }
              iVar5 = iVar5 + 8;
              iVar10 = iVar10 + -1;
            } while (iVar10 != 0);
          }
          puVar8 = puVar8 + 0x20;
          iVar7 = iVar7 + 4;
          iVar4 = iVar4 + -1;
        } while (iVar4 != 0);
      }
      iVar3 = iVar3 + 1;
      local_38 = local_38 + 8;
    } while (iVar3 <= in_EAX[1]);
  }
  iVar6 = iVar11 >> 1;
  *(char *)(param_2 + **(int **)(param_1 + 0x7c)) = (char)((iVar6 + local_34) / iVar11);
  *(char *)(param_2 + *(int *)(*(int *)(param_1 + 0x7c) + 4)) = (char)((local_30 + iVar6) / iVar11);
  *(char *)(param_2 + *(int *)(*(int *)(param_1 + 0x7c) + 8)) = (char)((local_2c + iVar6) / iVar11);
  return;
}


