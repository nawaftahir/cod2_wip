// 100651a5 size=116 FUN_100651a5

undefined4 FUN_100651a5(byte *param_1)

{
  int *piVar1;
  byte bVar2;
  int iVar3;
  int in_ECX;
  byte *pbVar4;
  byte *pbVar5;
  bool bVar6;
  
  iVar3 = FUN_10064c94(param_1);
  piVar1 = (int *)(in_ECX + 0x6c + iVar3 * 4);
  iVar3 = *piVar1;
  do {
    if (iVar3 == 0) {
      return 0;
    }
    pbVar4 = *(byte **)*piVar1;
    pbVar5 = param_1;
    do {
      bVar2 = *pbVar5;
      bVar6 = bVar2 < *pbVar4;
      if (bVar2 != *pbVar4) {
LAB_100651e9:
        iVar3 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
        goto LAB_100651ee;
      }
      if (bVar2 == 0) break;
      bVar2 = pbVar5[1];
      bVar6 = bVar2 < pbVar4[1];
      if (bVar2 != pbVar4[1]) goto LAB_100651e9;
      pbVar5 = pbVar5 + 2;
      pbVar4 = pbVar4 + 2;
    } while (bVar2 != 0);
    iVar3 = 0;
LAB_100651ee:
    if (iVar3 < 0) {
      return 0;
    }
    if (iVar3 == 0) {
      iVar3 = *piVar1;
      *piVar1 = *(int *)(iVar3 + 0xc);
      *(undefined4 *)(iVar3 + 0xc) = 0;
      FUN_10065146(1);
      return 0;
    }
    piVar1 = (undefined4 *)*piVar1 + 3;
    iVar3 = *piVar1;
  } while( true );
}


