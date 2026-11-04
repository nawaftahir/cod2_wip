extern int FUN_10048cd0();


void FUN_10048ef0(int param_1,unsigned int param_2,int param_3,unsigned int *param_4)

{
  unsigned int uVar1;
  unsigned int uVar2;
  int iVar3;
  unsigned int *puVar4;
  unsigned int *puVar5;
  
  uVar1 = *(unsigned int *)(param_1 + 0x24);
  iVar3 = *(int *)(param_1 + 0xe4);
  if (0 < iVar3) {
    param_3 = param_3 - (int)param_4;
    do {
      puVar4 = *(unsigned int **)(param_3 + (int)param_4);
      puVar5 = (unsigned int *)*param_4;
      for (uVar2 = uVar1 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
        *puVar5 = *puVar4;
        puVar4 = puVar4 + 1;
        puVar5 = puVar5 + 1;
      }
      param_4 = param_4 + 1;
      iVar3 = iVar3 + -1;
      for (uVar2 = uVar1 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
        *(unsigned char *)puVar5 = *(unsigned char *)puVar4;
        puVar4 = (unsigned int *)((int)puVar4 + 1);
        puVar5 = (unsigned int *)((int)puVar5 + 1);
      }
    } while (iVar3 != 0);
  }
  FUN_10048cd0();
  return;
}


