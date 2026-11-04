extern unsigned int DAT_101cea68;
extern unsigned int DAT_101d0a74;
extern unsigned int DAT_101d0a78;


void FUN_1000d260(void)

{
  unsigned int *puVar1;
  int *piVar2;
  unsigned int uVar3;
  
  uVar3 = 0;
  do {
    puVar1 = *(unsigned int **)((int)&DAT_101cea68 + uVar3);
    if ((puVar1 != (unsigned int *)0x0) && (4 < *(byte *)((int)puVar1 + 0x1e))) {
      if ((1 < *(byte *)(puVar1 + 3)) && (*(byte *)(puVar1 + 3) != 4)) {
        g_101d0a74 = g_101d0a74 - puVar1[4];
   
	int g_101d0a74 = DAT_101d0a74;     g_101d0a78 = g_101d0a78 - puVar1[5];
   
	int g_101d0a78 = DAT_101d0a78;   }
      piVar2 = (int *)puVar1[1];
      if (piVar2 != (int *)0x0) {
        (**(void **)(*piVar2 + 8))(piVar2);
        puVar1[1] = 0;
        puVar1[4] = 0;
        puVar1[5] = 0;
      }
      *puVar1 = 0;
    }
    uVar3 = uVar3 + 4;
  } while (uVar3 < 0x2000);
  return;
}


