


unsigned int
FUN_1007ded0(int *param_1,int param_2,unsigned int *param_3,unsigned int param_4,unsigned int param_5)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  
  iVar1 = (**(void **)(*param_1 + 0xc))(param_1);
  puVar3 = (unsigned int *)(iVar1 + param_2 * 0x10);
  for (iVar2 = (param_5 & 0xfffffff) << 2; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar3 = *param_3;
    param_3 = param_3 + 1;
    puVar3 = puVar3 + 1;
  }
  for (iVar1 = 0; iVar1 != 0; iVar1 = iVar1 + -1) {
    *(unsigned char *)puVar3 = *(unsigned char *)param_3;
    param_3 = (unsigned int *)((int)param_3 + 1);
    puVar3 = (unsigned int *)((int)puVar3 + 1);
  }
  return 0;
}


