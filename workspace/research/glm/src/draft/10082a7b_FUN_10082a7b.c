extern int FUN_100827bb();


unsigned int * FUN_10082a7b(unsigned int *param_1)

{
  int iVar1;
  unsigned int *extraout_EDX;
  unsigned int *puVar2;
  
  FUN_100827bb(3);
  *extraout_EDX = &PTR_FUN_1010ffe4;
  puVar2 = extraout_EDX + 4;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_1;
    param_1 = param_1 + 1;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


