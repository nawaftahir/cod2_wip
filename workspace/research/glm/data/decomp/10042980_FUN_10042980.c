// 10042980 size=346 FUN_10042980

void FUN_10042980(int param_1,undefined4 *param_2,int *param_3,int param_4,int param_5)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  byte *pbVar9;
  undefined1 *puVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  int local_18;
  
  iVar4 = *(int *)(param_1 + 0x24);
  iVar5 = *(int *)(*(int *)(param_1 + 0x158) + 8);
  if (-1 < param_5 + -1) {
    param_4 = param_4 << 2;
    local_18 = param_5;
    do {
      pbVar9 = (byte *)*param_2;
      piVar1 = (int *)(param_4 + param_3[2]);
      param_2 = param_2 + 1;
      puVar10 = *(undefined1 **)(param_4 + *param_3);
      piVar2 = (int *)(param_4 + param_3[1]);
      piVar3 = (int *)(param_4 + param_3[3]);
      param_4 = param_4 + 4;
      if (iVar4 != 0) {
        iVar6 = *piVar3 - (int)puVar10;
        iVar12 = *piVar2 - (int)puVar10;
        iVar7 = *piVar1 - (int)puVar10;
        param_5 = iVar4;
        do {
          iVar8 = 0xff - (uint)*pbVar9;
          iVar11 = 0xff - (uint)pbVar9[1];
          iVar13 = 0xff - (uint)pbVar9[2];
          puVar10[iVar6] = pbVar9[3];
          pbVar9 = pbVar9 + 4;
          *puVar10 = (char)((uint)(*(int *)(iVar5 + 0x800 + iVar13 * 4) +
                                   *(int *)(iVar5 + 0x400 + iVar11 * 4) +
                                  *(int *)(iVar5 + iVar8 * 4)) >> 0x10);
          puVar10[iVar12] =
               (char)((uint)(*(int *)(iVar5 + 0x1400 + iVar13 * 4) +
                             *(int *)(iVar5 + 0x1000 + iVar11 * 4) +
                            *(int *)(iVar5 + 0xc00 + iVar8 * 4)) >> 0x10);
          puVar10[iVar7] =
               (char)((uint)(*(int *)(iVar5 + 0x1c00 + iVar13 * 4) +
                             *(int *)(iVar5 + 0x1800 + iVar11 * 4) +
                            *(int *)(iVar5 + 0x1400 + iVar8 * 4)) >> 0x10);
          puVar10 = puVar10 + 1;
          param_5 = param_5 + -1;
        } while (param_5 != 0);
      }
      local_18 = local_18 + -1;
    } while (local_18 != 0);
  }
  return;
}


