// 10057350 size=723 FUN_10057350

void FUN_10057350(int param_1,int param_2,int *param_3,int param_4)

{
  int iVar1;
  int iVar2;
  int iVar3;
  int iVar4;
  int *piVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  byte *pbVar12;
  int iVar13;
  short *psVar14;
  int iVar15;
  uint uVar16;
  int iVar17;
  uint uVar18;
  int iVar19;
  uint uVar20;
  int iVar21;
  undefined1 *local_5c;
  int local_54;
  int local_50;
  int local_4c;
  int *local_48;
  int local_44;
  int local_40;
  int local_3c;
  int local_38;
  int local_24;
  
  iVar1 = *(int *)(param_1 + 100);
  iVar2 = *(int *)(param_1 + 0x1b0);
  iVar3 = *(int *)(iVar2 + 0x18);
  iVar4 = *(int *)(param_1 + 0x128);
  piVar5 = *(int **)(param_1 + 0x7c);
  iVar6 = *piVar5;
  iVar7 = piVar5[1];
  iVar8 = piVar5[2];
  iVar9 = *(int *)(iVar2 + 0x28);
  if (0 < param_4) {
    local_48 = param_3;
    local_24 = param_4;
    do {
      iVar10 = 0;
      pbVar12 = *(byte **)((int)local_48 + (param_2 - (int)param_3));
      local_5c = (undefined1 *)*local_48;
      if (*(char *)(iVar2 + 0x24) == '\0') {
        psVar14 = *(short **)(iVar2 + 0x20);
        local_38 = 1;
        param_4 = 3;
        *(undefined1 *)(iVar2 + 0x24) = 1;
      }
      else {
        pbVar12 = pbVar12 + iVar1 * 3 + -3;
        local_5c = local_5c + iVar1 + -1;
        psVar14 = (short *)(*(int *)(iVar2 + 0x20) + (iVar1 * 3 + 3) * 2);
        local_38 = -1;
        param_4 = -3;
        *(undefined1 *)(iVar2 + 0x24) = 0;
      }
      iVar17 = 0;
      iVar15 = 0;
      local_3c = 0;
      local_40 = 0;
      local_44 = 0;
      local_4c = 0;
      local_4c._0_2_ = 0;
      local_50 = 0;
      local_50._0_2_ = 0;
      local_54 = 0;
      local_54._0_2_ = 0;
      for (iVar11 = iVar1; iVar11 != 0; iVar11 = iVar11 + -1) {
        uVar18 = (uint)*(byte *)(*(int *)(iVar9 + (psVar14[param_4] + 8 + iVar17 >> 4) * 4) +
                                 (uint)*pbVar12 + iVar4);
        uVar20 = (uint)*(byte *)(*(int *)(iVar9 + (psVar14[param_4 + 1] + 8 + iVar10 >> 4) * 4) +
                                 (uint)pbVar12[1] + iVar4);
        uVar16 = (uint)*(byte *)(*(int *)(iVar9 + (psVar14[param_4 + 2] + 8 + iVar15 >> 4) * 4) +
                                 (uint)pbVar12[2] + iVar4);
        iVar13 = (int)uVar16 >> 3;
        iVar15 = ((int)uVar20 >> 2) * 0x20 + iVar13;
        iVar17 = (int)uVar18 >> 3;
        iVar10 = *(int *)(iVar3 + iVar17 * 4);
        if (*(short *)(iVar10 + iVar15 * 2) == 0) {
          FUN_10057160(param_1,iVar17,iVar13);
        }
        iVar10 = *(ushort *)(iVar10 + iVar15 * 2) - 1;
        *local_5c = (char)iVar10;
        iVar19 = uVar18 - *(byte *)(iVar10 + iVar6);
        iVar21 = uVar20 - *(byte *)(iVar10 + iVar7);
        iVar13 = uVar16 - *(byte *)(iVar10 + iVar8);
        *psVar14 = (short)local_54 + (short)iVar19 * 3;
        local_54 = local_44 + iVar19 * 5;
        iVar17 = iVar19 * 7;
        psVar14[1] = (short)local_50 + (short)iVar21 * 3;
        local_50 = local_40 + iVar21 * 5;
        iVar10 = iVar21 * 7;
        psVar14[2] = (short)local_4c + (short)iVar13 * 3;
        local_4c = local_3c + iVar13 * 5;
        iVar15 = iVar13 * 7;
        pbVar12 = pbVar12 + param_4;
        psVar14 = psVar14 + param_4;
        local_5c = local_5c + local_38;
        local_3c = iVar13;
        local_40 = iVar21;
        local_44 = iVar19;
      }
      *psVar14 = (short)local_54;
      psVar14[1] = (short)local_50;
      psVar14[2] = (short)local_4c;
      local_48 = local_48 + 1;
      local_24 = local_24 + -1;
    } while (local_24 != 0);
  }
  return;
}


