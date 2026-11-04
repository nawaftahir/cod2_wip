// 100427b0 size=278 FUN_100427b0

void FUN_100427b0(int param_1,undefined4 *param_2,int *param_3,int param_4,int param_5)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  int iVar4;
  undefined1 *puVar5;
  int iVar6;
  uint uVar7;
  int iVar8;
  uint uVar9;
  byte *pbVar10;
  uint uVar11;
  
  iVar3 = *(int *)(param_1 + 0x24);
  iVar4 = *(int *)(*(int *)(param_1 + 0x158) + 8);
  if (-1 < param_5 + -1) {
    param_4 = param_4 << 2;
    do {
      pbVar10 = (byte *)*param_2;
      piVar1 = (int *)(param_4 + param_3[2]);
      param_2 = param_2 + 1;
      piVar2 = (int *)(param_4 + *param_3);
      puVar5 = *(undefined1 **)(param_4 + param_3[1]);
      param_4 = param_4 + 4;
      if (iVar3 != 0) {
        iVar8 = *piVar2 - (int)puVar5;
        iVar6 = *piVar1 - (int)puVar5;
        param_1 = iVar3;
        do {
          uVar9 = (uint)pbVar10[1];
          uVar7 = (uint)*pbVar10;
          uVar11 = (uint)pbVar10[2];
          puVar5[iVar8] =
               (char)((uint)(*(int *)(iVar4 + 0x800 + uVar7 * 4) +
                             *(int *)(iVar4 + 0x400 + uVar9 * 4) + *(int *)(iVar4 + uVar11 * 4)) >>
                     0x10);
          pbVar10 = pbVar10 + 3;
          *puVar5 = (char)((uint)(*(int *)(iVar4 + 0x1400 + uVar7 * 4) +
                                  *(int *)(iVar4 + 0x1000 + uVar9 * 4) +
                                 *(int *)(iVar4 + 0xc00 + uVar11 * 4)) >> 0x10);
          puVar5[iVar6] =
               (char)((uint)(*(int *)(iVar4 + 0x1c00 + uVar7 * 4) +
                             *(int *)(iVar4 + 0x1800 + uVar9 * 4) +
                            *(int *)(iVar4 + 0x1400 + uVar11 * 4)) >> 0x10);
          puVar5 = puVar5 + 1;
          param_1 = param_1 + -1;
        } while (param_1 != 0);
      }
      param_5 = param_5 + -1;
    } while (param_5 != 0);
  }
  return;
}


