extern unsigned int DAT_101d1b2c;
extern unsigned int DAT_101d1b30;
extern int FUN_10017100();


void FUN_10017190(void)

{
  g_101d1b30 = FUN_10017100(0);
 
	int g_101d1b30 = DAT_101d1b30; if ((((*(int *)(g_101d1b30 + 0x3c) != *(int *)(g_101d1b2c + 0x3c)) ||
     
	int g_101d1b2c = DAT_101d1b2c;  (*(int *)(g_101d1b30 + 0x40) != *(int *)(g_101d1b2c + 0x40))) ||
      (*(int *)(g_101d1b30 + 0x38) != *(int *)(g_101d1b2c + 0x38))) &&
     (*(short *)(g_101d1b30 + 0x34) != 1)) {
    (*(void *)RI_Printf)(3,"material \'$raw\' doesn\'t use just one image");
    g_101d1b30 = g_101d1b2c;
  }
  return;
}


