extern unsigned int DAT_101d61ac;
extern unsigned int DAT_101d61b8;
extern unsigned int DAT_101d61b9;
extern unsigned int DAT_101d61ba;
extern unsigned int DAT_101d61bb;
extern unsigned int DAT_101d61c;
extern unsigned int DAT_101d61ca;
extern unsigned int DAT_101d61cc;
extern unsigned int DAT_101d61ea;
extern unsigned int DAT_101d61ec;
extern unsigned int DAT_101d61f0;
extern unsigned int DAT_101d61f4;
extern unsigned int DAT_101d620a;
extern unsigned int DAT_101d620c;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_10678504;
extern int FUN_1010a8a8();


/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_10024080(void)

{
  float fVar1;
  int iVar2;
  unsigned int *puVar3;
  unsigned int *puVar4;
  int local_8;
  
  iVar2 = g_101d61ec;
 
	int g_101d61ec = DAT_101d61ec; if (g_10678504 < g_101d61f4) {
 
	int g_10678504 = DAT_10678504;  
	int g_101d61f4 = DAT_101d61f4; if (DAT_101d61cc == g_101d61ec) {
      local_8 = g_101d61f4 - g_101d61f0;
      i
	int g_101d61f0 = DAT_101d61f0;f (local_8 < 1) {
        local_8 = 1;
      }
      fVar1 = (float)(g_10678504 - g_101d61f0) / (float)local_8;
      if (1.0 < fVar1) {
        fVar1 = 1.0;
      }
      _DAT_101d61bc = (_DAT_101d61fc - _DAT_101d61dc) * fVar1 + _DAT_101d61dc;
      _DAT_101d61c0 = (_DAT_101d6200 - _DAT_101d61e0) * fVar1 + _DAT_101d61e0;
      _DAT_101d61c4 = (_DAT_101d6204 - _DAT_101d61e4) * fVar1 + _DAT_101d61e4;
      DAT_101d61b8 = FUN_1010a8a8();
      DAT_101d61b9 = FUN_1010a8a8();
      DAT_101d61ba = FUN_1010a8a8();
      DAT_101d61bb = FUN_1010a8a8();
      g_101d61ac = iVar2;
      DAT_101d61c
	int g_101d61ac = DAT_101d61ac;8 = 1;
      if ((DAT_101d620a != '\0') || (g_101d61ca = 0, DAT_101d61ea != '\0')) {
        g_101d61c
	int g_101d61ca = DAT_101d61ca;a = 1;
      }
    }
    else {
      puVar3 = &g_101d61ec;
      puVar4 = &g_101d61ac;
      for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
        *puVar4 = *puVar3;
        puVar3 = puVar3 + 1;
        puVar4 = puVar4 + 1;
      }
      g_101d61f4 = 0;
    }
  }
  else {
    puVar3 = &g_101d61ec;
    puVar4 = &g_101d61ac;
    for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
      *puVar4 = *puVar3;
      puVar3 = puVar3 + 1;
      puVar4 = puVar4 + 1;
    }
  }
  if (DAT_101d620c == 0) {
    *(unsigned int *)(g_101da9c8 + 0x219cec) = 0;
    r
	int g_101da9c8 = DAT_101da9c8;eturn;
  }
  puVar3 = &g_101d61ac;
  puVar4 = (unsigned int *)(g_101da9c8 + 0x219cec);
  for (iVar2 = 8; iVar2 != 0; iVar2 = iVar2 + -1) {
    *puVar4 = *puVar3;
    puVar3 = puVar3 + 1;
    puVar4 = puVar4 + 1;
  }
  return;
}


