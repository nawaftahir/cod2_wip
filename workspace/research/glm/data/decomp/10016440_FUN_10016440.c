// 10016440 size=239 FUN_10016440

byte * FUN_10016440(void)

{
  byte bVar1;
  int iVar2;
  byte *in_EAX;
  int iVar3;
  byte *pbVar4;
  byte *pbVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  bool bVar9;
  
  uVar7 = 0;
  iVar3 = 0x77;
  bVar1 = *in_EAX;
  while (bVar1 != 0) {
    uVar7 = uVar7 + ((int)(char)bVar1 | 0x20U) * iVar3;
    iVar2 = iVar3 + -0x76;
    iVar3 = iVar3 + 1;
    bVar1 = in_EAX[iVar2];
  }
  uVar7 = uVar7 & 0x3f;
  iVar3 = (&DAT_101da460)[uVar7];
  do {
    if (iVar3 == 0) {
      DAT_101da45c = DAT_101da45c + 1;
      if (DAT_101da45c == 0x40) {
        FUN_100138c0(1,"More than %i string identifiers used by shaders",0x3f);
      }
      pbVar4 = in_EAX;
      do {
        bVar1 = *pbVar4;
        pbVar4 = pbVar4 + 1;
      } while (bVar1 != 0);
      pbVar4 = pbVar4 + (1 - (int)(in_EAX + 1));
      pbVar5 = (byte *)(*(code *)RI_Hunk_AllocInternal)(pbVar4);
      pbVar8 = pbVar5;
      for (uVar6 = (uint)pbVar4 >> 2; uVar6 != 0; uVar6 = uVar6 - 1) {
        *(undefined4 *)pbVar8 = *(undefined4 *)in_EAX;
        in_EAX = in_EAX + 4;
        pbVar8 = pbVar8 + 4;
      }
      for (uVar6 = (uint)pbVar4 & 3; uVar6 != 0; uVar6 = uVar6 - 1) {
        *pbVar8 = *in_EAX;
        in_EAX = in_EAX + 1;
        pbVar8 = pbVar8 + 1;
      }
      (&DAT_101da460)[uVar7] = pbVar5;
      return pbVar5;
    }
    pbVar4 = (byte *)(&DAT_101da460)[uVar7];
    pbVar8 = in_EAX;
    do {
      bVar1 = *pbVar4;
      bVar9 = bVar1 < *pbVar8;
      if (bVar1 != *pbVar8) {
LAB_100164b8:
        iVar3 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
        goto LAB_100164bd;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar4[1];
      bVar9 = bVar1 < pbVar8[1];
      if (bVar1 != pbVar8[1]) goto LAB_100164b8;
      pbVar4 = pbVar4 + 2;
      pbVar8 = pbVar8 + 2;
    } while (bVar1 != 0);
    iVar3 = 0;
LAB_100164bd:
    if (iVar3 == 0) {
      return (byte *)(&DAT_101da460)[uVar7];
    }
    uVar7 = uVar7 + 1 & 0x3f;
    iVar3 = (&DAT_101da460)[uVar7];
  } while( true );
}


