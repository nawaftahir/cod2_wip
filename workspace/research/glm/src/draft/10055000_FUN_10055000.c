extern int FUN_10054d40();
extern int FUN_10054e90();


int FUN_10055000(int *param_1,unsigned int param_2,int param_3,unsigned int param_4)

{
  unsigned int uVar1;
  int iVar2;
  int iVar3;
  unsigned int uVar4;
  unsigned int uVar5;
  
  uVar1 = (unsigned int)(0x3b9ac9f0 / (unsigned long long)(unsigned int)(param_3 * 0x80));
  iVar2 = param_1[1];
  if (uVar1 == 0) {
    *(unsigned int *)(*param_1 + 0x14) = 0x46;
    (**(void **)*param_1)(param_1);
  }
  if ((int)param_4 <= (int)uVar1) {
    uVar1 = param_4;
  }
  *(unsigned int *)(iVar2 + 0x50) = uVar1;
  iVar2 = FUN_10054d40(param_1,param_2,param_4 * 4);
  uVar5 = 0;
  if (param_4 != 0) {
    do {
      if (param_4 - uVar5 <= uVar1) {
        uVar1 = param_4 - uVar5;
      }
      iVar3 = FUN_10054e90(param_1,param_2,uVar1 * param_3 * 0x80);
      for (uVar4 = uVar1; uVar4 != 0; uVar4 = uVar4 - 1) {
        *(int *)(iVar2 + uVar5 * 4) = iVar3;
        uVar5 = uVar5 + 1;
        iVar3 = iVar3 + param_3 * 0x80;
      }
    } while (uVar5 < param_4);
  }
  return iVar2;
}


