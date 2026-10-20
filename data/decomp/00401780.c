
void __fastcall FUN_00401780(CWnd *param_1)

{
  BOOL BVar1;
  HWND hWnd;
  WINDOWPLACEMENT local_30;
  
  CWnd::OnDestroy(param_1);
  hWnd = (HWND)0x0;
  if (param_1 != (CWnd *)0x0) {
    hWnd = *(HWND *)(param_1 + 0x1c);
  }
  local_30.length = 0x2c;
  BVar1 = GetWindowPlacement(hWnd,&local_30);
  if (BVar1 != 0) {
    FUN_0047a140("Radiant::AdvCurveDlgPlace",&local_30,0x2c);
  }
  return;
}

