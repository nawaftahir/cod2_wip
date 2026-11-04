extern unsigned int DAT_106d3194;
extern unsigned int DAT_1072debd;
extern int FUN_1002e380();
extern int FUN_100341d0();
extern int FUN_100343d0();
extern int FUN_10034500();
extern int FUN_100345e0();
extern int FUN_10034700();


void FUN_10034840(void)

{
  unsigned int *puVar1;
  
  FUN_10034700();
  if (*(int *)(g_106d3194 + 0x249d28) != 0) {
 
	int g_106d3194 = DAT_106d3194;   if (DAT_1072debd != '\0') {
      FUN_1002e380();
    }
    FUN_100341d0();
    FUN_100343d0();
    *(unsigned int *)(g_106d3194 + 0x249d28) = 0;
  }
  FUN_10034500();
  FUN_10034500();
  puVar1 = (unsigned int *)(g_106d3194 + 0x249d30);
  *(unsigned int *)(g_106d3194 + 0x249d4c) = 0;
  FUN_100345e0(*puVar1);
  FUN_100345e0(*(unsigned int *)(g_106d3194 + 0x249d3c));
  return;
}


