// 1006a087 size=199 FUN_1006a087

int FUN_1006a087(undefined4 *param_1,undefined4 *param_2)

{
  byte bVar1;
  byte bVar2;
  byte *pbVar3;
  byte *pbVar4;
  int iVar5;
  byte *pbVar6;
  int iVar7;
  byte *pbVar8;
  bool bVar9;
  bool bVar10;
  
  pbVar8 = *(byte **)*param_1;
  if ((((*(short *)pbVar8 == 0x5f76) || (*(short *)pbVar8 == 0x5f72)) ||
      (*(short *)pbVar8 == 0x5f6f)) ||
     (((pbVar6 = *(byte **)*param_2, *(short *)pbVar6 == 0x5f76 || (*(short *)pbVar6 == 0x5f72)) ||
      (pbVar3 = pbVar8, pbVar4 = pbVar6, *(short *)pbVar6 == 0x5f6f)))) {
    pbVar6 = *(byte **)*param_2;
    do {
      bVar1 = *pbVar8;
      bVar9 = bVar1 < *pbVar6;
      if (bVar1 != *pbVar6) goto LAB_1006a11e;
      if (bVar1 == 0) break;
      bVar1 = pbVar8[1];
      bVar9 = bVar1 < pbVar6[1];
      if (bVar1 != pbVar6[1]) goto LAB_1006a11e;
      pbVar8 = pbVar8 + 2;
      pbVar6 = pbVar6 + 2;
    } while (bVar1 != 0);
    iVar5 = 0;
  }
  else {
    do {
      bVar1 = pbVar3[2];
      bVar2 = pbVar4[2];
      bVar9 = bVar1 < bVar2;
      if (bVar1 != bVar2) {
LAB_1006a10a:
        iVar5 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
        goto LAB_1006a10f;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar3[3];
      bVar9 = bVar1 < pbVar4[3];
      if (bVar1 != pbVar4[3]) goto LAB_1006a10a;
      pbVar3 = pbVar3 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
    iVar5 = 0;
LAB_1006a10f:
    if (iVar5 == 0) {
      iVar7 = 2;
      bVar9 = false;
      iVar5 = 0;
      bVar10 = true;
      do {
        if (iVar7 == 0) break;
        iVar7 = iVar7 + -1;
        bVar9 = *pbVar8 < *pbVar6;
        bVar10 = *pbVar8 == *pbVar6;
        pbVar8 = pbVar8 + 1;
        pbVar6 = pbVar6 + 1;
      } while (bVar10);
      if (!bVar10) {
LAB_1006a11e:
        iVar5 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
      }
    }
  }
  return iVar5;
}


