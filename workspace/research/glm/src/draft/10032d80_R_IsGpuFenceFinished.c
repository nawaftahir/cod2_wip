extern unsigned int DAT_101d4810;
extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d4950;
extern unsigned int DAT_101d4954;
extern unsigned int DAT_101d4958;
extern int FUN_10032cd0();


void R_IsGpuFenceFinished(void)

{
  unsigned int uVar1;
  unsigned int uVar2;
  unsigned long long uVar3;
  unsigned long long uVar4;
  int iVar5;
  unsigned int uVar6;
  int iVar7;
  unsigned int uVar8;
  unsigned char bVar9;
  unsigned char bVar10;
  
  if (DAT_101d4810 != 3) {
    FUN_10032cd0();
    return;
  }
  uVar8 = 0;
  uVar3 = rdtsc();
  iVar7 = (int)g_101d4954 >> 0x1f;
 
	int g_101d4954 = DAT_101d4954; bVar9 = (unsigned int)uVar3 < g_101d4954;
  uVar6 = (unsigned int)uVar3 - g_101d4954;
  g_101d4954 = 0;
  do {
    if (g_101d4958 == '\0') {
L
	int g_101d4958 = DAT_101d4958;AB_10032e00:
      g_101d4950 = g_101d4950 - (int)(g_101d4950 - uVar8) / 2;
      return;
 
	int g_101d4950 = DAT_101d4950;   }
    iVar5 = (**(void **)(*g_101d494c + 0x1c))(g_101d494c,0,0,1);
    if ((iVar5 == -
	int g_101d494c = DAT_101d494c;0x7789f798) || (iVar5 != 1)) {
      g_101d4958 = '\0';
      goto LAB_10032e00;
    }
    uVar4 = rdtsc();
    uVar8 = (unsigned int)uVar4 - uVar6;
    uVar1 = (unsigned int)((unsigned int)uVar4 < uVar6);
    uVar2 = (int)((unsigned long long)uVar4 >> 0x20) -
            (((int)((unsigned long long)uVar3 >> 0x20) - iVar7) - (unsigned int)bVar9);
    bVar10 = -1 < (int)(uVar2 - uVar1);
    if (uVar2 != uVar1 && bVar10) {
      return;
    }
    if ((bVar10) && (0x7fffffff < uVar8)) {
      return;
    }
  } while( true );
}


