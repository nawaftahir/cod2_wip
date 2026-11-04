// 1000d140 size=181 FUN_1000d140

undefined * FUN_1000d140(void)

{
  byte bVar1;
  undefined *puVar2;
  int iVar3;
  int iVar4;
  byte *pbVar5;
  uint uVar6;
  byte *unaff_EBX;
  byte *pbVar7;
  bool bVar8;
  
  uVar6 = 0;
  iVar4 = 0x77;
  bVar1 = *unaff_EBX;
  while (bVar1 != 0) {
    uVar6 = uVar6 + (char)bVar1 * iVar4;
    iVar3 = iVar4 + -0x76;
    iVar4 = iVar4 + 1;
    bVar1 = unaff_EBX[iVar3];
  }
  uVar6 = uVar6 & 0x7ff;
  puVar2 = (undefined *)(&DAT_101cea68)[uVar6];
  while (puVar2 != (undefined *)0x0) {
    pbVar7 = *(byte **)(puVar2 + 0x20);
    pbVar5 = unaff_EBX;
    do {
      bVar1 = *pbVar5;
      bVar8 = bVar1 < *pbVar7;
      if (bVar1 != *pbVar7) {
LAB_1000d1a4:
        iVar4 = (1 - (uint)bVar8) - (uint)(bVar8 != 0);
        goto LAB_1000d1a9;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar5[1];
      bVar8 = bVar1 < pbVar7[1];
      if (bVar1 != pbVar7[1]) goto LAB_1000d1a4;
      pbVar5 = pbVar5 + 2;
      pbVar7 = pbVar7 + 2;
    } while (bVar1 != 0);
    iVar4 = 0;
LAB_1000d1a9:
    if (iVar4 == 0) break;
    uVar6 = uVar6 + 1 & 0x7ff;
    puVar2 = (undefined *)(&DAT_101cea68)[uVar6];
  }
  if (((undefined *)0x101ce88f < puVar2) && (puVar2 < &DAT_101cea64)) {
    return (undefined *)0x0;
  }
  return puVar2;
}


