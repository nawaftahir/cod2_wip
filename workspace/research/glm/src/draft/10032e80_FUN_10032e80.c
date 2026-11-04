extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d4950;
extern unsigned int DAT_101d4958;


void FUN_10032e80(void)

{
  unsigned long long uVar1;
  unsigned long long uVar2;
  int iVar3;
  
  if (g_101d4958 != '\0') {
 
	int g_101d4958 = DAT_101d4958;   iVar3 = (**(void **)(*g_101d494c + 0x1c))(g_101d494c,0,0,1);
    i
	int g_101d494c = DAT_101d494c;f ((iVar3 == -0x7789f798) || (iVar3 != 1)) {
      g_101d4958 = 0;
      return;
    }
    uVar1 = rdtsc();
    do {
      if (g_101d4958 == '\0') goto LAB_10032f0a;
      iVar3 = (**(void **)(*g_101d494c + 0x1c))(g_101d494c,0,0,1);
      if ((iVar3 == -0x7789f798) || (iVar3 != 1)) break;
      uVar2 = rdtsc();
    } while ((int)uVar2 - (int)uVar1 <= g_101d4950);
    g_1
	int g_101d4950 = DAT_101d4950;01d4958 = '\0';
LAB_10032f0a:
    uVar2 = rdtsc();
    iVar3 = ((int)uVar2 - (int)uVar1) * 3;
    g_101d4950 = g_101d4950 + ((int)(iVar3 + (iVar3 >> 0x1f & 3U)) >> 2);
  }
  return;
}


