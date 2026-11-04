extern int FUN_100827bb();


unsigned int * FUN_100835be(unsigned int *param_1,unsigned int param_2,unsigned int param_3)

{
  int iVar1;
  unsigned int *extraout_EDX;
  unsigned int *puVar2;
  
  FUN_100827bb(0xf);
  *extraout_EDX = &PTR_FUN_10110080;
  puVar2 = extraout_EDX + 4;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = *param_1;
    param_1 = param_1 + 1;
    puVar2 = puVar2 + 1;
  }
  extraout_EDX[0xc] = param_2;
  extraout_EDX[0xd] = param_3;
  return extraout_EDX;
}


