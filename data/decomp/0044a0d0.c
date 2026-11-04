
void __thiscall FUN_0044a0d0(int param_1,uint param_2)

{
  tagRECT local_14;
  
  if ((DAT_0109fe5e != '\0') && (DAT_0109fe58 != 0)) {
    ReleaseCapture();
    DAT_0109fe58 = 0;
  }
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  FUN_0044cf30();
  if ((param_2 & 0x13) == 0) {
    ReleaseCapture();
  }
  return;
}

