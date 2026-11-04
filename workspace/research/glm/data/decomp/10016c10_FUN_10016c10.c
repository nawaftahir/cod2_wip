// 10016c10 size=175 FUN_10016c10

undefined4 FUN_10016c10(byte *param_1,uint param_2,uint *param_3)

{
  int iVar1;
  byte bVar2;
  undefined4 *puVar3;
  int iVar4;
  byte *pbVar5;
  int iVar6;
  uint unaff_EBX;
  byte *pbVar7;
  uint uVar8;
  bool bVar9;
  
  iVar6 = 0;
  iVar4 = 0x77;
  bVar2 = *param_1;
  while (bVar2 != 0) {
    iVar6 = iVar6 + (char)bVar2 * iVar4;
    iVar1 = iVar4 + -0x76;
    iVar4 = iVar4 + 1;
    bVar2 = param_1[iVar1];
  }
  uVar8 = param_2 * 0x61 + iVar6 + unaff_EBX & 0xff;
  puVar3 = (undefined4 *)(&DAT_101da564)[uVar8];
  do {
    if (puVar3 == (undefined4 *)0x0) {
      *param_3 = uVar8;
      return 0;
    }
    if ((*(byte *)((int)puVar3 + 10) == param_2) && (*(byte *)((int)puVar3 + 0xb) == unaff_EBX)) {
      pbVar5 = (byte *)*puVar3;
      pbVar7 = param_1;
      do {
        bVar2 = *pbVar5;
        bVar9 = bVar2 < *pbVar7;
        if (bVar2 != *pbVar7) {
LAB_10016c8c:
          iVar6 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
          goto LAB_10016c91;
        }
        if (bVar2 == 0) break;
        bVar2 = pbVar5[1];
        bVar9 = bVar2 < pbVar7[1];
        if (bVar2 != pbVar7[1]) goto LAB_10016c8c;
        pbVar5 = pbVar5 + 2;
        pbVar7 = pbVar7 + 2;
      } while (bVar2 != 0);
      iVar6 = 0;
LAB_10016c91:
      if (iVar6 == 0) {
        *param_3 = uVar8;
        return 1;
      }
    }
    uVar8 = uVar8 + 1 & 0xff;
    puVar3 = (undefined4 *)(&DAT_101da564)[uVar8];
  } while( true );
}


