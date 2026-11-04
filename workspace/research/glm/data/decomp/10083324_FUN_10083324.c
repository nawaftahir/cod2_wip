// 10083324 size=51 FUN_10083324

undefined4 * FUN_10083324(void)

{
  int iVar1;
  undefined4 *extraout_EDX;
  undefined4 *puVar2;
  
  FUN_100827bb(0xe);
  *extraout_EDX = &PTR_FUN_10110068;
  extraout_EDX[4] = 0;
  extraout_EDX[5] = 0;
  extraout_EDX[6] = 0;
  extraout_EDX[7] = 0;
  puVar2 = extraout_EDX + 8;
  for (iVar1 = 8; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  extraout_EDX[4] = 3;
  return extraout_EDX;
}


