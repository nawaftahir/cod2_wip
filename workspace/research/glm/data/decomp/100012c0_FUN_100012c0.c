// 100012c0 size=202 FUN_100012c0

void FUN_100012c0(void)

{
  byte *pbVar1;
  undefined4 *puVar2;
  int iVar3;
  int iVar4;
  int unaff_ESI;
  
  iVar3 = DAT_101ce5fc;
  *(undefined4 *)(unaff_ESI + 0x40) = *(undefined4 *)(DAT_101ce73c + 8);
  iVar4 = DAT_101ce604;
  *(undefined4 *)(unaff_ESI + 0x50) = *(undefined4 *)(iVar3 + 8);
  *(undefined4 *)(unaff_ESI + 0x54) = *(undefined4 *)(iVar4 + 8);
  iVar3 = DAT_101ce6d8;
  iVar4 = 0;
  do {
    pbVar1 = (byte *)(iVar3 + 8 + iVar4);
    iVar4 = iVar4 + 1;
    *(float *)(unaff_ESI + 0x40 + iVar4 * 4) = (float)*pbVar1;
  } while (iVar4 != 3);
  FUN_1005df00();
  iVar3 = DAT_101ce778;
  iVar4 = 0;
  do {
    pbVar1 = (byte *)(iVar3 + 8 + iVar4);
    iVar4 = iVar4 + 1;
    *(float *)(unaff_ESI + 0x54 + iVar4 * 4) = (float)*pbVar1;
  } while (iVar4 != 3);
  FUN_1005df00();
  iVar3 = DAT_101ce768;
  iVar4 = 0;
  do {
    pbVar1 = (byte *)(iVar3 + 8 + iVar4);
    iVar4 = iVar4 + 1;
    *(float *)(unaff_ESI + 0x60 + iVar4 * 4) = (float)*pbVar1;
  } while (iVar4 != 3);
  FUN_1005df00();
  iVar3 = DAT_101ce728;
  *(undefined1 *)(unaff_ESI + 0x70) = 1;
  puVar2 = *(undefined4 **)(iVar3 + 8);
  *(undefined4 *)(unaff_ESI + 0x74) = *puVar2;
  *(undefined4 *)(unaff_ESI + 0x78) = puVar2[1];
  *(undefined4 *)(unaff_ESI + 0x7c) = puVar2[2];
  return;
}


