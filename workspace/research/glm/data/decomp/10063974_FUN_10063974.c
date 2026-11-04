// 10063974 size=85 FUN_10063974

void FUN_10063974(void)

{
  LONG LVar1;
  
  while( true ) {
    LVar1 = InterlockedCompareExchange((LONG *)&DAT_101abd74,1,0);
    if (LVar1 != 1) break;
    Sleep(1);
  }
  if (DAT_101abd70 == 0) {
    InitializeCriticalSection((LPCRITICAL_SECTION)&DAT_101abd58);
  }
  DAT_101abd70 = DAT_101abd70 + 1;
  InterlockedExchange((LONG *)&DAT_101abd74,0);
  EnterCriticalSection((LPCRITICAL_SECTION)&DAT_101abd58);
  return;
}


