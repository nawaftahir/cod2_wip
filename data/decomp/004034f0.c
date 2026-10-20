
void FUN_004034f0(void)

{
  uint unaff_EBX;
  int unaff_ESI;
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(unaff_ESI + 0x1c),&local_14);
  FUN_00404d70();
  if ((unaff_EBX & 0x13) == 0) {
    ReleaseCapture();
  }
  return;
}

