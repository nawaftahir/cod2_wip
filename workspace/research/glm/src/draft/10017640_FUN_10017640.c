extern unsigned int DAT_101d0a74;
extern unsigned int DAT_101d0a78;
extern int FUN_1000fa40();
extern int FUN_100138c0();


void FUN_10017640(int param_1)

{
  unsigned short uVar1;
  unsigned int *puVar2;
  int *piVar3;
  char cVar4;
  unsigned int *puVar5;
  unsigned int uVar6;
  unsigned int *puVar7;
  unsigned int *puVar8;
  
  uVar1 = *(unsigned short *)(param_1 + 0x34);
  puVar8 = (unsigned int *)0x0;
  while( true ) {
    puVar7 = (unsigned int *)0x0;
    if (uVar1 != 0) {
      puVar5 = (unsigned int *)(*(int *)(param_1 + 0x3c) + 8);
      uVar6 = (unsigned int)uVar1;
      do {
        if (((*(char *)((int)puVar5 + -3) != '\x05') &&
            (puVar2 = (unsigned int *)*puVar5, puVar7 < puVar2)) &&
           ((puVar8 == (unsigned int *)0x0 || (puVar2 < puVar8)))) {
          puVar7 = puVar2;
        }
        puVar5 = puVar5 + 3;
        uVar6 = uVar6 - 1;
      } while (uVar6 != 0);
    }
    if (puVar7 == (unsigned int *)0x0) break;
    if ((1 < *(byte *)(puVar7 + 3)) && (*(byte *)(puVar7 + 3) != 4)) {
      g_101d0a74 = g_101d0a74 - puVar7[4];
   
	int g_101d0a74 = DAT_101d0a74;   g_101d0a78 = g_101d0a78 - puVar7[5];
   
	int g_101d0a78 = DAT_101d0a78; }
    piVar3 = (int *)puVar7[1];
    if (piVar3 != (int *)0x0) {
      (**(void **)(*piVar3 + 8))(piVar3);
      puVar7[1] = 0;
      puVar7[4] = 0;
      puVar7[5] = 0;
    }
    *puVar7 = 0;
    cVar4 = FUN_1000fa40();
    puVar8 = puVar7;
    if (cVar4 == '\0') {
      FUN_100138c0(1,"failed to load image \'%s\'",puVar7[8]);
    }
  }
  return;
}


