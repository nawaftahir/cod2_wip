// 10012db0 size=168 FUN_10012db0

void FUN_10012db0(void)

{
  int *piVar1;
  int *piVar2;
  BOOL BVar3;
  
  FUN_10012210();
  while (DAT_101d4938 != 0) {
    DAT_101d4938 = DAT_101d4938 + -1;
    BVar3 = IsWindow((HWND)(&DAT_101d493c)[DAT_101d4938 * 4]);
    if (BVar3 != 0) {
      DestroyWindow((HWND)(&DAT_101d493c)[DAT_101d4938 * 4]);
    }
    (&DAT_101d493c)[DAT_101d4938 * 4] = 0;
  }
  DAT_101d4938 = 0;
  piVar2 = DAT_101d1bf8;
  while (piVar1 = DAT_101d1bf4, piVar2 != (int *)0x0) {
    (**(code **)(*DAT_101d1bf8 + 8))(DAT_101d1bf8);
    DAT_101d1bf8 = (int *)0x0;
    piVar2 = DAT_1076a830;
  }
  while (piVar1 != (int *)0x0) {
    (**(code **)(*DAT_101d1bf4 + 8))(DAT_101d1bf4);
    DAT_101d1bf4 = (int *)0x0;
    piVar1 = DAT_1076a830;
  }
  return;
}


