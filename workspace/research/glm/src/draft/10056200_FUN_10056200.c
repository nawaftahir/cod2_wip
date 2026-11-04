


void FUN_10056200(int param_1,int param_2,unsigned int *param_3,int param_4)

{
  byte bVar1;
  unsigned int uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  int iVar8;
  unsigned int uVar9;
  int iVar10;
  unsigned int uVar11;
  int *piVar12;
  short *psVar13;
  byte *pbVar14;
  int iVar15;
  unsigned int *puVar16;
  char *pcVar17;
  int local_2c;
  int local_28;
  int local_1c;
  int local_18;
  
  uVar2 = *(unsigned int *)(param_1 + 100);
  iVar3 = *(int *)(param_1 + 0x128);
  iVar4 = *(int *)(param_1 + 0x1b0);
  iVar5 = *(int *)(param_1 + 0x6c);
  if (0 < param_4) {
    param_2 = param_2 - (int)param_3;
    local_18 = param_4;
    do {
      puVar16 = (unsigned int *)*param_3;
      for (uVar11 = uVar2 >> 2; uVar11 != 0; uVar11 = uVar11 - 1) {
        *puVar16 = 0;
        puVar16 = puVar16 + 1;
      }
      for (uVar11 = uVar2 & 3; uVar11 != 0; uVar11 = uVar11 - 1) {
        *(unsigned char *)puVar16 = 0;
        puVar16 = (unsigned int *)((int)puVar16 + 1);
      }
      local_1c = 0;
      if (0 < iVar5) {
        piVar12 = (int *)(iVar4 + 0x44);
        do {
          pcVar17 = (char *)*param_3;
          psVar13 = (short *)*piVar12;
          pbVar14 = (byte *)(*(int *)(param_2 + (int)param_3) + local_1c);
          if (*(char *)(iVar4 + 0x54) == '\0') {
            iVar15 = 1;
            local_28 = iVar5;
          }
          else {
            pcVar17 = pcVar17 + (uVar2 - 1);
            pbVar14 = pbVar14 + (uVar2 - 1) * iVar5;
            iVar15 = -1;
            psVar13 = psVar13 + uVar2 + 1;
            local_28 = -iVar5;
          }
          iVar6 = *(int *)(*(int *)(iVar4 + 0x18) + local_1c * 4);
          iVar7 = *(int *)(*(int *)(iVar4 + 0x10) + local_1c * 4);
          iVar8 = 0;
          param_4 = 0;
          param_4._0_2_ = 0;
          local_2c = 0;
          for (uVar11 = uVar2; uVar11 != 0; uVar11 = uVar11 - 1) {
            uVar9 = (unsigned int)*(byte *)((unsigned int)*pbVar14 + (psVar13[iVar15] + 8 + iVar8 >> 4) + iVar3);
            bVar1 = *(byte *)(uVar9 + iVar6);
            *pcVar17 = *pcVar17 + bVar1;
            iVar10 = uVar9 - *(byte *)((unsigned int)bVar1 + iVar7);
            *psVar13 = (short)param_4 + (short)iVar10 * 3;
            param_4 = local_2c + iVar10 * 5;
            iVar8 = iVar10 * 7;
            pbVar14 = pbVar14 + local_28;
            pcVar17 = pcVar17 + iVar15;
            psVar13 = psVar13 + iVar15;
            local_2c = iVar10;
          }
          *psVar13 = (short)param_4;
          local_1c = local_1c + 1;
          piVar12 = piVar12 + 1;
        } while (local_1c < iVar5);
      }
      param_3 = param_3 + 1;
      local_18 = local_18 + -1;
      *(unsigned char *)(iVar4 + 0x54) = *(char *)(iVar4 + 0x54) == '\0';
    } while (local_18 != 0);
  }
  return;
}


