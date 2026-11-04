extern int FUN_10054d40();


void FUN_100550b0(int *param_1,int param_2,unsigned char param_3,unsigned int param_4,unsigned int param_5,
                 unsigned int param_6)

{
  int iVar1;
  unsigned int *puVar2;
  
  iVar1 = param_1[1];
  if (param_2 != 1) {
    *(unsigned int *)(*param_1 + 0x14) = 0xe;
    *(int *)(*param_1 + 0x18) = param_2;
    (**(void **)*param_1)(param_1);
  }
  puVar2 = (unsigned int *)FUN_10054d40(param_1,param_2,0x78);
  puVar2[1] = param_5;
  puVar2[2] = param_4;
  *puVar2 = 0;
  puVar2[3] = param_6;
  *(unsigned char *)(puVar2 + 8) = param_3;
  *(unsigned char *)((int)puVar2 + 0x22) = 0;
  puVar2[9] = *(unsigned int *)(iVar1 + 0x44);
  *(unsigned int **)(iVar1 + 0x44) = puVar2;
  return;
}


