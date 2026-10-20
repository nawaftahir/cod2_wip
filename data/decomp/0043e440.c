
void FUN_0043e440(void)

{
  int iVar1;
  int local_18;
  int local_14;
  undefined4 local_8;
  
  DAT_0109fd70 = *(int *)(DAT_01233b64 + 0x1e4) != 0;
  DAT_0109fd71 = *(int *)(DAT_01233b64 + 0x1f0) != 0;
  if ((DAT_0109fdb4 == 0) && (DAT_01234a54 == 0)) {
    DAT_0109fd94 = 0x3d4ccccd;
    DAT_0109fd98 = 0x3d4ccccd;
    DAT_0109fd9c = 0x3d4ccccd;
    DAT_0109fda0 = 0x3d4ccccd;
    DAT_0109fda4 = (float)*(int *)(DAT_01233b64 + 600);
    (**(code **)(DAT_01234a38 + 0x134))(0x74,0);
    local_8 = 0x10;
    iVar1 = FUN_0047a1d0("Radiant::SurfaceWindow",&local_18);
    if (iVar1 != 0) {
      CWnd::SetWindowPos((CWnd *)&DAT_01234a38,(CWnd *)0x0,local_18,local_14,0,0,0x41);
    }
    DAT_0123348c = 0xffffffff;
    FUN_0043dff0();
    return;
  }
  DAT_0109fdb4 = DAT_01234a54;
  FUN_0043cf80(&DAT_01234a38);
  CWnd::ShowWindow((CWnd *)&DAT_01234a38,5);
  FUN_0043dff0();
  return;
}

