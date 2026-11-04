extern unsigned int DAT_10696d00;
extern unsigned int DAT_10696f14;
extern unsigned int DAT_106a3100;
extern unsigned int DAT_106a3104;
extern unsigned int DAT_106a3108;
extern unsigned int DAT_106a3110;
extern unsigned int DAT_106a3118;
extern unsigned int DAT_106a3120;
extern unsigned int DAT_106a3128;


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1002b9a0(void)

{
  unsigned int *puVar1;
  unsigned int *puVar2;
  unsigned int *puVar3;
  int iVar4;
  
  puVar3 = &DAT_10696d00;
  for (iVar4 = 0x310e; iVar4 != 0; iVar4 = iVar4 + -1) {
    *puVar3 = 0;
    puVar3 = puVar3 + 1;
  }
  _g_106a3128 = &g_106a3128;
  D
	int g_106a3128 = DAT_106a3128;AT_106a312c = &g_106a3128;
  _g_106a3108 = &g_106a3108;
  _DAT_10
	int g_106a3108 = DAT_106a3108;6a310c = &g_106a3108;
  _g_106a3110 = &g_106a3110;
  _DAT_10
	int g_106a3110 = DAT_106a3110;6a3114 = &g_106a3110;
  _g_106a3118 = &g_106a3118;
  _DAT_10
	int g_106a3118 = DAT_106a3118;6a311c = &g_106a3118;
  _g_106a3120 = &g_106a3120;
  _DAT_10
	int g_106a3120 = DAT_106a3120;6a3124 = &g_106a3120;
  g_106a3100 = &g_106a3100;
  g_106a3104 = &g_106a3100;
  puV
	int g_106a3100 = DAT_106a3100;ar3 = &DAT_10696f14;
  iVa
	int g_106a3104 = DAT_106a3104;r4 = 0x20;
  do {
    puVar3[-99] = &g_106a3100;
    puVar3[-0x62] = g_106a3104;
    g_106a3104 = puVar3 + -99;
    *(unsigned int **)puVar3[-0x62] = g_106a3104;
    puVar3[-1] = &g_106a3100;
    *puVar3 = g_106a3104;
    g_106a3104 = puVar3 + -1;
    *(unsigned int **)*puVar3 = g_106a3104;
    puVar1 = puVar3 + 0x61;
    *puVar1 = &g_106a3100;
    puVar3[0x62] = g_106a3104;
    g_106a3104 = puVar1;
    *(unsigned int **)puVar3[0x62] = puVar1;
    puVar1 = puVar3 + 0xc3;
    *puVar1 = &g_106a3100;
    puVar3[0xc4] = g_106a3104;
    puVar2 = puVar3 + 0xc4;
    puVar3 = puVar3 + 0x188;
    iVar4 = iVar4 + -1;
    g_106a3104 = puVar1;
    *(unsigned int **)*puVar2 = puVar1;
  } while (iVar4 != 0);
  return;
}


