// 100997e2 size=100 FUN_100997e2

undefined4 FUN_100997e2(int param_1,int param_2)

{
  byte bVar1;
  byte *pbVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  bool bVar6;
  
  iVar5 = *(int *)(param_2 + 0x1c);
  if (iVar5 != 0) {
    do {
      pbVar2 = *(byte **)(iVar5 + 0x10);
      pbVar4 = *(byte **)(param_1 + 8);
      do {
        bVar1 = *pbVar4;
        bVar6 = bVar1 < *pbVar2;
        if (bVar1 != *pbVar2) {
LAB_10099821:
          iVar3 = (1 - (uint)bVar6) - (uint)(bVar6 != 0);
          goto LAB_10099826;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar4[1];
        bVar6 = bVar1 < pbVar2[1];
        if (bVar1 != pbVar2[1]) goto LAB_10099821;
        pbVar4 = pbVar4 + 2;
        pbVar2 = pbVar2 + 2;
      } while (bVar1 != 0);
      iVar3 = 0;
LAB_10099826:
      if (iVar3 == 0) {
        return *(undefined4 *)(iVar5 + 0x14);
      }
      if (iVar3 < 0) {
        iVar5 = *(int *)(iVar5 + 8);
      }
      else {
        iVar5 = *(int *)(iVar5 + 0xc);
      }
    } while (iVar5 != 0);
  }
  return 0;
}


