// 10001780 size=44 FUN_10001780

void FUN_10001780(void)

{
  int *piVar1;
  
  piVar1 = *(int **)(DAT_101d1b9c + 0x30);
  if (piVar1 != (int *)0x0) {
    do {
      (**(code **)(*piVar1 + 8))(piVar1);
      piVar1 = (int *)0x0;
    } while (DAT_1076a830 != 0);
    *(undefined4 *)(DAT_101d1b9c + 0x30) = 0;
  }
  return;
}


