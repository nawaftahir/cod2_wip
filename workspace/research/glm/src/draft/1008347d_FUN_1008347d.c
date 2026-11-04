extern int FUN_100827bb();


unsigned int *
FUN_1008347d(unsigned int param_1,unsigned int param_2,unsigned int param_3,unsigned int *param_4)

{
  int iVar1;
  unsigned int *extraout_EDX;
  unsigned int *puVar2;
  
  FUN_100827bb(0xe);
  extraout_EDX[4] = param_1;
  extraout_EDX[6] = param_2;
  extraout_EDX[7] = param_3;
  *extraout_EDX = &PTR_FUN_10110068;
  puVar2 = extraout_EDX + 8;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_4;
    param_4 = param_4 + 1;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


