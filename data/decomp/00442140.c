
void FUN_00442140(void)

{
  int in_EAX;
  int iVar1;
  
  iVar1 = (DAT_01128da4 - DAT_01128d9c) + 0x10;
  if (iVar1 < in_EAX) {
    in_EAX = iVar1;
  }
  if (in_EAX < 0) {
    in_EAX = 0;
  }
  if (in_EAX != DAT_01128da0) {
    SetScrollPos(DAT_010bcd64,1,in_EAX,1);
    DAT_01128da0 = in_EAX;
    InvalidateRect(DAT_010bcd64,(RECT *)0x0,0);
    UpdateWindow(DAT_010bcd64);
  }
  return;
}

