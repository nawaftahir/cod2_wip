// 10016ab0 size=140 FUN_10016ab0

undefined4 FUN_10016ab0(byte *param_1)

{
  int iVar1;
  byte bVar2;
  undefined4 *puVar3;
  int iVar4;
  byte *pbVar5;
  uint uVar6;
  uint *unaff_EBX;
  byte *pbVar7;
  bool bVar8;
  
  uVar6 = 0;
  iVar4 = 0x77;
  bVar2 = *param_1;
  while (bVar2 != 0) {
    uVar6 = uVar6 + (char)bVar2 * iVar4;
    iVar1 = iVar4 + -0x76;
    iVar4 = iVar4 + 1;
    bVar2 = param_1[iVar1];
  }
  uVar6 = uVar6 & 0x1f;
  puVar3 = (undefined4 *)(&DAT_101da3dc)[uVar6];
  do {
    if (puVar3 == (undefined4 *)0x0) {
      *unaff_EBX = uVar6;
      return 0;
    }
    pbVar5 = (byte *)*puVar3;
    pbVar7 = param_1;
    do {
      bVar2 = *pbVar5;
      bVar8 = bVar2 < *pbVar7;
      if (bVar2 != *pbVar7) {
LAB_10016b14:
        iVar4 = (1 - (uint)bVar8) - (uint)(bVar8 != 0);
        goto LAB_10016b19;
      }
      if (bVar2 == 0) break;
      bVar2 = pbVar5[1];
      bVar8 = bVar2 < pbVar7[1];
      if (bVar2 != pbVar7[1]) goto LAB_10016b14;
      pbVar5 = pbVar5 + 2;
      pbVar7 = pbVar7 + 2;
    } while (bVar2 != 0);
    iVar4 = 0;
LAB_10016b19:
    if (iVar4 == 0) {
      *unaff_EBX = uVar6;
      return 1;
    }
    uVar6 = uVar6 + 1 & 0x1f;
    puVar3 = (undefined4 *)(&DAT_101da3dc)[uVar6];
  } while( true );
}


