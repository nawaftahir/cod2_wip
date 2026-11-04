extern int FUN_100827bb();


unsigned int * FUN_100833d8(unsigned int param_1,unsigned long long param_2,unsigned int *param_3)

{
  int iVar1;
  unsigned int *extraout_EDX;
  unsigned int *puVar2;
  
  FUN_100827bb(0xe);
  *(unsigned long long *)(extraout_EDX + 6) = param_2;
  extraout_EDX[4] = param_1;
  *extraout_EDX = &PTR_FUN_10110068;
  puVar2 = extraout_EDX + 8;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_3;
    param_3 = param_3 + 1;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


