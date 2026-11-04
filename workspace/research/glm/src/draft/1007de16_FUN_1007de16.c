


unsigned int FUN_1007de16(int *param_1,int param_2,unsigned int *param_3,float *param_4,unsigned int param_5)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  
  iVar2 = param_5 << 2;
  if (iVar2 != 0) {
    iVar1 = (int)param_3 - (int)param_4;
    do {
      *param_4 = (float)(*(int *)(iVar1 + (int)param_4) != 0);
      param_4 = param_4 + 1;
      iVar2 = iVar2 + -1;
    } while (iVar2 != 0);
  }
  iVar2 = (**(void **)(*param_1 + 0xc))(param_1);
  puVar3 = (unsigned int *)(iVar2 + param_2 * 0x10);
  for (iVar1 = (param_5 & 0xfffffff) << 2; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar3 = *param_3;
    param_3 = param_3 + 1;
    puVar3 = puVar3 + 1;
  }
  for (iVar2 = 0; iVar2 != 0; iVar2 = iVar2 + -1) {
    *(unsigned char *)puVar3 = *(unsigned char *)param_3;
    param_3 = (unsigned int *)((int)param_3 + 1);
    puVar3 = (unsigned int *)((int)puVar3 + 1);
  }
  return 0;
}


