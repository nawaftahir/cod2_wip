
void FUN_0044a2a0(void)

{
  uint unaff_EBX;
  int unaff_ESI;
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(unaff_ESI + 0x1c),&local_14);
  FUN_0044cf30();
  if ((unaff_EBX & 0x13) == 0) {
    ReleaseCapture();
  }
  return;
}

