extern int FUN_10057160();


void FUN_10057280(int param_1,int param_2,int *param_3,int param_4)

{
  byte *pbVar1;
  short *psVar2;
  byte bVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  char *pcVar7;
  byte *pbVar8;
  int local_10;
  
  iVar4 = *(int *)(*(int *)(param_1 + 0x1b0) + 0x18);
  iVar5 = *(int *)(param_1 + 100);
  if (0 < param_4) {
    param_2 = param_2 - (int)param_3;
    local_10 = param_4;
    do {
      pbVar8 = *(byte **)(param_2 + (int)param_3);
      pcVar7 = (char *)*param_3;
      for (iVar6 = iVar5; iVar6 != 0; iVar6 = iVar6 + -1) {
        bVar3 = *pbVar8;
        pbVar1 = pbVar8 + 2;
        psVar2 = (short *)(*(int *)(iVar4 + (unsigned int)(bVar3 >> 3) * 4) +
                          ((unsigned int)(pbVar8[1] >> 2) * 0x20 + (unsigned int)(*pbVar1 >> 3)) * 2);
        pbVar8 = pbVar8 + 3;
        if (*psVar2 == 0) {
          FUN_10057160(param_1,(unsigned int)(bVar3 >> 3),(unsigned int)(*pbVar1 >> 3));
        }
        *pcVar7 = (char)*psVar2 + -1;
        pcVar7 = pcVar7 + 1;
      }
      param_3 = param_3 + 1;
      local_10 = local_10 + -1;
    } while (local_10 != 0);
  }
  return;
}


