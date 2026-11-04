


void FUN_1004bb80(int param_1,int *param_2,int param_3,unsigned int *param_4,int param_5)

{
  int *piVar1;
  int *piVar2;
  byte bVar3;
  byte bVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  byte *pbVar11;
  unsigned char *puVar12;
  int iVar13;
  int iVar14;
  unsigned int uVar15;
  
  iVar5 = *(int *)(param_1 + 100);
  iVar6 = *(int *)(param_1 + 0x1ac);
  iVar7 = *(int *)(param_1 + 0x128);
  iVar8 = *(int *)(iVar6 + 8);
  iVar9 = *(int *)(iVar6 + 0xc);
  iVar10 = *(int *)(iVar6 + 0x10);
  iVar6 = *(int *)(iVar6 + 0x14);
  param_5 = param_5 - 1;
  if (param_5 >= 0) {
    param_3 = param_3 << 2;
    do {
      piVar1 = (int *)(param_3 + *param_2);
      piVar2 = (int *)(param_3 + param_2[2]);
      pbVar11 = *(byte **)(param_3 + param_2[1]);
      puVar12 = (unsigned char *)*param_4;
      param_4 = param_4 + 1;
      param_3 = param_3 + 4;
      if (iVar5 != 0) {
        iVar14 = *piVar1 - (int)pbVar11;
        iVar13 = *piVar2 - (int)pbVar11;
        param_1 = iVar5;
        do {
          bVar3 = pbVar11[iVar13];
          uVar15 = (unsigned int)pbVar11[iVar14];
          bVar4 = *pbVar11;
          puVar12[2] = *(unsigned char *)(*(int *)(iVar8 + (unsigned int)bVar3 * 4) + uVar15 + iVar7);
          puVar12[1] = *(unsigned char *)
                        ((*(int *)(iVar6 + (unsigned int)bVar4 * 4) + *(int *)(iVar10 + (unsigned int)bVar3 * 4) >>
                         0x10) + uVar15 + iVar7);
          *puVar12 = *(unsigned char *)(*(int *)(iVar9 + (unsigned int)bVar4 * 4) + uVar15 + iVar7);
          puVar12 = puVar12 + 3;
          pbVar11 = pbVar11 + 1;
          param_1 = param_1 + -1;
        } while (param_1 != 0);
      }
      param_5 = param_5 + -1;
    } while (param_5 != 0);
  }
  return;
}


