extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_101d7e94;
extern unsigned int DAT_101d7e9c;
extern int FUN_100296a0();


void FUN_100015b0(void)

{
  unsigned int uVar1;
  unsigned int *puVar2;
  int iVar3;
  int iVar4;
  
  g_101d7e94 = (*(void *)RI_Hunk_AllocInternal)(*(int *)(g_101d1b9c + 0xf4) << 3);
 
	int g_101d7e94 = DAT_101d7e94; D
	int g_101d1b9c = DAT_101d1b9c;AT_101d7e98 = (*(void *)RI_Hunk_AllocInternal)(*(int *)(g_101d1b9c + 0x10) << 2);
  DAT_101d7e9c = (*(void *)RI_Hunk_AllocInternal)(*(int *)(g_101d1b9c + 0xec) << 2);
  iVar4 = 0;
  if (0 < *(int *)(g_101d1b9c + 0xf4)) {
    do {
      iVar3 = g_101d7e94 + iVar4 * 8;
      uVar1 = FUN_100296a0();
      puVar2 = (unsigned int *)(*(void *)RI_Hunk_AllocAlignInternal)(uVar1 << 4,4);
      *(unsigned int **)(iVar3 + 4) = puVar2;
      for (iVar3 = (uVar1 & 0xfffffff) << 2; iVar3 != 0; iVar3 = iVar3 + -1) {
        *puVar2 = 0;
        puVar2 = puVar2 + 1;
      }
      for (iVar3 = 0; iVar3 != 0; iVar3 = iVar3 + -1) {
        *(unsigned char *)puVar2 = 0;
        puVar2 = (unsigned int *)((int)puVar2 + 1);
      }
      iVar4 = iVar4 + 1;
    } while (iVar4 < *(int *)(g_101d1b9c + 0xf4));
  }
  return;
}


