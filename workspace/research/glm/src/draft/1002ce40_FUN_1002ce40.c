


void FUN_1002ce40(int param_1,int *param_2,short param_3)

{
  unsigned int uVar1;
  int *piVar2;
  unsigned int uVar3;
  int iVar4;
  int iVar5;
  
  if (param_3 != 0) {
    piVar2 = *(int **)(param_1 + 8);
    iVar4 = CONCAT22(param_3,param_3);
    iVar5 = (int)*(short *)(param_1 + 4) >> 1;
    do {
      *param_2 = *piVar2 + iVar4;
      param_2[1] = piVar2[1] + iVar4;
      param_2[2] = piVar2[2] + iVar4;
      param_2 = param_2 + 3;
      piVar2 = piVar2 + 3;
      iVar5 = iVar5 + -1;
    } while (iVar5 != 0);
    return;
  }
  uVar1 = *(short *)(param_1 + 4) * 3;
  piVar2 = *(int **)(param_1 + 8);
  for (uVar3 = (uVar1 & 0x7fffffff) >> 1; uVar3 != 0; uVar3 = uVar3 - 1) {
    *param_2 = *piVar2;
    piVar2 = piVar2 + 1;
    param_2 = param_2 + 1;
  }
  for (iVar4 = (uVar1 & 1) << 1; iVar4 != 0; iVar4 = iVar4 + -1) {
    *(char *)param_2 = (char)*piVar2;
    piVar2 = (int *)((int)piVar2 + 1);
    param_2 = (int *)((int)param_2 + 1);
  }
  return;
}


