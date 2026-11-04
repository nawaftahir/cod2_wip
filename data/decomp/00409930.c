
void FUN_00409930(void)

{
  int iVar1;
  int local_18;
  int local_14;
  undefined4 local_8;
  
  if (DAT_0123367c == 0) {
    (**(code **)(DAT_01233660 + 0x134))(0xb5,0);
    local_8 = 0x10;
    iVar1 = FUN_0047a1d0("Radiant::CameraInspector",&local_18);
    if (iVar1 != 0) {
      CWnd::SetWindowPos((CWnd *)&DAT_01233660,(CWnd *)0x0,local_18,local_14,0,0,0x41);
    }
    DAT_0123348c = 0xffffffff;
  }
  CWnd::ShowWindow((CWnd *)&DAT_01233660,5);
  FUN_00409f90(&DAT_01233660);
  return;
}

