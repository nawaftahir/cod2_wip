// 10019700 size=123 FUN_10019700

uint FUN_10019700(byte *param_1,int param_2)

{
  byte bVar1;
  int *piVar2;
  byte *pbVar3;
  int iVar4;
  int *in_EDX;
  int iVar5;
  byte *pbVar6;
  int *piVar7;
  bool bVar8;
  
  iVar4 = *in_EDX;
  iVar5 = 0;
  piVar7 = in_EDX;
  piVar2 = (int *)0x0;
  do {
    if (iVar4 == 0) {
      return (uint)piVar2 & 0xffffff00;
    }
    if ((piVar7[2] == 0) && (piVar7[3] == 0)) {
      pbVar6 = (byte *)*piVar7;
      pbVar3 = param_1;
      do {
        bVar1 = *pbVar3;
        bVar8 = bVar1 < *pbVar6;
        if (bVar1 != *pbVar6) {
LAB_10019748:
          iVar4 = (1 - (uint)bVar8) - (uint)(bVar8 != 0);
          goto LAB_1001974d;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar3[1];
        bVar8 = bVar1 < pbVar6[1];
        if (bVar1 != pbVar6[1]) goto LAB_10019748;
        pbVar3 = pbVar3 + 2;
        pbVar6 = pbVar6 + 2;
      } while (bVar1 != 0);
      iVar4 = 0;
LAB_1001974d:
      if (iVar4 == 0) {
        *(int *)(param_2 + 4) = in_EDX[iVar5 * 5 + 1];
        return CONCAT31((int3)((uint)(iVar5 * 5) >> 8),1);
      }
    }
    iVar4 = piVar7[5];
    piVar7 = piVar7 + 5;
    iVar5 = iVar5 + 1;
    piVar2 = piVar7;
  } while( true );
}


