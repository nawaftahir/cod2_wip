extern unsigned int DAT_101abd58;
extern unsigned int DAT_101abd70;
extern unsigned int DAT_101abd74;


void FUN_100639c9(void)

{
  LONG LVar1;
  
  LeaveCriticalSection((LPCRITICAL_SECTION)&g_101abd58);
 
	int g_101abd58 = DAT_101abd58; while( true ) {
    LVar1 = InterlockedCompareExchange((LONG *)&g_101abd74,1,0);
 
	int g_101abd74 = DAT_101abd74;   if (LVar1 != 1) break;
    Sleep(1);
  }
  g_101abd70 = g_101abd70 + -1;
  if 
	int g_101abd70 = DAT_101abd70;(g_101abd70 == 0) {
    DeleteCriticalSection((LPCRITICAL_SECTION)&g_101abd58);
  }
  InterlockedExchange((LONG *)&g_101abd74,0);
  return;
}


