


void FUN_100428d0(int param_1,unsigned int *param_2,int *param_3,int param_4,int param_5)

{
  byte *pbVar1;
  byte *pbVar2;
  byte bVar3;
  unsigned int uVar4;
  int iVar5;
  int iVar6;
  byte *pbVar7;
  unsigned int uVar8;
  
  uVar4 = *(unsigned int *)(param_1 + 0x24);
  iVar5 = *(int *)(*(int *)(param_1 + 0x158) + 8);
  param_5 = param_5 - 1;
  if (param_5 >= 0) {
    param_4 = param_4 << 2;
    param_1 = param_5;
    do {
      pbVar7 = (byte *)*param_2;
      param_2 = param_2 + 1;
      iVar6 = *(int *)(param_4 + *param_3);
      param_4 = param_4 + 4;
      uVar8 = 0;
      if (uVar4 != 0) {
        do {
          pbVar1 = pbVar7 + 1;
          bVar3 = *pbVar7;
          pbVar2 = pbVar7 + 2;
          pbVar7 = pbVar7 + 3;
          *(char *)(uVar8 + iVar6) =
               (char)((unsigned int)(*(int *)(iVar5 + 0x800 + (unsigned int)bVar3 * 4) +
                             *(int *)(iVar5 + 0x400 + (unsigned int)*pbVar1 * 4) +
                            *(int *)(iVar5 + (unsigned int)*pbVar2 * 4)) >> 0x10);
          uVar8 = uVar8 + 1;
        } while (uVar8 < uVar4);
      }
      param_1 = param_1 + -1;
    } while (param_1 != 0);
  }
  return;
}


