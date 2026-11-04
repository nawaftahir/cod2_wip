extern unsigned int DAT_101d4970;
extern unsigned int DAT_101d497c;
extern unsigned int DAT_101d4980;
extern unsigned int DAT_101d4998;
extern unsigned int DAT_101d49a4;
extern unsigned int DAT_101d49c0;
extern int FUN_10011a40();
extern int FUN_10011ad0();


void FUN_10011b60(void)

{
  unsigned int *puVar1;
  
  FUN_10011a40();
  DAT_101d49a4 = &g_101d4998;
 
	int g_101d4998 = DAT_101d4998; puVar1 = &DAT_101d4980;
  do {
    FUN_10011a40();
    puVar1 = puVar1 + 0xc;
  } while (puVar1 != &g_101d4998);
  FUN_10011ad0();
  DAT_101d497c = &DAT_101d4970;
  DAT_101d49c0 = (*(void *)RI_Z_VirtualReserveInternal)(0xa00000);
  return;
}


