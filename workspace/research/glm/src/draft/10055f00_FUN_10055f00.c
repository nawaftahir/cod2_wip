


void FUN_10055f00(int param_1,int param_2,int *param_3,int param_4)

{
  byte *pbVar1;
  byte *pbVar2;
  byte bVar3;
  int *piVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  byte *pbVar9;
  char *pcVar10;
  int iVar11;
  
  piVar4 = *(int **)(*(int *)(param_1 + 0x1b0) + 0x18);
  iVar5 = piVar4[1];
  iVar6 = *(int *)(param_1 + 100);
  iVar7 = *piVar4;
  iVar8 = piVar4[2];
  if (0 < param_4) {
    param_2 = param_2 - (int)param_3;
    do {
      pbVar9 = *(byte **)(param_2 + (int)param_3);
      pcVar10 = (char *)*param_3;
      for (iVar11 = iVar6; iVar11 != 0; iVar11 = iVar11 + -1) {
        bVar3 = *pbVar9;
        pbVar1 = pbVar9 + 1;
        pbVar2 = pbVar9 + 2;
        pbVar9 = pbVar9 + 3;
        *pcVar10 = *(char *)((unsigned int)bVar3 + iVar7) + *(char *)((unsigned int)*pbVar1 + iVar5) +
                   *(char *)((unsigned int)*pbVar2 + iVar8);
        pcVar10 = pcVar10 + 1;
      }
      param_3 = param_3 + 1;
      param_4 = param_4 + -1;
    } while (param_4 != 0);
  }
  return;
}


