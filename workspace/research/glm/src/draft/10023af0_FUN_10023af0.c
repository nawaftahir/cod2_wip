extern unsigned int DAT_101ce64c;
extern unsigned int DAT_101da9c8;
extern unsigned int DAT_1067850c;
extern unsigned int DAT_1076a860;


unsigned int FUN_10023af0(void)

{
  unsigned int uVar1;
  
  if (*(char *)(DAT_101ce64c + 8) != '\0') {
    uVar1 = g_1067850c;
 
	int g_1067850c = DAT_1067850c;   if (g_1067850c < 0x7fe) {
      if ((unsigned int)g_101da9c8[0x28003] < 0x1ff8) {
     
	int g_101da9c8 = DAT_101da9c8;   g_101da9c8[0x28003] = g_101da9c8[0x28003] + 1;
        g_1067850c = g_1067850c + 1;
        return uVar1;
      }
      if (g_1076a860 != *g_101da9c8) {
 
	int g_1076a860 = DAT_1076a860;       g_1076a860 = *g_101da9c8;
        (*(void *)RI_Printf)(2,"too many visible models (more than %i)\n",0x1ff8);
        return 0xffffffff;
      }
    }
    else if (g_1076a860 != *g_101da9c8) {
      g_1076a860 = *g_101da9c8;
      (*(void *)RI_Printf)(2,"too many scene entities (more than %i)\n",0x7fe);
    }
  }
  return 0xffffffff;
}


