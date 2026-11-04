


void FUN_1004bdb0(int param_1,int *param_2,int param_3,unsigned int *param_4,int param_5)

{
  int *piVar1;
  int *piVar2;
  int *piVar3;
  byte bVar4;
  byte bVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  int iVar9;
  int iVar10;
  int iVar11;
  byte *pbVar12;
  unsigned char *puVar13;
  int iVar14;
  int iVar15;
  unsigned int uVar16;
  int iVar17;
  
  iVar6 = *(int *)(param_1 + 100);
  iVar7 = *(int *)(param_1 + 0x1ac);
  iVar8 = *(int *)(param_1 + 0x128);
  iVar9 = *(int *)(iVar7 + 8);
  iVar10 = *(int *)(iVar7 + 0xc);
  iVar11 = *(int *)(iVar7 + 0x10);
  iVar7 = *(int *)(iVar7 + 0x14);
  param_5 = param_5 - 1;
  if (param_5 >= 0) {
    param_3 = param_3 << 2;
    do {
      piVar1 = (int *)(param_3 + *param_2);
      piVar2 = (int *)(param_3 + param_2[2]);
      pbVar12 = *(byte **)(param_3 + param_2[1]);
      piVar3 = (int *)(param_3 + param_2[3]);
      puVar13 = (unsigned char *)*param_4;
      param_4 = param_4 + 1;
      param_3 = param_3 + 4;
      if (iVar6 != 0) {
        iVar15 = *piVar1 - (int)pbVar12;
        iVar14 = *piVar2 - (int)pbVar12;
        iVar17 = *piVar3 - (int)pbVar12;
        param_1 = iVar6;
        do {
          bVar4 = pbVar12[iVar14];
          uVar16 = (unsigned int)pbVar12[iVar15];
          bVar5 = *pbVar12;
          *puVar13 = *(unsigned char *)(((iVar8 - *(int *)(iVar9 + (unsigned int)bVar4 * 4)) - uVar16) + 0xff);
          puVar13[1] = *(unsigned char *)
                        (((iVar8 - (*(int *)(iVar7 + (unsigned int)bVar5 * 4) +
                                    *(int *)(iVar11 + (unsigned int)bVar4 * 4) >> 0x10)) - uVar16) + 0xff);
          puVar13[2] = *(unsigned char *)
                        (((iVar8 - *(int *)(iVar10 + (unsigned int)bVar5 * 4)) - uVar16) + 0xff);
          puVar13[3] = pbVar12[iVar17];
          pbVar12 = pbVar12 + 1;
          param_1 = param_1 + -1;
          puVar13 = puVar13 + 4;
        } while (param_1 != 0);
      }
      param_5 = param_5 + -1;
    } while (param_5 != 0);
  }
  return;
}


