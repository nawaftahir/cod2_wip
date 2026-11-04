// 10019e10 size=188 FUN_10019e10

uint FUN_10019e10(byte *param_1,int param_2,int *param_3,int param_4)

{
  byte bVar1;
  ushort uVar2;
  byte *pbVar3;
  int iVar4;
  int iVar5;
  byte *pbVar6;
  int *piVar7;
  bool bVar8;
  
  iVar4 = *param_3;
  iVar5 = 0;
  piVar7 = param_3;
  do {
    if (iVar4 == 0) {
      return (uint)piVar7 & 0xffffff00;
    }
    if (piVar7[2] == 0) {
      pbVar6 = (byte *)*piVar7;
      pbVar3 = param_1;
      do {
        bVar1 = *pbVar3;
        bVar8 = bVar1 < *pbVar6;
        if (bVar1 != *pbVar6) {
LAB_10019e54:
          iVar4 = (1 - (uint)bVar8) - (uint)(bVar8 != 0);
          goto LAB_10019e59;
        }
        if (bVar1 == 0) break;
        bVar1 = pbVar3[1];
        bVar8 = bVar1 < pbVar6[1];
        if (bVar1 != pbVar6[1]) goto LAB_10019e54;
        pbVar3 = pbVar3 + 2;
        pbVar6 = pbVar6 + 2;
      } while (bVar1 != 0);
      iVar4 = 0;
LAB_10019e59:
      if (iVar4 == 0) {
        bVar1 = *(byte *)(param_3 + iVar5 * 5 + 1);
        uVar2 = (ushort)bVar1;
        if (bVar1 < 0xbb) {
          *(undefined1 *)(param_4 + 6) = 0;
          *(ushort *)(param_4 + 4) = (ushort)bVar1;
          *(undefined1 *)(param_4 + 7) = *(undefined1 *)(param_2 + 5);
          return 1;
        }
        if (**(short **)(param_2 + 0xc) == 3) {
          uVar2 = bVar1 ^ 2;
        }
        *(ushort *)(param_4 + 4) = uVar2;
        *(undefined1 *)(param_4 + 6) = 0;
        *(undefined1 *)(param_4 + 7) = *(undefined1 *)(*(int *)(param_2 + 8) + 8);
        return 1;
      }
    }
    iVar4 = piVar7[5];
    piVar7 = piVar7 + 5;
    iVar5 = iVar5 + 1;
  } while( true );
}


