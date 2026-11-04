extern unsigned int DAT_101abd58;
extern unsigned int DAT_101abd70;
extern unsigned int DAT_101abd74;


void FUN_10063974(void)

{
  LONG LVar1;
  
  while( true ) {
    LVar1 = InterlockedCompareExchange((LONG *)&g_101abd74,1,0);
 
	int g_101abd74 = DAT_101abd74;   if (LVar1 != 1) break;
    Sleep(1);
  }
  if (g_101abd70 == 0) {
   
	int g_101abd70 = DAT_101abd70; InitializeCriticalSection((LPCRITICAL_SECTION)&g_101abd58);
  }
 
	int g_101abd58 = DAT_101abd58; g_101abd70 = g_101abd70 + 1;
  InterlockedExchange((LONG *)&g_101abd74,0);
  EnterCriticalSection((LPCRITICAL_SECTION)&g_101abd58);
  return;
}


