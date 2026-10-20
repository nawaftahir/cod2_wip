
void FUN_004421a0(void)

{
  SCROLLINFO local_20;
  
  local_20.nMax = DAT_01128da4 + 0x10;
  local_20.cbSize = 0x1c;
  local_20.fMask = 3;
  local_20.nMin = 0;
  local_20.nPage = DAT_01128d9c;
  SetScrollInfo(DAT_010bcd64,1,&local_20,1);
  if (local_20.nMax - local_20.nPage < DAT_01128da0) {
    FUN_00442140();
  }
  return;
}

