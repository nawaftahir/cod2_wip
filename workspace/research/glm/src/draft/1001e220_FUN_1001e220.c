extern unsigned int DAT_101ce7c8;
extern int FUN_1001da80();
extern int FUN_1001de60();


void FUN_1001e220(void)

{
  if ((*(byte *)(DAT_101ce7c8 + 8) & 1) != 0) {
	int g_101ce7c8 = DAT_101ce7c8;
    FUN_1001da80();
  }
  if ((*(byte *)(g_101ce7c8 + 8) & 2) != 0) {
    FUN_1001de60();
  }
  return;
}


