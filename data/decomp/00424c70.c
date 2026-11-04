
void FUN_00424c70(void)

{
  int iVar1;
  int local_18;
  int local_14;
  undefined4 local_8;
  
  if (DAT_01234694 == 0) {
    (**(code **)(DAT_01234678 + 0x134))(0xac,0);
    local_8 = 0x10;
    iVar1 = FUN_0047a1d0("Radiant::PatchWindow",&local_18);
    if (iVar1 != 0) {
      CWnd::SetWindowPos((CWnd *)&DAT_01234678,(CWnd *)0x0,local_18,local_14,0,0,1);
    }
  }
  CWnd::ShowWindow((CWnd *)&DAT_01234678,5);
  FUN_00424b10();
  return;
}

