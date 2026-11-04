extern int FUN_100827bb();


unsigned int * FUN_1008321c(void)

{
  int iVar1;
  unsigned int *extraout_EDX;
  unsigned int *puVar2;
  
  FUN_100827bb(0xd);
  extraout_EDX[4] = 0;
  extraout_EDX[5] = 0;
  extraout_EDX[6] = 0;
  extraout_EDX[7] = 0;
  extraout_EDX[8] = 0;
  extraout_EDX[9] = 0;
  *extraout_EDX = &PTR_FUN_1011005c;
  extraout_EDX[10] = 1;
  puVar2 = extraout_EDX + 0xc;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  return extraout_EDX;
}


