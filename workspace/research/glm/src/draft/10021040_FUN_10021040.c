extern unsigned int DAT_101d4980;
extern unsigned int DAT_101d49bc;
extern unsigned int DAT_101d4d1c;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_1042e778;
extern unsigned int DAT_1042e780;
extern int FUN_1001e540();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10021040(void)

{
  int iVar1;
  unsigned int *puVar2;
  
  g_101d4d1c = g_101d4d1c + 1;
  g
	int g_101d4d1c = DAT_101d4d1c;_101da9c8 = &DAT_1042e780;
 
	int g_101da9c8 = DAT_101da9c8; _DAT_1042e780 = g_101d4d1c;
  FUN_1001e540();
  puVar2 = g_101da9c8;
  g_101d49bc = g_101d49bc + 1 & 0x80000001;
  if ((int)g_
	int g_101d49bc = DAT_101d49bc;101d49bc < 0) {
    g_101d49bc = (g_101d49bc - 1 | 0xfffffffe) + 1;
  }
  iVar1 = g_101d49bc * 0xc;
  *(unsigned int **)(g_101da9c8 + 0x217c78) = &g_101d4980 + iVar1;
  *(unsigned int *)(&g_10
	int g_101d4980 = DAT_101d4980;1d4980 + iVar1) = 0;
  *(unsigned int *)(puVar2 + 4) = 0;
  *(unsigned int *)(puVar2 + 0x80008) = 0;
  *(unsigned int *)(puVar2 + 0xa000c) = 0;
  *(unsigned int *)(puVar2 + 0x187c70) = 0;
  *(unsigned int *)(puVar2 + 0x18fc74) = 0;
  *(unsigned int *)(puVar2 + 0x217c7c) = 0;
  DAT_1042e778 = puVar2 + 0x219d0c;
  *(unsigned int *)(puVar2 + 0x249d4c) = 0;
  *(unsigned int *)(puVar2 + 0x249d34) = 0;
  *(unsigned int *)(puVar2 + 0x249d1c) = 0;
  return;
}


