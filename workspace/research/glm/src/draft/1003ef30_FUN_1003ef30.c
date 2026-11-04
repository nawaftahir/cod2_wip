extern unsigned int DAT_101ce708;
extern unsigned int DAT_106d3200;
extern unsigned int DAT_106d3204;
extern unsigned int DAT_106d3208;
extern unsigned int DAT_106d320c;
extern unsigned int DAT_106d3210;
extern unsigned int DAT_106d3214;
extern unsigned int DAT_106d3218;
extern unsigned int DAT_106d321c;
extern unsigned int DAT_1072d9b0;
extern unsigned int DAT_1072d9cc;
extern unsigned int DAT_1072d9d0;
extern unsigned int DAT_1072d9d4;
extern unsigned int DAT_1072d9e0;
extern int FUN_1002df40();
extern int FUN_1003a8d0();


void FUN_1003ef30(int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int uVar3;
  int iVar4;
  int iVar5;
  unsigned int *puVar6;
  unsigned int *puVar7;
  
  if (g_1072d9cc != 1) {
 
	int g_1072d9cc = DAT_1072d9cc;   if ((g_1072d9d0 != 0) || (DAT_1072d9e0 != 0)) {
 
	int g_1072d9d0 = DAT_1072d9d0;     FUN_1003a8d0();
    }
    g_1072d9cc = 1;
  }
  if ((0x154a < (int)((unsigned int)*(unsigned short *)(param_1 + 10) + g_1072d9d4)) ||
 
	int g_1072d9d4 = DAT_1072d9d4;    (0x100000 < (int)(g_1072d9d0 + (*(unsigned short *)(param_1 + 10) - 2) * 3))) {
    FUN_1002df40();
  }
  if (*(int *)(DAT_101ce708 + 8) == 2) {
    iVar4 = 0;
    if (*(short *)(param_1 + 10) != 0) {
      iVar5 = 0;
      do {
        iVar2 = *(int *)(param_1 + 0xc) + iVar5;
        iVar1 = (g_1072d9d4 + iVar4) * 0x20;
        *(unsigned int *)(&g_106d3200 + iVar1) = *(unsigned int *)(*(int *)(param_1 + 0xc) + iVar5);
        *(uns
	int g_106d3200 = DAT_106d3200;igned int *)(&DAT_106d3204 + iVar1) = *(unsigned int *)(iVar2 + 4);
        *(unsigned int *)(&DAT_106d3208 + iVar1) = *(unsigned int *)(iVar2 + 8);
        *(unsigned int *)(&DAT_106d320c + (g_1072d9d4 + iVar4) * 0x20) =
             *(unsigned int *)(*(int *)(param_1 + 0xc) + 0x18 + iVar5);
        iVar1 = *(int *)(param_1 + 0xc);
        iVar2 = (g_1072d9d4 + iVar4) * 0x20;
        *(unsigned int *)(&DAT_106d3210 + iVar2) = *(unsigned int *)(iVar1 + 0x1c + iVar5);
        *(unsigned int *)(&DAT_106d3214 + iVar2) = *(unsigned int *)(iVar1 + iVar5 + 0x20);
        iVar1 = *(int *)(param_1 + 0xc);
        iVar2 = (g_1072d9d4 + iVar4) * 0x20;
        *(unsigned int *)(&DAT_106d3218 + iVar2) = *(unsigned int *)(iVar1 + 0x24 + iVar5);
        *(unsigned int *)(&DAT_106d321c + iVar2) = *(unsigned int *)(iVar1 + iVar5 + 0x28);
        iVar4 = iVar4 + 1;
        iVar5 = iVar5 + 0x44;
      } while (iVar4 < (int)(unsigned int)*(unsigned short *)(param_1 + 10));
    }
  }
  else {
    puVar6 = *(unsigned int **)(param_1 + 0xc);
    puVar7 = (unsigned int *)(&g_106d3200 + g_1072d9d4 * 0x44);
    for (uVar3 = (unsigned int)*(unsigned short *)(param_1 + 10) * 0x44 >> 2; uVar3 != 0; uVar3 = uVar3 - 1) {
      *puVar7 = *puVar6;
      puVar6 = puVar6 + 1;
      puVar7 = puVar7 + 1;
    }
    for (iVar4 = 0; iVar4 != 0; iVar4 = iVar4 + -1) {
      *(unsigned char *)puVar7 = *(unsigned char *)puVar6;
      puVar6 = (unsigned int *)((int)puVar6 + 1);
      puVar7 = (unsigned int *)((int)puVar7 + 1);
    }
  }
  iVar5 = *(unsigned short *)(param_1 + 10) - 2;
  iVar4 = 0;
  if (iVar5 < 1) {
    g_1072d9d4 = g_1072d9d4 + (unsigned int)*(unsigned short *)(param_1 + 10);
    return;
  }
  do {
    *(unsigned short *)(g_1072d9b0 + g_1072d9d0 * 2) = (unsigned short)g_1072d9d4;
    *(short *)(g_1072d9b0 + 2
	int g_1072d9b0 = DAT_1072d9b0; + g_1072d9d0 * 2) = (short)iVar4 + 1 + (short)g_1072d9d4;
    *(short *)(g_1072d9b0 + 4 + g_1072d9d0 * 2) = (short)iVar4 + 2 + (short)g_1072d9d4;
    g_1072d9d0 = g_1072d9d0 + 3;
    iVar4 = iVar4 + 1;
  } while (iVar4 < iVar5);
  g_1072d9d4 = g_1072d9d4 + (unsigned int)*(unsigned short *)(param_1 + 10);
  return;
}


