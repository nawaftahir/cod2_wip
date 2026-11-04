


void FUN_10055fc0(int param_1,int param_2,unsigned int *param_3,int *param_4)

{
  int iVar1;
  unsigned int uVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  byte *pbVar7;
  unsigned int uVar8;
  char *pcVar9;
  int iVar10;
  unsigned int uVar11;
  unsigned int *puVar12;
  int local_18;
  
  iVar1 = *(int *)(param_1 + 0x6c);
  uVar2 = *(unsigned int *)(param_1 + 100);
  iVar3 = *(int *)(param_1 + 0x1b0);
  if (0 < (int)param_4) {
    param_2 = param_2 - (int)param_3;
    local_18 = (int)param_4;
    do {
      puVar12 = (unsigned int *)*param_3;
      for (uVar8 = uVar2 >> 2; uVar8 != 0; uVar8 = uVar8 - 1) {
        *puVar12 = 0;
        puVar12 = puVar12 + 1;
      }
      for (uVar8 = uVar2 & 3; uVar8 != 0; uVar8 = uVar8 - 1) {
        *(unsigned char *)puVar12 = 0;
        puVar12 = (unsigned int *)((int)puVar12 + 1);
      }
      iVar4 = *(int *)(iVar3 + 0x30);
      iVar10 = 0;
      if (0 < iVar1) {
        param_4 = (int *)(iVar3 + 0x34);
        do {
          iVar5 = *(int *)(*(int *)(iVar3 + 0x18) + iVar10 * 4);
          pcVar9 = (char *)*param_3;
          iVar6 = *param_4;
          uVar11 = 0;
          pbVar7 = (byte *)(*(int *)(param_2 + (int)param_3) + iVar10);
          for (uVar8 = uVar2; uVar8 != 0; uVar8 = uVar8 - 1) {
            *pcVar9 = *pcVar9 + *(char *)(*(int *)(iVar6 + iVar4 * 0x40 + uVar11 * 4) +
                                          (unsigned int)*pbVar7 + iVar5);
            pbVar7 = pbVar7 + iVar1;
            pcVar9 = pcVar9 + 1;
            uVar11 = uVar11 + 1 & 0xf;
          }
          iVar10 = iVar10 + 1;
          param_4 = param_4 + 1;
        } while (iVar10 < iVar1);
      }
      param_3 = param_3 + 1;
      local_18 = local_18 + -1;
      *(unsigned int *)(iVar3 + 0x30) = iVar4 + 1U & 0xf;
    } while (local_18 != 0);
  }
  return;
}


