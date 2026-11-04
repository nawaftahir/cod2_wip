extern unsigned int DAT_101d1bf4;
extern unsigned int DAT_101d1bfc;
extern int FUN_10011900();
extern int FUN_100123d0();
extern int FUN_100127d0();


unsigned int FUN_10012820(void)

{
  if (g_101d1bf4 == 0) {
 
	int g_101d1bf4 = DAT_101d1bf4;   (*(void *)RI_Printf)(0,"Getting Direct3D 9 interface...\n");
    g_101d1bf4 = Direct3DCreate9(0x20);
    if (g_101d1bf4 == 0) {
      (*(void *)RI_Printf)(0,"Direct3D 9 failed to initialize\n");
      return 0;
    }
  }
  DAT_101d1bfc = FUN_100127d0();
  FUN_10011900();
  FUN_100123d0();
  return 1;
}


