extern unsigned int DAT_1019166e;


unsigned int FUN_100b969a(int param_1,int param_2,int param_3)

{
  byte bVar1;
  int iVar2;
  int iVar3;
  unsigned int uVar4;
  byte *pbVar5;
  int iVar6;
  byte *pbVar7;
  byte *pbVar8;
  unsigned char bVar9;
  
  iVar2 = *(int *)(*(int *)(param_3 + 0x14) + param_1 * 4);
  iVar3 = *(int *)(*(int *)(param_3 + 0x14) + param_2 * 4);
  uVar4 = *(unsigned int *)(iVar2 + 0x60);
  pbVar5 = *(byte **)(uVar4 + 0x20);
  if (pbVar5 == (byte *)0x0) {
    pbVar5 = &g_1019166e;
 
	int g_1019166e = DAT_1019166e; }
  pbVar7 = *(byte **)(*(int *)(iVar3 + 0x60) + 0x20);
  pbVar8 = &g_1019166e;
  if (pbVar7 != (byte *)0x0) {
    pbVar8 = pbVar7;
  }
  do {
    bVar1 = *pbVar5;
    bVar9 = bVar1 < *pbVar8;
    if (bVar1 != *pbVar8) {
LAB_100b96f6:
      iVar6 = (1 - (unsigned int)bVar9) - (unsigned int)(bVar9 != 0);
      goto LAB_100b96fb;
    }
    if (bVar1 == 0) break;
    bVar1 = pbVar5[1];
    bVar9 = bVar1 < pbVar8[1];
    if (bVar1 != pbVar8[1]) goto LAB_100b96f6;
    pbVar5 = pbVar5 + 2;
    pbVar8 = pbVar8 + 2;
  } while (bVar1 != 0);
  iVar6 = 0;
LAB_100b96fb:
  if (iVar6 < 1) {
    if (iVar6 >= 0) {
      pbVar5 = *(byte **)(*(int *)(*(int *)(iVar3 + 0x60) + 0x14) + 0x18);
      pbVar7 = *(byte **)(*(int *)(uVar4 + 0x14) + 0x18);
      do {
        bVar1 = *pbVar7;
        bVar9 = bVar1 < *pbVar5;
        if (bVar1 != *pbVar5) {
LAB_100b973f:
          iVar6 = (1 - (unsigned int)bVar9) - (unsigned int)(bVar9 != 0);
          goto LAB_100b9744;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar7[1];
        bVar9 = bVar1 < pbVar5[1];
        if (bVar1 != pbVar5[1]) goto LAB_100b973f;
        pbVar7 = pbVar7 + 2;
        pbVar5 = pbVar5 + 2;
      } while (bVar1 != 0);
      iVar6 = 0;
LAB_100b9744:
      if (0 < iVar6) goto LAB_100b96ff;
      if (iVar6 >= 0) {
        if (*(unsigned int *)(iVar3 + 0x60) < uVar4) goto LAB_100b96ff;
        if ((*(unsigned int *)(iVar3 + 0x60) <= uVar4) &&
           (*(unsigned int *)(iVar3 + 0x74) <= *(unsigned int *)(iVar2 + 0x74))) {
          if (*(unsigned int *)(iVar2 + 0x74) != *(unsigned int *)(iVar3 + 0x74)) goto LAB_100b96ff;
          if (*(unsigned int *)(iVar3 + 0x10) <= *(unsigned int *)(iVar2 + 0x10)) {
            return (unsigned int)(*(unsigned int *)(iVar3 + 0x10) < *(unsigned int *)(iVar2 + 0x10));
          }
        }
      }
    }
    uVar4 = 0xffffffff;
  }
  else {
LAB_100b96ff:
    uVar4 = 1;
  }
  return uVar4;
}


