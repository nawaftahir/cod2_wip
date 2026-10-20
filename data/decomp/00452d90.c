
undefined1 FUN_00452d90(int param_1)

{
  char in_AL;
  
  if (in_AL != '\0') {
    if (DAT_010a44b8 != &DAT_010a44b4) {
      DAT_0109fe5f = 1;
      FUN_00470c00();
      DAT_0109fdf8 = 0;
      DAT_0109fdf4 = 0;
      DAT_0109fdf0 = 0;
      goto LAB_00452de0;
    }
    FUN_0047a5b0("Need a brush selected to turn on Mouse Rotation mode\n");
  }
  DAT_0109fe5f = 0;
LAB_00452de0:
  RedrawWindow(*(HWND *)(param_1 + 0x1c),(RECT *)0x0,(HRGN)0x0,0x105);
  return DAT_0109fe5f;
}

