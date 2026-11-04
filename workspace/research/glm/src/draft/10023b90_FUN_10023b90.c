extern unsigned int DAT_101ce708;
extern unsigned int DAT_101d1b9c;
extern unsigned int DAT_10678510;
extern unsigned int DAT_10678ac4;
extern unsigned int DAT_10678ac8;
extern unsigned int DAT_10678ad0;
extern unsigned int DAT_10678ad8;
extern unsigned int DAT_10678adc;
extern unsigned int DAT_10678ae0;
extern unsigned int DAT_10678ae4;
extern unsigned int DAT_10678ae8;
extern unsigned int DAT_10678aec;
extern int FUN_10023af0();


int FUN_10023b90(int param_1)

{
  int iVar1;
  int iVar2;
  unsigned int *puVar3;
  int iVar4;
  int iVar5;
  unsigned int *puVar6;
  
  iVar1 = FUN_10023af0();
  if (iVar1 < 0) {
    return -1;
  }
  puVar3 = (unsigned int *)(iVar1 * 0x74 + DAT_10678510);
  iVar5 = *(int *)(g_101d1b9c + 0xf8) + param_1 * 0x60;
 
	int g_101d1b9c = DAT_101d1b9c; puVar6 = puVar3;
  for (iVar2 = 0x1d; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  *puVar3 = 2;
  puVar3[0xf] = *(unsigned int *)(iVar5 + 4);
  puVar3[0x10] = *(unsigned int *)(iVar5 + 8);
  puVar3[0x11] = *(unsigned int *)(iVar5 + 0xc);
  puVar3[5] = *(unsigned int *)(iVar5 + 0x2c);
  puVar3[6] = *(unsigned int *)(iVar5 + 0x30);
  puVar3[7] = *(unsigned int *)(iVar5 + 0x34);
  puVar3[8] = *(unsigned int *)(iVar5 + 0x38);
  puVar3[9] = *(unsigned int *)(iVar5 + 0x3c);
  puVar3[10] = *(unsigned int *)(iVar5 + 0x40);
  puVar3[0xb] = *(unsigned int *)(iVar5 + 0x44);
  puVar3[0xc] = *(unsigned int *)(iVar5 + 0x48);
  puVar3[0xd] = *(unsigned int *)(iVar5 + 0x4c);
  iVar2 = DAT_101ce708;
  puVar3[0xe] = *(unsigned int *)(iVar5 + 0x50);
  if (*(int *)(iVar2 + 8) == 2) {
    puVar3[2] = *(int *)(g_101d1b9c + 300) + param_1 * 0x60;
    puVar3[3] = *(unsigned int *)(*(int *)(g_101d1b9c + 0x130) + param_1 * 4);
  }
  else {
    puVar3[2] = *(unsigned int *)(iVar5 + 0x54);
    puVar3[3] = *(unsigned int *)(iVar5 + 0x58);
    puVar3[4] = *(unsigned int *)(iVar5 + 0x5c);
  }
  iVar4 = iVar1 * 0x34;
  puVar6 = (unsigned int *)(&DAT_10678ac4 + iVar4);
  for (iVar2 = 0xd; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar6 = 0;
    puVar6 = puVar6 + 1;
  }
  *(unsigned int *)(&DAT_10678ad0 + iVar4) = 2;
  (&DAT_10678ac8)[iVar1 * 0xd] = *(unsigned int *)(iVar5 + 0x10);
  *(unsigned int *)(&DAT_10678ad8 + iVar4) = *(unsigned int *)(iVar5 + 0x14);
  *(unsigned int *)(&DAT_10678adc + iVar4) = *(unsigned int *)(iVar5 + 0x18);
  *(unsigned int *)(&DAT_10678ae0 + iVar4) = *(unsigned int *)(iVar5 + 0x1c);
  *(unsigned int *)(&DAT_10678ae4 + iVar4) = *(unsigned int *)(iVar5 + 0x20);
  *(unsigned int *)(&DAT_10678ae8 + iVar4) = *(unsigned int *)(iVar5 + 0x24);
  *(unsigned int *)(&DAT_10678aec + iVar4) = *(unsigned int *)(iVar5 + 0x28);
  return iVar1;
}


