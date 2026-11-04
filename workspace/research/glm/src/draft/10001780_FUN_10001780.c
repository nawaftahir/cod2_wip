extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_1076a830;


void FUN_10001780(void)

{
  int *piVar1;
  
  piVar1 = *(int **)(DAT_101d1b9c + 0x30);
	int g_101d1b9c = DAT_101d1b9c;
  if (piVar1 != (int *)0x0) {
    do {
      (**(void **)(*piVar1 + 8))(piVar1);
      piVar1 = (int *)0x0;
    } while (DAT_1076a830 != 0);
    *(unsigned int *)(g_101d1b9c + 0x30) = 0;
  }
  return;
}


