// 10009690 size=55 FUN_10009690

void FUN_10009690(void)

{
  int in_ECX;
  int iVar1;
  int *piVar2;
  
  piVar2 = *(int **)(in_ECX + 0x2c);
  for (iVar1 = *(int *)(in_ECX + 0x28); iVar1 != 0; iVar1 = iVar1 + -1) {
    if (*(int *)(DAT_101d7e9c + *piVar2 * 4) != DAT_10678500) {
      FUN_100093a0();
    }
    piVar2 = piVar2 + 1;
  }
  return;
}


