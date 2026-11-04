// 10017050 size=174 FUN_10017050

void FUN_10017050(ushort *param_1,undefined1 *param_2)

{
  byte bVar1;
  int iVar2;
  int iVar3;
  byte *pbVar4;
  ushort uVar5;
  byte *unaff_EBX;
  byte *pbVar7;
  bool bVar8;
  int iVar6;
  
  iVar6 = 0;
  uVar5 = 0;
  iVar3 = 0x77;
  bVar1 = *unaff_EBX;
  while (bVar1 != 0) {
    iVar6 = iVar6 + (char)bVar1 * iVar3;
    uVar5 = (ushort)iVar6;
    iVar2 = iVar3 + -0x76;
    iVar3 = iVar3 + 1;
    bVar1 = unaff_EBX[iVar2];
  }
  *param_1 = uVar5 & 0x3ff;
  iVar6 = (&DAT_101d4d28)[uVar5 & 0x3ff];
  do {
    if (iVar6 == 0) {
      *param_2 = 0;
      return;
    }
    pbVar4 = *(byte **)(&DAT_101d4d28)[*param_1];
    pbVar7 = unaff_EBX;
    do {
      bVar1 = *pbVar4;
      bVar8 = bVar1 < *pbVar7;
      if (bVar1 != *pbVar7) {
LAB_100170c6:
        iVar6 = (1 - (uint)bVar8) - (uint)(bVar8 != 0);
        goto LAB_100170cb;
      }
      if (bVar1 == 0) break;
      bVar1 = pbVar4[1];
      bVar8 = bVar1 < pbVar7[1];
      if (bVar1 != pbVar7[1]) goto LAB_100170c6;
      pbVar4 = pbVar4 + 2;
      pbVar7 = pbVar7 + 2;
    } while (bVar1 != 0);
    iVar6 = 0;
LAB_100170cb:
    if (iVar6 == 0) {
      *param_2 = 1;
      return;
    }
    uVar5 = *param_1 + 1 & 0x3ff;
    *param_1 = uVar5;
    iVar6 = (&DAT_101d4d28)[uVar5];
  } while( true );
}


