extern unsigned int DAT_101d494c;
extern unsigned int DAT_101d4958;


void FUN_10032cd0(void)

{
  int iVar1;
  
  do {
    if (DAT_101d4958 == '\0') {
	int g_101d4958 = DAT_101d4958;
      return;
    }
    iVar1 = (**(void **)(*DAT_101d494c + 0x1c))(DAT_101d494c,0,0,1);
	int g_101d494c = DAT_101d494c;
  } while ((iVar1 != -0x7789f798) && (iVar1 == 1));
  g_101d4958 = 0;
  return;
}


