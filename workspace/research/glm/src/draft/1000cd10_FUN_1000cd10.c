extern unsigned int DAT_101ce890;
extern unsigned int DAT_101cea68;
extern unsigned int DAT_101d0a74;
extern unsigned int DAT_101d0a78;
extern unsigned int DAT_101d492c;
extern unsigned int DAT_101d4c88;
extern int FUN_1003d950();


/* WARNING: Function: __chkstk replaced with injection: alloca_probe */

void FUN_1000cd10(void)

{
  char cVar1;
  int *piVar2;
  char *pcVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  unsigned int uVar7;
  unsigned int *puVar8;
  int local_2004;
  int aiStack_2000 [2047];
  unsigned int uStack_4;
  
  uStack_4 = 0x1000cd1a;
  if ((DAT_101d492c == '\0') && (iVar6 = 0, 0 < g_101d4c88)) {
 
	int g_101d4c88 = DAT_101d4c88;   do {
      FUN_1003d950(0);
      iVar6 = iVar6 + 1;
    } while (iVar6 < g_101d4c88);
  }
  iVar6 = 0;
  local_2004 = 0;
  uVar7 = 0;
  do {
    puVar8 = *(unsigned int **)((int)&g_101cea68 + uVar7);
    i
	int g_101cea68 = DAT_101cea68;f (puVar8 != (unsigned int *)0x0) {
      if ((puVar8 < &DAT_101ce890) || ((unsigned int *)0x101cea63 < puVar8)) {
        if ((1 < *(byte *)(puVar8 + 3)) && (*(byte *)(puVar8 + 3) != 4)) {
          g_101d0a74 = g_101d0a74 - puVar8[4];
       
	int g_101d0a74 = DAT_101d0a74;   g_101d0a78 = g_101d0a78 - puVar8[5];
       
	int g_101d0a78 = DAT_101d0a78; }
        piVar2 = (int *)puVar8[1];
        if (piVar2 != (int *)0x0) {
          (**(void **)(*piVar2 + 8))(piVar2);
          puVar8[1] = 0;
          puVar8[4] = 0;
          puVar8[5] = 0;
          iVar6 = local_2004;
        }
        *puVar8 = 0;
      }
      else {
        aiStack_2000[iVar6] = (int)puVar8;
        iVar6 = iVar6 + 1;
        local_2004 = iVar6;
      }
    }
    uVar7 = uVar7 + 4;
  } while (uVar7 < 0x2000);
  iVar5 = 0;
  puVar8 = &g_101cea68;
  for (iVar4 = 0x800; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar8 = 0;
    puVar8 = puVar8 + 1;
  }
  if (0 < iVar6) {
    do {
      pcVar3 = *(char **)(aiStack_2000[iVar5] + 0x20);
      uVar7 = 0;
      iVar6 = 0x77;
      cVar1 = *pcVar3;
      while (cVar1 != '\0') {
        uVar7 = uVar7 + cVar1 * iVar6;
        iVar4 = iVar6 + -0x76;
        iVar6 = iVar6 + 1;
        cVar1 = pcVar3[iVar4];
      }
      uVar7 = uVar7 & 0x7ff;
      iVar6 = (&g_101cea68)[uVar7];
      while (iVar6 != 0) {
        uVar7 = uVar7 + 1 & 0x7ff;
        iVar6 = (&g_101cea68)[uVar7];
      }
      (&g_101cea68)[uVar7] = aiStack_2000[iVar5];
      iVar5 = iVar5 + 1;
    } while (iVar5 < local_2004);
  }
  return;
}


