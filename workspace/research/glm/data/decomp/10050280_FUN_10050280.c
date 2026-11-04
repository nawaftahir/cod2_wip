// 10050280 size=327 FUN_10050280

void FUN_10050280(int param_1,int *param_2,int param_3,undefined4 *param_4)

{
  byte bVar1;
  byte bVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  undefined1 *puVar11;
  uint uVar12;
  byte *pbVar13;
  uint uVar14;
  byte *pbVar15;
  int iVar16;
  byte *pbVar17;
  
  iVar3 = *(int *)(param_1 + 0x1a8);
  iVar4 = *(int *)(iVar3 + 0x10);
  iVar5 = *(int *)(param_1 + 0x128);
  iVar6 = *(int *)(iVar3 + 0x14);
  iVar7 = *(int *)(iVar3 + 0x18);
  iVar3 = *(int *)(iVar3 + 0x1c);
  pbVar17 = *(byte **)(*param_2 + param_3 * 4);
  pbVar13 = *(byte **)(param_2[2] + param_3 * 4);
  pbVar15 = *(byte **)(param_2[1] + param_3 * 4);
  puVar11 = (undefined1 *)*param_4;
  for (uVar12 = *(uint *)(param_1 + 100) >> 1; uVar12 != 0; uVar12 = uVar12 - 1) {
    bVar1 = *pbVar13;
    bVar2 = *pbVar15;
    pbVar15 = pbVar15 + 1;
    pbVar13 = pbVar13 + 1;
    iVar8 = *(int *)(iVar4 + (uint)bVar1 * 4);
    iVar16 = *(int *)(iVar3 + (uint)bVar2 * 4);
    iVar9 = *(int *)(iVar7 + (uint)bVar1 * 4);
    uVar14 = (uint)*pbVar17;
    iVar10 = *(int *)(iVar6 + (uint)bVar2 * 4);
    puVar11[2] = *(undefined1 *)(iVar8 + uVar14 + iVar5);
    iVar16 = iVar16 + iVar9 >> 0x10;
    puVar11[1] = *(undefined1 *)(iVar16 + uVar14 + iVar5);
    *puVar11 = *(undefined1 *)(iVar5 + uVar14 + iVar10);
    uVar14 = (uint)pbVar17[1];
    puVar11[5] = *(undefined1 *)(iVar8 + uVar14 + iVar5);
    puVar11[4] = *(undefined1 *)(iVar16 + uVar14 + iVar5);
    puVar11[3] = *(undefined1 *)(iVar5 + uVar14 + iVar10);
    pbVar17 = pbVar17 + 2;
    puVar11 = puVar11 + 6;
  }
  if ((*(byte *)(param_1 + 100) & 1) != 0) {
    iVar3 = *(int *)(iVar3 + (uint)*pbVar15 * 4);
    iVar7 = *(int *)(iVar7 + (uint)*pbVar13 * 4);
    uVar12 = (uint)*pbVar17;
    iVar6 = *(int *)(iVar6 + (uint)*pbVar15 * 4);
    puVar11[2] = *(undefined1 *)(*(int *)(iVar4 + (uint)*pbVar13 * 4) + uVar12 + iVar5);
    puVar11[1] = *(undefined1 *)(uVar12 + (iVar3 + iVar7 >> 0x10) + iVar5);
    *puVar11 = *(undefined1 *)(uVar12 + iVar6 + iVar5);
  }
  return;
}


