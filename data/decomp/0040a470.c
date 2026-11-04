
void __fastcall FUN_0040a470(CWnd *param_1)

{
  tagRECT local_14;
  
  if ((param_1 != (CWnd *)0x0) && (*(HWND *)(param_1 + 0x1c) != (HWND)0x0)) {
    GetWindowRect(*(HWND *)(param_1 + 0x1c),&local_14);
    FUN_0047a140("Radiant::CameraInspector",&local_14,0x10);
  }
  CWnd::OnDestroy(param_1);
  DAT_0123348c = 0xffffffff;
  return;
}

