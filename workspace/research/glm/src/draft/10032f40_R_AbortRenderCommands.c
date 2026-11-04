extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d4958;


unsigned int R_AbortRenderCommands(void)

{
  int iVar1;
  
  if (DAT_101d4958 != '\0') {
	int g_101d4958 = DAT_101d4958;
    iVar1 = (**(void **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
	int g_101d494c = DAT_101d494c;
    if ((iVar1 != -0x7789f798) && (iVar1 == 1)) {
      return 0;
    }
    g_101d4958 = '\0';
  }
  return 1;
}


