// 10049380 size=378 FUN_10049380

void FUN_10049380(int param_1,int param_2,undefined4 *param_3,int param_4)

{
  byte bVar1;
  undefined1 *puVar2;
  byte *pbVar3;
  byte *pbVar4;
  byte *pbVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  byte *pbVar10;
  int iVar11;
  int iVar12;
  int iVar13;
  uint uVar14;
  int local_c;
  
  iVar13 = *(int *)(param_2 + 0x1c) * 8;
  FUN_10048cd0(param_3 + -1,*(int *)(param_1 + 0xe4) + 2,*(undefined4 *)(param_1 + 0x24),iVar13);
  iVar6 = *(int *)(param_1 + 0xbc) * 0x40;
  iVar9 = (0x80 - *(int *)(param_1 + 0xbc)) * 0x200;
  local_c = 0;
  if (0 < *(int *)(param_2 + 0xc)) {
    do {
      puVar2 = *(undefined1 **)(param_4 + local_c * 4);
      pbVar3 = (byte *)param_3[-1];
      pbVar4 = (byte *)param_3[1];
      pbVar5 = (byte *)*param_3;
      uVar14 = (uint)*pbVar5;
      iVar11 = (uint)*pbVar3 + *pbVar4 + uVar14;
      pbVar10 = pbVar5 + 1;
      iVar7 = (uint)pbVar4[1] + (uint)pbVar3[1] + (uint)pbVar5[1];
      *puVar2 = (char)(((iVar11 * 2 - uVar14) + iVar7) * iVar6 + 0x8000 + uVar14 * iVar9 >> 0x10);
      for (iVar12 = iVar13 + -2; puVar2 = puVar2 + 1, iVar12 != 0; iVar12 = iVar12 + -1) {
        bVar1 = *pbVar10;
        pbVar10 = pbVar10 + 1;
        iVar8 = (uint)pbVar4[2] + (uint)pbVar3[2] + (uint)*pbVar10;
        *puVar2 = (char)(((iVar11 - (uint)bVar1) + iVar8 + iVar7) * iVar6 + 0x8000 +
                         (uint)bVar1 * iVar9 >> 0x10);
        pbVar3 = pbVar3 + 1;
        pbVar4 = pbVar4 + 1;
        iVar11 = iVar7;
        iVar7 = iVar8;
      }
      *puVar2 = (char)(((iVar7 * 2 - (uint)*pbVar10) + iVar11) * iVar6 + 0x8000 +
                       (uint)*pbVar10 * iVar9 >> 0x10);
      local_c = local_c + 1;
      param_3 = param_3 + 1;
    } while (local_c < *(int *)(param_2 + 0xc));
  }
  return;
}


