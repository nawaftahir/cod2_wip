
int * __thiscall FUN_004bc600(int *param_1,byte *param_2)

{
  int *piVar1;
  byte bVar2;
  int iVar3;
  byte *pbVar4;
  int iVar5;
  int iVar6;
  byte *pbVar7;
  int *piVar8;
  bool bVar9;
  
  iVar3 = *(int *)(*param_1 + 4);
  iVar6 = iVar3;
  do {
    if (iVar6 == 0) {
      return (int *)0x0;
    }
    iVar6 = iVar6 + -1;
    if (iVar6 < iVar3) {
      piVar8 = *(int **)(*(int *)(*param_1 + 8) + iVar6 * 4);
    }
    else {
      piVar8 = (int *)0x0;
    }
    pbVar7 = (byte *)*piVar8;
    while (pbVar4 = param_2, pbVar7 != (byte *)0x0) {
      do {
        bVar2 = *pbVar4;
        bVar9 = bVar2 < *pbVar7;
        if (bVar2 != *pbVar7) {
LAB_004bc666:
          iVar5 = (1 - (uint)bVar9) - (uint)(bVar9 != 0);
          goto LAB_004bc66b;
        }
        if (bVar2 == 0) break;
        bVar2 = pbVar4[1];
        bVar9 = bVar2 < pbVar7[1];
        if (bVar2 != pbVar7[1]) goto LAB_004bc666;
        pbVar7 = pbVar7 + 2;
        pbVar4 = pbVar4 + 2;
      } while (bVar2 != 0);
      iVar5 = 0;
LAB_004bc66b:
      if (iVar5 == 0) {
        if (*piVar8 != 0) {
          return piVar8;
        }
        break;
      }
      piVar1 = piVar8 + 2;
      piVar8 = piVar8 + 2;
      pbVar7 = (byte *)*piVar1;
    }
  } while( true );
}

