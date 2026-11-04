// 100652c0 size=183 FUN_100652c0

undefined4 FUN_100652c0(undefined4 *param_1)

{
  int *piVar1;
  byte bVar2;
  int iVar3;
  byte *pbVar4;
  int in_ECX;
  byte *pbVar5;
  bool bVar6;
  
  iVar3 = FUN_10064c94(*param_1);
  piVar1 = (int *)(in_ECX + 0x6c + iVar3 * 4);
  iVar3 = *piVar1;
  do {
    if (iVar3 == 0) {
LAB_10065368:
      param_1[3] = *piVar1;
      *piVar1 = (int)param_1;
      return 0;
    }
    pbVar4 = *(byte **)*piVar1;
    pbVar5 = (byte *)*param_1;
    do {
      bVar2 = *pbVar5;
      bVar6 = bVar2 < *pbVar4;
      if (bVar2 != *pbVar4) {
LAB_1006530d:
        iVar3 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
        goto LAB_10065312;
      }
      if (bVar2 == 0) break;
      bVar2 = pbVar5[1];
      bVar6 = bVar2 < pbVar4[1];
      if (bVar2 != pbVar4[1]) goto LAB_1006530d;
      pbVar5 = pbVar5 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar2 != 0);
    iVar3 = 0;
LAB_10065312:
    if (iVar3 < 0) goto LAB_10065368;
    if (iVar3 == 0) {
      iVar3 = FUN_10064ccb(*piVar1,param_1);
      if (iVar3 == 0) {
        FUN_10067d05(in_ECX + 0x18,in_ECX + 0x278,0x5ef,"\'%s\' : macro redefinition",*param_1);
      }
      iVar3 = *piVar1;
      *piVar1 = *(int *)(iVar3 + 0xc);
      *(undefined4 *)(iVar3 + 0xc) = 0;
      FUN_10065146(1);
      goto LAB_10065368;
    }
    piVar1 = (undefined4 *)*piVar1 + 3;
    iVar3 = *piVar1;
  } while( true );
}


