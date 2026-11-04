// 10023af0 size=149 FUN_10023af0

uint FUN_10023af0(void)

{
  uint uVar1;
  
  if (*(char *)(DAT_101ce64c + 8) != '\0') {
    uVar1 = DAT_1067850c;
    if (DAT_1067850c < 0x7fe) {
      if ((uint)DAT_101da9c8[0x28003] < 0x1ff8) {
        DAT_101da9c8[0x28003] = DAT_101da9c8[0x28003] + 1;
        DAT_1067850c = DAT_1067850c + 1;
        return uVar1;
      }
      if (DAT_1076a860 != *DAT_101da9c8) {
        DAT_1076a860 = *DAT_101da9c8;
        (*(code *)RI_Printf)(2,"too many visible models (more than %i)\n",0x1ff8);
        return 0xffffffff;
      }
    }
    else if (DAT_1076a860 != *DAT_101da9c8) {
      DAT_1076a860 = *DAT_101da9c8;
      (*(code *)RI_Printf)(2,"too many scene entities (more than %i)\n",0x7fe);
    }
  }
  return 0xffffffff;
}


