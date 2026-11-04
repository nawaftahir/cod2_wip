// 100503d0 size=555 FUN_100503d0

void FUN_100503d0(int param_1,int *param_2,int param_3,undefined4 *param_4)

{
  undefined4 *puVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  byte *pbVar9;
  undefined1 *puVar10;
  byte *pbVar11;
  uint uVar12;
  uint uVar13;
  byte *pbVar14;
  byte *pbVar15;
  undefined1 *puVar16;
  int iVar17;
  int iVar18;
  
  iVar18 = *(int *)(param_1 + 0x1a8);
  iVar3 = *(int *)(iVar18 + 0x10);
  iVar4 = *(int *)(param_1 + 0x128);
  iVar5 = *(int *)(iVar18 + 0x14);
  iVar6 = *(int *)(iVar18 + 0x18);
  iVar18 = *(int *)(iVar18 + 0x1c);
  puVar1 = (undefined4 *)(*param_2 + param_3 * 8);
  pbVar14 = (byte *)*puVar1;
  pbVar15 = (byte *)puVar1[1];
  pbVar11 = *(byte **)(param_2[1] + param_3 * 4);
  puVar10 = (undefined1 *)*param_4;
  puVar16 = (undefined1 *)param_4[1];
  pbVar9 = *(byte **)(param_2[2] + param_3 * 4);
  for (uVar12 = *(uint *)(param_1 + 100) >> 1; uVar12 != 0; uVar12 = uVar12 - 1) {
    bVar2 = *pbVar11;
    pbVar11 = pbVar11 + 1;
    iVar7 = *(int *)(iVar3 + (uint)*pbVar9 * 4);
    iVar8 = *(int *)(iVar5 + (uint)bVar2 * 4);
    uVar13 = (uint)*pbVar14;
    iVar17 = *(int *)(iVar18 + (uint)bVar2 * 4) + *(int *)(iVar6 + (uint)*pbVar9 * 4) >> 0x10;
    puVar10[2] = *(undefined1 *)(uVar13 + iVar7 + iVar4);
    puVar10[1] = *(undefined1 *)(uVar13 + iVar17 + iVar4);
    *puVar10 = *(undefined1 *)(uVar13 + iVar8 + iVar4);
    uVar13 = (uint)pbVar14[1];
    pbVar14 = pbVar14 + 2;
    puVar10[5] = *(undefined1 *)(uVar13 + iVar7 + iVar4);
    puVar10[4] = *(undefined1 *)(uVar13 + iVar17 + iVar4);
    puVar10[3] = *(undefined1 *)(uVar13 + iVar8 + iVar4);
    uVar13 = (uint)*pbVar15;
    puVar10 = puVar10 + 6;
    puVar16[2] = *(undefined1 *)(uVar13 + iVar7 + iVar4);
    puVar16[1] = *(undefined1 *)(uVar13 + iVar17 + iVar4);
    *puVar16 = *(undefined1 *)(uVar13 + iVar8 + iVar4);
    uVar13 = (uint)pbVar15[1];
    pbVar15 = pbVar15 + 2;
    puVar16[5] = *(undefined1 *)(uVar13 + iVar7 + iVar4);
    puVar16[4] = *(undefined1 *)(uVar13 + iVar17 + iVar4);
    puVar16[3] = *(undefined1 *)(uVar13 + iVar8 + iVar4);
    puVar16 = puVar16 + 6;
    pbVar9 = pbVar9 + 1;
  }
  if ((*(byte *)(param_1 + 100) & 1) != 0) {
    iVar3 = *(int *)(iVar3 + (uint)*pbVar9 * 4);
    iVar18 = *(int *)(iVar18 + (uint)*pbVar11 * 4);
    iVar6 = *(int *)(iVar6 + (uint)*pbVar9 * 4);
    iVar5 = *(int *)(iVar5 + (uint)*pbVar11 * 4);
    uVar12 = (uint)*pbVar14;
    puVar10[2] = *(undefined1 *)(iVar3 + uVar12 + iVar4);
    iVar18 = iVar18 + iVar6 >> 0x10;
    puVar10[1] = *(undefined1 *)(iVar18 + uVar12 + iVar4);
    *puVar10 = *(undefined1 *)(iVar4 + uVar12 + iVar5);
    uVar12 = (uint)*pbVar15;
    puVar16[2] = *(undefined1 *)(iVar3 + uVar12 + iVar4);
    puVar16[1] = *(undefined1 *)(iVar18 + uVar12 + iVar4);
    *puVar16 = *(undefined1 *)(uVar12 + iVar5 + iVar4);
  }
  return;
}


