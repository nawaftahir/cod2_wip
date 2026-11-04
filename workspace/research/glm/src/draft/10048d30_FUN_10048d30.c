


void FUN_10048d30(int param_1,int *param_2,int param_3,int param_4,int param_5)

{
  int *piVar1;
  int *piVar2;
  int iVar3;
  unsigned int *puVar4;
  int iVar5;
  
  iVar3 = param_1;
  piVar1 = (int *)(param_1 + 0x44);
  piVar2 = (int *)(param_1 + 0x15c);
  iVar5 = *(int *)(param_1 + 0x4c);
  param_1 = 0;
  if (0 < *piVar1) {
    puVar4 = (unsigned int *)(*piVar2 + 0xc);
    param_4 = param_4 - (int)param_2;
    do {
      (*(void *)*puVar4)(iVar3,iVar5,*param_2 + param_3 * 4,
                         *(int *)(param_4 + (int)param_2) + *(int *)(iVar5 + 0xc) * param_5 * 4);
      param_1 = param_1 + 1;
      param_2 = param_2 + 1;
      puVar4 = puVar4 + 1;
      iVar5 = iVar5 + 0x54;
    } while (param_1 < *(int *)(iVar3 + 0x44));
  }
  return;
}


