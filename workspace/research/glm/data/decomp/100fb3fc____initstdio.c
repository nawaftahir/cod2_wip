// 100fb3fc size=169 ___initstdio

/* Library Function - Single Match
    ___initstdio
   
   Library: Visual Studio 2003 Release */

undefined4 ___initstdio(void)

{
  size_t sVar1;
  undefined **ppuVar2;
  uint uVar3;
  int iVar4;
  undefined4 *puVar5;
  
  sVar1 = 0x14;
  if (DAT_1076bdc0 == 0) {
    sVar1 = 0x200;
  }
  else if (0x13 < (int)DAT_1076bdc0) goto LAB_100fb41b;
  DAT_1076bdc0 = sVar1;
LAB_100fb41b:
  DAT_1076adb8 = _calloc(DAT_1076bdc0,4);
  if (DAT_1076adb8 == (void *)0x0) {
    DAT_1076bdc0 = 0x14;
    DAT_1076adb8 = _calloc(0x14,4);
    if (DAT_1076adb8 == (void *)0x0) {
      return 0x1a;
    }
  }
  iVar4 = 0;
  ppuVar2 = &PTR_DAT_101a48a0;
  do {
    *(undefined ***)(iVar4 + (int)DAT_1076adb8) = ppuVar2;
    ppuVar2 = ppuVar2 + 8;
    iVar4 = iVar4 + 4;
  } while ((int)ppuVar2 < 0x101a4b20);
  uVar3 = 0;
  puVar5 = &DAT_101a48b0;
  do {
    iVar4 = *(int *)((&DAT_1076aca0)[(int)uVar3 >> 5] + (uVar3 & 0x1f) * 0x24);
    if ((iVar4 == -1) || (iVar4 == 0)) {
      *puVar5 = 0xffffffff;
    }
    puVar5 = puVar5 + 8;
    uVar3 = uVar3 + 1;
  } while ((int)puVar5 < 0x101a4910);
  return 0;
}


