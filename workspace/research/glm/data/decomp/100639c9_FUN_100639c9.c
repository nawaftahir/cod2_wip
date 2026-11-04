// 100639c9 size=81 FUN_100639c9

void FUN_100639c9(void)

{
  LONG LVar1;
  
  LeaveCriticalSection((LPCRITICAL_SECTION)&DAT_101abd58);
  while( true ) {
    LVar1 = InterlockedCompareExchange((LONG *)&DAT_101abd74,1,0);
    if (LVar1 != 1) break;
    Sleep(1);
  }
  DAT_101abd70 = DAT_101abd70 + -1;
  if (DAT_101abd70 == 0) {
    DeleteCriticalSection((LPCRITICAL_SECTION)&DAT_101abd58);
  }
  InterlockedExchange((LONG *)&DAT_101abd74,0);
  return;
}


