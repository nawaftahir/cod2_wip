
void FUN_0040fef0(void)

{
  BOOL BVar1;
  int iVar2;
  int local_18;
  int local_14;
  undefined4 local_8;
  
  if ((DAT_01233868 != (CWnd *)0x0) && (*(HWND *)(DAT_01233868 + 0x1c) != (HWND)0x0)) {
    BVar1 = IsWindow(*(HWND *)(DAT_01233868 + 0x1c));
    if (BVar1 != 0) goto LAB_0040ff2d;
  }
  (**(code **)(*(int *)DAT_01233868 + 0x130))(0x93,0);
LAB_0040ff2d:
  CWnd::ShowWindow(DAT_01233868,5);
  local_8 = 0x10;
  iVar2 = FUN_0047a1d0("Radiant::TextureFindWindow",&local_18);
  if (iVar2 != 0) {
    CWnd::SetWindowPos(DAT_01233868,(CWnd *)0x0,local_18,local_14,0,0,0x41);
  }
  return;
}

