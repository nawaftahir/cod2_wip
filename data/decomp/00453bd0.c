
void __thiscall FUN_00453bd0(int param_1,uint param_2)

{
  tagRECT local_14;
  
  GetClientRect(*(HWND *)(param_1 + 0x1c),&local_14);
  FUN_00462760(param_2);
  if ((param_2 & 0x13) == 0) {
    ReleaseCapture();
  }
  return;
}

