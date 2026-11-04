extern unsigned int DAT_101ce6d4;
extern unsigned int DAT_10764578;
extern unsigned int DAT_1076457c;
extern int FUN_10037670();


void FUN_100376c0(void)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  unsigned int *puStack_44;
  unsigned char auStack_40 [64];
  
  g_10764578 = (unsigned int *)0x0;
 
	int g_10764578 = DAT_10764578; g_1076457c = 0;
 
	int g_1076457c = DAT_1076457c; if ((*(int *)(g_101ce6d4 + 8) != 0) &&
     
	int g_101ce6d4 = DAT_101ce6d4;(g_10764578 = (unsigned int *)(*(void *)RI_Z_MallocInternal)(0x1800000),
     *(int *)(g_101ce6d4 + 8) == 2)) {
    FUN_10037670();
    uVar1 = (*(void *)RI_StatMon_Warning)(auStack_40,&puStack_44);
    if (-1 < (int)uVar1) {
      if (uVar1 % 6 == 0) {
        if (0x1800000 < uVar1) {
          uVar1 = 0x1800000;
        }
        puVar3 = puStack_44;
        puVar4 = g_10764578;
        for (uVar2 = uVar1 >> 2; uVar2 != 0; uVar2 = uVar2 - 1) {
          *puVar4 = *puVar3;
          puVar3 = puVar3 + 1;
          puVar4 = puVar4 + 1;
        }
        for (uVar2 = uVar1 & 3; uVar2 != 0; uVar2 = uVar2 - 1) {
          *(unsigned char *)puVar4 = *(unsigned char *)puVar3;
          puVar3 = (unsigned int *)((int)puVar3 + 1);
          puVar4 = (unsigned int *)((int)puVar4 + 1);
        }
        g_1076457c = uVar1 / 6;
      }
      (*(void *)RI_FS_ReadFile)(puStack_44);
    }
  }
  return;
}


