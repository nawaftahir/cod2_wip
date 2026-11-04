extern unsigned int DAT_101d0a74;
extern unsigned int DAT_101d0a78;
extern unsigned int DAT_101d4820;
extern unsigned int DAT_101d4828;
extern unsigned int DAT_101d4924;


void FUN_10023560(void)

{
  int *piVar1;
  int iVar2;
  int *piVar3;
  unsigned int *puVar4;
  
  piVar3 = &DAT_101d4828;
  do {
    piVar1 = (int *)piVar3[-1];
    if (piVar1 != (int *)0x0) {
      (**(void **)(*piVar1 + 8))(piVar1);
    }
    piVar1 = (int *)*piVar3;
    if (piVar1 != (int *)0x0) {
      (**(void **)(*piVar1 + 8))(piVar1);
    }
    puVar4 = (unsigned int *)piVar3[-2];
    if (puVar4 != (unsigned int *)0x0) {
      if ((1 < *(byte *)(puVar4 + 3)) && (*(byte *)(puVar4 + 3) != 4)) {
        g_101d0a74 = g_101d0a74 - puVar4[4];
   
	int g_101d0a74 = DAT_101d0a74;     g_101d0a78 = g_101d0a78 - puVar4[5];
   
	int g_101d0a78 = DAT_101d0a78;   }
      piVar1 = (int *)puVar4[1];
      if (piVar1 != (int *)0x0) {
        (**(void **)(*piVar1 + 8))(piVar1);
        puVar4[1] = 0;
        puVar4[4] = 0;
        puVar4[5] = 0;
      }
      *puVar4 = 0;
    }
    piVar3 = piVar3 + 5;
  } while ((int)piVar3 < 0x101d492c);
  puVar4 = &DAT_101d4820;
  for (iVar2 = 0x41; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = 0;
    puVar4 = puVar4 + 1;
  }
  DAT_101d4924 = 0;
  return;
}


