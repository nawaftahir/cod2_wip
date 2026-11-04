extern int FUN_1002f110();


void FUN_1002f260(int *param_1)

{
  int iVar1;
  
  iVar1 = *param_1;
  FUN_1002f110(*(unsigned int *)(iVar1 + 4),*(unsigned int *)(iVar1 + 8),*(unsigned int *)(iVar1 + 0xc),
               *(unsigned int *)(iVar1 + 0x10),*(unsigned int *)(iVar1 + 0x14));
  *param_1 = (unsigned int)*(unsigned short *)(*param_1 + 2) + *param_1;
  return;
}


