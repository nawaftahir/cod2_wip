
void FUN_0047a250(undefined4 param_1)

{
  HWND pHVar1;
  HWND unaff_ESI;
  tagRECT local_14;
  
  GetWindowRect(unaff_ESI,&local_14);
  if (unaff_ESI != DAT_010bcd54) {
    pHVar1 = GetParent(unaff_ESI);
    if (pHVar1 != DAT_010bcd54) {
      SetParent(unaff_ESI,DAT_010bcd54);
    }
    MapWindowPoints((HWND)0x0,DAT_010bcd54,(LPPOINT)&local_14,2);
  }
  FUN_0047a140(param_1,&local_14,0x10);
  return;
}

