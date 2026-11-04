extern unsigned int DAT_101ce79c;
extern unsigned int DAT_101d1b2c;
extern unsigned int DAT_101d1b30;
extern unsigned int DAT_101d1be4;
extern unsigned int DAT_101d7fc8;
extern int FUN_10017190();
extern int FUN_10017350();
extern int FUN_1001c930();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_100173e0(void)

{
  int iVar1;
  unsigned int *puVar2;
  
  puVar2 = &DAT_101d7fc8;
  for (iVar1 = 0xa67; iVar1 != 0; iVar1 = iVar1 + -1) {
    *puVar2 = 0;
    puVar2 = puVar2 + 1;
  }
  FUN_1001c930();
  FUN_10017350();
  if (*(char *)(DAT_101ce79c + 8) != '\0') {
    FUN_10017350();
  }
  FUN_10017190();
  if (((*(int *)(g_101d1b30 + 0x3c) != *(int *)(g_101d1b2c + 0x3c)) ||
 
	int g_101d1b30 = DAT_101d1b30;  
	int g_101d1b2c = DAT_101d1b2c;   (*(int *)(g_101d1b30 + 0x40) != *(int *)(g_101d1b2c + 0x40))) ||
     (*(int *)(g_101d1b30 + 0x38) != *(int *)(g_101d1b2c + 0x38))) {
    _DAT_101d1be4 = **(unsigned int **)(g_101d1b30 + 0x3c);
    *(unsigned int **)(g_101d1b30 + 0x3c) = &DAT_101d1be4;
  }
  return;
}


