// 1006b285 size=47 FUN_1006b285

void FUN_1006b285(void)

{
  int *piVar1;
  int in_ECX;
  
  piVar1 = *(int **)(in_ECX + 8);
  if (piVar1 != (int *)0x0) {
    (**(code **)(*piVar1 + 8))(piVar1);
    *(undefined4 *)(in_ECX + 8) = 0;
  }
  _free(*(void **)(in_ECX + 0x58));
  if (*(int *)(in_ECX + 0x78) != 0) {
    FUN_1006ac35(1);
  }
  return;
}


