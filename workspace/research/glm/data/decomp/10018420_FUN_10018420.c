// 10018420 size=163 FUN_10018420

undefined4 * FUN_10018420(void)

{
  byte bVar1;
  int iVar2;
  byte *pbVar3;
  undefined4 *in_ECX;
  byte *pbVar4;
  int iVar5;
  undefined4 *unaff_EBX;
  byte *pbVar6;
  bool bVar7;
  
  iVar2 = DAT_101aac70 * 0x45c;
  if ((&DAT_101a6ab4)[iVar2] != '\0') {
    (&DAT_101a6ab4)[iVar2] = 0;
    *in_ECX = *(undefined4 *)(&DAT_101a6ac8 + iVar2);
    *(undefined4 *)(&DAT_101a6ab0 + iVar2) = *(undefined4 *)(&DAT_101a6ac4 + iVar2);
  }
  pbVar3 = (byte *)FUN_1005f690();
  pbVar6 = (byte *)*unaff_EBX;
  iVar2 = 0;
  do {
    pbVar4 = pbVar3;
    if (pbVar6 == (byte *)0x0) {
      FUN_1005f360("%s is not a valid state value\n",pbVar3);
      return (undefined4 *)0x0;
    }
    do {
      bVar1 = *pbVar4;
      bVar7 = bVar1 < *pbVar6;
      if (bVar1 != *pbVar6) {
LAB_10018496:
        iVar5 = (1 - (uint)bVar7) - (uint)(bVar7 != 0);
        goto LAB_1001849b;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar4[1];
      bVar7 = bVar1 < pbVar6[1];
      if (bVar1 != pbVar6[1]) goto LAB_10018496;
      pbVar6 = pbVar6 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar1 != 0);
    iVar5 = 0;
LAB_1001849b:
    if (iVar5 == 0) {
      return unaff_EBX + iVar2 * 2;
    }
    pbVar6 = (byte *)unaff_EBX[iVar2 * 2 + 2];
    iVar2 = iVar2 + 1;
  } while( true );
}


